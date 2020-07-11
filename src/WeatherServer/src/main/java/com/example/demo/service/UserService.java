package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.enity.User;

@Service
public interface UserService {
    JSONArray getList();

    String getUserRoleByName(String name);
    
    String getUserPasswordByName(String name);
    
    void addUser(String user_name, String password);

    void deleteUser(String user_name);
    
    User getUser(String username);
}
