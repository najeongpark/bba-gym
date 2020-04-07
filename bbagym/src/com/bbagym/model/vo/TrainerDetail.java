package com.bbagym.model.vo;

import java.util.List;
import java.util.Arrays;

public class TrainerDetail {
	
	private String prof_img;
	private String t_name;
	private String t_intro;
	private String m_phone_2;
	private String m_address_2;
	private List<String> t_program_name;
	private List<Integer> t_price;
	private String t_text;
	private String t_career;
	private String t_counsel_hours;
	private String c_name;
	private List<String> t_img;
	private String t_sns_url;
	private String t_sns_type;
	
	public TrainerDetail() {
		// TODO Auto-generated constructor stub
	}
	
	public TrainerDetail(String prof_img, String t_name, String t_intro, String m_phone_2, String m_address_2,
			List<String> t_program_name, List<Integer> t_price, String t_text, String t_career, String t_counsel_hours,
			String c_name, List<String> t_img, String t_sns_url, String t_sns_type) {
		super();
		this.prof_img = prof_img;
		this.t_name = t_name;
		this.t_intro = t_intro;
		this.m_phone_2 = m_phone_2;
		this.m_address_2 = m_address_2;
		this.t_program_name = t_program_name;
		this.t_price = t_price;
		this.t_text = t_text;
		this.t_career = t_career;
		this.t_counsel_hours = t_counsel_hours;
		this.c_name = c_name;
		this.t_img = t_img;
		this.t_sns_url = t_sns_url;
		this.t_sns_type = t_sns_type;
	}

	public String getProf_img() {
		return prof_img;
	}

	public void setProf_img(String prof_img) {
		this.prof_img = prof_img;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getT_intro() {
		return t_intro;
	}

	public void setT_intro(String t_intro) {
		this.t_intro = t_intro;
	}

	public String getM_phone_2() {
		return m_phone_2;
	}

	public void setM_phone_2(String m_phone_2) {
		this.m_phone_2 = m_phone_2;
	}

	public String getM_address_2() {
		return m_address_2;
	}

	public void setM_address_2(String m_address_2) {
		this.m_address_2 = m_address_2;
	}

	public List<String> getT_program_name() {
		return t_program_name;
	}

	public void setT_program_name(List<String> t_program_name) {
		this.t_program_name = t_program_name;
	}

	public List<Integer> getT_price() {
		return t_price;
	}

	public void setT_price(List<Integer> t_price) {
		this.t_price = t_price;
	}

	public String getT_text() {
		return t_text;
	}

	public void setT_text(String t_text) {
		this.t_text = t_text;
	}

	public String getT_career() {
		return t_career;
	}

	public void setT_career(String t_career) {
		this.t_career = t_career;
	}

	public String getT_counsel_hours() {
		return t_counsel_hours;
	}

	public void setT_counsel_hours(String t_counsel_hours) {
		this.t_counsel_hours = t_counsel_hours;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public List<String> getT_img() {
		return t_img;
	}

	public void setT_img(List<String> t_img) {
		this.t_img = t_img;
	}

	public String getT_sns_url() {
		return t_sns_url;
	}

	public void setT_sns_url(String t_sns_url) {
		this.t_sns_url = t_sns_url;
	}

	public String getT_sns_type() {
		return t_sns_type;
	}

	public void setT_sns_type(String t_sns_type) {
		this.t_sns_type = t_sns_type;
	}

	@Override
	public String toString() {
		return "TrainerDetail [prof_img=" + prof_img + ", t_name=" + t_name + ", t_intro=" + t_intro + ", m_phone_2="
				+ m_phone_2 + ", m_address_2=" + m_address_2 + ", t_program_name=" + t_program_name + ", t_price="
				+ t_price + ", t_text=" + t_text + ", t_career=" + t_career + ", t_counsel_hours=" + t_counsel_hours
				+ ", c_name=" + c_name + ", t_img=" + t_img + ", t_sns_url=" + t_sns_url + ", t_sns_type=" + t_sns_type
				+ "]";
	}
	
	

}
