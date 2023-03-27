package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.service.WHService;

@Controller
public class ReleaseController {
	
	@Inject
	private WHService whService; 
	
	@RequestMapping(value = "/rel/relpage", method = RequestMethod.GET)
	public String relpage() {
		System.out.println("MaterialController relinsert()");
		
		return "release/RelPage";
	}
	
	@RequestMapping(value = "/rel/relinsert", method = RequestMethod.GET)
	public String relinsert() {
		System.out.println("MaterialController relinsert()");
		
		return "release/RelInsert";
	}
}
