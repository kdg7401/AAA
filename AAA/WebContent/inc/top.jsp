<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--  익스방해 막기 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>무제 문서</title>
</head>
<script src="request.js"></script>

<!-- 스타일 적용 -->
		<style type="text/css">
        @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
        
        body{margin:0 auto; padding:0;}
        
        img{border:0;}
        table{border-collapse:collapse; border-spacing:0;}
        ul{list-style:none;}
        #header{width:980px; margin:0 auto;}
        span.mn{margin-left:6px; padding-top:3px;}
        
        
        #top_mn{margin-top:40px; width:100%; height:100px; background-color:white; height:40px; text-align:center;}	
        
        ul#topnav {
            margin: 0 auto; padding: 0;
            width: 810px;
            list-style: none;
            position: relative;
            font-size: 1.2em;
            margin-bottom:40px;
        }
        ul#topnav li {
            float: left;
            margin: 0; padding: 0;
			height:50px;
            margin-left:30px;
			font-weight:900;
		 	font-family: 'Nanum Gothic';
		 	
            }
        ul#topnav li a {
            padding:11px 10px;
            display: block;
            color: gray;
            text-decoration: none;
        }
        ul#topnav li:hover {background:none !important;}
        ul#topnav li span {
        	background-color:black;
            float: left;
            padding: 15px 0;
            position: absolute;
            left: 0; top:35px;
            display: none;
            width: 600px;
            color: #666;
            text-align:center;
            -moz-border-radius-bottomright: 5px;
            -khtml-border-radius-bottomright: 5px;
            -webkit-border-bottom-right-radius: 5px;
            -moz-border-radius-bottomleft: 5px;
            -khtml-border-radius-bottomleft: 5px;
            -webkit-border-bottom-left-radius: 5px;
            font-family: 'Nanum Gothic';font-size:13px;font-weight:600;
        }
       ul#topnav li span a{color:white;}
	    
        ul#topnav li span.mn1 {
            
            width: 930px;
        }
        
        ul#topnav li span.mn2 {
            width: 930px;
        }
        
        ul#topnav li span.mn3 {
            width: 930px;
        }
        
        ul#topnav li span.mn4 {
            width: 930px;
        
        }
        ul#topnav li span.mn5 {
        	width: 930px;
        
        }
        ul#topnav li span.mn6 {
             text-align:right;
			 width:930px;
        
        
        }
        
        
        ul#topnav li:hover span { display: block; }
        ul#topnav li span a { display: inline; }
        ul#topnav li span a:hover {text-decoration: underline;}
        
        font.bar{font-weight:200; color:#ccc;}
        </style>
        
<script type="text/javascript">	

        $(document).ready(function() {
            
        $("ul#topnav li").hover(function() { //Hover over event on list item
            $(this).css({ 'background' : '#1376c9 url(topnav_active.gif) repeat-x'}); //Add background color + image on hovered list item
            $(this).find("span").show(); //Show the subnav
        } , function() { //on hover out...
            $(this).css({ 'background' : 'none'}); //Ditch the background
            $(this).find("span").hide(); //Hide the subnav
        });
            
        });
        
        function chatting(){
    		var url="/chating.do";
    		open(url,"confirm","menubar=no, scrollvar=no, statusvar=no, width=1500, height=700");
        }
        
        </script>

<!-- /스타일 적용 -->
<body>
   <div id="top_mn">
   
       <ul id="topnav">
       
        <li><a href="meetingList.do">미팅</a>
	        <span class="mn1">
                <a href="javascript:chatting()">채팅하기</a> <font class="bar">|</font>
                 <a href="http://www.naver.com">랜덤 매칭</a> <font class="bar">|</font>
            </span>    
        </li>
        <li>
            <a href="/shop/shopbrand.html?xcode=048&type=X">영화</a>
            <span class="mn2"> 
                 <a href="http://www.naver.com">소메뉴1</a> <font class="bar">|</font>
                 <a href="http://www.naver.com">소메뉴1</a> <font class="bar"></font>
            </span>
        </li>
        <li>
            <a href="festivalList.do">행사/축제</a>        
            <span class="mn3">
                 <a href="http://www.naver.com">소메뉴1</a> <font class="bar">|</font>
                 <a href="http://www.naver.com">소메뉴1</a> <font class="bar">|</font>
                <a href="http://www.naver.com">소메뉴1</a> <font class="bar">|</font>
                <a href="http://www.naver.com">소메뉴1</a> <font class="bar">|</font>
                 <a href="http://www.naver.com">소메뉴1</a> <font class="bar"></font>
            </span>
        </li>
        <li>
            <a href="">콘서트</a>
            <span class="mn4">
                <a href="http://www.naver.com">소메뉴1</a> <font class="bar">|</font>
                 <a href="http://www.naver.com">소메뉴1</a> <font class="bar"></font>
            </span>
        </li>
        
        <li><a href="/shop/shopbrand.html?xcode=053&type=X">마이페이지</a>
             <span class="mn5">
                 <a href="http://www.naver.com">소메뉴1</a> <font class="bar">|</font>
                 <a href="http://www.naver.com">소메뉴1</a> <font class="bar">|</font>
                 <a href="http://www.naver.com">소메뉴1</a> <font class="bar"></font>
            </span>

        </li>
        
        <li>
        	<a href="loginform.do">로그인</a>
        </li>
        
          <li>
            <a href="provision.do">회원가입</a>
        </li>
    </ul> 
    <br><br>
    <hr style="height:40px; background-color: black;">    
</div>
        
<!-- -->


    
</body>
</html>