package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BusinessController {

	@RequestMapping(value = "/business/businessmain", method = RequestMethod.GET)
	public String businessmain() {
		
		// 가상주소 유지
		return "business/BusinessMain";
	}
	
	@RequestMapping(value = "/business/businessinsert", method = RequestMethod.GET)
	public String businessinsert() {
		
		// 가상주소 유지
		return "business/BusinessInsert";
	}
	
	@RequestMapping(value = "/business/jusoPopup", method = RequestMethod.GET)
	public String jusoPopup() {
		
		// 가상주소 유지
		return "business/jusoPopup";
	}
	
	
}
