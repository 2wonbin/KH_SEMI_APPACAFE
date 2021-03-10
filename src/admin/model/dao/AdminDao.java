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

import admin.model.vo.adminVo;
import member.model.vo.Member;

public class AdminDao {
	
	private Properties prop = new  Properties();
	
	public AdminDao() {		
		String fileName = "/sql/admin/admin-query.properties";
		String absPath = AdminDao.class.getResource(fileName).getPath();
		try {
			prop.load(new FileReader(absPath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<adminVo> selectList(Connection conn, adminVo searchVal) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserInfoList");
		List<adminVo> list = null;
		
		try {
			//1. PreparedStatement객체 생성
			//2. 미완성 쿼리 값대입
			pstmt = conn.prepareStatement(sql);
			System.out.println("combo : " + searchVal.getViewCombo() + " content : " + searchVal.getViewContent());
			pstmt.setString(1, searchVal.getViewCombo());
			pstmt.setString(2, searchVal.getViewContent());
			pstmt.setString(3, searchVal.getViewCombo());
			pstmt.setString(4, searchVal.getViewContent());
			pstmt.setString(5, searchVal.getViewCombo());
			//1 : 1 ~ 10
			//2 : 11 ~ 20
			//3 : 21 ~ 30
			//...
			//12 : 111 ~ 120
			
			//3. 실행 및 ResultSet처리
			rset = pstmt.executeQuery();
			//4. Member --> List에 추가
			list = new ArrayList<>();
			while(rset.next()) {
				adminVo member = new adminVo();
				member.setMember_no(rset.getNString("member_no")); //회원번호
				member.setMemberId(rset.getString("member_id")); //회원 아이디
				member.setMemberName(rset.getString("member_name")); // 회원 성명
				member.setNickName(rset.getString("nickname")); //회원 닉네임
				member.setSsn(rset.getString("ssn")); //생년월일  (주민번호)
				member.setPhone(rset.getString("phone")); //회원 전화번호
				member.setZoneCode(rset.getString("zone_code"));
				member.setRoadAddress(rset.getString("road_address"));
				member.setDetail(rset.getString("detail"));
				member.setMemberRole(rset.getString("member_role")); //회원 유형
				member.setEmail(rset.getString("email")); //회원 이메일
				member.setEnrollDate(rset.getDate("enroll_date")); // 회원 가입일
				member.setDelFlag(rset.getString("del_flag"));
				member.setDelDate(rset.getDate("del_date"));
				member.setPasswordQuestion(rset.getString("password_question"));
				list.add(member);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//5. 자원반납
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int updateUserRole(Connection conn, adminVo adminVo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateUserRole");
		try {
			System.out.println("DAO - role : " + adminVo.getMemberRole() + " no : " + adminVo.getMemberId() + " del_flag : " + adminVo.getDelFlag());
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, adminVo.getMemberRole());
			pstmt.setString(2, adminVo.getDelFlag());
			pstmt.setString(3, adminVo.getDelFlag());
			pstmt.setString(4, adminVo.getMemberId());
			System.out.println("DAO_1");
			result = pstmt.executeUpdate();
			System.out.println("DAO_2");
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("DAO - result : " + result);
		return result;
	}
}
