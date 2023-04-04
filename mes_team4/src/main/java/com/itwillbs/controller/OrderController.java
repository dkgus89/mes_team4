package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.SystemDTO;
import com.itwillbs.service.BusinessService;
import com.itwillbs.service.OrderService;
import com.itwillbs.service.ProductService;
import com.itwillbs.service.SystemService;

@Controller
public class OrderController {

	@Inject
	private BusinessService businessService;
	
	@Inject
	private OrderService orderService;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private SystemService systemService;
	
	@RequestMapping(value = "/order/ordermain", method = RequestMethod.GET)
	public String ordermain(HttpServletRequest request, Model model) {
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
		
		// 검색어 가져오기
		String search = request.getParameter("search");
		// 검색어를 pageDTO에 담아줌 
		pageDTO.setSearch(search);
		
		List<OrderDTO> orderList = orderService.getOrderList(pageDTO);
		
		//페이징 처리
		int count = orderService.getOrderCount();
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
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageDTO", pageDTO);
		
		// 가상주소 유지
		return "order/OrderMain";
	}
	
	@RequestMapping(value = "/order/orderinsert", method = RequestMethod.GET)
	public String businessinsert(Model model) {
			
		List<BusinessDTO> businessList = businessService.getBusinessList();
		List<ProductDTO> productList = productService.getProductList();
//		List<SystemDTO> systemList = systemService.getSystemlist();
		
		model.addAttribute("businessList",businessList);
		model.addAttribute("productList",productList);
//		model.addAttribute("systemList",systemList);
		
		// 가상주소 유지
		return "order/OrderInsert";
	}
	
	@RequestMapping(value = "/order/orderinsertpro", method = RequestMethod.POST)
	public String insertPro(OrderDTO orderDTO) {
		System.out.println("OrderController insertPro()");
		
		orderService.insertOrder(orderDTO);
		
		return "redirect:/order/ordermain";		
	}
	
	@RequestMapping(value = "/order/delete")
	public String delete(HttpServletRequest request) {
		System.out.println("OrderController delete()");
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			orderService.deleteOrder(ajaxMsg[i]);
		}
		return "redirect:/order/ordermain";
	}
	
	@RequestMapping(value = "/order/orderupdate", method = RequestMethod.GET)
	public String businessupdate(HttpServletRequest request, Model model) {
		System.out.println("orderController UpdateForm()");
		
		String cd = request.getParameter("cd");
		System.out.println("cd 값 : "+cd);

		OrderDTO orderDTO = orderService.getOrder(cd);
		List<BusinessDTO> businessList = businessService.getBusinessList();
		
		model.addAttribute("businessList",businessList);
		model.addAttribute("orderDTO",orderDTO);
		
		// 가상주소 유지
		return "order/OrderUpdate";
	}
	
	@RequestMapping(value = "/order/orderupdatepro", method = RequestMethod.POST)
	public String updatePro(OrderDTO orderDTO, HttpServletRequest request) {
		System.out.println("OrderController orderupdatePro()");
		
		String cd = request.getParameter("cd");
		orderDTO.setOrder_cd(cd);
		System.out.println("order cd값 : "+ orderDTO.getOrder_cd());

		orderService.updateOrder(orderDTO);

		return "redirect:/order/ordermain";
	}
	
}
