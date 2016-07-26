/**
 *  검색
 */
function getXMLHttpRequest()
{
	if(window.ActiveXObject)
	{
		try
		{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch(e)
		{
			try
			{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch(ex)
			{
				return null;
			}
		}
	}
	else if(window.XMLHttpRequest)
	{
		return new XMLHttpRequest();
	}
	else
	{
		return null;
	}
}
var httpRequest = null;
function sendRequest(callback, url, method, params)
{
	httpRequest = getXMLHttpRequest();
	
	httpRequest.onreadystatechange = callback;
	
	var httpMethod = method ? method : "GET";
	if(httpMethod != "GET" && httpMethod != "POST")
	{
		httpMethod = "GET";
	}
	
	var httpParams = (params==null || params=="") ? null : params;
	
	httpUrl = (httpMethod=="GET") ? (url+"?"+httpParams) : url;
	
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	httpRequest.send(httpMethod=="POST" ? httpParams : null);
	
}