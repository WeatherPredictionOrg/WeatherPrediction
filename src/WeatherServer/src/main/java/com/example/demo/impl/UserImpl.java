package com.example.demo.impl;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.enity.User;
import com.example.demo.mapper.LoginMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserImpl implements UserService {

    @Autowired
    private LoginMapper logMapper;

    @Override
	public String getUserRoleByName(String name) {
		return logMapper.getUserRoleByName(name);
	}

	@Override
	public String getUserPasswordByName(String name) {
		return logMapper.getUserPasswordByName(name);
	}
 
	@Override
	public User getUser(String username) {
		return logMapper.getUser(username);
	}
}
