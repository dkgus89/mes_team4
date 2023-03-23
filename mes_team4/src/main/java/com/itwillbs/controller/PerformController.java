package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.LineDTO;
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
		
		@RequestMapping(value = "/perform/performinsert", method = RequestMethod.GET)
		public String performInsert() {
			
			// 주소변경 없이 이동
			// /WEB-INF/views/perform/PerformInsert.jsp
			return "perform/PerformInsert";
		}
		
		@RequestMapping(value = "/perform/performinsertpro", method = RequestMethod.POST)
		public String performInsertPro(HttpServletRequest request, PerformDTO performDTO) {
			System.out.println("PerformController performInsertPro()");
			
			
			//글쓰기 작업 메서드 호출
			performService.insertPerform(performDTO);
			
			// 주소변경 하면서 이동
			return "redirect:/perform/perform";
		}
		
		@RequestMapping(value = "/perform/performupdate", method = RequestMethod.GET)
		public String performUpdate(HttpServletRequest request, Model model) {
			String perform_cd=request.getParameter("perform_cd");
			PerformDTO performDTO=performService.getPerform(perform_cd);
			
			model.addAttribute("PerformDTO", performDTO);
			
			// 주소변경 없이 이동
			// /WEB-INF/views/perform/PerformUpdate.jsp
			return "perform/PerformUpdate";
		}
		
		@RequestMapping(value = "/perform/performupdatepro", method = RequestMethod.POST)
		public String performUpdatePro(PerformDTO performDTO) {
			
			performService.updatePerform(performDTO);
			
			// 주소변경 하면서 이동
			return "redirect:/perform/perform";
		}
		
		@RequestMapping(value = "/perform/performdelete", method = RequestMethod.GET)
		public String performDelete(HttpServletRequest request) {
			String chbox[]=request.getParameterValues("chbox");
			String perform_cd = null;
			if(chbox!=null){
				  for(int i=0;i<chbox.length;i++){
			   
					perform_cd=chbox[i];
					performService.deletePerform(perform_cd);
				  }
		       }			
			
			// 주소변경 하면서 이동
			return "redirect:/perform/perform";
		}
}
