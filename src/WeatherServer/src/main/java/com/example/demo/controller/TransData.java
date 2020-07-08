package com.example.demo.controller;
import java.util.concurrent.atomic.AtomicLong;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.json.JSONObject;
import org.python.jline.internal.Log;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.enity.Data;
import com.example.demo.enity.User;
import com.example.demo.function.Function;
import com.example.demo.shiro.*;

@RestController
//@RequestMapping("http://localhost:8080/#")
public class TransData {
	    @RequestMapping(value = "/login", method = RequestMethod.POST)
	    @ResponseBody
	    public int login(@RequestBody User user) {
	    	String s1=user.getUsername();
	    	String s2=user.getPassword();
	    	System.out.println(s1+s2);
	    	try {
				if(!Sql.exist(s1)) {
					return 0; //不存在
				}
				else {
					if(Sql.passwordIsRight(s1, s2)) {
						return 1;
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    	return 2;
	    }
	    @RequestMapping(value = "/register", method = RequestMethod.POST)
	    @ResponseBody
	    public int register(@RequestBody User user) {
	    	String s1=user.getUsername();
	    	String s2=user.getPassword();
	    	System.out.println(s1+s2);
	    	try {
				if(Sql.exist(s1)) {
					return 0;
				}
				else {
					return Sql.insert(user);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    	return 1;
	    }
	    @RequestMapping(value = "/pickdate", method = RequestMethod.POST)
	    @ResponseBody
	    public String getJson(@RequestBody Data data) {
	    	String s1=data.getDate1();
	    	String s2=data.getDate2();
	    	Function function=new Function();
	    	System.out.println(s1);
	    	String re=function.getJsonRun(s1, s2);
	    	System.out.println(re);		
	    	return re;
	    }	
	   
}
