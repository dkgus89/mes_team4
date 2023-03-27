package com.itwillbs.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.service.PerformService;

@RestController
public class AjaxController {

	// 부모 인페이스 멤버변수 선언 => 자동으로 객체생성 
		@Inject
		private PerformService performService;
		
		// 가상주소 http://localhost:8080/
		@RequestMapping(value = "/perform/callcd", method = RequestMethod.GET)
		public ResponseEntity<Map<String, Object>> callcd(HttpServletRequest request, Model model) {
			// request 파라미터 
			String ic=request.getParameter("ic");
			
			//메서드 호출
			Map<String, Object> callcdMap
			     =performService.getcallcdMap(ic);
					
			
			
			//출력 결과 ResponseEntity 저장 => 되돌아감
			ResponseEntity<Map<String, Object>> entity=
					new ResponseEntity<Map<String, Object>>(callcdMap,HttpStatus.OK);
			return entity;
		}
}
