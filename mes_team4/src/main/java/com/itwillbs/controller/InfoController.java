package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.LineDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.InfoService;

@Controller
public class InfoController {
	
	//멤버변수 부모 인터페이스 정의 => 자동으로 자식 클래스 객체생성
	// 스프링 객체생성 방식 => 의존관계주입(DI : Dependency Injection)
	@Inject
	private InfoService infoService;
		
		@RequestMapping(value = "/line/line", method = RequestMethod.GET)
		public String line(HttpServletRequest request, Model model) {
			System.out.println("InfoController line()");
			//검색어 가져오기
			String search=request.getParameter("search");
			String select=request.getParameter("select");
					

			
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
			//검색어
			pageDTO.setSearch(search);
			pageDTO.setSelect(select);
			
			
			List<LineDTO> LineList=infoService.getLineList(pageDTO);
			
			
			//페이징 처리
			int count = infoService.getLineCount(pageDTO);
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
			
			model.addAttribute("LineList", LineList);
			model.addAttribute("pageDTO", pageDTO);
			
			// 주소변경 없이 이동
			// /WEB-INF/views/line/Line.jsp
			return "line/Line";
		}
		
		@RequestMapping(value = "/line/lineinsert", method = RequestMethod.GET)
		public String lineInsert() {
			
			// 주소변경 없이 이동
			// /WEB-INF/views/line/LineInsert.jsp
			return "line/LineInsert";
		}
		
		@RequestMapping(value = "/line/lineinsertpro", method = RequestMethod.POST)
		public String lineInsertPro(HttpServletRequest request, LineDTO lineDTO) {
			System.out.println("InfoController lineInsertPro()");
			
			//글쓰기 작업 메서드 호출
			infoService.insertLine(lineDTO);
			
			// 주소변경 하면서 이동
			return "redirect:/line/line";
		}
		
		@RequestMapping(value = "/line/lineupdate", method = RequestMethod.GET)
		public String lineupdate(HttpServletRequest request, Model model) {
			String line_cd=request.getParameter("line_cd");
			LineDTO lineDTO=infoService.getLine(line_cd);
			
			model.addAttribute("LineDTO", lineDTO);
			
			// 주소변경 없이 이동
			// /WEB-INF/views/line/LineUpdate.jsp
			return "line/LineUpdate";
		}
		
		@RequestMapping(value = "/line/lineupdatepro", method = RequestMethod.POST)
		public String lineUpdatePro(LineDTO lineDTO) {
			
			infoService.updateLine(lineDTO);
			
			// 주소변경 하면서 이동
			return "redirect:/line/line";
		}
		
		@RequestMapping(value = "/line/linedelete", method = RequestMethod.GET)
		public String lineDelete(HttpServletRequest request) {
			String chbox[]=request.getParameterValues("rowcheck");
			String line_cd = null;
			if(chbox!=null){
				  for(int i=0;i<chbox.length;i++){
			   
					line_cd=chbox[i];
					infoService.deleteLine(line_cd);
				  }
		       }			
			
			// 주소변경 하면서 이동
			return "redirect:/line/line";
		}
		
		@ResponseBody
		@RequestMapping(value = "/line/linecdcheck", method = RequestMethod.GET)
		public String linecdcheck(HttpServletRequest request, Model model) {
			// request 파라미터 
			String line_cd=request.getParameter("cd");
//			System.out.println(line_cd);
			String result=null;
			
////			// 메서드 호출
			int linecdcheck
			     =infoService.getlinecdcheck(line_cd);
////			System.out.println(linecdcheck);
			if(linecdcheck==0) {
				result="0";
			}else {
				result="1";
			}
			
//			System.out.println(result);
			return result;
		}
}
