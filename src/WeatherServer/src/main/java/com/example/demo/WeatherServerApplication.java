package com.example.demo;

import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.annotation.RequestJsonHandlerMethodArgumentResolver;

@SpringBootApplication
public class WeatherServerApplication extends WebMvcConfigurerAdapter{

	public static void main(String[] args) {
		SpringApplication.run(WeatherServerApplication.class, args);
	}
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
		argumentResolvers.add(new RequestJsonHandlerMethodArgumentResolver());
	    super.addArgumentResolvers(argumentResolvers);
	}
}
