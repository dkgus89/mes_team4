<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<div id="contents">
<h2>작업지시정보</h2>
<div class="wrap2">

	 </div><br><br>
				<div>
					<label>수주코드</label>
					<input type="text" value="${instructionDTO.order_cd}" readonly><br><br>
				</div>
				<div>
					<label>작업지시코드</label>
					<input type="text" value="${instructionDTO.instruction_code}" readonly><br><br>
				</div>
				<div>
					<label>제품코드</label>
					<input type="text" value="${instructionDTO.product_cd_name}" readonly><br><br>
				</div>
				<div>
					<label>지시수량</label>
					<input type="text" value="${instructionDTO.instruction_qt}" readonly><br><br>
				</div>
				<div>
					<label>라인코드</label>
					<input type="text" value="${instructionDTO.line_cd}" readonly><br><br>
				</div>
				<div>
					<label>지시일자</label>
					<input type="text" value="${instructionDTO.instruction_date}" readonly><br><br>
				</div>

<table id="vendortable" class="table table-striped">
			<thead>
				<tr style="text-align: center; font-size: 0.9rem">					
					<th>원재료코드</th>
					<th>원재료이름</th>
					<th>소요량</th>
					<th>단위</th>
				</tr>
			</thead>
				<tbody>
		<c:choose>
			<c:when test="${not empty consListMap}">
			<c:forEach var="dto" items="${consListMap}" varStatus="sts">
			<tr>
			<td>${dto.rproduct_cd_name}</td>
			<td>${dto.rproduct_name}</td>
			<td>${dto.consumption * dto.instruction_qt}</td>
			<td>${dto.consumption_unit}</td>
			</tr>
			</c:forEach>
			</c:when>
         
        <c:otherwise>
            <tr>
            <td colspan="10" style="text-align: center;">등록된 데이터가 없습니다.</td>
            </tr>
        </c:otherwise>	
		</c:choose>
		</tbody>
			
	</table>
</div>
</div>
<jsp:include page="../main/Footer.jsp" />