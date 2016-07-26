<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form id="boardlistform">
		<div>
		  	<select name="area" id="area">
			    <option value="0">지역선택</option>
			    <option value="1">전체</option>
			    <option>서울</option>
			    <option>대전</option>
			    <option>대구</option>
			    <option>부산</option>
			    <option>광주</option>
			    <option>부산</option>
			    <option>경기도</option>
				<option>강원도</option>
				<option>충청북도</option>
				<option>충청남도</option>
				<option>경상북도</option>
				<option>경상남도</option>
				<option>전라북도</option>
				<option>전라남도</option>
				<option>제주도</option>
		  	</select>
		  	
		  	<select name="year" id="year">
		  		<option value="0">년도</option>
			    <option value="2011">2011년</option>
			    <option value="2012">2012년</option>
			    <option value="2013">2013년</option>
			    <option value="2014">2014년</option>
			    <option value="2015">2015년</option>
			    <option value="2016">2016년</option>
			    <option value="2017">2017년</option>
		  	</select>
		  	<select name="month" id="month">
				<option value="0">월</option>
			    <option value="01">1월</option>
			    <option value="02">2월</option>
			    <option value="03">3월</option>
			    <option value="04">4월</option>
			    <option value="05">5월</option>
			    <option value="06">6월</option>
			    <option value="07">7월</option>
			    <option value="08">8월</option>
			    <option value="09">9월</option>
			    <option value="10">10월</option>
			    <option value="11">11월</option>
			    <option value="12">12월</option>
		  	</select>
		  	<input type="text" name="search" id="search">
		  	<input type="button" name="search_btn" value="조회" onclick="boardsearch(${category_num})">
		</div>	
	 	<div id="boardlist">
			<c:forEach var="dto" items="${list}">
				<c:if test="${dto.category_num==100}">
					영화
				</c:if>
				<c:if test="${dto.category_num==200}">
					<div style="float:left;width:200px;" onclick="getboard('${dto.board_num}','${dto.category_num}')">			
						<img src="${dto.festival_img}" width="150px" height="150px"><br>
						<b style="font-size:15px">${dto.festival_name}</b>
					</div>
				</c:if>
				<c:if test="${dto.category_num==300}">
					콘서트
				</c:if>
			</c:forEach>
		</div>
	</form>
</body>
</html>