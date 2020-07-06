/*
 * *
 *  * blog.coder4j.cn
 *  * Copyright (C) 2016-2019 All Rights Reserved.
 *
 */
package com.example.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 黎佩瑜 王迪
 * @version WSController.java
 */
@Controller
@Service
public class WSController {
	static User user;
	static Data data;
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;
    
    @MessageMapping("/login")
    @SendTo("/login/success")
    public int login(User user) {
        String s1=user.getUsername();
        String s2=user.getPassword();
        if(s1.equals("cdy")&&s2.equals("1234")) {
        	return 1;
        }
        else {
        	return 2;
        }
    }
    @MessageMapping("/getJson")
    public String getJson(Data data) {
    	String date1=data.getDate1();
    	String date2=data.getDate2();
    	return Function.getJsonRun(date1, date2);
    }
    @GetMapping("/sendMsgByUser")
    public @ResponseBody
    Object sendMsgByUser(String token, String msg) {
        //simpMessagingTemplate.convertAndSendToUser(token, "/msg", msg);
        return "success";
    }
  

    @GetMapping("/sendMsgByAll")
    public @ResponseBody
    Object sendMsgByAll(String msg) {
        //simpMessagingTemplate.convertAndSend("/topic", msg);
        return "success";
    }

    @GetMapping("/test")
    public String test() {
        return "test-stomp.html";
    }
}