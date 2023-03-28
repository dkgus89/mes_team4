package com.itwillbs.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.xml.crypto.dsig.keyinfo.PGPData;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.DeliverDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.DeliverService;




	
@Controller
public class DeliverController {
	
		@Inject
		private DeliverService deliverService;
	

//		//가상주소???!!!???? 영업관리=> 출하등록 화면에서 " 출하등록 및 리스트가 되어야하는곳..."
//		@RequestMapping(value = "/deliver/deliver", method = RequestMethod.GET)
//		public String list(Model model) {
//			// 처리작업
//			
//			List<DeliverDTO> DeliverList=deliverService.getDeliverList();
//			
//			model.addAttribute("DeliverList", DeliverList);
//			
//			
//			// 가상주소에서 주소변경 없이 이동
//			return "deliver/Deliver";
//		}
	
			
		@RequestMapping(value = "/deliver/list", method = RequestMethod.GET)
		public String list(HttpServletRequest request, Model model) {
			System.out.println("/deliver/list()");
			
			//검색어 가져오기
			String search = request.getParameter("search");
			
				// 한 화면에 보여줄 글 개수 설정
				int pageSize = 8;
			
			//현 페이지 번호가져오기
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null) {
				//pageNum없으면 1페이지 설정
				pageNum="1";
			}
			//페이지 번호를 => 정수형 변경
			int currentPage=Integer.parseInt(pageNum);
			
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			//검색어
			pageDTO.setSearch(search);
			
			List<DeliverDTO>deliverList=deliverService.getDeliverList(pageDTO);
			
			//페이징처리
			//검색어
			int count = deliverService.getDeliverCount(pageDTO);
			int pageBlock=5;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count/pageSize+(count%pageSize == 0?0:1);
			if(endPage > pageCount) {
				endPage = pageCount;
			
			}
			
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			System.out.println(startPage);
			
			
			model.addAttribute("deliverList", deliverList);
			model.addAttribute("pageDTO",pageDTO);
			System.out.println(deliverList.get(0).getDeliver_cd());
			
			// 주소변경없이 이동
			return "deliver/Deliver";
		}



	/*		GET 방식은 클라이언트의 데이터를 URL 뒤 붙여 쿼리 스트링을 통해 전송, 전송하는 데이터 길이는 제한적
  		POST 방식은 데이터를 URL에 붙여 전송하지 않고 HTTP 몸체에 전송하며, 길이에 제한 없이 전송합니다. */	
//	가상주소 http://localhost:8080/mesteam4/deliver/Deliverinsert
	//자동으로 가상주소 뽑아오나? /deliver/Deliverinsert
	//가상주소???!!!????여기는 영업관리=>출하등록 이동후  "추가" 버튼 누르면 팝업창이 생성되어서 값을 등록할수 있게 되어야함.
	@RequestMapping(value = "/deliver/insert", method = RequestMethod.GET)
	public String insert() {
		
		//주소변경 없이 이동
		// /WEB-INF/views/deliver/Deliverinsert.jsp
		return "deliver/Deliverinsert";
		
	}//insert
	
	
	
	
	
//	가상주소 http://localhost:8080/mesteam4/deliver/insertPro
	//가상주소???!!!????
	//이동하는게 이상한데? 내가원하는것은 팝업창에서 입력하면 원래의 취합받은 리스트가 저장되는곳 그곳으로 이동이 되어야 하는데? 왜 이렇지?
		@RequestMapping(value = "/deliver/insertPro", method = RequestMethod.POST)
		public String insertPro(DeliverDTO deliverDTO) {
			System.out.println("DeliverController insertPro()" );
			
			//글쓰기 작업 메소드 호출 = 출하 값 입력 작업 메소드 호출
			deliverService.insertDeliver(deliverDTO);
			
			// 주소변경 하면서 이동.
			return "redirect:/deliver/Deliver";
		}//insertPro()
	
	
	
		
		
/*		GET 방식은 클라이언트의 데이터를 URL 뒤 붙여 쿼리 스트링을 통해 전송, 전송하는 데이터 길이는 제한적
	  	POST 방식은 데이터를 URL에 붙여 전송하지 않고 HTTP 몸체에 전송하며, 길이에 제한 없이 전송합니다.
*/			
		@RequestMapping(value = "/deliver/update", method = RequestMethod.GET)
		public String update(HttpServletRequest request, Model model) {
			System.out.println("/deliver/update");
			String deliver_cd =  request.getParameter("deliver_cd");
			System.out.println(deliver_cd);
			
			//System.out.println(deliverDTO.getDeliver_cd());	
			
			DeliverDTO deliverDTO=deliverService.getDeliver(deliver_cd);
		
			model.addAttribute("deliverDTO", deliverDTO);
			
			
			// 가상주소에서 주소변경 없이 이동
			return "deliver/Deliverupdate";
		}
		
		
		
		
		/*		GET 방식은 클라이언트의 데이터를 URL 뒤 붙여 쿼리 스트링을 통해 전송, 전송하는 데이터 길이는 제한적
	  	POST 방식은 데이터를 URL에 붙여 전송하지 않고 HTTP 몸체에 전송하며, 길이에 제한 없이 전송합니다.
*/			
		@RequestMapping(value = "/deliver/updatePro", method = RequestMethod.POST)
		public String updatePro(DeliverDTO deliverDTO) {
			System.out.println("/deliver/updatePro");
			
			deliverService.updateDeliver(deliverDTO);
			
			// 주소변경하면서 이동
			return "redirect:/deliver/Deliver";
		}
		
		
		
		
		
		
	
}// DeliverController
