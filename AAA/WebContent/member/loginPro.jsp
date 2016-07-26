<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="${project}script.js"></script>

<h2> ${page_login} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( loginiderror );
		//-->
	</script>
</c:if>		
<c:if test="${result == -1}">		
	<script type="text/javascript">
		<!--
		erroralert( loginpasswderror );
		//-->
	</script>
</c:if>		
<c:if test="${result == 1}">
	${sessionScope.memId = id}
	<c:redirect url="main.do"/>			
</c:if>	










