/**
 * 		회원관리
 */

var msg_checkerror = "모든 약관에 동의해주세요";
var msg_iderror = "아이디를 입력하세요";
var msg_passwderror = "비밀번호를 입력하세요";
var msg_repasswderror = "비밀번호가 다릅니다.\n다시 확인하세요"; 
var msg_nameerror = "이름을 입력하세요";
var msg_juminerror = "주민등록번호를 입력하세요";
var msg_juminlength = "주민등록번호의 길이가 유효하지 않습니다";
var msg_telerror = "전화번호의 길이가 유효하지 않습니다";
var msg_emailerror = "이메일이 유효하지 않습니다";
var msg_emailinerror1 = "이메일 인증을 하지 않았습니다.";
var msg_confirmerror = "아이디 중복 확인을 해주세요";
var msg_zipcheck="동을 입력하세요.";
var msg_ziperror = "주소를 입력하세요.";
var msg_emailinerror ="인증번호를 입력해주세요";
var msg_mail_o = "메일인증에 성공했습니다.";
var msg_mail_x = "메일인증에 실패했습니다. \n 다시 확인하세요.";
var	msg_mailcheck_s = "전송중";
var msg_mailcheck_x = "전송실패";
var msg_mailcheck_o = "전송완료";
var msg_mailcheck_i = "인증완료";
var msg_mailcheck_ix = "인증실패";
var msg_mailchange = "메일 수정됨. 다시인증받으세요";

var inputerror = "회원가입에 실패했습니다\n잠시 후 다시 시도하세요";

//아이디 중복체크 확인용
var idCheckError=0;


//실시간 처리
var httpRequest = null;
function getXMLHttpRequest() {
	if(window.ActiveXObject) {
		// IE의 경우
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch(ee) {
				return null;
			}
		}
		
	} else {
			// IE가 아닌 경우
			try{
				return new XMLHttpRequest();
			} catch(e){
				return null;	
			}
	}
}

function sendRequest(callback, url, method, params ) {
	httpRequest = getXMLHttpRequest();
	
	// callback
	httpRequest.onreadystatechange = callback;
	
	// method
	var httpMethod = method ? method : "GET";
		//값이 있으면 그것 (주로  POST) 아니면 GET방식으로 넣어라
	if( httpMethod != "POST" && httpMethod != "GET"){
		httpMethod = "GET";
		//POST도 GET도 아니면  GET으로 넣어라(방어코드)
	}
		
	// params
	var httpParams = (params == null || params =="" )? null :(params);
		//null이면 null로 아니면 params로 입력되는값을 그대로 넣어라(방어코드)
	
	// url
	var httpUrl = (httpMethod == "GET" ? url+"?"+httpParams : url)
		//"GET"방식이면 url+가공된 httpParams를 넣고, POST방식이면 url그대로 넣음
		//url 주소기때문
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader(
			"content-type", "application/x-www-form-urlencoded");
	
	httpRequest.send( httpMethod == "POST" ? httpParams : null);
	
}

// 에러창
function erroralert( msg ) {
	alert( msg );
	// history.go(-1);	
	history.back();
}
//모두동의
function allCheck() {	
	if($('input[name=agree]').prop('checked')){		
		$('input[name=agree1]').prop('checked','true');
		$('input[name=agree2]').prop('checked','true');
	}else{
		if($('input[name=agree1]').prop('checked')){
		$('input[name=agree1]').trigger('click');
		}
		if($('input[name=agree2]').prop('checked')){
		$('input[name=agree2]').trigger('click');
		}
	}			
}
//동의확인
function agreeCheck() {
	var result = 0;
	if(($('input[name=agree1]').prop('checked'))&&
	($('input[name=agree2]').prop('checked'))){
		var url = "logonInputForm2.do";
		redirect( url, "confirm");	
	}
	erroralert( msg_checkerror );
	return false;
}

//아이디 중복검사
function idChk() {
	var id = inputform.id.value;
	sendRequest(idCheck, "confirmId.do","POST","id="+id);
}
function idCheck() {
	var resultDiv = document.getElementById('idArea');
	
	if(httpRequest.readyState == 4) {
		if(httpRequest.status==200) {
			if(inputform.id.value){
				resultDiv.innerHTML = httpRequest.responseText;
				idCheckError=1;
				//idCheckError가 1이어야 중복확인이 완료된것
			}else{
				resultDiv.innerHTML ="아이디를 입력해주세요";
				idCheckError=0;
			}
		}
	}
}
//비밀번호확인
function passwdChk() {
	var resultDiv = document.getElementById('passwdArea');
	var passwdCheckError=0;

		if(inputform.passwd1.value==inputform.passwd2.value){
			resultDiv.innerHTML ="비밀번호가 일치합니다.";
			passwdCheckError=1;
		}else{
			resultDiv.innerHTML ="입력된 비밀번호가 다릅니다.";
			passwdCheckError=0;
		}	
}


