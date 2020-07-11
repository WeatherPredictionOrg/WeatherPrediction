package com.example.demo.enity;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;

//@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class User implements java.io.Serializable{
	String username;
	String password;
	String roles;
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public String getRole() {
		return roles;
	}
	public void setUsername(String username) {
		this.username=username;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public void setRole(String role) {
		this.roles=role;
	}
	public JSONObject getJSONObject() {
        Map<String, Object> map = new HashMap<>();
        map.put("username", username);
        map.put("password", password);
        JSONObject obj = new JSONObject(map);
        return obj;
    }
	//public List<User> getList
	public User() {
		super();
	}
}
