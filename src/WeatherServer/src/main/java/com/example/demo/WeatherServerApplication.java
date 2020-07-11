package com.example.demo;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.example.demo.impl.UserImpl;
import com.example.demo.mapper.LoginMapper;

//import com.annotation.RequestJsonHandlerMethodArgumentResolver;

//(exclude = DataSourceAutoConfiguration.class)
@SpringBootApplication
@MapperScan(value = {"com.example.demo.mapper"})
//@ComponentScan({"com.example.demo.shiroShiroConfigure"}) 
public class WeatherServerApplication{
	 
	public static void main(String[] args) {
		SpringApplication.run(WeatherServerApplication.class, args);
	}
}
