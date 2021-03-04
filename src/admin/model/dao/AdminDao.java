package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import member.model.vo.Member;



public class AdminDao {

		private Properties prop = new Properties();
		private Member member = null;

		public AdminDao() {
			String fileName = "/sql/admin/admin-query.properties";	// '/' = WEB-INF/Classes
			String absPath = AdminDao.class.getResource(fileName).getPath();
			try {
				prop.load(new FileReader(absPath));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		

		public List<Member> selectList(Connection conn, int currentPage, int numPerPage) {
			
			List<Member> list = null;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = prop.getProperty("selectPagedList");
			//select * from( select M.*, row_number() over(order by enroll_date desc) rnum from member M) 
			//where rnum between ? and ?
			try {
				pstmt = conn.prepareStatement(query);
				// 1 : 1 ~ 10
				// 2 : 11 ~ 20
				//......
				//12 : 111 ~ 120
				pstmt.setInt(1, (currentPage -1) * numPerPage + 1);
				pstmt.setInt(2, (currentPage * numPerPage));
				rset = pstmt.executeQuery();
				list = new ArrayList<>();
			
				while(rset.next()) {
					member = new Member();
				
					member.setMemberNo(rset.getInt("member_no"));
					member.setMemberId(rset.getString("member_id"));
					member.setMemberName(rset.getString("member_name"));
					member.setNickName(rset.getString("nickname"));
					member.setSsn(rset.getString("ssn"));
					member.setEmail(rset.getString("email"));
					member.setPhone(rset.getString("phone"));
					member.setAddress(rset.getString("address"));
					member.setMemberGrade(rset.getInt("member_grade"));
					member.setMemberRole(rset.getString("member_role"));
					member.setEnrollDate(rset.getDate("enroll_date"));
					member.setDelFlag(rset.getString("del_flag"));
					member.setDelDate(rset.getDate("del_date"));
					
					list.add(member);

				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}


		public int updateMemberRole(Connection conn, String memberId, String memberRole) {

			int result = 0;
			PreparedStatement pstmt = null;
			String query = prop.getProperty("updateMemberRole"); 

			try {
				//미완성쿼리문을 가지고 객체생성.
				pstmt = conn.prepareStatement(query);
				//쿼리문미완성
				pstmt.setString(1, memberRole);
				pstmt.setString(2, memberId);
				
				//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
				//DML은 executeUpdate() > 처리결과는 정수형으로 리턴
				result = pstmt.executeUpdate();
//				System.out.println("fromDao"+result);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}


		public List<Member> selectMembersBy(Connection conn, Map<String, Object> param) {
			List<Member> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectPagedMembersBy");
			//select * from (select M.*, row_number() over(order by enroll_date desc) rnum from member M where # like ? ) where rnum between ? and ?
			switch((String)param.get("searchType")) {
			case "memberId" : sql = sql.replace("#", "member_id"); break;
			case "memberName" : sql = sql.replace("#", "member_name"); break;
			case "gender" : sql = sql.replace("#", "gender"); break;
			}
			
			try{
				//미완성쿼리문을 가지고 객체생성. 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + param.get("searchKeyword") + "%");
				
				//1 : 1 ~ 10
				//2 : 11 ~ 20
				int cpage = (int)param.get("cpage");
				int numPerPage = (int)param.get("numPerPage");
				pstmt.setInt(2, (cpage - 1) * numPerPage + 1);
				pstmt.setInt(3, cpage * numPerPage);
				
				
				//쿼리문실행
				//완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					Member m = new Member();
					member.setMemberNo(rset.getInt("member_no"));
					member.setMemberId(rset.getString("member_id"));
					member.setMemberName(rset.getString("member_name"));
					member.setNickName(rset.getString("nickname"));
					member.setSsn(rset.getString("ssn"));
					member.setEmail(rset.getString("email"));
					member.setPhone(rset.getString("phone"));
					member.setAddress(rset.getString("address"));
					member.setMemberGrade(rset.getInt("member_grade"));
					member.setMemberRole(rset.getString("member_role"));
					member.setEnrollDate(rset.getDate("enroll_date"));
					member.setDelFlag(rset.getString("del_flag"));
					member.setDelDate(rset.getDate("del_date"));
					list.add(m);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			
			return list;
		}


		public int selectTotalMembers(Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int totalContents = 0;
			String query = prop.getProperty("selectTotalMembers");
			

			try {
				pstmt=conn.prepareStatement(query);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					totalContents = rset.getInt(1);//컬럼 순서로 가져온다.
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return totalContents;
		}


		public int selectTotalMembersBy(Connection conn, Map<String, Object> param) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int totalContents = 0;
			String query = prop.getProperty("selectTotalMembersBy");
			//select count(*) from member where # like ?
			String searchType = (String)param.get("searchType");
			query = query.replace("#",searchType);
			try {
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, "%"+param.get("searchKeyword")+"%");	//여기서 문자열 추가하는 것도 가능합니다. query에서 처리하는 방법과 같이 고민해볼 것.
				rset = pstmt.executeQuery();
				if(rset.next()) {
					totalContents = rset.getInt(1);//컬럼 순서로 가져온다.
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return totalContents;
		}
}

