<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
              .none 
              {
              list-style-type : none;
              list-style-position : outside;
              }
              div.search
              {
              	float:left;
              	margin-bottom:20px;
              	margin-right:2px;
              }
         </style>

<div class=search>
<select name="searchId" style="width: 100">
	<option selected>아이디</option>
	<option>내용</option>
</select>
<select name="searchArea" style="width: 100">
	<option selected>지역</option>
				<option>서울</option>
				<option>인천</option>
				<option>대전</option>
				<option>대구</option>
				<option>광주</option>
				<option>부산</option>
				<option>울산</option>
				<option>세종특별자치시</option>
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
<select name="searchAge" style="width: 100">
	<option selected>연령</option>
	<option value="10">10대</option>
	<option value="20">20대</option>
	<option value="30">30대</option>
	<option value="40">40대</option>
</select>
<select name="searchPeople" style="width: 100">
	<option selected>인원</option>
	<option value="1"> 1명</option>
	<option value="2" > 2명</option>
	<option value="3" > 3명</option>
	<option value="4" > 4명</option>
	<option value="5" > 5명</option>
	<option value="6" > 6명</option>
</select>
<input type="text" name="serach" value="검색어를 입력하세요.">
<input type="button" value="검색" onclick="window.location='Ajax.do'">
</div>
<table border="1" style="clear:left">
<tr>
	<th colspan="2" align="right">
		<input type="button" name="writeMeeting" value="선택미팅" 
		onclick="window.location='meetingSelectWriteForm.do?meeting_check=1'"> 
	</th>
</tr>
<c:if test="${count!=0}">
	<c:forEach var="mdto" items="${list}">
		<tr>
			<th>
				<img src="${mdto.profile_img}" border="1" height="120" width="100">
				<input type="button" name="writeMeeting" value="미팅 내용 보기" 
				onclick="window.location='meetingContent.do?meeting_num=${mdto.meeting_num}'">
			</th>
			<td>
				<ul class="none">
					<li> ${mdto.meeting_title}</li>
					<li>이름 : ${mdto.name}</li>
					<li>아이디 : ${mdto.id}</li>
					<li>미팅 지역 : ${mdto.meeting_area }</li>
					<li>연령 : ${mdto.meeting_age}대</li>
					<li>인원 : ${mdto.meeting_people}명</li>
					<li>작성일 : <fmt:formatDate value="${mdto.reg_date}" pattern="yyyy-MM-dd HH:mm"/></li>
				</ul>
			</td>
		</tr>
	</c:forEach>
</c:if>
</table>

<c:if test="${count>0 }">
	<c:if test="${startPage > pageBlock }">
			<a href="meetingList.do?pageNum=1">[◀◀]</a>
			<a href="meetingList.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
</c:if>
<c:forEach var="i" begin="${startPage }" end="${endPage }">
<c:if test="${ i== currentPage}" >
	<span><b>[${i }]</b></span>
		</c:if>
		<c:if test="${ i!= currentPage}" >
			<span><a href="meetingList.do?pageNum=${i}">[${i}]</a></span>
	</c:if>
</c:forEach>
<c:if test="${pageCount > endPage }">
		<a href="meetingList.do?pageNum=${startPage+pageBlock}">[▶]</a>
		<a href="meetingList.do?pageNum=${pageCount}">[▶▶]</a>
</c:if>