package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ConsumptionDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.ConsumptionService;


@Controller
public class ConsumptionController {
	
	@Inject 
	private ConsumptionService consumptionService;
	
	@RequestMapping(value = "/consmpt/list", method = RequestMethod.GET)
	public String list() {
		System.out.println("ConsumptionController list()");
		// 처리작업
		
		return "consumption/list";
	}
	
	@RequestMapping(value = "/consmpt/insert", method = RequestMethod.GET)
	public String insert() {
		System.out.println("ConsumptionController insert()");
		// 처리작업
	
		return "consumption/insert";
	}
	
	@RequestMapping(value = "/consmpt/insertPro", method = RequestMethod.POST)
	public String insertPro(ConsumptionDTO consumptionDTO) {
		System.out.println("ConsumptionController insert()");
		// 처리작업
		System.out.println(consumptionDTO.getCproduct_cd_name());
		System.out.println(consumptionDTO.getCproduct_name());
		System.out.println(consumptionDTO.getRproduct_cd_name()[0]);
		System.out.println(consumptionDTO.getRproduct_name()[0]);
		System.out.println(consumptionDTO.getRproduct_cd_name()[1]);
		System.out.println(consumptionDTO.getRproduct_name()[1]);
		System.out.println(consumptionDTO.getConsumtion()[0]);
		System.out.println(consumptionDTO.getConsumtion_unit()[0]);
		System.out.println(consumptionDTO.getConsumtion()[1]);
		System.out.println(consumptionDTO.getConsumtion_unit()[1]);
		
		// consumptionService.insertConsmpt(consumptionDTO);
		return "redirect:/consumption/list";
	}
	
	@RequestMapping(value = "/consmpt/prlist", method = RequestMethod.GET)
	public String prlist(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("ConsumptionController prlist()");
		// 처리작업

		// 검색어 설정
		//String search= request.getParameter("search");
		//pageDTO.setSearch(search);		
		
		// 품목구분 설정
		String product_dv = request.getParameter("product_dv");
		pageDTO.setProduct_dv(product_dv);
		
		// 한 화면에 보여줄 글의 개수
		int pageSize = 10;
		
		// 현재페이지 번호 설정
		String pageNum= request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		} 
		int CurrentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(CurrentPage);
		
		List<Map<String, Object>> prList = consumptionService.getPrList(pageDTO);
		
		// 페이징 처리
		int count = consumptionService.getPrCount(pageDTO);
		int pageBlock = 5;
		int startPage = (CurrentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
		 	endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		// 서버단 처리 결과 전달
		model.addAttribute("prList", prList); 
		model.addAttribute("pageDTO", pageDTO);
		
		return "consumption/prList";
	}
	
}// class
