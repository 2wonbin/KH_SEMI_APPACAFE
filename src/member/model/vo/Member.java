package member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memberNo;
	private String memberId;
	private String password;
	private String memberName;
	private String nickName;
	private String ssn;
	private String email;
	private String phone;
	private String zoneCode;
	private String roadAddress;
	private String detail;
	private String grade;
	private String memberRole;
	private Date enrollDate;
	private String delFlag;
	private Date delDate;
	private String passwordQuestion;
	
	public Member() {
		super();
	}







	public Member(int memberNo, String memberId, String password, String memberName, String nickName, String ssn,
			String email, String phone, String zoneCode, String roadAddress, String detail, String grade,
			String memberRole, Date enrollDate, String delFlag, Date delDate, String passwordQuestion) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.nickName = nickName;
		this.ssn = ssn;
		this.email = email;
		this.phone = phone;
		this.zoneCode = zoneCode;
		this.roadAddress = roadAddress;
		this.detail = detail;
		this.grade = grade;
		this.memberRole = memberRole;
		this.enrollDate = enrollDate;
		this.delFlag = delFlag;
		this.delDate = delDate;
		this.passwordQuestion = passwordQuestion;
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

	public String getZoneCode() {
		return zoneCode;
	}
	
	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode;
	}
	
	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String address) {
		this.roadAddress = address;
	}

	public String getDetail() {
		return detail;
	}
	
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
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

	public String getPasswordQuestion() {
		return passwordQuestion;
	}

	public void setPasswordQuestion(String passwordQuestion) {
		this.passwordQuestion = passwordQuestion;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", password=" + password + ", memberName="
				+ memberName + ", nickName=" + nickName + ", ssn=" + ssn + ", email=" + email + ", phone=" + phone
				+ ", zoneCode=" + zoneCode + ", roadAddress=" + roadAddress + ", detail=" + detail + ", grade=" + grade
				+ ", memberRole=" + memberRole + ", enrollDate=" + enrollDate + ", delFlag=" + delFlag + ", delDate="
				+ delDate + ", passwordQuestion=" + passwordQuestion + "]";
	}



	
	


	
	
	
	
	
}
