package admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class adminVo implements Serializable, HttpSessionBindingListener {
	private String member_no;   //회원 번호
	private String member_Id;	//회원 아이디 필수
	private String member_Name;	//회원 이름 필수
	private String nickname;	//회원 닉네임
	private String member_role;	//회원 유형
	private String member_grade;//회원 등급
	private String ssn;			//회원 주민번호(생년월일 substring)
	private String email;		//회원 이메일
	private String phone;		//회원 전화번호
	private Date   enroll_Date;	//회원 가입일
	private String password;	//회원 비밀번호 필수
	private String del_flag;	//회원 삭제 여부 (Y/N)
	private Date del_date;	//회원 삭제일
	
	private String viewCombo;	//화면 콤보박스 value
	private String viewContent;	//화면 검색어    value
	private String viewAlign;	//화면 정렬 기준 value
	
	public void setDelFlag(String del_flag) {
		this.del_flag = del_flag;
	}
	
	public String getDelFlag() {
		return del_flag;
	}
	
	public void setDelDate(Date del_date) {
		this.del_date = del_date;
	}
	
	public Date getDelDate() {
		return del_date;
	}
	
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
	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public String getMember_Name() {
		return member_Name;
	}
	public void setMember_Name(String member_Name) {
		this.member_Name = member_Name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
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
	public Date getEnroll_Date() {
		return enroll_Date;
	}
	public void setEnroll_Date(Date enroll_Date) {
		this.enroll_Date = enroll_Date;
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