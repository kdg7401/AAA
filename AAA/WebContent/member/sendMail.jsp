<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="styleinput.css" type="text/css" rel="stylesheet">
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>


<c:set var="errorcode" value="10000000"/>
<c:if test="${result == errorcode}">
		<body onload="mailstatus('fail')">
	${msg_sendfail}
</c:if>
<c:if test="${result != errorcode}">
		<body onload="mailstatus('ok')">
	<form name="mailform" method="post" action="sendmail.do"> 
	<div align="center">
	${email}님 에게 메일을 전송하였습니다.<br>
	${msg_sendok}<br>
	<input class="input" type="text" name="mailnum" maxlength="6">
	<input class="inputbutton" type="button" value="${btn_ok}" onclick="mailcheck('${result}')">	
	</div>
	</form>
</c:if>


</body>