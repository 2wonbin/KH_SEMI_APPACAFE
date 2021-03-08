package member.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	private MemberDao memberDao = new MemberDao();
	
	public int addMember(Member member) {
		Connection conn = getConnection();
		
		int result = memberDao.addMember(conn, member);
		
		//트랜잭션 처리
		if(result > 0)
			commit(conn);
		else 
			rollback(conn);
		
		//자원반납
		close(conn);
		
		return result;
	}

	public Member selectMember(String memberId) {
		Connection conn = getConnection();
		
		Member member =  memberDao.selectMember(conn, memberId);
		
		close(conn);
		
		return member;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		
		int result = memberDao.updateMember(conn, member);
		
		if(result > 0)
			commit(conn);
		else 
			rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int passwordChange(Member member) {
		Connection conn = getConnection();
		
		int result = memberDao.passwordChange(conn, member);
		
		if(result > 0)
			commit(conn);
		else 
			rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int deleteMember(String memberId) {
		Connection conn = getConnection();
		
		int result = memberDao.deleteMember(conn, memberId);
		
		if(result > 0)
			commit(conn);
		else 
			rollback(conn);
		
		close(conn);
		
		return result;
	}

	public Member checkNickName(String nickName) {
		Connection conn = getConnection();
		
		Member member =  memberDao.checkNickName(conn, nickName);
		
		close(conn);
		
		return member;
	}

}
