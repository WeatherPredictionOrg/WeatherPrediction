package com.example.demo.controller;
import java.util.concurrent.atomic.AtomicLong;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;



import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;



import com.example.demo.enity.Data;
import com.example.demo.enity.User;
import com.example.demo.function.Function;
import com.example.demo.shiro.*;

@RestController
//@RequestMapping("http://localhost:8080/#")
public class TransData {
	    @RequestMapping(value = "/login", method = RequestMethod.POST)
	    @ResponseBody
	    public int login(User user, Model model) {
	    	String s1=user.getUsername();
	    	String s2=user.getPassword();
	    	System.out.println(s1+s2);
			         /**
	    			 * 使用Shiro编写认证操作
					*/
			//1.获取Subject
			Subject subject = SecurityUtils.getSubject();

			//2.封装用户数据
			UsernamePasswordToken token = new UsernamePasswordToken(s1,s2);

			//3.执行登录方法
			try {
				subject.login(token);
				System.out.println(subject);
				System.out.println("adjja");

				//登录成功
				//跳转到test.html
				return 2;
			} catch (UnknownAccountException e) {
				//e.printStackTrace();
				//登录失败:用户名不存在
				model.addAttribute("msg", "用户名不存在");
				return 0;
			}catch (IncorrectCredentialsException e) {
				//e.printStackTrace();
				//登录失败:密码错误
				model.addAttribute("msg", "密码错误");
				return 1;
			}
		}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	    @ResponseBody
	    public int register( User user) {
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
	    @RequestMapping(value = "/getJson", method = RequestMethod.POST)
	    @ResponseBody
	    public String getJson( Data data) {
	    	String s1=data.getDate1();
	    	String s2=data.getDate2();
	    	Function function=new Function();
	    	return function.getJsonRun(s1, s2);
	    }	
	   
}

