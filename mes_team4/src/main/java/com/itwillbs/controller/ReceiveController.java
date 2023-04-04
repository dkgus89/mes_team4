package com.itwillbs.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReceiveDTO;
import com.itwillbs.domain.WHDTO;
import com.itwillbs.service.OrderService;
import com.itwillbs.service.PurchaseService;
import com.itwillbs.service.ReceiveService;
import com.itwillbs.service.WHService;

@Controller
public class ReceiveController {
	
	@Inject
	private ReceiveService receiveService;
	@Inject
	private WHService whService;
	@Inject 
	private PurchaseService purchaseService;
	@Inject
	private OrderService orderService;
	
	
	@RequestMapping(value = "/receive/recpage", method = RequestMethod.GET)
	public String recpage(HttpServletRequest request, Model model) {
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
		int currentPage=Integer.parseInt(pageNum);
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
//		// 검색어
		pageDTO.setSearch(search);
		pageDTO.setSelect(select);
		
		List<ReceiveDTO> receiveList=receiveService.getReceiveList(pageDTO);
//		List<Map<String, Object>> receiveList
//	     =receiveService.getReceiveList(pageDTO);
//		
		// 페이징 처리
		int count =receiveService.getReceiveCount(pageDTO);
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
		model.addAttribute("receiveList", receiveList);
		model.addAttribute("pageDTO",pageDTO);
		
		return "receive/ReceivePage";
	}
	
	@RequestMapping(value = "/receive/recinsert", method = RequestMethod.GET)
	public String recinsert(Model model) {
		System.out.println("ReceiveController insert()");
		
//		List<Map<String, Object>> instMap
//			=receiveService.getInstMap();
//		// model에 담아서 이동
//		model.addAttribute("instMap", instMap);
		
		return "receive/ReceiveInsert";
	}
	
	@RequestMapping(value = "/receive/recinsertPro", method = RequestMethod.POST)
	public String recinsertPro(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveController insertPro()");
		
//		// 발주코드 자동생성(PCHyyMMdd01) 및 저장 
//		// 기존 발주코드
//		String first_purchase_cd = "기존발주코드";
//		String first_number_st = "기존스트링넘버";
//		int first_number = 0;
//		
//		if (purchaseService.getPurchase_cd() != null) { // -> 이 줄만 수정해서 사용하세요.
//			first_purchase_cd = purchaseService.getPurchase_cd(); // -> 이 줄만 수정해서 사용하세요.
//			first_number_st = first_purchase_cd.substring(9);
//		}	
//		
//		// 새로운 발주코드
//		String new_purchase_cd = "새발주코드";
//		String new_number_st = "새스트링넘버";
//		int new_number = 0;
//		
//		// 메뉴코드 설정
//		String menu_code = "PCH"; // -> 이 줄만 수정해서 사용하세요.
//		
//		// 오늘날짜 설정
//		LocalDate now = LocalDate.now();
//	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
//	    String today = now.format(formatter);
//	    
//	    // 인덱스 설정
//	    if ( !(first_purchase_cd.equals("기존발주코드")) && first_purchase_cd.contains(today)) {
//	    	// 패턴&매치 정규식 이용 => 스트링넘버 앞 0 삭제(조건 : String length 2자 이상)
//	    	Pattern pattern = Pattern.compile("^0*([1-9][0-9]*)|0+$");
//			Matcher matcher = pattern.matcher(first_number_st);
//			
//			if (matcher.find()) { 
//			    first_number = Integer.parseInt(matcher.group(1)); 
//			} else {
//			    System.out.println("No match found.");
//			}
//			
//			// String 정규식 이용 => new_purchase_cd 생성
//			new_number = first_number+1;
//			new_number_st = String.valueOf(new_number).format("%02d", new_number);
//			new_purchase_cd = menu_code + today + new_number_st;
//			
//	    } else {
//	    	new_purchase_cd = menu_code + today + "01";
//	    }
//		
//	    purchaseDTO.setPurchase_cd(new_purchase_cd); // -> 이 줄만 수정해서 사용하세요.
//	    
//		// 발주상태 저장
//		purchaseDTO.setPurchase_com("미완료");
//		
//		// String -> date 변환
//		Date purchase_date = Date.valueOf(purchaseDTO.getPurchase_date_st());
//	    Date purchase_due = Date.valueOf(purchaseDTO.getPurchase_due_st());
//		purchaseDTO.setPurchase_date(purchase_date);
//		purchaseDTO.setPurchase_due(purchase_due);
		
		receiveService.insertReceive(receiveDTO);
		
		return "redirect:/receive/recpage";
	}
	
	@RequestMapping(value = "/receive/warehouse", method = RequestMethod.GET)
	public String whpage(HttpServletRequest request, Model model) {
				
				// 한 화면에 보여줄 글 개수 설정
				int pageSize=10;
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
				
				List<WHDTO> whList=whService.getWhList(pageDTO);
				
				//페이징 처리
				int count = whService.getWhCount(pageDTO);
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
				
				model.addAttribute("whList", whList);
				model.addAttribute("pageDTO", pageDTO);
				
		return "receive/warehouse";
	}
	
	@RequestMapping(value = "/receive/purchase", method = RequestMethod.GET)
	public String list(HttpServletRequest request, PageDTO pageDTO, Model model) {
				
		// 한 화면에 보여줄 글의 개수
		int pageSize = 5;
		
		// 현재페이지 번호 설정
		String pageNum= request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		} 
		int CurrentPage = Integer.parseInt(pageNum);
		
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(CurrentPage);
		
		List<Map<String, Object>> purchaseMapList = purchaseService.getPurchaseMapList(pageDTO);
		
		int count = purchaseService.getPurchaseCount(pageDTO);
		
		// 페이징 처리
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
		model.addAttribute("purchaseMapList", purchaseMapList); 
		model.addAttribute("pageDTO", pageDTO);
		
		return "receive/purchase";
	}
	
	@RequestMapping(value = "/receive/order", method = RequestMethod.GET)
	public String ordermain(HttpServletRequest request, Model model) {
		
		int pageSize=5;
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
		
		//생산 전,완료 개수 구하기
		pageDTO.setPcount(orderService.getPCount());
		pageDTO.setFcount(orderService.getFCount());
		
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
		return "receive/order";
	}
}