package com.example.demo.enity;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import lombok.*;


//@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class Data implements java.io.Serializable{
	String date1;
	String date2;
	String date;
	String order;
	public String getDate1() {
		return date1;
	}
	public String getDate2() {
		return date2;
	}
	public String getDate() {
		return date;
	}
	public String getOrder() {
		return order;
	}
	public void setDate1(String date1) {
		this.date1=date1;
	}
	public void setDate2(String date2) {
		this.date2=date2;
	}
	public void setOrder(String order) {
		this.order=order;
	}
	public void setDate(String date) {
		this.date=date;
	}
	public Data() {
		super();
	}
}