//인증메일보내기
function sendmail(){
	var email = inputform.email1.value;
	if(inputform.email2.options[inputform.email2.selectedIndex].value=="0"){
		if(email.match('@')==null){
			alert(msg_emailerror);
			inputform.email1.focus();
		}else if(email.match(/@/g).length>1){
			alert(msg_emailerror);
			inputform.email1.focus();
		}else if(inputform.email1.value.indexOf('.')==-1){
			alert(msg_emailerror);
			inputform.email1.focus();
		}else{
			document.getElementById("mailcheck").innerHTML = msg_mailcheck_s;
			document.getElementById("mailcheck").style.color="green";
			var url="sendMail.do?email="+email;
			open(url,"sendmail","menubar=no, scrollvar=no, statusvar=no, width=600, height=100");
		}
	}else{	
		if(email.match('@')!=null){
			alert(msg_emailerror);
			inputform.email1.focus();
		}else{
			document.getElementById("mailcheck").innerHTML = msg_mailcheck_s;
			document.getElementById("mailcheck").style.color="green";
			email = inputform.email1.value+"@"+inputform.email2.options[inputform.email2.selectedIndex].value;
			var url="sendMail.do?email="+email;
			open(url,"sendmail","menubar=no, scrollvar=no, statusvar=no, width=600, height=100");
		}
	}

}

//인증번호 확인
function mailcheck(result){
	if(mailform.mailnum.value==result){
		//인증성공
		alert(msg_mail_o);
		opener.document.getElementById("mailcheck").innerHTML = msg_mailcheck_i;
		opener.document.getElementById("mailcheck").style.color = "blue";
		opener.document.inputform.confirmail.value="1";
		self.close();
	}else{
		//인증실패
		alert(msg_mail_x);
		opener.document.getElementById("mailcheck").innerHTML = msg_mailcheck_ix;
		opener.document.getElementById("mailcheck").style.color = "red";
	}
}

//인증 후 메일변경 시 인증확인 초기화
function mailchange(){
	if(document.inputform.confirmail.value=="1"){
		document.getElementById("mailcheck").innerHTML = msg_mailchange;
	}
	document.inputform.confirmail.value="0";
}



//인증 시 전송실패, 전송완료 
function mailstatus(status){
	if(status=="fail"){
		opener.document.getElementById("mailcheck").innerHTML = msg_mailcheck_x;
		opener.document.getElementById("mailcheck").style.color="red";
	}else if(status=="ok"){
		opener.document.getElementById("mailcheck").innerHTML = msg_mailcheck_o;
		opener.document.getElementById("mailcheck").style.color="blue";
	}
}

// 회원가입
function inputfocus() {
	inputform.id.focus();
}
function inputcheck() {
	
	if( idCheckError == "0" ) {
		alert( msg_confirmerror );
		inputform.id.focus();
		return false;
	}else if( ! inputform.passwd1.value ) {
		alert( msg_passwderror );
		inputform.passwd1.focus();
		return false;
	} else if( inputform.passwd1.value 
			!= inputform.passwd2.value ) {
		alert( msg_repasswderror );
		inputform.passwd2.focus();
		return false;
	} else if( ! inputform.name.value ) {
		alert( msg_nameerror );
		inputform.name.focus();
		return false;		
	} else if( ! inputform.jumin1.value 
			|| ! inputform.jumin2.value ) {
		alert( msg_juminerror );
		inputform.jumin1.focus();
		return false;
	} else if( inputform.jumin1.value.length < 6 
			|| inputform.jumin2.value.length < 7 ) {
		alert( msg_juminlength );
		inputform.jumin1.focus();
		return false;	
	}
	if(inputform.email1.value){
		var email = inputform.email1.value;
		if(inputform.email2.options[inputform.email2.selectedIndex].value=="0"){
			if(email.match('@')==null){
				alert(msg_emailerror);
				inputform.email1.focus();
				return false;
			}else if(email.match(/@/g).length>1){
				alert(msg_emailerror);
				inputform.email1.focus();
				return false;
			}
		}else{
			if(email.match('@')!=null){
				alert(msg_emailerror);
				inputform.email1.focus();
				return false;
			}
		}
	}
	if(document.inputform.confirmail.value!="1"){
		alert(msg_emailinerror1);
		inputform.email1.focus();
		return false;
	}
	if( inputform.tel1.value
		|| inputform.tel2.value 
		|| inputform.tel3.value ) {
		if( inputform.tel1.value.length < 3 
				|| inputform.tel2.value.length < 4
				|| inputform.tel3.value.length < 4 ) {
			alert( msg_telerror );
			inputform.tel1.focus();
			return false;
		} 			
	} 
}

function nextjumin1() {
	if( inputform.jumin1.value.length == 6 ) {
		inputform.jumin2.focus();
	}		
}
function nextjumin2() {
	if( inputform.jumin2.value.length == 7 ) {
		inputform.tel1.focus();
	}		
}
function nexttel1() {
	if( inputform.tel1.value.length == 3 ) {
		inputform.tel2.focus();
	}		
}
function nexttel2() {
	if( inputform.tel2.value.length == 4 ) {
		inputform.tel3.focus();
	}		
}
function nexttel3() {
	if( inputform.tel3.value.length == 4 ) {
		inputform.email1.focus();
	}		
}










