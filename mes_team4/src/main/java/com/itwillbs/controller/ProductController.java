package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;

@Controller
public class ProductController {
	
	@Inject
	private ProductService productService;
	
	@RequestMapping(value = "/product/prodpage", method = RequestMethod.GET)
	public String prodpage() {
		return "product/ProductPage";
	}
	
	@RequestMapping(value = "/product/prodinsert", method = RequestMethod.GET)
	public String prodinsert() {
		return "product/ProductInsert";
	}
	
	@RequestMapping(value = "/product/prodinsertPro", method = RequestMethod.POST)
	public String prodinsertPro(ProductDTO productDTO) {
		System.out.println("ProductController insertPro()");
		//회원가입 처리 부모인터페이스 MemberService, 
		//           자식클래스 MemberServiceImpl
		// 리턴할형 없음 insertMember(MemberDTO memberDTO) 메서드 정의
		// 메서드 호출
		productService.insertProduct(productDTO);
		
//		주소줄 변경하면서 이동
		return "redirect:/product/prodpage";
	}
}
