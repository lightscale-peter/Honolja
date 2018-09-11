package com.guest.honolja.board;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {
	private String b_title;
	private String b_content;
	private Date b_date;
	private String b_member;
	private String b_viewcnt;
	private String u_id;
	private MultipartFile b_uploadfilename2;
	private String b_uploadfilename;
	private String b_originalfilename;
	//hi hihihi
	private long b_filesize;
	private String skey,sval;
	private int cnt;

	private int rn;
	private int start;
	private int end;
	
	
	public MultipartFile getB_uploadfilename2() {
		return b_uploadfilename2;
	}
	public void setB_uploadfilename2(MultipartFile b_uploadfilename2) {
		this.b_uploadfilename2 = b_uploadfilename2;
	}
	
	public String getB_uploadfilename() {
		return b_uploadfilename;
	}
	public void setB_uploadfilename(String b_uploadfilename) {
		this.b_uploadfilename = b_uploadfilename;
	}
	public long getB_filesize() {
		return b_filesize;
	}
	public void setB_filesize(long b_filesize) {
		this.b_filesize = b_filesize;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSkey() {
		return skey;
	}
	public void setSkey(String skey) {
		this.skey = skey;
	}
	public String getSval() {
		return sval;
	}
	public void setSval(String sval) {
		this.sval = sval;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public String getB_member() {
		return b_member;
	}
	public void setB_member(String b_member) {
		this.b_member = b_member;
	}
	public String getB_viewcnt() {
		return b_viewcnt;
	}
	public void setB_viewcnt(String b_viewcnt) {
		this.b_viewcnt = b_viewcnt;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getB_originalfilename() {
		return b_originalfilename;
	}
	public void setB_originalfilename(String b_originalfilename) {
		this.b_originalfilename = b_originalfilename;
	}

	
	
	

}
