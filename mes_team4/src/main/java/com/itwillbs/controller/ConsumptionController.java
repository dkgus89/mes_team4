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

import com.itwillbs.domain.ConsumptionDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.ConsumptionService;


@Controller
public class ConsumptionController {
	
	@Inject 
	private ConsumptionService consumptionService;
	
	@RequestMapping(value = "/consmpt/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("ConsumptionController list()");
		// 처리작업

		// 검색어 설정
		// String search= request.getParameter("search");
		// pageDTO.setSearch(search);		
		
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
		
		//List<ConsumptionDTO> consmptList = consumptionService.getConsmptList(pageDTO);
		  
		// 페이징 처리
		int count = consumptionService.getConsmptCount(pageDTO);
		int cprCount = consumptionService.getCprConsmptCount(pageDTO);
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
		//model.addAttribute("consmptList", consmptList); 
		model.addAttribute("pageDTO", pageDTO);
		
		return "consumption/List";
	}
	
	@RequestMapping(value = "/consmpt/insert", method = RequestMethod.GET)
	public String insert() {
		System.out.println("ConsumptionController insert()");
		// 처리작업
	
		return "consumption/Insert";
	}
	
	@RequestMapping(value = "/consmpt/insertPro", method = RequestMethod.POST)
	public String insertPro(ConsumptionDTO consumptionDTO) {
		System.out.println("ConsumptionController insertPro()");
		// 처리작업
		
		// 배열 길이 지정
		int length = consumptionDTO.getRproduct_cd_name_arr().length;
		
		// consmptArray 저장
		ConsumptionDTO[] consmptArray = new ConsumptionDTO[length];
		for (int i = 0; i < length; i++) {
			ConsumptionDTO consumptionDTO2 = new ConsumptionDTO();
			consumptionDTO2.setCproduct_cd_name(consumptionDTO.getCproduct_cd_name());
			consumptionDTO2.setCproduct_name(consumptionDTO.getCproduct_name());
			consumptionDTO2.setRproduct_cd_name(consumptionDTO.getRproduct_cd_name_arr()[i]);
			consumptionDTO2.setRproduct_name(consumptionDTO.getRproduct_name_arr()[i]);
			consumptionDTO2.setConsumption(consumptionDTO.getConsumption_arr()[i]);
			consumptionDTO2.setConsumption_unit(consumptionDTO.getConsumption_unit_arr()[i]);
			consmptArray[i] = consumptionDTO2;
		}
		
		consumptionService.insertConsmpt(consmptArray);
		return "consumption/Close";
	}
	
	@RequestMapping(value = "/consmpt/prlist", method = RequestMethod.GET)
	public String prlist(HttpServletRequest request, PageDTO pageDTO, Model model) {
		System.out.println("ConsumptionController prlist()");
		// 처리작업

		// 검색어 설정
		// String search= request.getParameter("search");
		// pageDTO.setSearch(search);		
		
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
		
		return "consumption/PrList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/consmpt/cprcheck", method = RequestMethod.GET)
	public String cprcheck(HttpServletRequest request) {
		System.out.println("ConsumptionController cprcheck()");
		// 처리작업
		String cprCdName = request.getParameter("cprCdName");
		String result = "insert";
		
		List<ConsumptionDTO> consmptList = consumptionService.checkCprCdName(cprCdName);
		
		if(!(consmptList.isEmpty())) {
			result = "notInsert";
		} 
		
		return result;
	}
	
}// class
