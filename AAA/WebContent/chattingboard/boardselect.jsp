<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	//<!--
	    function sendimg(imgsrc, name, board_num, category_num){
        	var id = document.board.id.value;
        	var applicantnum = 100;
        	var params = "applicant_num=" + applicantnum 
        				+ "&chatting_img="+ imgsrc
        				+ "&chatting_content=" + encodeURI(name)
        				+ "&id="+ encodeURI(id)
        				+ "&board_num="+ board_num
        				+ "&category_num="+ category_num;
        	window.location = "insertChatting.do?"+params;  
        	//self.close();
        }	
	//-->
</script>
</head>
	<body>
		<form name="board">
			<input type="hidden" name="id" value="<%=session.getAttribute("memId")%>">
			<c:if test="${dto.category_num eq 100}">
				
			</c:if>
			<c:if test="${dto.category_num eq 200}">
				<img src="${dto.festival_img}">
				${dto.festival_name}
			</c:if>
			<c:if test="${dto.category_num eq 300}">
			
			</c:if>
			<input type="button" value="가져오기" onclick="sendimg('${dto.festival_img}', '${dto.festival_name}', '${dto.board_num}', '${dto.category_num}')">
		</form>
	</body>
</html>