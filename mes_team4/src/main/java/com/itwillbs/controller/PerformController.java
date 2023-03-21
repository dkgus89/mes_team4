package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.PerformDTO;
import com.itwillbs.service.PerformService;

@Controller
public class PerformController {
	
	//멤버변수 부모 인터페이스 정의 => 자동으로 자식 클래스 객체생성
		// 스프링 객체생성 방식 => 의존관계주입(DI : Dependency Injection)
		@Inject
		private PerformService performService;
			
		@RequestMapping(value = "/perform/perform", method = RequestMethod.GET)
		public String perform(Model model) {
			System.out.println("PerformController perform()");
			
			
			List<PerformDTO> PerformList=performService.getPerformList();
						
			model.addAttribute("PerformList", PerformList);
			
			
			// 주소변경 없이 이동
			// /WEB-INF/views/perform/Perform.jsp
			return "perform/Perform";
		}	
}
