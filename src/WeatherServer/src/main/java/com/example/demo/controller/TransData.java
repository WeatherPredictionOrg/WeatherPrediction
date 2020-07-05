package com.example.demo.controller;
import java.util.concurrent.atomic.AtomicLong;
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


@RestController
//@RequestMapping("http://localhost:8080/#")
public class TransData {
	    @RequestMapping(value = "/login", method = RequestMethod.POST)
	    @ResponseBody
	    public int login(@RequestBody User user) {
	    	String s1=user.getUsername();
	    	String s2=user.getPassword();
	    	if(s1.equals("cdy")&&s2.equals("1234")) {
	    		return 1;
	    	}else {
	    		return 2;
	    	}
	    }
	    @RequestMapping(value = "/getJson", method = RequestMethod.POST)
	    @ResponseBody
	    public String getJson(@RequestBody Data data) {
	    	String s1=data.getDate1();
	    	String s2=data.getDate2();
	    	Function function=new Function();
	    	return function.getJsonRun(s1, s2);
	    }	
	   
}
