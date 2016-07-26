<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="display:block;">	
	<jsp:include page="/inc/top.jsp" flush="false"/>
</div>
<br>
<br>

<div style="display:block;" id="center">
	<jsp:include page="${center}" flush="false"/> 
</div>

<div style="display:block;">
	<jsp:include page="/inc/footer.jsp" flush="false"/>
</div>

