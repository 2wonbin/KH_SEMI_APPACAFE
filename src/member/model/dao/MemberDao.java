package member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;
import static common.JDBCTemplate.close;

public class MemberDao {
	
	private Properties prop = new Properties();

	public MemberDao() {
		String fileName = "/sql/member/member-query.properties";
		String path = MemberDao.class.getResource(fileName).getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int addMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("addMember"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getNickName());
			pstmt.setString(5, member.getSsn());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getZoneCode());
			pstmt.setString(9, member.getRoadAddress());
			pstmt.setString(10, member.getDetail());
			pstmt.setString(11, member.getPasswordQuestion());
			
//			String zoneCode = member.getZoneCode();
//			String roadAddress = member.getRoadAddress();
//			String detail = member.getDetail();
			
//			System.out.println(zoneCode);
//			System.out.println(roadAddress);
//			System.out.println(detail);
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public Member selectMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		Member member = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			//2.Statement실행 및 결과처리:ResultSet -> Member
			rset = pstmt.executeQuery();
			while(rset.next()) {
				member = new Member();
				member.setMemberNo(rset.getInt("member_no"));
				member.setMemberId(rset.getString("member_id"));
				member.setPassword(rset.getString("password"));
				member.setMemberName(rset.getString("member_name"));
				member.setNickName(rset.getString("nickname"));
				member.setSsn(rset.getString("ssn"));
				member.setEmail(rset.getString("email"));
				member.setPhone(rset.getString("phone"));
				member.setZoneCode(rset.getString("zone_code"));
				member.setRoadAddress(rset.getString("road_address"));
				member.setDetail(rset.getString("detail"));
				member.setMemberRole(rset.getString("member_role"));
				member.setEnrollDate(rset.getDate("enroll_date"));
				member.setDelFlag(rset.getString("del_flag"));
				member.setDelDate(rset.getDate("del_date"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMember"); 
		
		try {
			
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, member.getNickName());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getZoneCode());
			pstmt.setString(5, member.getRoadAddress());
			pstmt.setString(6, member.getDetail());
			pstmt.setString(7, member.getMemberId());
			
			String t = member.getNickName();
			System.out.println(t);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public int passwordChange(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("passwordChange"); 

		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public int deleteMember(Connection conn, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteMember"); 

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public Member checkNickName(Connection conn, String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNickName");
		Member member = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			
			//2.Statement실행 및 결과처리:ResultSet -> Member
			rset = pstmt.executeQuery();
			while(rset.next()) {
				member = new Member();
				member.setMemberNo(rset.getInt("member_no"));
				member.setMemberId(rset.getString("member_id"));
				member.setPassword(rset.getString("password"));
				member.setMemberName(rset.getString("member_name"));
				member.setNickName(rset.getString("nickname"));
				member.setSsn(rset.getString("ssn"));
				member.setEmail(rset.getString("email"));
				member.setPhone(rset.getString("phone"));
				member.setZoneCode(rset.getString("zone_code"));
				member.setRoadAddress(rset.getString("road_address"));
				member.setDetail(rset.getString("detail"));
				member.setGrade(rset.getString("member_grade"));
				member.setMemberRole(rset.getString("member_role"));
				member.setEnrollDate(rset.getDate("enroll_date"));
				member.setDelFlag(rset.getString("del_flag"));
				member.setDelDate(rset.getDate("del_date"));
				member.setPasswordQuestion(rset.getString("password_question"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return member;
		
	}

	public Member findId(Connection conn, String memberName, String ssn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findId");
		Member member = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, ssn);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				member = new Member();
				member.setMemberId(rset.getString("member_id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	public Member findPassword(Connection conn, String memberId, String ssn, String answer) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findPassword");
		Member member = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, ssn);
			pstmt.setString(3, answer);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				member = new Member();
				member.setMemberId(rset.getString("member_id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	public int kakaoEnroll(Connection conn, int kakaoID, String memberID) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("kakaoEnroll"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, memberID);
			pstmt.setInt(2, kakaoID);
			
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int kakaoDelete(Connection conn, String memberID) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("kakaoDelete"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setString(1, memberID);
			
			//쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			//DML은 executeUpdate()
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member findPeristalsis(Connection conn, String sKakaoID) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findPeristalsis");
		Member member = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sKakaoID);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				member = new Member();
				member.setMemberId(rset.getString("member_ID_ref"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
}
