package com.jrj.payment.controller;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jrj.payment.service.PayService;


@Controller
@RequestMapping(value = "/")
public class VersionController {
    
	@Autowired
	private PayService payService;
    @RequestMapping(value = "test")
    public @ResponseBody String exp(InputStream is) throws Exception {
//    	System.out.println("dddd");
    	return "Hello world!";
    }
    
    @RequestMapping("ttt")
    public ModelAndView aaa(HttpServletRequest res) throws Exception {
    	System.out.println("dddd");
//    	return "home";
    	ModelAndView a = new ModelAndView("/home");
    	a.addObject("username", "zhengdegui");
    	
    	payService.getPayByid("1");
//    	res.setAttribute("username", "zhengdegui");
    	return a;
//    	return new ModelAndView("");
//    	return "/home";
    }
}
