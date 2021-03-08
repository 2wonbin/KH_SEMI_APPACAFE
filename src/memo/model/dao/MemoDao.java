package memo.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
}
