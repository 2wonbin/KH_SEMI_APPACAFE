package memo.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import member.model.dao.MemberDao;
import memo.model.vo.MemoVo;

public class MemoDao {
	
	private Properties prop = new Properties();

	public MemoDao() {
		String fileName = "/sql/memo/memo-query.properties";
		String path = MemoDao.class.getResource(fileName).getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public List<MemoVo> selectMemoList(Connection conn, int cPage, int numPerPage, int receiver) {
		List<MemoVo> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemoList");
		
		try{

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, receiver);
			//pstmt.setInt(2, (cPage-1)*numPerPage+1);
			//pstmt.setInt(3, cPage*numPerPage);
			

			rset = pstmt.executeQuery();
			
			while(rset.next()){

				MemoVo b = new MemoVo();
				b.setMemoNo(rset.getInt("memo_no"));
				b.setSendDate(rset.getDate("send_date"));
				b.setSender(rset.getInt("sender"));
				b.setReceiver(rset.getInt("receiver"));
				b.setSenderNickname(rset.getString("sender_nickname"));
				b.setReceiverNickname(rset.getString("receiver_nickname"));
				b.setContent(rset.getString("memo_content"));
				b.setIsRead(rset.getString("isread") == "1" ? true : false);
				
				

				list.add(b);
			}
			
		}catch(Exception e){
			throw new RuntimeException("게시물 조회 오류", e);
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	

	public int selectMemoCount(Connection conn, int receiver) {
		PreparedStatement pstmt = null;
		int totalContents = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectMemoCount");
		
		try{
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				totalContents = rset.getInt("cnt");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return totalContents;
	}
	
	public MemoVo selectMemo(Connection conn, int memoNo) {
		MemoVo memo = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemo");
		
		try{

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, memoNo);
			
			rset = pstmt.executeQuery();
			
			rset.next();
			
			memo = new MemoVo();
			memo.setSendDate(rset.getDate("send_date"));
			memo.setSender(rset.getInt("sender"));
			memo.setSenderNickname(rset.getString("sender_nickname"));
			memo.setContent(rset.getString("memo_content"));
				
		}catch(Exception e){
			throw new RuntimeException("게시물 조회 오류", e);
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return memo;
	}
	
	
	public String selectMemeberNickname(Connection conn, int memeberNo) {
		String nickname = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMemeberNickname");
		
		try{

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, memeberNo);
			
			rset = pstmt.executeQuery();
			
			rset.next();
			
			nickname = rset.getString("nickname");

		}catch(Exception e){
			throw new RuntimeException("게시물 조회 오류", e);
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return nickname;
	}


	public int insertMemo(Connection conn, MemoVo memo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertMemo"); 
		
		try {
			//미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			//쿼리문미완성
			pstmt.setInt(1, memo.getSender());
			pstmt.setInt(2, memo.getReceiver());
			pstmt.setString(3, memo.getContent());


			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
