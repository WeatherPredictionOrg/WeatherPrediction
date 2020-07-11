package com.example.demo.shiro;

import com.example.demo.enity.User;
import com.example.demo.mapper.LoginMapper;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.*;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.HashSet;
import java.util.Set;


public class UserRealm extends AuthorizingRealm {
	 
//	 @Autowired
//	 private LoginMapper mapper;
	@Autowired
	private UserService userService;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		 System.out.println("————权限认证————");
		    Subject subject=SecurityUtils.getSubject();
		    User currentUser=(User)subject.getPrincipal();
	        //String username = (String) SecurityUtils.getSubject().getPrincipal();
	        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
	        //获得该用户角色
	        //String role = userService.getUserRoleByName(username);
	        String role=currentUser.getRole();
	        System.out.println("username "+currentUser.getUsername());
	        System.out.println("role "+role);
	        Set<String> set = new HashSet<>();
	        //需要将 role 封装到 Set 作为 info.setRoles() 的参数
	        set.add(role);
	        //设置该用户拥有的角色
	        info.setRoles(set);
	        return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
		System.out.println("————身份认证方法————");
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        // 从数据库获取对应用户名密码的用户
        String test = token.getUsername();
        System.out.println(test);
        String password = userService.getUserPasswordByName(token.getUsername());
        User user=userService.getUser(test);
        System.out.println(password);
        if (null == password) {//用户名不存在
        	return null;
        }
        System.out.println("身份认证完毕");
        //密码认证交给shiro
        //return new SimpleAuthenticationInfo("", password, "");
        return new SimpleAuthenticationInfo(user, password, getName());
	}

}
