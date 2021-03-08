package memo.model.vo;

import java.sql.Date;

public class MemoVo {
	private int memoNo;
	private Date sendDate;
	private int sender;
	private String senderNickname;
	private int receiver;
	private String receiverNickname;
	private String content;
	private Boolean isRead;
	
	public MemoVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemoVo(int memoNo, Date sendDate, int sender, String senderNickname, int receiver, String receiverNickname,
			String content, Boolean isRead) {
		super();
		this.memoNo = memoNo;
		this.sendDate = sendDate;
		this.sender = sender;
		this.senderNickname = senderNickname;
		this.receiver = receiver;
		this.receiverNickname = receiverNickname;
		this.content = content;
		this.isRead = isRead;
	}

	public int getMemoNo() {
		return memoNo;
	}

	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public int getSender() {
		return sender;
	}

	public void setSender(int sender) {
		this.sender = sender;
	}

	public String getSenderNickname() {
		return senderNickname;
	}

	public void setSenderNickname(String senderNickname) {
		this.senderNickname = senderNickname;
	}

	public int getReceiver() {
		return receiver;
	}

	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}

	public String getReceiverNickname() {
		return receiverNickname;
	}

	public void setReceiverNickname(String receiverNickname) {
		this.receiverNickname = receiverNickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}

	@Override
	public String toString() {
		return "MemoVo [memoNo=" + memoNo + ", sendDate=" + sendDate + ", sender=" + sender + ", senderNickname="
				+ senderNickname + ", receiver=" + receiver + ", receiverNickname=" + receiverNickname + ", content="
				+ content + ", isRead=" + isRead + "]";
	}
	
}
