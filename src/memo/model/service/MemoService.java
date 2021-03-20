package memo.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import member.model.vo.Member;
import memo.model.dao.MemoDao;
import memo.model.vo.MemoVo;

public class MemoService {
	
	private MemoDao memoDao = new MemoDao();
	
	public List<MemoVo> selectMemoList(int cpage, int numPerPage, int receiver) {
		Connection conn = getConnection();
		List<MemoVo> list= memoDao.selectMemoList(conn, cpage, numPerPage, receiver);
		close(conn);
		return list;
	}
	
	public int selectMemoCount(int receiver) {
		Connection conn = getConnection();
		int totalMemoCount = memoDao.selectMemoCount(conn, receiver);
		close(conn);
		return totalMemoCount;
	}
	
	
	public int readMemo(int memoNo) {
		Connection conn = getConnection();
		int result = memoDao.readMemo(conn, memoNo);
		
		if(result > 0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public MemoVo selectMemo(int memoNo) {
		Connection conn = getConnection();
		MemoVo memo = memoDao.selectMemo(conn, memoNo);
		close(conn);
		return memo;
	}
	
	public String selectMemeberNickname(int memberNo) {
		Connection conn = getConnection();
		String nickname = memoDao.selectMemeberNickname(conn, memberNo);
		close(conn);
		return nickname;
	}

	public String selectMemeberNickname(String memberId) {
		Connection conn = getConnection();
		String nickname = memoDao.selectMemeberNickname(conn, memberId);
		close(conn);
		return nickname;
	}
	
	public int selectMemeberNoFromMemberId(String memberId) {
		Connection conn = getConnection();
		int memberNo = memoDao.selectMemeberNoFromMemberId(conn, memberId);
		close(conn);
		return memberNo;
	}

	public int insertMemo(MemoVo memo) {
		
			Connection conn = getConnection();
			
			int result = memoDao.insertMemo(conn, memo);
			
			//트랜잭션 처리
			if(result > 0)
				commit(conn);
			else 
				rollback(conn);
			
			//자원반납
			close(conn);
			
			return result;
	}
	
	
	public int countUnReadMemo(int receiver) {
		Connection conn = getConnection();
		int isread = memoDao.countUnReadMemo(conn, receiver);
		close(conn);
		return isread;
	}
	
	
}
