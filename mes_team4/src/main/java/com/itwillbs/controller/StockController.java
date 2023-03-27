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
import com.itwillbs.domain.StockDTO;
import com.itwillbs.service.StockService;

@Controller
public class StockController {

	//멤버변수 부모 인터페이스 정의 => 자동으로 자식 클래스 객체생성
	// 스프링 객체생성 방식 => 의존관계주입(DI : Dependency Injection)
	@Inject
	private StockService stockService;
	
	@RequestMapping(value = "/stock/stock", method = RequestMethod.GET)
	public String stock(HttpServletRequest request, Model model) {
		System.out.println("StockController stock()");
		
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
		
//		List<StockDTO> StockList=stockService.getStockList(pageDTO);
					
		//페이징 처리
		int count = stockService.getStockCount();
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
		
		//메서드 호출
		List<Map<String, Object>> StockMap
		     =stockService.getStockMap();
		//model 담아서 이동
		model.addAttribute("StockMap", StockMap);
		
//		model.addAttribute("StockList", StockList);
		model.addAttribute("pageDTO", pageDTO);
		
		// 주소변경 없이 이동
		// /WEB-INF/views/stock/Stock.jsp
		return "stock/Stock";
	}
	
	@RequestMapping(value = "/stock/stockinsert", method = RequestMethod.GET)
	public String stockInsert() {
		
		// 주소변경 없이 이동
		// /WEB-INF/views/stock/StockInsert.jsp
		return "stock/StockInsert";
	}
	
	@RequestMapping(value = "/stock/stockinsertpro", method = RequestMethod.POST)
	public String stockInsertPro(HttpServletRequest request, StockDTO stockDTO) {
		System.out.println("StockController stockInsertPro()");
		
		//글쓰기 작업 메서드 호출
		stockService.insertStock(stockDTO);
		
		// 주소변경 하면서 이동
		return "redirect:/stock/stock";
	}
	
	@RequestMapping(value = "/stock/stockupdate", method = RequestMethod.GET)
	public String stockupdate(HttpServletRequest request, Model model) {
		String stock_cd=request.getParameter("stock_cd");
		StockDTO stockDTO=stockService.getStock(stock_cd);
		
		model.addAttribute("StockDTO", stockDTO);
		
		// 주소변경 없이 이동
		// /WEB-INF/views/stock/StockUpdate.jsp
		return "stock/StockUpdate";
	}
	
	@RequestMapping(value = "/stock/stockupdatepro", method = RequestMethod.POST)
	public String stockUpdatePro(StockDTO stockDTO) {
		
		stockService.updateStock(stockDTO);
		
		// 주소변경 하면서 이동
		return "redirect:/stock/stock";
	}
	
	@RequestMapping(value = "/stock/stockdelete", method = RequestMethod.GET)
	public String stockDelete(HttpServletRequest request) {
		String chbox[]=request.getParameterValues("chbox");
		String stock_cd = null;
		if(chbox!=null){
			  for(int i=0;i<chbox.length;i++){
		   
				stock_cd=chbox[i];
				stockService.deleteStock(stock_cd);
			  }
	       }			
		
		// 주소변경 하면서 이동
		return "redirect:/stock/stock";
	}
}
