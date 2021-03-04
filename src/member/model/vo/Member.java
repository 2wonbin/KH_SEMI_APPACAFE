package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	private int memberNo;
	private String memberId;
	private String password;
	private String memberName;
	private String nickName;
	private String ssn;
	private String email;
	private String phone;
	private String address;
	private int memberGrade;
	private String memberRole;
	private Date enrollDate;
	private String delFlag;
	private Date delDate;
	
	public Member() {
		super();
		
	}

	public Member(int memberNo, String memberId, String password, String memberName, int memberGrade, String memberRole,
			String nickName, String ssn, String email, String phone, String address, Date enrollDate, String delFlag,
			Date delDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.memberGrade = memberGrade;
		this.memberRole = memberRole;
		this.nickName = nickName;
		this.ssn = ssn;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.enrollDate = enrollDate;
		this.delFlag = delFlag;
		this.delDate = delDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(int memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", password=" + password + ", memberName="
				+ memberName + ", memberGrade=" + memberGrade + ", memberRole=" + memberRole + ", nickName=" + nickName
				+ ", ssn=" + ssn + ", email=" + email + ", phone=" + phone + ", address=" + address + ", enrollDate="
				+ enrollDate + ", delFlag=" + delFlag + ", delDate=" + delDate + "]";
	}
	
	

}
