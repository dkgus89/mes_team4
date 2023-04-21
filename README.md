# MEDI-FAC 의약품 MES 사이트
### 호스팅 사이트 : http://itwillbs21.cafe24.com/mesteam4/home
#### 1. 개발도구 : Eclipse, Github  
#### 2. 개발언어 : Java(OpenJDK 11.0.2), MySQL(8.0.17), JavaScript
#### 3. 라이브러리 : jQuery(3.6.4), JSTL(1.2)
#### 4. 프레임워크 : Spring(4.3.8.RELEASE), MyBatis(3.4.1)
#### 5. 웹 애플리케이션도구 : JSP(MVC model2)
#### 6. 웹 호스팅 : cafe24

***

#### 개발 기간 : 3월 8일 ~ 4월 14일
#### 역할 : 깃허브 관리, PPT
#### 개발 페이지 : 소요량 페이지, 발주 페이지, 작업지시 페이지-원자재 재고비교 

### <상세 코드>
#### 소요량 페이지  
1. Model 
    - 소요량 DAO [ConsumptionDAO.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/dao/ConsumptionDAO.java)  
    - 소요량 DAOImpl [ConsumptionDAOImpl.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/dao/ConsumptionDAOImpl.java)
    - 소요량 Service [ConsumptionService.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/service/ConsumptionService.java)  
    - 소요량 ServiceImpl [ConsumptionServiceImpl.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/service/ConsumptionServiceImpl.java)
    - 소요량 DTO [ConsumptionDTO.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/domain/ConsumptionDTO.java)  
    - 페이징 DTO [PageDTO.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/domain/PageDTO.java)  

2. View    
    - 소요량 리스트 [consumption/List.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/consumption/List.jsp)  
    - 소요량 추가 팝업 [consumption/Insert.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/consumption/Insert.jsp)  
    - 소요량 수정 팝업 [consumption/Update.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/consumption/Update.jsp)  
    - 소요량 품목 리스트 [consumption/PrList.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/consumption/PrList.jsp)  
    - 소요량 팝업 닫기 [consumption/Close.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/consumption/Close.jsp)  

3. Controller  
    - 컨트롤러 [ConsumptionController.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/controller/ConsumptionController.java)  

#### 발주 페이지 
1. Model 
    - 발주 DAO [PurchaseDAO.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/dao/PurchaseDAO.java)  
    - 발주 DAOImpl [PurchaseDAOImpl.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/dao/PurchaseDAOImpl.java)
    - 발주 Service [PurchaseService.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/service/PurchaseService.java)  
    - 발주 ServiceImpl [PurchaseServiceImpl.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/service/PurchaseServiceImpl.java)
    - 발주 DTO [PurchaseDTO.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/domain/PurchaseDTO.java)  
    - 페이징 DTO [PageDTO.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/domain/PageDTO.java)  
    
2. View  
    - 발주 리스트 [purchase/List.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/purchase/List.jsp)   
    - 발주 추가 팝업 [purchase/Insert.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/purchase/Insert.jsp)  
    - 발주 수정 팝업 [purchase/Update.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/purchase/Update.jsp)   
    - 발주 품목 리스트 [purchase/PrList.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/purchase/PrList.jsp)
    - 발주 거래처 리스트 [purchase/BsList.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/purchase/BsList.jsp)  
    - 발주 사원 리스트 [purchase/EmList.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/purchase/EmList.jsp)
    - 발주 팝업 닫기 [purchase/Close.jsp](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/purchase/Close.jsp)

3. Controller  
    - 컨트롤러 [PurchaseController.java](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/controller/PurchaseController.java)

#### 작업지시 페이지-원자재 재고비교 
1. Model  
    - 작업지시-재고비교 DAOImpl [InstructionDAOImpl.java(L209-L214)](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/dao/InstructionDAOImpl.java#L209-L214) 
    - 작업지시-재고비교 ServiceImpl [InstructionServiceImpl.java(L214-L219)](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/service/InstructionServiceImpl.java#L214-L219) 
   
2. View   
    - 작업지시-재고비교(ajex) [inst/InstInsert.jsp(L21-L65)](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/inst/InstInsert.jsp#L21-L65) 
    - 작업지시-재고비교(table) [purchase/Insert.jsp(L269-L283)](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/webapp/WEB-INF/views/inst/InstInsert.jsp#L269-L283)  

3. Controller  
    - 컨트롤러 [InstructionController.java(L444-L487)](https://github.com/MEMOZ00/mes_team4/blob/cafe24/mes_team4/src/main/java/com/itwillbs/controller/InstructionController.java#L444-L487)
