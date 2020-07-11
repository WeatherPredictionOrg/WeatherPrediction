package com.example.demo.enity;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

public class Manage {
	String order;
	String username;
	String password;
	String usernameafter;
	String usernamebefore;
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public String getUsernameafter() {
		return usernameafter;
	}
	public String getUsernamebefore() {
		return usernamebefore;
	}
	
	public String getOrder() {
		return order;
	}
	public void setUsername(String username) {
		this.username=username;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	
	
	//public List<User> getList
	public Manage() {
		super();
	}
}
