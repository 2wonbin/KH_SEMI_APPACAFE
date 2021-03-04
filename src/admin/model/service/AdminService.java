package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import admin.model.dao.AdminDao;
import member.model.vo.Member;

public class AdminService {
	
	AdminDao adminDao = new AdminDao();

	public List<Member> selectList(int currentPage, int numPerPage) {
		//1.Connection객체 생성
		Connection conn = getConnection();
		//2.dao요청
		List<Member> list =  adminDao.selectList(conn, currentPage, numPerPage);
		//4.자원반납
		close(conn);
		return list;
		
	}

	public int updateMemberRole(String memberId, String memberRole) {
		int result = 0;
		Connection conn = getConnection();
		result = adminDao.updateMemberRole(conn, memberId, memberRole);
		
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}


	public int selectTotalMembers() {
		Connection conn = getConnection();
		int result = adminDao.selectTotalMembers(conn);
		close(conn);
		return result;
	}

	public List<Member> selectMembersBy(Map<String, Object> param) {
		//1.Connection객체 생성
		Connection conn = getConnection();
		//2.dao요청
		List<Member> list = adminDao.selectMembersBy(conn, param);
		//4.자원반납
		close(conn);
				
		return list;
	}

	public int selectTotalMembersBy(Map<String, Object> param) {
		Connection conn = getConnection();
		int result = adminDao.selectTotalMembersBy(conn,param);
		close(conn);
		return result;
		
	}
}
