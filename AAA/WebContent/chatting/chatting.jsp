<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

  <script src="//code.jquery.com/jquery-1.10.2.js"></script>

  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>



<style>

        .container { 
        	width: 400px; 
        	padding: 10px; 
        	border: 2px solid #3e3e41;
        	background:#B2CCFF;
        	}

        .talk_view { 
        	position: relative; 
        	width: 400px; 
        	height: 400px; 
        	padding: 5px; 
        	
        	overflow-y:scroll;
        	}

        .talk_input { 
        	position: relative; 
        	margin-top: 20px; 
        	width: 350px; 
        	padding: 5px; 
        	 
        }
        

		 #result { 
		 	height : 100% 
		 }
		
 		 #sortable1, #sortable2 {
		
		    border: 1px solid #eee;
		
		    width: 170px;
		    
		    height : 250px;
		
		    min-height: 20px;
		
		    list-style-type: none;
		
		    margin: 0;
		
		    padding: 5px 0 0 0;
		
		    float: left;
		
		    margin-right: 10px;
		
		  }
		
		  #sortable1 li, #sortable2 li {
		
		    margin: 0 5px 5px 5px;
		
		    padding: 5px;
		
		    font-size: 1.2em;
		
		    width: 150px;
		
		  }
		 	
</style>


<script src="/AAA/request.js"></script>
<script type = "text/javascript" src = "http://maps.googleapis.com/maps/api/js?sensor=true"></script>
<script src="/AAA/js/chatting.js"></script>

</head>

 <body onload="startTalk()">
		 <form name="chattingform">
		 		<input type="hidden" name="id" value="<%=session.getAttribute("memId")%>">
				<div style="float:left;width:500px;">
			        <div class="container">
			
			            <div id="talk_view" class="talk_view"></div>   
			
			            <input type="text" name="talk_input" id="talk_input" class="talk_input">
			            <input type="button" name="talk_send" id="talk_send" value="전송" OnClick="sendTalk()">
			
			        </div>
			        
			        <div>
			        	<a id="festival" href="javascript:festival()">축제</a><br>
						<a id="datebutton" href="javascript:date()">데이트코스 만들기</a><br>
			        </div>
				</div>        
		  
		        <div id="date" style="display:none;float:left;">
		        	<div style="width:400px; height:600px;float:left;">
			        	<div>
				        	<input type="text" name="city">			        	
				        	<input type="button" value="위치" onclick="check()">
				        	<input type="button" value="추가" onclick="insert()">  
						</div><br>
						
						<div id="resultlist" style="width:500px;height:300px;border:1px;">	
							
							<ul id="sortable1" class="connectedSortable">
							
							</ul>
	
	 						<ul id="sortable2" class="connectedSortable">
							
	
							</ul>
	
	
						</div>
						<div id="result" style="width:350px; height:300px;float:left;">	
							
						</div>
					</div>
					<div id="iresult" style="width:500px; height:600px;float:left;color:black;">	
						공유 맵 자리
					</div>
		        </div>

		        <div id="board" style="display:none;float:left;width:800px;height:600px;">
		        	
		        </div>
		</form>
    </body>
</html>
