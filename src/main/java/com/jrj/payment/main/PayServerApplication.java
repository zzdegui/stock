/*
 * Copyright 2012-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.jrj.payment.main;

import java.util.Date;
import java.util.Map;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.jrj.payment.config.ConnectionSettings;

@Configuration
@ComponentScan({ "com.jrj.payment" })
@EnableAutoConfiguration
@EnableAspectJAutoProxy
@EnableConfigurationProperties(ConnectionSettings.class)
@Controller
public class PayServerApplication extends WebMvcConfigurerAdapter{
	
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp"); 
		return viewResolver;
	}
	
	@Bean
	// Only used when running in embedded servlet
	public DispatcherServlet dispatcherServlet() {
		return new DispatcherServlet();
	}
	
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@RequestMapping("/")
	public ModelAndView home(Map<String, Object> model) {
		model.put("message", "Hello World");
		model.put("title", "Hello Home");
		model.put("date", new Date());
		return new ModelAndView("home");
	}

	@RequestMapping("/foo")
	public String foo() {
		throw new RuntimeException("Expected exception in controller");
	}

	public static void main(String[] args) throws Exception {
		new SpringApplicationBuilder(PayServerApplication.class).run(args);
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login").setViewName("login");
	}


//	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
//		return application.sources(PayServerApplication.class);
//	}
//	
//	
//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/**").addResourceLocations("classpath:/WEB-INF/");
//	}
//	
//	@Override
//	public void addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("/").setViewName("/home");
//	}
	
	
//	
//
//	public static void main(String[] args) throws Exception {
//		SpringApplication.run(PayServerApplication.class, args);
//	}
	
//	@Bean
//    public MultipartConfigElement multipartConfigElement() {
//          return new MultipartConfigElement("");
//    }
	
	
	
	
	
	
	
	

//	public void addInterceptors(InterceptorRegistry registry) {
////		registry.addInterceptor(new UserSecurityInterceptor());
//	}
	
//	@Bean  
//    public Filter characterEncodingFilter() {  
//        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();  
//        characterEncodingFilter.setEncoding("UTF-8");  
//        characterEncodingFilter.setForceEncoding(true);  
//        return characterEncodingFilter;  
//    } 
	
//	@Bean
//	public FilterRegistrationBean loggingFilter() {
//		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();  
//        characterEncodingFilter.setEncoding("UTF-8");  
//        characterEncodingFilter.setForceEncoding(true);  
////	    LoggingFilter filter = new LoggingFilter();
//	    FilterRegistrationBean registrationBean = new FilterRegistrationBean();
//	    registrationBean.setFilter(characterEncodingFilter);
//	    registrationBean.setUrlPatterns(Arrays.asList("/core/*"));
//	    return registrationBean;
//	}

	
//	@Override
//	public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {
////    	ExceptionHandler eh = new ExceptionHandler();
////    	exceptionResolvers.add(eh);
////    	
////    	
////    	super.configureHandlerExceptionResolvers(exceptionResolvers);
//	}
	
	
	
	
	
	
	
	
}
