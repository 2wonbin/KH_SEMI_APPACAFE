package admin.model.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.sql.ConnectionEvent;

import admin.model.vo.adminVo;
import member.model.vo.Member;
import admin.model.dao.AdminDao;
import static common.JDBCTemplate.*; 

public class AdminService {
	
	private AdminDao adminDao = new AdminDao();

	public List<adminVo> selectList(adminVo searchVal) {
		Connection conn = getConnection();
		List<adminVo> list = adminDao.selectList(conn, searchVal);
		close(conn);
		return list;
	}
	
	public int updateUserRole(adminVo adminVo) {
		Connection conn = getConnection();
		System.out.println("SERVICE_1");
		int result = adminDao.updateUserRole(conn, adminVo);
		System.out.println("SERVICE - result : " + result);
		if(result > 0) {
			System.out.println("1");
			commit(conn);
		} else {
			System.out.println("0");
			rollback(conn);
			close(conn);
		}
		return result;
	}
}
