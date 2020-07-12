package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.enity.User;

@Service
public interface UserService {
    
    String getUserRoleByName(String name);
    
    String getUserPasswordByName(String name);
    
    User getUser(String username);
}
