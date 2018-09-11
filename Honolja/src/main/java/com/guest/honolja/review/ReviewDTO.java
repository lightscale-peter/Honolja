package com.guest.honolja.review;

import java.util.Date;

public class ReviewDTO {

	private int re_no;
	private String re_title;
	private String re_content;
	private String re_like;
	private String re_score;
	private Date re_date;
	private String i_name;
	private String re_img;
	private String u_id;
	private int g_no;

	public int getRe_no() {
		return re_no;
	}

	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}

	public String getRe_title() {
		return re_title;
	}

	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_like() {
		return re_like;
	}

	public void setRe_like(String re_like) {
		this.re_like = re_like;
	}

	public String getRe_score() {
		return re_score;
	}

	public void setRe_score(String re_score) {
		this.re_score = re_score;
	}

	public Date getRe_date() {
		return re_date;
	}

	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public String getRe_img() {
		return re_img;
	}

	public void setRe_img(String re_img) {
		this.re_img = re_img;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

}
