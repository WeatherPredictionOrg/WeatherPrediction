package com.example.demo.controller;
import java.util.concurrent.atomic.AtomicLong;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import org.apache.ibatis.annotations.Mapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.json.JSONArray;
import org.json.JSONObject;
import org.python.jline.internal.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.enity.Data;
import com.example.demo.enity.Manage;
import com.example.demo.enity.PredictedData;
import com.example.demo.enity.User;
import com.example.demo.function.Function;
import com.example.demo.shiro.*;
import com.example.demo.mapper.*;

@RestController
public class TransData {
	@Resource
	private UserMapper userMapper;
	@Resource
    private LoginMapper mapper;
	ArrayList<User> UserList =new ArrayList<User>();
	
	    @RequestMapping(value = "/login", method = RequestMethod.POST)
	    @ResponseBody
	    public int login(@RequestBody User user) {
	    	String s1=user.getUsername();
	    	String s2=user.getPassword();
	    	System.out.println(s1+s2);
	    	 // 从SecurityUtils里边创建一个 subject
	        Subject subject = SecurityUtils.getSubject();
	        // 在认证提交前准备 token（令牌）
	        UsernamePasswordToken token = new UsernamePasswordToken(s1, s2);
	        System.out.println("mapper "+mapper);
	        String role = mapper.getUserRoleByName(s1);
	        System.out.println("subject "+subject);
	        System.out.println("role "+role);
	        try {
	        	System.out.println("token "+token);
	        	subject.login(token);   
	        }catch(UnknownAccountException e) {//用户名不存在
	        	return 0;
	        }catch(IncorrectCredentialsException  e) {//密码错误
	        	return 2;
	        }
	        if(role.equals("user")) {
 	        	return 1;
 	        }else {
 	        	return 3;
 	        }
			
	    }
	    
	    @RequestMapping(value = "/register", method = RequestMethod.POST)
	    @ResponseBody
	    public int register(@RequestBody User user) {
	    	String s1=user.getUsername();
	    	String s2=user.getPassword();
	    	System.out.println(s1+s2);
	    	System.out.println(userMapper.existName(s1));
	    	//System.out.println(userMapper);
	    	if(userMapper.existName(s1)!=null) {
	    		return 0;
	    	}else {
	    		userMapper.insertUser(s1, s2,"user");
	    		return 1;
	    	}
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
	    
	    @RequestMapping(value = "/admin", method = RequestMethod.POST)
	    @ResponseBody
	    public String admin(@RequestBody Manage manage) {
	    	String order=manage.getOrder();
	    	String name=manage.getUsername();
	    	String password=manage.getPassword();
	    	String newName=manage.getUsernameafter();
	    	String nameBefore=manage.getUsernamebefore(); 
	    	System.out.println("str= "+order);
	    	if(order.equals("all")) {
	    		ArrayList<User> userlist=(ArrayList<User>) userMapper.getUserList();
		    	String re=getEvaluatedOptionsJson(userlist);
		    	System.out.println(re);
		    	return re;
	    	}
	    	if(order.equals("delete")) {
	    		userMapper.deleteUser(name);
	    		return "1";
	    	}
	    	if(order.equals("modify")) {
	    		System.out.println("newName= "+newName);
	    		System.out.println("nameBefore= "+nameBefore);
	    		if(newName.equals(nameBefore)) {//只改密码
	    			userMapper.updatePassword(nameBefore, password);
	    			return "1";
	    		}
	    		else {
	    			String exist=userMapper.existName(newName);
	    			if(exist==null) {
	    				userMapper.deleteUser(nameBefore);
	    				userMapper.insertUser(newName, password,"user");
	    				return "1";
	    			}
	    			else {
	    				return "2";
	    			}
	    		}	
	    	}
	    	if(order.equals("add")){  //add
	    		String exist=userMapper.existName(name);
	    		if(exist==null) {
	    			userMapper.insertUser(name, password, "user");
	    			return "1";
	    		}
	    		else {
	    			return "2";
	    		}
	    	}
	    	return "3";
	    }	
	    
	
	    public static String getEvaluatedOptionsJson(ArrayList<User> checkItemIds) {
	        if (checkItemIds.isEmpty()) {
	            return null;
	        }
	        JSONArray jsonArray = new JSONArray();
	        for (User item : checkItemIds) {
	            jsonArray.put(item.getJSONObject());
	        }
	        //System.out.println(jasonArray);
	        return jsonArray.toString();
	    }
}
