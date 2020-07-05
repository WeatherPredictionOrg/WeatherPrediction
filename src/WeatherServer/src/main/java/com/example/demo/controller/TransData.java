package com.example.demo.controller;
import java.util.concurrent.atomic.AtomicLong;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TransData {
	    @RequestMapping("/login")
	    @ResponseBody
	    public int login(HttpServletRequest request) {
	    	String s1=request.getParameter("username");
	    	String s2=request.getParameter("password");
	    	System.out.print(s1+s2);
	    	if(s1=="cdy"&&s2=="1234") {
	    		return 1;
	    	}
	    	else {
	    		return 2;
	    	}
	    }
}
