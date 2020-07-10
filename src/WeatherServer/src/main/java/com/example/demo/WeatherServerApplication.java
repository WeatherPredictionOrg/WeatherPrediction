package com.example.demo;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

//import com.annotation.RequestJsonHandlerMethodArgumentResolver;

@SpringBootApplication
@MapperScan("com.example.demo.mapper")
public class WeatherServerApplication{

	public static void main(String[] args) {
		SpringApplication.run(WeatherServerApplication.class, args);
	}
}
