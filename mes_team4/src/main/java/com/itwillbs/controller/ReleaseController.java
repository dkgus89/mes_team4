package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReleaseDTO;
import com.itwillbs.domain.WHDTO;
import com.itwillbs.service.ReleaseService;
import com.itwillbs.service.WHService;

@Controller
public class ReleaseController {
	
	@Inject
	private ReleaseService relService; 
	
	@RequestMapping(value = "/rel/relpage", method = RequestMethod.GET)
	public String relpage(HttpServletRequest request, Model model) {
		System.out.println("ReleaseController relinsert()");
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize=10;
		// 현페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
//			pageNum 없으면 1페이지 설정
			pageNum="1";
		}
//		 페이지번호를 => 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<Map<String, Object>> relList=relService.getRelList(pageDTO);
		
		//페이징 처리
		int count = relService.getRelCount(pageDTO);
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
		
		model.addAttribute("relList", relList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "release/RelPage";
	}
	
	@RequestMapping(value = "/rel/relinsert", method = RequestMethod.GET)
	public String relinsert(Model model) {
		System.out.println("ReleaseController relinsert()");
		
		List<Map<String, Object>> instMap
		=relService.getInstMap();
//		 model에 담아서 이동
		model.addAttribute("instMap", instMap);
		
		return "release/RelInsert";
	}
	
	@RequestMapping(value = "/rel/relinsertPro", method = RequestMethod.POST)
	public String relinsertPro(ReleaseDTO releaseDTO) {
		System.out.println("ReleaseController relinsertPro()");
		
		relService.insertrel(releaseDTO);
		
		return "redirect:/rel/relpage";
	}

	
	
}
