package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;

@Controller
public class ProductController {
	
	@Inject
	private ProductService productService;
	
	@RequestMapping(value = "/product/prodpage", method = RequestMethod.GET)
	public String prodpage(HttpServletRequest request, Model model) {
		String pageNum=request.getParameter("pageNum");
		// 한 화면에 보여질 글의 개수 설정
		int pageSize=10;
		// 현재 페이지번호 가져오기
		if(pageNum==null) {
			// pageNum없으면 1페이지로 설정
			pageNum="1";
		}		
		// 페이지번호를 '정수형'으로 변경
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<ProductDTO> productList=productService.getProductList(pageDTO);
		
		// 페이징 처리
		int count =productService.getProductCount();
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
		System.out.println(productList.get(0).getProduct_cd_name());
		model.addAttribute("productList",productList);
		model.addAttribute("pageDTO",pageDTO);
		
		return "product/ProductPage";
	}
	
	@RequestMapping(value = "/product/prodinsert", method = RequestMethod.GET)
	public String prodinsert() {
		return "product/ProductInsert";
	}
	
	@RequestMapping(value = "/product/prodinsertPro", method = RequestMethod.POST)
	public String prodinsertPro(ProductDTO productDTO) {
		System.out.println("ProductController prodinsertPro()");
		//회원가입 처리 부모인터페이스 MemberService, 
		//           자식클래스 MemberServiceImpl
		// 리턴할형 없음 insertMember(MemberDTO memberDTO) 메서드 정의
		// 메서드 호출
		productService.insertProduct(productDTO);
		
//		주소줄 변경하면서 이동
		return "redirect:/product/prodpage";
	}
	
	@RequestMapping(value = "/product/productdelete", method = RequestMethod.GET)
	public String productdelete(HttpServletRequest request) {
		String chbox[]=request.getParameterValues("chbox");
		String product_cd_name = null;
		if(chbox!=null){
			  for(int i=0;i<chbox.length;i++){
		   
				  product_cd_name=chbox[i];
				productService.deleteProduct(product_cd_name);
			  }
	       }			
		
		// 주소변경 하면서 이동
		return "redirect:/product/prodpage";
	}
	
	
}
