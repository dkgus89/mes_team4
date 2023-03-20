package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.WHDTO;
import com.itwillbs.service.WHService;

@Controller
public class WHController {
	
	@Inject
	private WHService whService; 
	@RequestMapping(value = "/wh/whpage", method = RequestMethod.GET)
	public String whpage() {

		return "warehouse/WhPage";
	}
//	@RequestMapping(value = "/wh/whpage", method = RequestMethod.GET)
//	public String whpage(HttpServletRequest request, Model model) {
//		
//		int wh_cd=Integer.parseInt(request.getParameter("wh_cd"));
//		WHDTO whDTO = whService.getWh(wh_cd);
//		
//		model.addAttribute("whDTO",whDTO);
//		
//		return "warehouse/WhPage";
//	}
	
	@RequestMapping(value = "/wh/whinsert", method = RequestMethod.GET)
	public String whinsert() {
		System.out.println("WHController whinsert()");
		
		return "warehouse/WhInsert";
	}
	
	@RequestMapping(value = "/wh/whinsertPro", method = RequestMethod.POST)
	public String whinsertPro(WHDTO whdto) {
		System.out.println("WHController whinsertPro()");
		
		whService.insertwh(whdto);
		
		return "redirect:/wh/whpage";
	}
	

}
