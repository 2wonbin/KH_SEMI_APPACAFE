package board.model.service;


import static common.JDBCTemplate.close;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import board.model.dao.BoardDao;
import board.model.vo.BoardComment;
import board.model.vo.BoardVo;
import board.model.vo.SellBoard;


public class BoardService {
	
	private BoardDao boardDao = new BoardDao();
	
	
	public List<BoardVo> selectBoardList(int cpage, int numPerPage) {
		Connection conn = getConnection();
		List<BoardVo> list= boardDao.selectBoardList(conn, cpage, numPerPage);
		close(conn);
		return list;
	}
	
	public int selectBoardCount() {
		Connection conn = getConnection();
		int totalBoardCount = boardDao.selectBoardCount(conn);
		close(conn);
		return totalBoardCount;
	}

	public int insertBoard(BoardVo board) {
		Connection conn = getConnection();
		int result = boardDao.insertBoard(conn, board);
		if(result > 0) {
			//게시글 성공한 경우, 등록된 게시글 번호 가져오기
			int boardNo = boardDao.selectLastBoardNo(conn);
			board.setBoardNo(boardNo);
			commit(conn);
		}
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public List<SellBoard> selectSellBoardList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<SellBoard> list= boardDao.selectSellBoardList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectSellBoardCount() {
		Connection conn = getConnection();
		int totalBoardCount = boardDao.selectSellBoardCount(conn);
		close(conn);
		return totalBoardCount;
	}

	public int enrollSellBoard(SellBoard sellBoard) {
		Connection conn = getConnection();
		int result = boardDao.enrollSellBoard(conn, sellBoard);
		if(result > 0) {
			
			//게시글 성공한 경우 보드 넘버, 수정 필요
			int boardNo = boardDao.selectLastSellBoardNo(conn);
			sellBoard.setBoardNo(boardNo);
			commit(conn);
		}
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public SellBoard selectSellBoard(int boardNo) {
		Connection conn = getConnection();
		SellBoard board = boardDao.selectSellBoard(conn, boardNo);
		close(conn);
		return board;
	}
	
	public List<BoardVo> selectBoardList(int cpage, int numPerPage, String boardType) {
		Connection conn = getConnection();
		List<BoardVo> list= boardDao.selectBoardList(conn, cpage, numPerPage, boardType);
		close(conn);
		return list;
	}
	
	public int selectBoardCount(String boardType) {
		Connection conn = getConnection();
		int totalBoardCount = boardDao.selectBoardCount(conn, boardType);
		close(conn);
		return totalBoardCount;
	}
	
	public BoardVo selectBoard(int boardNo, String boardType) {
		Connection conn = getConnection();
		BoardVo vo = boardDao.selectBoard(conn, boardNo, boardType);
		close(conn);
		return vo;
	}
	
	public int updateBoardReadCount(int boardNo) {
		Connection conn = getConnection();
		int result = boardDao.updateBoardReadCount(conn, boardNo);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	
	public int updateBoard(BoardVo board) {
		Connection conn = getConnection();
		int result = boardDao.updateBoard(conn, board);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteBoard(int boardNo, String boardType) {
		Connection conn = getConnection();
		int result = boardDao.deleteBoard(conn, boardNo, boardType);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<BoardComment> selectCommentList(int board_no) {
		Connection conn = getConnection();
		List<BoardComment> list= boardDao.selectCommentList(conn, board_no);
		close(conn);
		return list;
	}
	
	public int insertBoardComment(BoardComment boardComment) {
		Connection conn = getConnection();
		int result = boardDao.insertBoardComment(conn, boardComment);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteBoardComment(int boardCommentNo) {
		Connection conn = getConnection();
		int result = boardDao.deleteBoardComment(conn, boardCommentNo);
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		return result;
	}

}
