package board.model.vo;

import java.sql.Date;

public class SellBoard {

		private int boardNo;
		private String boardTitle;
		private String productName;
		private String seller;
		private String boardOriginalFileName;
		private String boardRenamedFileName;
		private int price;
		private String boardContent;
		private Date boardDate;
		private int boardReadCount;
		
		
		public SellBoard(){
			super();
			
		}
		public SellBoard(int boardNo,String boardTitle, String productName, String seller, String boardOriginalFileName,
				String boardRenamedFileName, int price, String boardContent, Date boardDate) {
			super();
			
			this.boardNo = boardNo;
			this.boardTitle = boardTitle;
			this.productName = productName;
			this.seller = seller;
			this.boardOriginalFileName = boardOriginalFileName;
			this.boardRenamedFileName = boardRenamedFileName;
			this.price = price;
			this.boardContent = boardContent;
			this.boardDate = boardDate;
		}
		public int getBoardNo() {
			return boardNo;
		}
		public void setBoardNo(int boardNo) {
			this.boardNo = boardNo;
		}
		public String getBoardTitle() {
			return boardTitle;
		}
		public void setBoardTitle(String boardTitle) {
			this.boardTitle = boardTitle;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public String getSeller() {
			return seller;
		}
		public void setSeller(String seller) {
			this.seller = seller;
		}
		public String getBoardOriginalFileName() {
			return boardOriginalFileName;
		}
		public void setBoardOriginalFileName(String boardOriginalFileName) {
			this.boardOriginalFileName = boardOriginalFileName;
		}
		public String getBoardRenamedFileName() {
			return boardRenamedFileName;
		}
		public void setBoardRenamedFileName(String boardRenamedFileName) {
			this.boardRenamedFileName = boardRenamedFileName;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getBoardContent() {
			return boardContent;
		}
		public void setBoardContent(String boardContent) {
			this.boardContent = boardContent;
		}
		public Date getBoardDate() {
			return boardDate;
		}
		public void setBoardDate(Date boardDate) {
			this.boardDate = boardDate;
		}
		public int getBoardReadCount() {
			return boardReadCount;
		}
		public void setBoardReadCount(int boardReadCount) {
			this.boardReadCount = boardReadCount;
		}
}
