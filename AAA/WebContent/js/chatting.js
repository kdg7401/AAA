		var map;
		var imap;
		var infowindow = new google.maps.InfoWindow();
		var markers = [];
		var marker;
		var imarkers = [];
		var imarker;
		var newli;
		var markindex;
		var chatvalue = false;
		var datevalue = false;
		var locationnum = 0;
		var inputindex;
		var removeindex;
		var locations = [];
		var startindex = 0;
		var directionsDisplay;
	    var directionsService = new google.maps.DirectionsService();
	    var id;
	    var markercount = 0;
	    var premylat = 37.566535;
	    var premylng = 126.9779692;
	    var preyoulat = 37.566535;
	    var preyoulng = 126.9779692;
	    var datetimer;
	    
        var thisUserId = "팀장이 바꼈어요"; // 아이디입력

        // 텍스트에 박스에 입력한 대화내용을 서버에 전송한다.
       
        function sendTalk() {

            var id = document.chattingform.id.value;
            var chattingcontent = document.chattingform.talk_input;
            var content = chattingcontent.value;
            var applicantnum = 100;
            
			var params = "applicant_num=" + applicantnum  
						+ "&id="+ encodeURI(id)
						+ "&chatting_content=" + encodeURI(content);			
			
			if(chattingcontent.value) {

				chattingcontent.value = ""; //텍스트필드 초기화
				chattingcontent.focus();  //커서를 텍스트필드에 위치한다.
				
				sendRequestChatting(showTalk, "insertChatting.do", "POST", params);  
            }
        }
       /*
        function sendimg(){
        	var id = document.chattingform.id.value;
        	var applicantnum = 100;
        	var img = "/AAA/img/1.png";
        	var params = "applicant_num=" + applicantnum 
        				+ "&chatting_img="+img
        				+ "&chatting_content=test"
        				+ "&id="+ encodeURI(id);
        	sendRequest(showTalk, "insertChatting.do", "POST", params);  
        }*/
        
		function showTalk(){
			var obj = document.getElementById("talk_view");
			if(httpRequestChatting.readyState ==4 ){
				if(com != httpRequestChatting.responseText){
					 com = httpRequestChatting.responseText;
					 obj.innerHTML = httpRequestChatting.responseText;
					 obj.scrollTop = obj.scrollHeight;
				}
			 }
		}
		
		var com = null;
		function startTalk(){
				var obj = document.getElementById("talk_view");
				sendRequestChatting(viewTalk, "getChatting.do");
				id = chattingform.id.value;
				setTimeout("startTalk()", 500);
	     }
		
		function viewTalk(){
			var obj = document.getElementById("talk_view");
			if(httpRequestChatting.readyState ==4 ){
				if(com != httpRequestChatting.responseText){
					 com = httpRequestChatting.responseText;
					 obj.innerHTML = httpRequestChatting.responseText;
					 obj.scrollTop = obj.scrollHeight;
				}
			 }
		}
       

        // 입력된 대화 내용을 대화창에 추가한다.

        function addTalk(content) {

            var obj = document.getElementById("talk_view");

            if(obj) {

                var line = thisUserId + " - " + content + "<br>";  //이름 -내용을 저장

                obj.innerHTML += line;  //내용을 추가한다.

            }          

        }
        
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
	        function date(){
	        	var obj = document.getElementById("date");
	        	var board = document.getElementById("board");
	        	obj.style.display="";
	        	board.style.display="none";
	        	var params = "myid="+id;
	        	sendRequestGoogle(locationNumSave, "locationnum.do", "POST", params);
	        	initialize();
	        	datetimer = setInterval("startDate()", 1000); 
	        	$(document).ready(
		        	$('a#festival').on(
		        		click,
		        		clearInterval(datetimer)
		        	)
	        	);
	        }
        
        
        function locationNumSave(){
        	if(httpRequestGoogle.readyState ==4 ){
				if(httpRequestGoogle.status == 200){
					var doc = eval("("+httpRequestGoogle.responseText+")");
					locationnum=doc.result.locationnum + 1;
					//alert(locationnum);
				}else if(httpRequestGoogle.status == 404){
					locationnum=0;
					//alert(locationnum);
				}
			}else{

			}
        }
        //자동 조회
        
        function startDate(){
        	var params = "num=100";
			sendRequestGoogle(viewDate, "outputdate.do", "POST", params);
    	}
        
		function viewDate(){
			if(httpRequestGoogle.readyState ==4 ){
				if(httpRequestGoogle.status == 200){
					var doc = eval("("+httpRequestGoogle.responseText+")");
					var resultlist = document.getElementById("resultlist");
					//var iresult = document.getElementById("iresult");
					markercount = doc.result.geometry.length;
					if(imarkers.length != markercount){
						 for(var i=0; i<imarkers.length; i++) {
							 imarkers[i].setMap(null);
						 }
						 imarkers = [];	
					}
					
					if(doc.result.geometry.length>0){
						 //alert(doc.result.geometry.length);
						 for(var i=0; i<doc.result.geometry.length; i++){
							 if(imarkers.length != markercount){
								if(doc.result.geometry[i].myid==id){
									map.setCenter(new google.maps.LatLng(doc.result.geometry[i].location.lat, doc.result.geometry[i].location.lng));
									if(i>0){
										premylat = doc.result.geometry[i-1].location.lat;
										premylng = doc.result.geometry[i-1].location.lng;
									}
									addMyImarker(premylat, premylng, doc.result.geometry[i].location.lat, doc.result.geometry[i].location.lng);
								}else{
									addYouImarker(preyoulat, preyoulng, doc.result.geometry[i].location.lat, doc.result.geometry[i].location.lng);
								}
							}
							if(startindex!=1){ 
								if(doc.result.geometry[i].myid==id){
									var sortable = document.getElementById("sortable2");
									newli = makedate('highlight', doc.result.geometry[i].location.lat);
									sortable.appendChild(newli);
								}
							}
						}
					}
					 startindex = 1;
				}
			}
		}
		
		
		//코스 조회
		
		function check(){
			 var city = chattingform.city.value;
			 var params = "address="+encodeURI(city)+"&key=AIzaSyAY6aWSaNHMu1Svoj2UcqPDR3BNbczi1uE";
				 sendRequestGoogle(checkview, "https://maps.googleapis.com/maps/api/geocode/json", "GET", params);
		}
		
		
		function checkview(){
			if(httpRequestGoogle.readyState ==4 ){
				if(httpRequestGoogle.status == 200){
					var doc = eval("("+httpRequestGoogle.responseText+")");
					var sortable = document.getElementById("sortable1");
					newli = makedate('default');
					sortable.appendChild(newli);
					var location = doc.results[0].geometry.location;
					map.setCenter(new google.maps.LatLng(location.lat, location.lng));
				}
			}
		}
		
		
		
		
		// 코스 추가
		function insert(){
			 var city = chattingform.city.value;
			 if(city){
			 var params = "address="+encodeURI(city)+"&key=AIzaSyAY6aWSaNHMu1Svoj2UcqPDR3BNbczi1uE";
			 sendRequestGoogle(insertpro, "https://maps.googleapis.com/maps/api/geocode/json", "GET", params);
			 }
		}
		
		function insertpro(){
			if(httpRequestGoogle.readyState ==4 ){
				if(httpRequestGoogle.status == 200){
					var sortable = document.getElementById("sortable2");
					if(locationnum<5){ 
						 var doc = eval("("+httpRequestGoogle.responseText+")");
						 if(doc.status=="OK"){
							 var location = doc.results[0].geometry.location;
							 var params = "lat="+location.lat+"&lng="+location.lng+"&myid="+id+"&locationnum="+ locationnum++;
							 sendRequest(insertview, "insertdate.do", "POST", params);
						 }else{
							 alert("검색되지않았습니다.");
						 }
					}else{
						alert("최대코스수는 5개입니다.");
					}
				}else{
					alert();
				}
			}
		}
		
		function insertview(){
			if(httpRequestGoogle.readyState ==4 ){
				if(httpRequestGoogle.status == 200){
					//map.setCenter(new google.maps.LatLng(lat, lng));
					var city = chattingform.city.value;
					var sortable = document.getElementById("sortable2");
					newli = makedate('highlight', city);
					sortable.appendChild(newli);
				}
			}
		}
		
		//ui 만들기
		function makedate(tableli, city){
			newli = document.createElement("li");
			newli.setAttribute("class", "ui-state-"+tableli);
			
			//newli.setAttribute("id", "g_"+locationnum);
			//alert(locationnum);
			/*
			if(count == null || count == ""){
				var counts = ++cnt;
			}else{
				var counts = count; 
			}
			
			newdiv.comment = comment;
			*/
			newli.innerHTML = city;
			return newli;
		}
		
		//코스 순서변경		
		function changeupdate(itemtext){
			 var params = "address="+encodeURI(itemtext)+"&key=AIzaSyAY6aWSaNHMu1Svoj2UcqPDR3BNbczi1uE";
			 sendRequestGoogle(changeupdateview, "https://maps.googleapis.com/maps/api/geocode/json", "GET", params);
		} 
		
		function changeupdateview(){
			
			//map.setCenter(new google.maps.LatLng(lat, lng));
			marker = new google.maps.Marker({
			        //position: new google.maps.LatLng(lat, lng),
			        title:'Meine Position',
			        icon:'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'
			    });
			markers.setMap(map);	
		}
		
		
		
		//코스 삭제
		function deletedate(removeindex){
			 var params = "locationnum="+removeindex+"&myid="+id;
			 sendRequestGoogle(deletedateview, "deletedate.do", "POST", params);	
			 
		}
		
		
		function deletedateview(){
			if(httpRequestGoogle.readyState ==4 ){
				if(httpRequestGoogle.status == 200){
					locationnum --;
					directionsDisplay.setMap(null);			
					
				}
			}
		}
		
		

		
		//구글맵 초기값
		
		function initialize(){
			  var latlng = new google.maps.LatLng(37.566535, 126.9779692);
			  var options = {
			   zoom: 16,
			   center:latlng,
			   mapTypeId: google.maps.MapTypeId.ROADMAP
			 };
			  
			  var ioptions = {
					   zoom: 8,
					   center:latlng,
					   mapTypeId: google.maps.MapTypeId.ROADMAP
			 };
			  
			  imap = new google.maps.Map(document.getElementById("iresult"), ioptions);
			  map = new google.maps.Map(document.getElementById("result"), options);
			  directionsDisplay = new google.maps.DirectionsRenderer();
			  map.addListener('click', function(event) {
				    addMarker(event.latLng);
				  });
			  var image ="http://labs.google.com/ridefinder/images/mm_20_green.png";
		}
		
		
		function addMarker(location) {
			  marker = new google.maps.Marker({
			    position: location,
			    map: map
			  });
			  markers.push(marker);
		}
		
		
		function addMyImarker(premylat, premylng, lat, lng){
			 imarker = new google.maps.Marker({
				    position: new google.maps.LatLng(lat, lng),
				    map: imap,
				    icon:'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'
				  });
			 imarker.addListener('click', function (event) {
				  direction(premylat, premylng, lat, lng);
			 });
			imarkers.push(imarker);
		}
		
		
		function addYouImarker(preyoulat, preyoulng, lat, lng){
			 imarker = new google.maps.Marker({
				    position: new google.maps.LatLng(lat, lng),
				    map: imap,
				    icon:'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
				  });
			 imarker.addListener('click', function (event) {
				  direction(preyoulat, preyoulng, lat, lng);
			 });
			imarkers.push(imarker);
		}
		
		
		function direction(prelat, prelng, lat, lng){
			  //alert("lat : " + prelat + " lng : " + prelng);
			  var location1 = {lat: lat, lng: lng}; 
			  var location2 = {lat: prelat, lng: prelng};
			  var request = {
		          origin:location1,
		          destination:location2,
		         // waypoints:[{location: first, stopover: false}],
		         // optimizeWaypoints:true,
		          travelMode:google.maps.DirectionsTravelMode.TRANSIT
		      };
			  
		      directionsService.route(request, function(response, status) {
		        if (status == google.maps.DirectionsStatus.OK) {
		            directionsDisplay.setDirections(response);
		        }else{
		        	alert("검색할수 없습니다.");  	
		        }
		      });
			  directionsDisplay.setMap(imap);
		}
		
		
		

		
		//정렬 jquery
		/*$(function() {

		    $( "#sortable" ).sortable();
		    
		    $( "#sortable" ).sortable({
				
		    	update: function( event, ui ) {
		    		  markindex = ui.item.index();
		    		  var itemtext = ui.item.text();
		    		  changeupdate(itemtext);
		    		  
		    	  },
		    	  
		    	  
		    	});



		    $( "#sortable" ).disableSelection();

		  });*/
		
		  $(function() {

			    $( "#sortable1, #sortable2" ).sortable({

			      connectWith: ".connectedSortable",

			    }).disableSelection();
			    
			    $( "#sortable2" ).sortable({

			    	  start: function( event, ui ) {
			    		  removeindex = ui.item.index();  
			    	  },
			    	
			    	  receive: function( event, ui ) {
			    		 inputindex = ui.item.index();
			    		 update(inputindex);
			    	  },
			    	  
			    	  remove: function( event, ui ) {
			    		  deletedate(removeindex);
			    	  },
			    	  
			    	  update: function( event, ui ) {
			    		  //markindex = ui.item.index();
			    		  //var itemtext = ui.item.text();
			    		  //changeupdate(itemtext);
			    	  }
			    	  
			    	  	  
			    });

			  });
		  
		  
		  
		  
		  
		  function festival(){
	        	var board = document.getElementById("board");
	        	var date = document.getElementById("date");
	        	board.style.display="";
	        	date.style.display="none";
	        	sendRequest(festivalView, "festivallist.do");  
		  }
		  
		  function festivalView(){
			  if(httpRequest.readyState ==4 ){
					if(httpRequest.status == 200){
						 var board = document.getElementById("board");
						 board.innerHTML = httpRequest.responseText;
					}
			  }
		  }
		  
		  function getboard(board_num, category_num){
	    		var url="getboard.do?board_num="+board_num+"&category_num=" + category_num;
	    		open(url,"confirm","menubar=no, scrollvar=no, statusvar=no, width=1500, height=700");
		  }
		  //보드별 검색
		  function boardsearch(category_num){
				if(category_num == 100){
					//영화
				}else if(category_num == 200){
					var area = document.getElementById("area").value;
					var year = document.getElementById("year").value;
					var month= document.getElementById("month").value;
					var comment = document.getElementById("search").value;
					if(area==0||area==1){
						area = "";
					}
					
		        	//축제
						var params = "area="+encodeURI(area)
									+"&year="+year
									+"&month="+month
									+"&comment="+encodeURI(comment);
			        	sendRequest(boardsearchview, "festivalsearch.do", "POST", params);  
					
				}else if(category_num == 300){
					//콘서트
				}
			}
		
			function boardsearchview(){
				if(httpRequest.readyState ==4 ){
					if(httpRequest.status == 200){
						 var boardlist = document.getElementById("boardlist");
						 boardlist.innerHTML = httpRequest.responseText;
					}
			  	}
			}
		  
		  



