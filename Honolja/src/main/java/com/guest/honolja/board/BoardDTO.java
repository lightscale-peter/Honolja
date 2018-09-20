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
	private long b_filesize;
	private String skey,sval;
	private int cnt;
	private int start;
	private int end;
	private Date br_date;
	private int rcnt;
	private int rn;
	private int brr_no;
	private String brr_content;
	private Date brr_date; 
	private String br_no;  
	private int depth;
	private String b_no;
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
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
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
	public String getB_originalfilename() {
		return b_originalfilename;
	}
	public void setB_originalfilename(String b_originalfilename) {
		this.b_originalfilename = b_originalfilename;
	}
	public long getB_filesize() {
		return b_filesize;
	}
	public void setB_filesize(long b_filesize) {
		this.b_filesize = b_filesize;
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
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
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
	public Date getBr_date() {
		return br_date;
	}
	public void setBr_date(Date br_date) {
		this.br_date = br_date;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getBrr_no() {
		return brr_no;
	}
	public void setBrr_no(int brr_no) {
		this.brr_no = brr_no;
	}
	public String getBrr_content() {
		return brr_content;
	}
	public void setBrr_content(String brr_content) {
		this.brr_content = brr_content;
	}
	public Date getBrr_date() {
		return brr_date;
	}
	public void setBrr_date(Date brr_date) {
		this.brr_date = brr_date;
	}
	public String getBr_no() {
		return br_no;
	}
	public void setBr_no(String br_no) {
		this.br_no = br_no;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	
	
	
	

}
