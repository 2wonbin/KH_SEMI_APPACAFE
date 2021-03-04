package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	public static final String ADMIN_MEMBER_ROLE = "A";
	public static final String USER_MEMBER_ROLE = "U";
	
	private MemberDao memberDao = new MemberDao();

	public Member selectOne(String memberId) {
		
			//1.Connection객체 생성
				Connection conn = getConnection();
				//2.dao요청
				Member member =  memberDao.selectOne(conn, memberId);
				//3.트랜잭션관리(DML만)
				//4.자원반납
				close(conn);
				return member;
	}
}
