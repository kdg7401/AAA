<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>