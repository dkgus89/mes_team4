package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.LineDTO;
import com.itwillbs.service.InfoService;

@Controller
public class InfoController {
	
	//멤버변수 부모 인터페이스 정의 => 자동으로 자식 클래스 객체생성
		// 스프링 객체생성 방식 => 의존관계주입(DI : Dependency Injection)
		@Inject
		private InfoService InfoService;
		
		@RequestMapping(value = "/line/line", method = RequestMethod.GET)
		public String Line(Model model) {
			System.out.println("InfoController Line()");
			
			
			List<LineDTO> LineList=InfoService.getLineList();
			
			
			
			model.addAttribute("LineList", LineList);
			
			// 주소변경 없이 이동
			// /WEB-INF/views/line/Line.jsp
			return "line/Line";
		}
		
		@RequestMapping(value = "/line/lineinsert", method = RequestMethod.GET)
		public String LineInsert() {
			
			// 주소변경 없이 이동
			// /WEB-INF/views/line/LineInsert.jsp
			return "line/LineInsert";
		}
		
		@RequestMapping(value = "/line/lineinsertpro", method = RequestMethod.POST)
		public String LineInsertpro(LineDTO lineDTO) {
			System.out.println("InfoController LineInsertPro()");
			//글쓰기 작업 메서드 호출
			InfoService.insertLine(lineDTO);
			// 주소변경 하면서 이동
			return "redirect:/line/line";
		}
		
		@RequestMapping(value = "/line/lineupdate", method = RequestMethod.GET)
		public String update(HttpServletRequest request, Model model) {
			String line_cd=request.getParameter("line_cd");
			
			LineDTO lineDTO=InfoService.getLine(line_cd);
			
			model.addAttribute("lineDTO", lineDTO);
			
			// 주소변경 없이 이동
			// /WEB-INF/views/line/LineUpdate.jsp
			return "line/LineUpdate";
		}
		
		@RequestMapping(value = "/line/lineupdatepro", method = RequestMethod.POST)
		public String LineUpdatePro(LineDTO LineDTO) {
			
			InfoService.updateLine(LineDTO);
			
			// 주소변경 하면서 이동
			return "redirect:/line/line";
		}
}
