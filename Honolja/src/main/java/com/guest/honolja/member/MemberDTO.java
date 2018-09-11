package com.guest.honolja.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	int rn;
	String u_no;
	String u_member;
	String u_id;
	long u_pwd;
	String u_name;
	String u_birth;
	String u_gender;
	String u_gender2;
	String u_phn;
	String u_img;
	MultipartFile upload_img;
	String u_email;
	String year;
	String month;
	String day;
	String u_date;
	String u_update;
	String u_emailkey;
	int u_cnt;
	
	
	public String getU_id() { return u_id; }
	public void setU_id(String u_id) { this.u_id = u_id; }
	public String getU_no() { return u_no; }
	public void setU_no(String u_no) { this.u_no = u_no; }
	public long getU_pwd() { return u_pwd; }
	public void setU_pwd(long u_pwd) { this.u_pwd = u_pwd; }
	public String getU_name() { return u_name; }
	public void setU_name(String u_name) { this.u_name = u_name; }
	public String getU_birth() { return u_birth; }
	public void setU_birth(String u_birth) { this.u_birth = u_birth; }
	public String getU_gender() { return u_gender; }
	public void setU_gender(String u_gender) { this.u_gender = u_gender; }
	public String getU_gender2() { return u_gender2; }
	public void setU_gender2(String u_gender2) { this.u_gender2 = u_gender2; }
	public String getU_phn() { return u_phn; }
	public void setU_phn(String u_phn) { this.u_phn = u_phn; }
	public String getU_img() { return u_img; }
	public void setU_img(String u_img) { this.u_img = u_img; }
	public String getU_email() { return u_email; }
	public void setU_email(String u_email) { this.u_email = u_email; }
	public int getRn() { return rn; }
	public void setRn(int rn) { this.rn = rn; }
	public String getYear() { return year; }
	public void setYear(String year) { this.year = year; }
	public String getMonth() { return month; }
	public void setMonth(String month) { this.month = month; }
	public String getDay() { return day; }
	public void setDay(String day) { this.day = day; }
	public String getU_member() { return u_member; }
	public void setU_member(String u_member) { this.u_member = u_member; }
	public String getU_date() { return u_date; }
	public void setU_date(String u_date) { this.u_date = u_date; }
	public String getU_update() { return u_update; }
	public void setU_update(String u_update) { this.u_update = u_update; }
	public MultipartFile getUpload_img() { return upload_img; }
	public void setUpload_img(MultipartFile upload_img) { this.upload_img = upload_img; }
	public int getU_cnt() { return u_cnt; }
	public void setU_cnt(int u_cnt) { this.u_cnt = u_cnt; }
	public String getU_emailkey() { return u_emailkey; }
	public void setU_emailkey(String u_emailkey) { this.u_emailkey = u_emailkey; }
	
	
	

}//MemberDTO class END
