package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WHController {
	
	@RequestMapping(value = "/wh/whpage", method = RequestMethod.GET)
	public String whpage() {
		
		return "warehouse/WhPage";
	}
	
	@RequestMapping(value = "/wh/whinsert", method = RequestMethod.GET)
	public String whinsert() {
		
		return "warehouse/WhInsert";
	}
}
