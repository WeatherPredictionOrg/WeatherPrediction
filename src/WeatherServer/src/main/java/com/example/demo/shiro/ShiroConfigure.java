package com.example.demo.shiro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authc.pam.AtLeastOneSuccessfulStrategy;
import org.apache.shiro.authc.pam.AuthenticationStrategy;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
//import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.session.mgt.DefaultSessionManager;
import org.apache.shiro.session.mgt.eis.JavaUuidSessionIdGenerator;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.web.filter.DelegatingFilterProxy;
 
/**
 * Shiro配置 
 * 提示:@Bean注解默认采用方法名作为id
 *
 * @author JustryDeng
 * @Date 2018年8月23日 上午10:58:22
 */
@Configuration
public class ShiroConfigure {
	
	@Bean
	public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier("getDefaultWebSecurityManager") DefaultWebSecurityManager defaultWebSecurityManager) {
		ShiroFilterFactoryBean bean=new ShiroFilterFactoryBean();
		//设置安全管理器
		bean.setSecurityManager(defaultWebSecurityManager);
		//bean.setSuccessUrl("/manage");
		//bean.setUnauthorizedUrl("/pickdates");
		//添加Shiro的内置过滤器
		Map<String,String>filterMap=new LinkedHashMap<>();
		filterMap.put("/login", "anon");
		filterMap.put("/register", "anon");
		filterMap.put("/pickdate", "roles[user]");
		//filterMap.put("/manage", "roles[admin]");
		
		//bean.setFilterChainDefinitionMap(filterMap);
		return bean;
	}
	
	@Bean(name="getDefaultWebSecurityManager")
	public DefaultWebSecurityManager getDefaultWebSecurityManager(@Qualifier("userRealm") UserRealm userRealm) {
		DefaultWebSecurityManager securityManager=new DefaultWebSecurityManager();
		securityManager.setRealm(userRealm);
		return securityManager;
	}
	
	@Bean(name="userRealm")
	public UserRealm userRealm() {
		return new UserRealm();
	}
}

