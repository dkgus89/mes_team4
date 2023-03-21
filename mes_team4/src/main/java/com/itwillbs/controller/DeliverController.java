package com.itwillbs.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.DeliverDTO;



@Controller
public class DeliverController {
	
	
	//가상주소???!!!????
		@RequestMapping(value = "/deliver/deliver", method = RequestMethod.GET)
		public String list() {
			// 처리작업
			
			// 가상주소에서 주소변경 없이 이동
			return "deliver/DeliverPage";
		}
	
	
	
	
	//가상주소???!!!????
	@RequestMapping(value = "/deliver/insert", method = RequestMethod.GET)
	public String insert() {
		// 처리작업
		
		// 가상주소에서 주소변경 없이 이동
		return "deliver/deliverinsertForm";
	}
	
	
	
	
	//가상주소???!!!????
		@RequestMapping(value = "/deliver/insertPro", method = RequestMethod.POST)
		public String insertPro(DeliverDTO deliverDTO) {
			// 처리작업
			System.out.println(deliverDTO.getDeliver_cd());
			// 가상주소에서 주소변경 없이 이동
			return "redirect:/deliver/deliver";
		}
	
	
	
	
}// DeliverController
