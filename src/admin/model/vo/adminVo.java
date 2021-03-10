package admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class adminVo implements Serializable, HttpSessionBindingListener {
	private String member_no;   //회원 번호
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
	
	private String viewCombo;	//화면 콤보박스 value
	private String viewContent;	//화면 검색어    value
	private String viewAlign;	//화면 정렬 기준 value
	private final static String last_6_char_pattern = "(.{6}$)";
	
	public void setViewCombo(String viewCombo) {
		this.viewCombo = viewCombo;
	}
	
	public String getViewCombo() {
		return viewCombo;
	}
	
	public void setViewContent(String viewContent) {
		this.viewContent = viewContent;
	}
	
	public String getViewContent() {
		return viewContent;
	}
	
	public void setViewAlign(String viewAlign) {
		this.viewAlign = viewAlign;
	}
	
	public String getViewAlign() {
		return viewAlign;
	}

	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public String getZoneCode() {
		return zoneCode;
	}

	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
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

	public String getSsn() {
		if(ssn == null || "".equals(ssn) || ssn.length() < 6) 
			return ssn; 
		
		return ssn.replaceAll(last_6_char_pattern, "******");

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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}
}