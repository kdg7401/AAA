<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div style="background:#B2CCFF;width:350px;" >
	<c:forEach var="dto" items="${chatting}">
		<c:if test="${dto.id eq sessionScope.memId}">
			<div align="right">
				<br><br>
				<c:if test="${dto.chatting_img != null}">
					<img src="${dto.chatting_img}" width="200px" height="200px" onclick="getboard('${dto.chatting_imgnum}', '${dto.chatting_imgcate}')">
				</c:if>
				<br>
				<b style="font-size:10px;">
				<fmt:formatDate value="${dto.reg_date}" type="time" pattern="HH:mm"/>
				</b>
				<span style="background:yellow;border-radius:5px;padding:5px;margin:10px;">	
					${dto.chatting_content}
				</span>
				<br><br>
			</div>
		</c:if>
		<c:if test="${dto.id ne sessionScope.memId}">
			<div align="left">
				<b style="font-size:13px;margin:5px;">${dto.id}</b><br><br>
				<c:if test="${dto.chatting_img != null}">
					<img src="${dto.chatting_img}" width="200px" height="200px" onclick="getboard('${dto.chatting_imgnum}', '${dto.chatting_imgcate}')">
				</c:if>
				<br>
				<span style="background:white;border-radius:5px;padding:5px;margin:10px;">	
					${dto.chatting_content}
				</span><b style="font-size:10px;"></b>
				<b style="font-size:10px;">
				<fmt:formatDate value="${dto.reg_date}" type="time" pattern="HH:mm"/>
				</b>
			</div>
		</c:if>
	</c:forEach>
</div>