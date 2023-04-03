package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.PageDTO;

@Controller
public class ReceiveController {
	
	@RequestMapping(value = "/receive/recpage", method = RequestMethod.GET)
	public String prodpage(HttpServletRequest request, Model model) {
		// 검색어 가져오기
		String search=request.getParameter("search");
		// 검색어 옵션
		String select=request.getParameter("select");
		
		String pageNum=request.getParameter("pageNum");
		// 한 화면에 보여질 글의 개수 설정
		int pageSize=5;
		// 현재 페이지번호 가져오기
		if(pageNum==null) {
			// pageNum없으면 1페이지로 설정
			pageNum="1";
		}		
		// 페이지번호를 '정수형'으로 변경
//		int currentPage=Integer.parseInt(pageNum);
//		
//		PageDTO pageDTO=new PageDTO();
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setPageNum(pageNum);
//		pageDTO.setCurrentPage(currentPage);
//		// 검색어
//		pageDTO.setSearch(search);
//		pageDTO.setSelect(select);
//		
////		List<ProductDTO> productList=productService.getProductList(pageDTO);
//		List<Map<String, Object>> productList
//	     =productService.getProductList(pageDTO);
//		
//		// 페이징 처리
//		int count =productService.getProductCount(pageDTO);
//		int pageBlock=10;
//		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//		int endPage=startPage+pageBlock-1;
//		int pageCount=count/pageSize+(count%pageSize==0?0:1);
//		if(endPage > pageCount){
//			endPage = pageCount;
//		}
		
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);
//		System.out.println(productList.get(0).getProduct_cd_name());
//		model.addAttribute("productList", productList);
//		model.addAttribute("pageDTO",pageDTO);
		
		return "receive/ReceivePage";
	}
}