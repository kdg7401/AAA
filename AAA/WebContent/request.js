/**
 * 		Module
 */

var httpRequest = null;
var httpRequestGoogle = null;
var httpRequestChatting = null;

function getXmlHttpRequest(){
	if(window.ActiveXObject){
		//ie경우
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				return new ActiveXObject("Micrisoft.XMLHTTP");
			}catch(ee){
				return null;
			}
		}
	}else{
		//ie아닐경우
		try{
			return new XMLHttpRequest();
		}catch(e){
			return null;
		}
	}
}

function sendRequest(callback, url, method, params ){
	httpRequest = getXmlHttpRequest();
	
	//callback
	httpRequest.onreadystatechange = callback;
	
	//method
	var httpMethod = method ? method : "GET";
	
	if(httpMethod !="GET" && httpMethod !="POST"){
		httpMethod = "GET";
	}
	
	//params
	var httpParams = (params == null || params == "") ? null : params;
	
	//url
	var httpUrl = (httpMethod == "GET") ? (url + "?" + httpParams) : url;
	
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader(
			"content-type", "application/x-www-form-urlencoded");
	httpRequest.send(httpMethod=="POST" ? httpParams : null);
	
}

function sendRequestGoogle(callback, url, method, params ){
	httpRequestGoogle = getXmlHttpRequest();
	
	//callback
	httpRequestGoogle.onreadystatechange = callback;
	
	//method
	var httpMethod = method ? method : "GET";
	
	if(httpMethod !="GET" && httpMethod !="POST"){
		httpMethod = "GET";
	}
	
	//params
	var httpParams = (params == null || params == "") ? null : params;
	
	//url
	var httpUrl = (httpMethod == "GET") ? (url + "?" + httpParams) : url;
	
	httpRequestGoogle.open(httpMethod, httpUrl, true);
	httpRequestGoogle.setRequestHeader(
			"content-type", "application/x-www-form-urlencoded");
	httpRequestGoogle.send(httpMethod=="POST" ? httpParams : null);
	
}


function sendRequestChatting(callback, url, method, params ){
	httpRequestChatting = getXmlHttpRequest();
	
	//callback
	httpRequestChatting.onreadystatechange = callback;
	
	//method
	var httpMethod = method ? method : "GET";
	
	if(httpMethod !="GET" && httpMethod !="POST"){
		httpMethod = "GET";
	}
	
	//params
	var httpParams = (params == null || params == "") ? null : params;
	
	//url
	var httpUrl = (httpMethod == "GET") ? (url + "?" + httpParams) : url;
	
	httpRequestChatting.open(httpMethod, httpUrl, true);
	httpRequestChatting.setRequestHeader(
			"content-type", "application/x-www-form-urlencoded");
	httpRequestChatting.send(httpMethod=="POST" ? httpParams : null);
	
}


