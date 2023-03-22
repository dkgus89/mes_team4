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
public class ConsumptionController {
	
	@Inject 
	private MemberService memberService;
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		// 처리작업
		
		// 가상주소에서 주소변경 없이 이동
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		// DB작업
		
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		if(memberDTO2 != null) {
			System.out.println("아이디 비밀번호 일치");
			// session 객체는 매개변수로 받아옴
			session.setAttribute("id", memberDTO.getId());
			return "redirect:/member/main";
		} else {
			System.out.println("아이디 비밀번호 틀림");
			// member/msg.jsp 만들어서 아이디 비밀번호 틀림 메세지 출력, 뒤로이동
			//가상주소 변경없이 이동
			return "member/msg";
		}
	}
	
	
	

	
}//class
