package com.example.demo.controller;
import java.util.concurrent.atomic.AtomicLong;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import com.example.demo.enity.MapData;
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
	        if(role.equals("admin")) {
 	        	return 3;
 	        }else{
 	        	return 1;
 	        }       
	    }
	    
	    @RequestMapping(value = "/register", method = RequestMethod.POST)
	    @ResponseBody
	    public int register(@RequestBody User user) {
	    	String s1=user.getUsername();
	    	String s2=user.getPassword();
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
	    	String[] pos= {"安徽","北京","福建","甘肃","广东","广西","贵州","黑龙江","海南","河北","河南",
	    			"河北","湖北","湖南","吉林","江苏","江西","辽宁","内蒙古","宁夏","青海","山东","山西",
	    			"陕西","上海","四川","天津","西藏","新疆","云南","浙江","重庆"};
	    	int k=0;
	    	String sql,r,d;
	    	Connection conn = getConn();
	    	ArrayList<PredictedData> preDataJsonList =new ArrayList<PredictedData>();
	    	String[] temp;
	    	String s1=data.getDate1();
	    	String s2=data.getDate2();
	    	String date=data.getDate();
	    	String order=data.getOrder();
	    	if(order.equals("chart")) {
	    		sql = "select * from beijing2";
	    		try {
					ResultSet rs = ((PreparedStatement) conn.prepareStatement(sql)).executeQuery();
					while(rs.next()) {
						d=rs.getString("date");
						if(d.equals(s1)) {
							r=rs.getString("value");
							temp=r.split("#");
							PredictedData preData=new PredictedData();
							preData.setDate(rs.getString("date"));
							preData.setAverage(Double.parseDouble(temp[0]));
							preData.setMax(Double.parseDouble(temp[1]));
							preData.setMin(Double.parseDouble(temp[2]));
							preDataJsonList.add(preData);
							if(s1.equals(s2)) {
								while(rs.next()&&k<6) {
									r=rs.getString("value");
									temp=r.split("#");
									PredictedData preData1=new PredictedData();
									preData1.setDate(rs.getString("date"));
									preData1.setAverage(Double.parseDouble(temp[0]));
									preData1.setMax(Double.parseDouble(temp[1]));
									preData1.setMin(Double.parseDouble(temp[2]));
									preDataJsonList.add(preData1);
									k++;
								}
							}
							else {
								boolean flag=true;
								while(rs.next()&&flag) {
									if(rs.getString("date").equals(s2)) {
										flag=false;
									}
									r=rs.getString("value");
									temp=r.split("#");
									PredictedData preData1=new PredictedData();
									preData1.setDate(rs.getString("date"));
									preData1.setAverage(Double.parseDouble(temp[0]));
									preData1.setMax(Double.parseDouble(temp[1]));
									preData1.setMin(Double.parseDouble(temp[2]));
									preDataJsonList.add(preData1);
									k++;
								}
							}
							
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}	    		
		    	String re=getOptionsJson(preDataJsonList);
		    	System.out.println(re);		
		    	return re;
	    	}
	    	else {
	        String re="[";
	    		for(int i=0;i<31;i++) {
					try {
						MapData mapdata=new MapData();
						sql = "select * from "+pos[i];
			    		ResultSet rs = ((PreparedStatement) conn.prepareStatement(sql)).executeQuery();
			    		while(rs.next()) {
			    			d=rs.getString("date");
			    			if(d.equals(date)) {
			    				re+="{";
			    				r=rs.getString("value");
					    		temp=r.split("#");
					    		re+="\"pos\":";
					    		re+="\""+pos[i]+"\",";
					    		re+="\"min\":"+temp[2]+",";
					    		re+="\"avg\":"+temp[0]+",";
					    		re+="\"max\":"+temp[1]+"},";
					    		break;
			    			}
			    		}
					} catch (SQLException e) {
						e.printStackTrace();
					}
		    		
		    	}
	    		re=re.substring(0,re.length() - 1);
	    		re+="]";
	    		System.out.println(re);
	    		return re;
	    	}
	    	
	    }
	    
	    @RequestMapping(value = "/admin", method = RequestMethod.POST)
	    @ResponseBody
	    public String admin(@RequestBody Manage manage) {
	    	String order=manage.getOrder();
	    	String name=manage.getUsername();
	    	String password=manage.getPassword();
	    	String newName=manage.getUsernameafter();
	    	String nameBefore=manage.getUsernamebefore(); 
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
	    		if(newName.equals(nameBefore)) {//只改密码
	    			userMapper.updatePassword(nameBefore, password);
	    			return "1";
	    		}
	    		else {
	    			String exist=userMapper.existName(newName);
	    			if(exist==null) {
	    				String role=userMapper.getRole(nameBefore);
	    				userMapper.deleteUser(nameBefore);    				
	    				userMapper.insertUser(newName, password,role);
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
	    
	    public static String getOptionsJson(ArrayList<PredictedData> checkItemIds) {
	        if (checkItemIds.isEmpty()) {
	            return null;
	        }
	        JSONArray jsonArray = new JSONArray();
	        for (PredictedData item : checkItemIds) {
	            jsonArray.put(item.getJSONObject());
	        }

	        return jsonArray.toString();
	    }
	    public static String getEvaluatedOptionsJson(ArrayList<User> checkItemIds) {
	        if (checkItemIds.isEmpty()) {
	            return null;
	        }
	        JSONArray jsonArray = new JSONArray();
	        for (User item : checkItemIds) {
	            jsonArray.put(item.getJSONObject());
	        }
	        return jsonArray.toString();
	    }

	    private static Connection getConn() {

			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/predict?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
			String username = "root";
			String password = "Mysql78089091";
			Connection conn = null;
			try {
				Class.forName(driver); // classLoader,加载对应驱动
				conn = (Connection) DriverManager.getConnection(url, username, password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return conn;
		}
}
