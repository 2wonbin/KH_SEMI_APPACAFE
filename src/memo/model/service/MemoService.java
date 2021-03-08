package memo.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

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
}
