package com.example.demo.impl;

import com.alibaba.fastjson.JSONArray;
import com.example.demo.dao.CommonDao;
import com.example.demo.enity.User;
import com.example.demo.mapper.LoginMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//@Service(interfaceClass=IOtherCertificateService.class)
@Service
public class UserImpl implements UserService {

    @Autowired
    //private UserMapper usm;
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
    public JSONArray getList() {
        JSONArray res = new JSONArray();
        //List<User> userList = usm.getUserList();
        //res.add(userList);
        return res;
    }

    @Override
    public void addUser(String user_name, String password) {
        //usm.insertUser(user_name,password);
    }

    @Override
    public void deleteUser(String user_name) {
        //usm.deleteUser(user_name);
    }

	@Override
	public User getUser(String username) {
		return logMapper.getUser(username);
	}
}
