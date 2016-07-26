<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="/AAA/member/style.css" type="text/css" rel="stylesheet">
<%@ include file="setting.jsp"%>
<script src ="http://code.jquery.com/jquery-1.12.2.js"></script>
<script src="${project}script.js"></script>

	<body onload="inputfocus()">
		<h2> ${page_input} </h2>
		<br><span>${page_input_AAA}</span>
		<br><br>
		
		<table class="agree">
			<tr>
				<th>${page_step1}</th>
				<th class="black">${page_step2}</th>
				<th>${page_step3}</th>
			</tr>
		</table>
		<br><br>
		
		<form method="post" action="logonInputPro.do"
		class="inputform" name="inputform" onsubmit="return inputcheck()">
		<input type="hidden" name="confirm" value="0">
		<input type="hidden" name="confirmaddress" value="0">
		<input type="hidden" name="confirmail" value="0">
		<table>
		
			<tr>
				<th> ${str_id} </th>
				<td><input type="text" name="id"  maxlength="15" onkeyup="idChk()">
				<div id="idArea"></div>
				</td>
			</tr>
			<tr>
				<th> ${str_passwd} </th>
				<td><input type="password" name="passwd1"  maxlength="15"></td>
				
			</tr>
			<tr>
				<th>${str_passwd2}</th>
				<td><input type="password" name="passwd2"  maxlength="15"  onkeyup="passwdChk()">
				<div id="passwdArea"></div>	</td>	
			</tr>
			<tr>
				<th> ${str_name} </th>
				<td><input type="text" name="name"></td>
				
			</tr>
			<tr>
				<th> ${str_jumin} </th>
				<td>
					<input class="input" type="text" name="jumin1" maxlength="6"
						style="width: 50px;" onkeyup="nextjumin1()">
					- <input class="input" type="text" name="jumin2" maxlength="7"
						style="width: 60px;" onkeyup="nextjumin2()">
				</td>
			</tr>
			<tr>
				<th rowspan="2"> ${str_address} </th>
				
				<td>
					<input class="input" type="text" name="address1"
						maxlength="3" style="width: 30px" readOnly>	
					- <input class="input" type="text" name="address2"
						maxlength="3" style="width: 35px" readOnly>
					<input class="inputButton_table" type="button" value="검색"
						onclick="search('input')">							
				</td>			
			</tr>
			<tr>
				<td>
					<input class="input" type="text" name="address3"
						maxlength="15" style="width: 200px" readOnly>	
					<input class="input" type="text" name="address4"
						maxlength="30" style="width: 200px">
				</td>
			</tr>
			<tr>
				<th>${str_tel}</th>
				<td><input class="input" type="text" name="tel1"
						maxlength="3" style="width: 30px" onkeyup="nexttel1()">	
					- <input class="input" type="text" name="tel2"
						maxlength="4" style="width: 35px" onkeyup="nexttel2()">
					- <input class="input" type="text" name="tel3"
						maxlength="4" style="width: 35px" onkeyup="nexttel3()">	
				</td>		
			</tr>
			<tr>
				<th rowspan="2"> ${str_email} </th>
				<td>
					<input class="input" type="text" name="email1"
						maxlength="20" style="width: 100px" onkeyup="mailchange()">
					@
					<select name="email2">
						
						<option value="0"> 직접입력 </option>
						<option value="naver.com"> 네이버 </option>
						<option value="gmail.com"> 구글 </option>
						<option value="nate.com"> 네이트 </option>
						<option value="daum.net"> 다음 </option>
						<option value="hanmail.net"> 한메일 </option>
						<option value="yahoo.com"> 야후 </option>
						<option value="hotmail.com"> 핫메일 </option>
						<option value="korea.com"> 코리아 </option>
						<option value="lycos.com"> 라이코스 </option>
						<option value="empal.com"> 엠팔 </option>	
					</select>
						<input class="input" type="text" name="emailtext" readonly>
							<input class="inputButton_table" type="button" name="emailin" value="${btn_emailin}"
						onclick="sendmail()">
				</td>
			</tr>
			<tr>
				<td id="mailcheck" style="font-weight:bold;">
				${msg_mailcheck}
				</td>
			</tr>
				
			</table>
		
		<center>
			<input class="inputsubmit" type="submit" value="${btn_ok}">
			<input class="inputbutton" type="button" value="${btn_cancel}">
		</center>
		</form>
	</body>