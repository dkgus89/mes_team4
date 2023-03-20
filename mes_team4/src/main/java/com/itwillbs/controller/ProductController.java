package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	@RequestMapping(value = "/product/prodpage", method = RequestMethod.GET)
	public String ProdPage() {
		return "product/ProdPage";
	}
	
	@RequestMapping(value = "/product/prodinsert", method = RequestMethod.GET)
	public String ProdInsert() {
		return "product/ProdInsert";
	}
	
}
