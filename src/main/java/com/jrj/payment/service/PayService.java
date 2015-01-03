package com.jrj.payment.service;

import org.springframework.stereotype.Component;

import com.jrj.payment.dao.PayDb;

import j.u.XMap;
@Component("payService")
public class PayService {
	
	
	
	public static XMap getPayByid(String product_id){
		return PayDb.getPayByid(product_id);
		
	}
	
	

}
