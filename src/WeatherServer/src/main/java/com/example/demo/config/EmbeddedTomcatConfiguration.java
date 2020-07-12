//package com.example.demo.config;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.apache.catalina.connector.Connector;
//import org.apache.commons.lang.StringUtils;
//import org.apache.tomcat.util.descriptor.web.SecurityCollection;
//import org.apache.tomcat.util.descriptor.web.SecurityConstraint;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
//import org.springframework.boot.web.server.ConfigurableWebServerFactory;
//import org.springframework.boot.web.server.WebServerFactoryCustomizer;
////import org.springframework.cglib.proxy.CallbackGenerator.Context;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//
//@Configuration
//public class EmbeddedTomcatConfiguration {
// 
//    @Value("${server.additionalPorts}")
//    private String additionalPorts;
//    
////    @Value("${http.port}")
////    Integer httpPort;
//// 
////    //正常启用的https端口 如443
////    @Value("${server.port}")
////    Integer httpsPort;
//
// 
//    @Bean
//    public TomcatServletWebServerFactory getApplicationContext(){
//    	TomcatServletWebServerFactory tomcat=new TomcatServletWebServerFactory();
//    	Connector[] addtionalConnectors=this.additionalConnector();
//    	if(addtionalConnectors!=null&&addtionalConnectors.length>0) {
//    		tomcat.addAdditionalTomcatConnectors(addtionalConnectors);
//    	}
//    	return tomcat;
//    }
// 
//    @Bean
//   private Connector[] additionalConnector() {
//    	if(StringUtils.isBlank(this.additionalPorts)) {
//    		return null;
//    	}
//    	String[] ports=this.additionalPorts.split(",");
//    	List<Connector> result=new ArrayList<>();
//    	for(String port:ports) {
//    		Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
//    		connector.setScheme("http");
//    		connector.setPort(Integer.valueOf(port));
//    		result.add(connector);
//    	}
//    	return result.toArray(new Connector[] {});
//    }
//
//}