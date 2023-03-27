package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BusinessService;


@Controller
public class BusinessController {
	
	@Inject
	private BusinessService businessService;
	
	
	@RequestMapping(value = "/business/businessmain", method = RequestMethod.GET)
	public String businessmain(HttpServletRequest request, Model model) {
		// 한 화면에 보여줄 글 개수 설정
		int pageSize=5;
		// 현페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 페이지번호를 => 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
//		검색어 가져오기
		String search = request.getParameter("search");
//		검색어를 pageDTO에 담아줌 
		pageDTO.setSearch(search);
		
		List<BusinessDTO> businessList = businessService.getBusinessList(pageDTO);
		
		//페이징 처리
		int count = businessService.getBusinessCount();
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
		
		model.addAttribute("businessList", businessList);
		model.addAttribute("pageDTO", pageDTO);
		
		// 가상주소 유지
		return "business/BusinessMain";
	}
	
	@RequestMapping(value = "/business/businessinsert", method = RequestMethod.GET)
	public String businessinsert() {
		
		// 가상주소 유지
		return "business/BusinessInsert";
	}
	
	@RequestMapping(value = "/business/businessinsertpro", method = RequestMethod.POST)
	public String insertPro(BusinessDTO businessDTO) {
		System.out.println("BusinessController businessinsertPro()");

		businessService.insertBusiness(businessDTO);

		return "redirect:/business/businessmain";
	}
	
	@RequestMapping(value = "/business/delete")
	public String delete(HttpServletRequest request) {
		System.out.println("businessController delete()");
		
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			businessService.deleteBusiness(ajaxMsg[i]);
		}
		
		
		return "redirect:/business/businessmain";
	}
	
	@RequestMapping(value = "/business/businessupdate", method = RequestMethod.GET)
	public String businessupdate(HttpServletRequest request, Model model) {
		System.out.println("businessController UpdateForm()");
		
		String cd = request.getParameter("cd");
		System.out.println("cd 값 : "+cd);
		
		BusinessDTO businessDTO = businessService.getBusiness(cd);
		
		model.addAttribute("businessDTO",businessDTO);
		
		System.out.println("dv값" +businessDTO.getBusiness_dv());
		System.out.println(businessDTO.getBusiness_type());
		
		// 가상주소 유지
		return "business/BusinessUpdate";
	}
	
	@RequestMapping(value = "/business/businessupdatepro", method = RequestMethod.POST)
	public String updatePro(BusinessDTO businessDTO, HttpServletRequest request) {
		System.out.println("BusinessController businessupdatePro()");
		
		String cd = request.getParameter("cd");
		businessDTO.setBusiness_cd(cd);

		businessService.updateBusiness(businessDTO);

		return "redirect:/business/businessmain";
	}
	
	

	
}
