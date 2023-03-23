package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.LineDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PerformDTO;
import com.itwillbs.service.PerformService;

@Controller
public class PerformController {
	
	//멤버변수 부모 인터페이스 정의 => 자동으로 자식 클래스 객체생성
		// 스프링 객체생성 방식 => 의존관계주입(DI : Dependency Injection)
		@Inject
		private PerformService performService;
			
		@RequestMapping(value = "/perform/perform", method = RequestMethod.GET)
		public String perform(HttpServletRequest request, Model model) {
			System.out.println("PerformController perform()");
			
			// 한 화면에 보여줄 글 개수 설정
			int pageSize=5;
			// 현페이지 번호 가져오기
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				//pageNum 없으면 1페이지 설정
				pageNum="1";
			}
			// 페이지번호를 => 정수형 변경
			int currentPage=Integer.parseInt(pageNum);
						
			PageDTO pageDTO=new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			List<PerformDTO> PerformList=performService.getPerformList(pageDTO);
						
			//페이징 처리
			int count = performService.getPerformCount();
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage > pageCount){
				endPage = pageCount;
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			model.addAttribute("PerformList", PerformList);
			model.addAttribute("pageDTO", pageDTO);			
			
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
