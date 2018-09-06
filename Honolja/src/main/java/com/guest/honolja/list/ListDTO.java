package com.guest.honolja.list;

import org.springframework.web.multipart.MultipartFile;

public class ListDTO {
	private  int g_no;
	  private  String g_name;
	  private  String g_addr;
	  private  String g_position_n;
	  private  String g_position_e;
	  private  String g_detail;
	  private  String g_url;
	  private  String guesthouse;
	  private  String img_file_name ;
	  private int rcnt;
	  private  MultipartFile upload_f ;
	 
	public String getG_url() {	return g_url;}
	public void setG_url(String g_url) {this.g_url = g_url;}
	public int getG_no() {return g_no;}
	public void setG_no(int g_no) {this.g_no = g_no;}
	public String getG_name() {return g_name;}
	public void setG_name(String g_name) {this.g_name = g_name;}
	public String getG_addr() {return g_addr;}
	public void setG_addr(String g_addr) {this.g_addr = g_addr;}
	public String getG_position_n() {return g_position_n;}
	public void setG_position_n(String g_position_n) {this.g_position_n = g_position_n;}
	public String getG_position_e() {return g_position_e;}
	public void setG_position_e(String g_position_e) {	this.g_position_e = g_position_e;}
	public String getG_detail() {	return g_detail;}
	public void setG_detail(String g_detail) {this.g_detail = g_detail;}
	public String getGuesthouse() {	return guesthouse;}
	public void setGuesthouse(String guesthouse) {	this.guesthouse = guesthouse;}
	public String getImg_file_name() {	return img_file_name;}
	public void setImg_file_name(String img_file_name) {	this.img_file_name = img_file_name;}
	public int getRcnt() {	return rcnt;}
	public void setRcnt(int rcnt) {	this.rcnt = rcnt;}
	public MultipartFile getUpload_f() {	return upload_f;}
	public void setUpload_f(MultipartFile upload_f) {	this.upload_f = upload_f;}
	

}
