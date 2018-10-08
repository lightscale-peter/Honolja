package com.guest.honolja.reservation;

import java.util.Date;

public class ReservationDTO {
	private int res_no;
	private String u_id;
	private int res_price;
	private char res_ok;
	private int res_people;
	private Date res_date;
	private String check_in;
	private String check_out;
	private int r_no;
	private int g_no;

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getRes_price() {
		return res_price;
	}

	public void setRes_price(int res_price) {
		this.res_price = res_price;
	}

	public char getRes_ok() {
		return res_ok;
	}

	public int getRes_people() {
		return res_people;
	}

	public void setRes_people(int res_people) {
		this.res_people = res_people;
	}

	public Date getRes_date() {
		return res_date;
	}

	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}

	public void setRes_ok(char res_ok) {
		this.res_ok = res_ok;
	}

	public String getCheck_in() {
		return check_in;
	}

	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}

	public String getChech_out() {
		return check_out;
	}

	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

}
