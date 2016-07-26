<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<head>
		<style type="text/css"  >
		
			ui {
				
				border: solid 1px gray;
				width : 500px;
				margin : 40px;
			}	
			
			aside{
				width:550px;
				height:300px;
				border:solid;
				float:left;
				margin : 30px;
			}
		</style>
	</head>
	
<body>

<header>
	&nbsp;&nbsp;&nbsp;&nbsp;<h2 style="margin:30px;">${dto.festival_name}</h2>
</header>
<div>
	<aside>
	   <img src="${dto.festival_img}" width="550px" height="300px">
	</aside>
	<div style="width:650px;height:500px;float:left;"> 조회수 : ${dto.festival_clickcount}
	<hr style="border:1px solid gray;" width="100%" align="right">
		<ul>
			<li><b> 행사기간  : </b> &nbsp;&nbsp; 
			<fmt:formatDate value="${dto.festival_startterm}" type="date" pattern="yyyy-MM-dd"/>
			~
			<fmt:formatDate value="${dto.festival_endterm}" type="date" pattern="yyyy-MM-dd"/>
			</li>
			<li><b> 행사위치 : </b> &nbsp;&nbsp;${dto.festival_area} </li>
			<li><b> 연 락 처  : </b> &nbsp;&nbsp;${dto.festival_tel} </li>
			<li><b> 홈페이지 : </b> <a href="${dto.festival_home}" target="_blank">&nbsp;&nbsp;${dto.festival_home}</a></li>
		</ul>
	<hr style="border:1px solid gray;" width="100%" align="right">
	</div>
	<div style="float:right;">
		<h2><b>개요</b> </h2>
		<hr style="border:1px solid gray;" width="100%" align="center">
		<ul>
			<li><b> 주최ㆍ주관 : </b> ${dto.festival_host} </li>
			<li><b> 행사 소개 : </b> ${dto.festival_intro} </li>
			<li><b> 행사 내용 : </b> ${dto.festival_content} </li>
			<li><b> 프로그램 : </b> ${dto.festival_program} </li>
		</ul>
	</div>
	<div style="float:left;height:300px;">
		<h2><b> 이용안내</b> </h2>
		<hr style="border:1px solid gray;" width="188%" align="center">
		<ul>
			<li><b> 관람소요시간 : </b> ${dto.festival_time} </li>
			<li><b> 관람가능연령 : </b> ${dto.festival_age} </li>
			<li><b> 이용요금 : </b> ${dto.festival_pay} </li>
		</ul>
	</div>
</div>	
	<div style="width:850px;float:left;">
		<input class="inputbutton" type="button" value="${btn_print}"
				onclick="window.print();">
		<input class="inputbutton" type="button" value="${btn_list}"
				onclick="location='festival.do?pageNum=${pageNum}'">
 	</div>  
</body>
</html>


