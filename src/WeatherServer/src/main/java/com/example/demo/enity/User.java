package com.example.demo.enity;

public class User implements java.io.Serializable{
	String username;
	String password;
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public void setUsername(String username) {
		this.username=username;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public User() {
		super();
	}
}