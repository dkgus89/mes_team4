package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MemberServiceImpl;

@Controller
public class MainController {
	
	@RequestMapping(value = "/main/home", method = RequestMethod.GET)
	public String insert() {
		// 처리작업
		
		// 가상주소에서 주소변경 없이 이동
		return "redirect:/main/home";
	}
	
}//class
