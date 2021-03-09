package board.model.vo;

import java.sql.Date;

public class SellBoardComment {
	private int sellBoardCommentNo;
	private int sellBoardCommentLevel;
	private String sellBoardCommentWriter;
	private String sellBoardCommentContent;
	private int sellBoardRef;
	
	@Override
	public String toString() {
		return "SellBoardComment [sellBoardCommentNo=" + sellBoardCommentNo + ", sellBoardCommentLevel="
				+ sellBoardCommentLevel + ", sellBoardCommentWriter=" + sellBoardCommentWriter
				+ ", sellBoardCommentContent=" + sellBoardCommentContent + ", sellBoardRef=" + sellBoardRef
				+ ", sellBoardCommentRef=" + sellBoardCommentRef + ", sellBoardCommentDate=" + sellBoardCommentDate
				+ "]";
	}
	private int sellBoardCommentRef;
	
	public SellBoardComment() {
		
	}
	
	public SellBoardComment(int sellBoardCommentNo, int sellBoardCommentLevel, String sellBoardCommentWriter,
			String sellBoardCommentContent, int sellBoardRef, int sellBoardCommentRef, Date sellBoardCommentDate) {
		super();
		this.sellBoardCommentNo = sellBoardCommentNo;
		this.sellBoardCommentLevel = sellBoardCommentLevel;
		this.sellBoardCommentWriter = sellBoardCommentWriter;
		this.sellBoardCommentContent = sellBoardCommentContent;
		this.sellBoardRef = sellBoardRef;
		this.sellBoardCommentRef = sellBoardCommentRef;
		this.sellBoardCommentDate = sellBoardCommentDate;
	}
	public int getSellBoardCommentNo() {
		return sellBoardCommentNo;
	}
	public void setSellBoardCommentNo(int sellBoardCommentNo) {
		this.sellBoardCommentNo = sellBoardCommentNo;
	}
	public int getSellBoardCommentLevel() {
		return sellBoardCommentLevel;
	}
	public void setSellBoardCommentLevel(int sellBoardCommentLevel) {
		this.sellBoardCommentLevel = sellBoardCommentLevel;
	}
	public String getSellBoardCommentWriter() {
		return sellBoardCommentWriter;
	}
	public void setSellBoardCommentWriter(String sellBoardCommentWriter) {
		this.sellBoardCommentWriter = sellBoardCommentWriter;
	}
	public String getSellBoardCommentContent() {
		return sellBoardCommentContent;
	}
	public void setSellBoardCommentContent(String sellBoardCommentContent) {
		this.sellBoardCommentContent = sellBoardCommentContent;
	}
	public int getSellBoardRef() {
		return sellBoardRef;
	}
	public void setSellBoardRef(int sellBoardRef) {
		this.sellBoardRef = sellBoardRef;
	}
	public int getSellBoardCommentRef() {
		return sellBoardCommentRef;
	}
	public void setSellBoardCommentRef(int sellBoardCommentRef) {
		this.sellBoardCommentRef = sellBoardCommentRef;
	}
	public Date getSellBoardCommentDate() {
		return sellBoardCommentDate;
	}
	public void setSellBoardCommentDate(Date sellBoardCommentDate) {
		this.sellBoardCommentDate = sellBoardCommentDate;
	}
	private Date sellBoardCommentDate;
}
