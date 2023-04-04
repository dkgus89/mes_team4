package com.itwillbs.controller;

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

import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReceiveDTO;
import com.itwillbs.domain.ReleaseDTO;
import com.itwillbs.service.ReceiveService;
import com.itwillbs.service.ReleaseService;

@Controller
public class ReleaseController {
	
	@Inject
	private ReleaseService relService; 
	@Inject
	private ReceiveService receiveService;
	
	@RequestMapping(value = "/rel/relpage", method = RequestMethod.GET)
	public String relpage(HttpServletRequest request, Model model) {
		System.out.println("ReleaseController relinsert()");
		
		//검색어 가져오기
		String search=request.getParameter("search");
		// 검색어 옵션
		String select = request.getParameter("select");
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize=5;
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
		//검색어
		pageDTO.setSearch(search);
		pageDTO.setSelect(select);
		
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
		
		return "release/RelInsert";
	}
	
	@RequestMapping(value = "/rel/relinsertPro", method = RequestMethod.POST)
	public String relinsertPro(ReleaseDTO releaseDTO) {
		System.out.println("ReleaseController relinsertPro()");
		
//		// 출고코드 자동생성(PCHyyMMdd01) 및 저장 
//				// 기존 출고코드
//				String first_release_schedule_cd = relService.getRel_cd();
//				String first_number_st = first_release_schedule_cd.substring(9);
//				int first_number = 0;
//				
//				// 새로운 발주코드
//				String new_release_schedule_cd = "출고코드";
//				String new_number_st = "스트링넘버";
//				int new_number = 0;
//				
//				// 메뉴코드 설정
//				String menu_code = "REL";
//				
//				// 오늘날짜 설정
//				LocalDate now = LocalDate.now();
//			    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
//			    String today = now.format(formatter);
//			    
//			    // 인덱스 설정
//			    if (first_release_schedule_cd.contains(today)) {
//			    	// 패턴&매치 정규식 이용 => 스트링넘버 앞 0 삭제(조건 : String length 2자 이상)
//			    	Pattern pattern = Pattern.compile("^0*([1-9][0-9]*)|0+$");
//					Matcher matcher = pattern.matcher(first_number_st);
//					
//					if (matcher.find()) { 
//					    first_number = Integer.parseInt(matcher.group(1)); 
//					} else {
//					    System.out.println("No match found.");
//					}
//					
//					// String 정규식 이용 => new_release_schedule_cd 생성
//					new_number = first_number+1;
//					new_number_st = String.valueOf(new_number).format("%02d", new_number);
//					new_release_schedule_cd = menu_code + today + new_number_st;
//					
//			    } else {
//			    	new_release_schedule_cd = menu_code + today + "01";
//			    }
		
		relService.insertrel(releaseDTO);
		
		return "redirect:/rel/relpage";
	}

	@RequestMapping(value = "/rel/relupdate", method = RequestMethod.GET)
	public String relupdate(HttpServletRequest request, Model model) {
		System.out.println("ReleaseController relupdate()");
		
		String rel_schedule_cd=request.getParameter("rel_schedule_cd");
		ReleaseDTO relDTO=relService.getrel(rel_schedule_cd);
		
		model.addAttribute("relDTO", relDTO);
		
		return "release/RelUpdate";
	}
	
	@RequestMapping(value = "/rel/relupdatePro", method = RequestMethod.POST)
	public String relupdatePro(ReleaseDTO releaseDTO) {
		System.out.println("ReleaseController relupdatePro()");
		
		relService.updaterel(releaseDTO);
		
		return "redirect:/rel/relpage";
	}
	
	@RequestMapping(value = "/rel/reldelete", method = RequestMethod.GET)
	public String reldelete(HttpServletRequest request) {
		System.out.println("ReleaseController reldelete()");
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			relService.deleterel(ajaxMsg[i]);
		}
		
		return "redirect:/rel/relpage";
	}
	
	@RequestMapping(value = "/rel/reclist", method = RequestMethod.GET)
	public String instList(HttpServletRequest request, Model model) {
		
//		한 화면에 보여줄 글의 개수 설정
		int pageSize =5;
//		현재 페이지 번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
//			pageNum이 없으면 1페이지로 설정
			pageNum = "1";
		} 
		int currentPage = Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<ReceiveDTO> receiveList=receiveService.getReceiveList(pageDTO);
		
//		페이징처리
		int count = receiveService.getReceiveCount(pageDTO);
		int pageBlock = 10;
		int startPage = (currentPage-1)/pageBlock * pageBlock + 1;  
		int endPage = startPage + pageBlock - 1;
		int pageCount = count/pageSize + (count%pageSize==0?0:1);
		if (endPage > pageCount){
			endPage = pageCount;
			}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		
		
		model.addAttribute("receiveList", receiveList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "release/RecList";
	}
}
