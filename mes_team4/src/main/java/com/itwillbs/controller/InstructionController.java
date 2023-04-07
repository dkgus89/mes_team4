
package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.InstructionService;
import com.itwillbs.service.OrderService;

@Controller
public class InstructionController {
	@Inject
	private InstructionService instructionService;
	
	@Inject
	private OrderService orderService;
	
	@RequestMapping(value = "/inst/instmain", method = RequestMethod.GET)
	public String instmain(HttpServletRequest request, Model model) {
			System.out.println("InstructionController instmain()");
			String search =request.getParameter("search");
//			한 화면에 보여줄 글의 개수 설정
			int pageSize =5;
//			현재 페이지 번호 가져오기
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) {
//				pageNum이 없으면 1페이지로 설정
				pageNum = "1";
			} 
			int currentPage = Integer.parseInt(pageNum);
			
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			pageDTO.setSearch(search);
			
			List<InstructionDTO> instructionList=instructionService.instructionlist(pageDTO);
			
//			페이징처리
			int count = instructionService.getinstructioncount(pageDTO);
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
			
			
			
			model.addAttribute("instructionList", instructionList);
			model.addAttribute("pageDTO", pageDTO);
			
			return "inst/InstMain";

	}
	
	@RequestMapping(value = "/inst/instinsert", method = RequestMethod.GET)
	public String instructioninsert(HttpServletRequest request, Model model) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		List<Map<String, Object>> instMap
	     = instructionService.getInstMap();
	//model 담아서 이동
	model.addAttribute("instMap", instMap);
		return "inst/InstInsert";
	}
	
	@RequestMapping(value = "/inst/instinsertpro", method = RequestMethod.POST)
	public String instinsertpro(InstructionDTO instructionDTO) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("InstructionController instinsertpro()");
		instructionDTO.setInstruction_code("IS" + instructionDTO.getOrder_cd());
		
		System.out.println("instruction_code :" + instructionDTO.getInstruction_code());
		System.out.println("line_cd :" + instructionDTO.getLine_cd());
		System.out.println("product_cd_name :" + instructionDTO.getProduct_cd_name());
		System.out.println("order_cd :" + instructionDTO.getOrder_cd());
		System.out.println("instruction_date :" + instructionDTO.getInstruction_date());
		System.out.println("instruction_state :" + instructionDTO.getInstruction_state());
		System.out.println("instruction_qt :" + instructionDTO.getInstruction_qt());
		
		// MemberService memberService = new MemberServiceImpl();
		instructionService.instinsertpro(instructionDTO);
		orderService.updateCon(instructionDTO.getOrder_cd());
		
		// 가상주소에서 주소변경 하면서 이동
		return "redirect:/inst/instmain";
	}
	
	@RequestMapping(value = "/inst/instupdate", method = RequestMethod.GET)
	public String instupdate(HttpServletRequest request, Model model) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("InstructionController instupdate()");
		String instruction_code = request.getParameter("instruction_code");
	

		//메서드 호출
		List<Map<String, Object>> instMap
		     =instructionService.getInstMap();
		//model 담아서 이동
		model.addAttribute("instMap", instMap);
		
		//메서드 호출
		Map<String, Object> inst
		     = instructionService.getInst(instruction_code);
		
		//model 담아서 이동
		model.addAttribute("inst", inst);
		
		return "/inst/InstUpdate";
	}
	
	@RequestMapping(value = "/inst/instupdatepro", method = RequestMethod.POST)
	public String instructionupdatepro(InstructionDTO instructionDTO) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("InstructionController instructionupdatepro()");

		instructionService.instupdatepro(instructionDTO);
		
		// 가상주소에서 주소변경 하면서 이동
		return "redirect:/inst/instmain";
	}

	@RequestMapping(value = "/inst/instdelete", method = RequestMethod.GET)
	public String instdelete(HttpServletRequest request) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		System.out.println("InstructionController instdelete()");
		String chbox[]=request.getParameterValues("rowcheck");
		String instruction_code = null;
		if(chbox!=null){
			  for(int i=0;i<chbox.length;i++){
				  instruction_code=chbox[i];
				  instructionService.instdelete(instruction_code);
			  }
	       }			
		
		// 주소변경 하면서 이동
		return "redirect:/inst/instmain";
	}
	
	
	@RequestMapping(value = "/inst/orderlist", method = RequestMethod.GET)
	public String orderlist(HttpServletRequest request, Model model) {
		
//		한 화면에 보여줄 글의 개수 설정
		int pageSize =10;
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
		
		List<Map<String, Object>> orderListMap
	     =instructionService.getOrderListMap(pageDTO);
//		List<OrderDTO> orderList=orderService.getOrderList(pageDTO);
		
//		페이징처리
		int count = orderService.getOrderCount();
		int pageBlock = 5;
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
		

		model.addAttribute("orderListMap", orderListMap);
		model.addAttribute("pageDTO", pageDTO);
		
		// 주소변경 없이 이동
		// /WEB-INF/views/perform/InstList.jsp
		return "inst/OrderList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/inst/ordercheck", method = RequestMethod.GET)
	public String ordercheck(HttpServletRequest request, Model model) {
		// request 파라미터 
		String order_cd=request.getParameter("order");
		String result=null;
		
		// 메서드 호출
		int ordercheck
	     =instructionService.getordercheck(order_cd);
			
		// if문으로 result에 저장 할 값 설정
		if(ordercheck==0) {
			result="0";
		}else {
			result="1";
		}			
				
		// result 값 리턴
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/inst/changeIng")
	public String delete(HttpServletRequest request) {
		System.out.println("OrderController delete()");
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		String jdata = "0";
		
		System.out.println("배열0번지출력"+ajaxMsg[0]);
		
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
				instructionService.updateCon2(ajaxMsg[i]);
//				orderService.updateCon(ajaxMsg[i]);
				jdata = "1";
			}
			
		
		System.out.println("jdata값!!!!!!!!!!" + jdata);
		return jdata;
	}

	@RequestMapping(value = "/inst/instcontent", method = RequestMethod.GET)
	public String instcontent(HttpServletRequest request, Model model, InstructionDTO instructionDTO) {
		// web.xml 에서 한글설정을 한번만 하면 모든 곳에서 한글처리
		String instruction_code = request.getParameter("instruction_code");
		List<Map<String, Object>> consListMap
	     = instructionService.getConsListMap(instruction_code);
		
		InstructionDTO instructionDTO2 = instructionService.instructioninfo(instruction_code);
	//model 담아서 이동
	model.addAttribute("consListMap", consListMap);
	model.addAttribute("instructionDTO", instructionDTO2);
		return "/inst/InstContent";
	}

}
