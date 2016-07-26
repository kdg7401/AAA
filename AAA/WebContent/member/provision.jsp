<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/AAA/member/style.css" type="text/css" rel="stylesheet">
<%@ include file="setting.jsp"%>
<script src = "http://code.jquery.com/jquery-1.12.2.js"></script>
<script src="${project}script.js"></script>
</head>


	<body>
		<h2> ${page_input} </h2>
		<span>${page_input_AAA}</span>
		<br><br>
		
		<table class="agree">
			<tr>
				<th class="black">${page_step1}</th>
				<th>${page_step2}</th>
				<th>${page_step3}</th>
			</tr>	
		</table>
		
		<hr>
		<center>${page_all_agree}<input type="checkbox" name="agree" value="0" onclick="allCheck()"></center>
		<hr>
		<h3>${page_clause1}</h3>
		<section>
									<strong>제1조 목적</strong><br />
									이 약관은 AAA(이하 “회사”)가 운영하는 인터넷 사이트를 통해 제공하는 전자상거래 관련 서비스(이사 “서비스)를 이용함에 있어 회사와 이용자의 권리‧의무 및 책임사항을 규정함을 목적으로 한다. <br />
									※ PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용한다. <br />
									<br />
							
		</section>
				${page_agree}<input type="checkbox" name="agree1" value="1"/>
				
		<br><br>
		<h3>${page_clause2}</h3>		
		<section>
									<strong>제1조 (총칙)</strong><br />
									1. 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 알아볼 수 있는 부호, 문자, 음성, 음향 및 영상 등의 정보(해당 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함한다)를 말한다.<br />
									2. AAA(이하 “회사”라 함)는 이용자의 개인정보보호를 매우 중요시하며, 「개인정보보호법」, 「정보통신망 이용 촉진 및 정보보호에 관한 법률」 등 개인정보보호 관련 법률 및 하위 법령들을 준수한다.<br />
						
									<br />
		</section>
				${page_agree}<input type="checkbox" name="agree2" value="2"/>
		
		<form method="post" action="logonInputForm.do" onsubmit="return agreeCheck()">
		<center>
			<input class="inputsubmit" type="submit" name="ok" value="${btn_ok}" >
			<input class="inputbutton" type="button" name="cancel" value="${btn_cancel}">		
		</center>
		</form>
		
	</body>
</html>   
