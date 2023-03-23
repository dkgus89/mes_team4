package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.service.ConsumptionService;


@Controller
public class ConsumptionController {
	
	@Inject 
	private ConsumptionService consumptionService;
	
	@RequestMapping(value = "/consmpt/list", method = RequestMethod.GET)
	public String list() {
		// 처리작업
		
		// 가상주소 변경없이 이동
		return "consumption/list";
	}
	
	@RequestMapping(value = "/consmpt/insert", method = RequestMethod.GET)
	public String insert() {
		// 처리작업
		
		// 가상주소 변경없이 이동
		return "consumption/insert";
	}
	
}// class
