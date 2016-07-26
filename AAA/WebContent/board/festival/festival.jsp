<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<script src="/AAA/request.js"></script>
<script type="text/javascript">
//<!--
	function go( num ) {
		window.location="festivalContent.do?board_num="+num;
	}
	
	 function boardsearch(){
			var area = document.getElementById("area").value;
			var year = document.getElementById("year").value;
			var month= document.getElementById("month").value;
			var comment = document.getElementById("search").value;
			if(area==0||area==1){
				area = "";
			}
			
				var params = "area="+encodeURI(area)
							+"&year="+year
							+"&month="+month
							+"&comment="+encodeURI(comment);
	        	sendRequest(boardsearchview, "festivalSearch.do", "POST", params);  	
		}
	 
	 	function boardsearchview(){
			if(httpRequest.readyState ==4 ){
				if(httpRequest.status == 200){
					 var boardlist = document.getElementById("boardlist");
					 boardlist.innerHTML = httpRequest.responseText;
				}
		  	}
		}
//-->
</script>

<br>
<div class="whereEventBg">
	<p align="center">
	<select id="area" name="area">
		 <option value="0">지역선택</option>
		 <option value="1">전체</option>
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

	<select id="year" name="year">
		 <option value="">전체</option>
		 <option value="2011">2011년</option>
		 <option value="2012">2012년</option>
		 <option value="2013">2013년</option>
		 <option value="2014">2014년</option>
		 <option value="2015">2015년</option>
		 <option value="2016" selected="selected">2016년</option>
		 <option value="2017">2017년</option>
	</select>
		
	<select id="month" name="month">
		 <option value="">월</option>
		 <option value="01">01월</option>
		 <option value="02">02월</option>
		 <option value="03">03월</option>
		 <option value="04">04월</option>
		 <option value="05">05월</option>
		 <option value="06">06월</option>
		 <option value="07" selected="selected">07월</option>
		 <option value="08">08월</option>
		 <option value="09">09월</option>
		 <option value="10">10월</option>
		 <option value="11">11월</option>
		 <option value="12">12월</option>
	</select>
	
	<input type="text" name="search" id="search">
	<input type="button" name="button" value="조회" onclick="boardsearch()">
	<input type="button" value="조회순">
	</p>
</div>
<br>

<div class="title">
<h2 align="center" style="font-size:40px;"> 이달의 축제ㆍ행사  </h2> 
<i class="date"> 2016 <span> 07 </span></i>
<br><br>
</div>

<div id="boardlist">
	${str_total} : ${count}
<br> 
	<table border="1" bordercolor="lightgray">
		<c:forEach var="dto" items="${list}">
			<tr>
				<td onclick="go('${dto.board_num}')">
				<br>
				&nbsp;${dto.festival_clickcount}
				<h2> &nbsp;${dto.festival_name} </h2> 
				&nbsp; * ${dto.festival_intro} <br><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 진행기간 : 
				<fmt:formatDate value="${dto.festival_startterm}" type="date" pattern="yyyy-MM-dd"/>
				~
				<fmt:formatDate value="${dto.festival_endterm}" type="date" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<br>
<p align="center">
<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock }">	
		<a href="festival.do?pageNum=1">[◀◀]</a>
		<a href="festival.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i == currentPage}">
			<span><b>[${i}]</b></span>
		</c:if>
		<c:if test="${i != currentPage}">
			<a href="festival.do?pageNum=${i}">[${i}]</a>
		</c:if>
	</c:forEach>
	<c:if test="${pageCount > endPage}">
		<a href="festival.do?pageNum=${startPage+pageBlock}">[▶]</a>
		<a href="festival.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>
</c:if>
</p>



