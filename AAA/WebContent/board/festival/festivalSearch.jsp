<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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