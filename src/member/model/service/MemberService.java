package member.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {
	public static final String ADMIN_MEMBER_ROLE = "A";
	public static final String USER_MEMBER_ROLE = "U";

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

}
