# MEDI-FAC 의약품 MES 사이트
### 호스팅 사이트 : http://itwillbs21.cafe24.com/mesteam4/home
#### 1. 개발도구 : Eclipse, Github  
#### 2. 개발언어 : Java(OpenJDK version 11.0.2), MySQL(version 8.0.17), JavaScript
#### 3. 라이브러리 : jQuery(version 3.6.4), JSTL(version 1.2)
#### 4. 프레임워크 : Spring(version 4.3.8.RELEASE)
#### 5. 웹 애플리케이션도구 : JSP(MVC model2)
#### 6. 웹 호스팅 : cafe24

***

#### 개발 기간 : 3월 8일 ~ 4월 14일
#### 역할 : 깃허브 관리, PPT
#### 개발 페이지 : 소요량 페이지, 발주 페이지, 원자재 재고비교 

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
    - 중고거래 DAO [MarketDAO.java](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/db/MarketDAO.java)  
    - 중고거래 DTO [MarketDTO.java](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/db/MarketDTO.java)  
    - 중고거래 글상세 [MarketContent.java](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/action/MarketContent.java)   
    - 중고거래 리스트(기본) [MarketList.java](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/action/MarketList.java)  
    - 중고거래 리스트(최신/조회/인기) [MarketSortList.java](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/action/MarketSortList.java)   
    - 중고거래 글수정 [MarketUpdateForm.java](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/action/MarketUpdateForm.java), [MarketUpdatePro.java](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/action/MarketUpdatePro.java)  
    - 중고거래 글작성 [MarketWritePro.java](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/action/MarketWritePro.java) 
    - 중고거래 글삭제 [MarketDeletePro.java](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/action/MarketDeletePro.java)
    - 중고거래 찜하기 [MarketWishPro.java](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/action/MarketWishPro.java)
    
2. View  
    - 중고거래 글상세 페이지 [MarketContent.jsp](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/webapp/market/MarketContent.jsp)   
    - 중고거래 리스트(기본) [MarketList.jsp](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/webapp/market/MarketList.jsp)  
    - 중고거래 리스트(최신/조회/인기) [MarketSortList.jsp](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/webapp/market/MarketSortList.jsp)   
    - 중고거래 글수정 페이지 [MarketUpdateForm.jsp](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/webapp/market/MarketUpdateForm.jsp)
    - 중고거래 글작성 페이지 [MarketWriteForm.jsp](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/webapp/market/MarketWriteForm.jsp)  

3. Controller  
    - 컨트롤러 [MarketFrontController.java](https://github.com/MEMOZ00/Project_team2/blob/cafe24/teamProject/src/main/java/com/itwillbs/market/action/MarketFrontController.java)
