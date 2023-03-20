package com.itwillbs.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class DeliverController {
	
	
	@RequestMapping(value = "/deliver/deliver", method = RequestMethod.GET)
	public String insert() {
		// 처리작업
		
		// 가상주소에서 주소변경 없이 이동
		return "deliver/DeliverPage";
	}
	
	
	
	@RequestMapping(value = "/deliver/insert", method = RequestMethod.GET)
	public String insertPro() {
		// 처리작업
		
		// 가상주소에서 주소변경 없이 이동
		return "deliver/deliverpageinsert";
	}
	

}
