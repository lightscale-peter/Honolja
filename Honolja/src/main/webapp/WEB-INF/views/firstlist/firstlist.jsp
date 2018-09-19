<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="application/json; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title>[firstlist.jsp]</title>
	
	<link href="css/slidebtn.css" type="text/css" rel="stylesheet">
 	<link href="css/filter.css" type="text/css" rel="stylesheet">
 	<link href="css/header.css" type="text/css" rel="stylesheet">
 	
 	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- 달력 사용하기  -->
	<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    
    <!-- naver MAP API 받아오기 -->
 	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=U7Zqn2z2m6oFf4fS07JV&submodules=geocoder"></script>
 	
 	<script>
	 	var x= new Array();
		var y= new Array();
		var name= new Array();
		var url= new Array();
		var area;
		
		function sendValue(){
			
			var url = "guestlist.do";
			var name = "marong";
			var value = "dddd"

			var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "get");
				form.setAttribute("action", url);

			var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", name);
				hiddenField.setAttribute("value", value);
				
			form.appendChild(hiddenField);
			document.body.appendChild(form);
	
			form.submit();
		}
		
		
		
	</script>
	
	
</head>

<body id="page-top" style="margin-top:51px;" >
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="main.do"></c:param>
		
		<c:param name="area" value="${param.area}"></c:param>
		<c:param name="adult" value="${param.adult}"></c:param>
		<c:param name="child" value="${param.child}"></c:param>
		<c:param name="check_in" value="${param.check_in}"></c:param>
		<c:param name="check_out" value="${param.check_out}"></c:param>
		<c:param name="nights" value="${param.nights}"></c:param>
	</c:import>
			<!-- 달력 시작 -->  
<form>
	<div style="position:fixed; background-color:#D5D5D5;width:100%;height:50px;margin-bottom:0;margin-top:0; border:0;">
		<div style="margin-top:10px;">
	    	<div style="position:fixed;margin-left:1%;" >
	    		<input type="text" aria-label="YYYY-MM-DD" name="startDate"  id="startDate" width="150px" placeholder="YYYY-MM-DD" value="${param.check_in}" 
	    		autoComplete="off" aria-describedby="DateInput_screen-reader-message-startDate" style="color:black;" onchange="sendValue();" /> 
	    	</div>
	   
	   		<div class="DateRangePickerInput__arrow" aria-hidden="true" role="presentation"><span></span></div> 
	   
	    	<div style="position:fixed; margin-left:12%; margin-bottom:80%;">
	    		<input type="text" aria-label="YYYY-MM-DD" name="endDate" onchange="nullCheck()" id="endDate" width="150px" placeholder="YYYY-MM-DD" value="${param.check_out}"
	    	 	aria-describedby="DateInput_screen-reader-message-endDate" style="color:black;" />
	    	</div>
	    
	    	<div style="position:fixed; margin-left:22%; margin-bottom:80%;">
	    		<img src="https://yaimg.yanolja.com/joy/pw/place/bullet-datepicker-check.svg" alt>
	    		<span>${param.nights}박 ${param.nights+1}일</span>
			</div>
	    </div>
	</div>
</form>
	<script type="text/javascript">
		 $('#startDate').datepicker({ 
			showOn:"both",
			buttonImageOnly:true,
			buttonText:"Select date",
			format: 'yyyy-mm-dd',
			onSelect : function(dateStr){
				var min = $(this).datepicker('getDate');
				$('#endDate').datepicker('option','minDate', min || '0');
				datrpicked();
			}
			
		}); 
		$('#endDate').datepicker({ 
			showOn:"both",
			buttonImageOnly:true,
			buttonText:"Select date",
			format: 'yyyy-mm-dd',
			onSelect : function(dateStr){
				var min = $(this).datepicker('getDate');
				$('#startDate').datepicker('option','minDate', min || '0');
				datrpicked();
			}
		});  
    </script>
	<br>
	<div style="padding-top:40px; ">
   	<!-- 지도 우측배치로 고정 -->
		<div style= "right:0; position:fixed;width:40%;height:100%;">	
			<div id="map" style="width:100%;height:100%;margin-top:10px;"></div>
			</div>
		<!-- 지도 끝-->
		
        <!-- 필터 담을것. 기본순/테마/가격대선택/예약가능/.......필터초기화-->
	<div style="left:0; width:60%; padding-left: 30px; padding-right:30px;padding-left:30px;">
    	<div style="padding-top: 13px;padding-bottom: 12px;"><p>
     		<button type="button" class="filter__item" name="popoverButton" style="margin-right:27px;"id="firstfilter">
     			<span class="filter__option"id = "basics">기본순</span>
     			<i class="filter-icon filter-icon__arrow_bottom"></i>
     		</button> 
     		<button type="button" class="filter__item" name="popoverButton"style="margin-right:27px;" id="secondfilter">
     			<span class="filter__option">가격대선택</span>
     			<i class="filter-icon filter-icon__arrow_bottom"></i>
     		</button> 
     		
     		<button type="button" class="filter__refresh-btn f-right" style="margin-left: 50%;padding-top: 0;"id="refresh">
     			<i class="filter-icon filter-icon__refresh"></i>
     			<em>필터 초기화</em>
     		</button>
     	</div>
     		<script>
     		$(document).ready(function(){
     			jQuery('#refresh').click(function(){
     				location.href="guestlist.do?area=my";
     			});
     		});
     		</script>
     	
     	<div data-popover-content="true" id="firstfilt" 
     	style="box-sizing: border-box;
     	width:150px;
     	height:90px;
     	position:absolute;
    	box-shadow: 0 3px 7px rgba(0,0,0,.2);
    	border-top: 2px solid #ff2d60;
    	background-color: #fff;
    	padding: 20px;
    	display: table;
    	clear: both;">
    	
 	    	<div>
 	      		<div>
 	      			<div>
 	      				<input type="radio" id="basic" name="sortFilter" value="basic">
 	      				<label for="basic">기본순</label>
 	      			</div>
 	      			<div>
 	      				<input type="radio" id="like" name="sortFilter" value="like">
 	      				<label for="like">인기순</label>
 	      			</div>
 	      			
 	      			<div>
 	      				<input type="radio" id="reply" name="sortFilter" value="reply">
 	      				<label for="reply">댓글 많은 순</label>
 	      			</div>
 	      		</div>
 	      	</div>
		</div>
		<script type="text/javascript">
		//기본순
		$(document).ready(function(){
	    	$("#basic").change(function(){
	        	if($("#basic").is(":checked")){
	        		location.href="guestlist.do?g_addr=${param.g_addr}&basic=true";
	        		$('#basics').html('기본순');
	    	    }
		    });
		});
		
		//인기순(좋아요 많은 순)
		$(document).ready(function(){
	    	$("#like").change(function(){
	        	if($("#like").is(":checked")){
	        		location.href="guestlist.do?g_addr=${param.g_addr}&islike=true";
	        		$('#basics').html('인기순');
	    	    }
		    });
		});
		
		//댓글 많은 순
		$(document).ready(function(){
	    	$("#reply").change(function(){
	        	if($("#reply").is(":checked")){
	        		$('#basics').html('댓글 많은 순');
	        		location.href="guestlist.do?g_addr=${param.g_addr}&reply=true";
	    	    }
		    });
		});
		</script>
		<!-- 가격대 선택 -->
		<form action="guestlist.do" method="get">
		<div data-popover-content="true" id="secondfilt" 
     	style="box-sizing: border-box;
     	width:180px;
     	height:90px;
     	position:absolute;
    	box-shadow: 0 3px 7px rgba(0,0,0,.2);
    	border-top: 2px solid #ff2d60;
    	background-color: #fff;
    	padding: 20px;
    	display: table;
    	clear: both;
    	margin-left: 5%;">
 	    	<div id="checkbox">
 	      		<div>
 	      			<div>
 	      				<input type="checkbox" id="zero" name="sortFilter" value="a">
 	      				<!-- <a href="guestlist.do?r_price=a"> -->
 	      				<label for="zero">0~20000</label>
 	      			</div>
 	      			
 	      			<div>
 	      				<input type="checkbox" id="one" name="sortFilter" value="b">
 	      				<!-- <a href="guestlist.do?r_price=b"> -->
 	      				<label for="one">20000~40000</label>
 	      			</div>
 	      			
 	      			<div>
 	      				<input type="checkbox" id="two" name="sortFilter" value="c">
 	      				<!-- <a href="guestlist.do?r_price=c"> -->
 	      				<label for="two">40000~60000</label>
 	      			</div>
 	      			
 	      			<div>
 	      				<input type="checkbox" id="three" name="sortFilter" value="d">
 	      				<!-- <a href="guestlist.do?r_price=d"> -->
 	      				<label for="three">60000~80000</label>
 	      			</div>
 	      			
					<div>
 	      				<input type="checkbox" id="four" name="sortFilter" value="e">
 	      				<!-- <a href="guestlist.do?r_price=e"> -->
 	      				<label for="four">80000~2800000</label>
 	      			</div>
 	      			<div style="margin-left:60%;">
 	      				<button type="submit" onclick="return test_checkbox();" style = "width:60px;background-color:#ff2d60; color:white;">
 	      				<em>확인</em>
 	      				</button> 
 	      			</div>
 	      		</div>
 	      	</div>
		</div>	
		</form>
		<!-- 해당 필터 클릭 시 이벤트 -->
		<script>
			jQuery('#firstfilt').css("display", "none"); 
 	      	jQuery('#secondfilt').css("display", "none"); 
 	      		
 	      	jQuery('#firstfilter').click(function () {  
 	      	 	  if($("#firstfilt").css("display") == "table"){
 	      	       	 jQuery('#firstfilt').css("display", "none");
 	      	     	 jQuery('#secondfilt').css("display", "none"); 
 	      	    } else {  
 	      	        jQuery('#firstfilt').css("display", "table");
 	      	     	jQuery('#secondfilt').css("display", "none"); 
 	      	    } 
 	      	});
 	      	
			jQuery('#secondfilter').click(function () {  
		 		if($("#secondfilt").css("display") == "table"){
		       		jQuery('#secondfilt').css("display", "none");
		       		jQuery('#firstfilt').css("display", "none");
		    	} else {  
		        	jQuery('#secondfilt').css("display", "table");
		        	jQuery('#firstfilt').css("display", "none");
		    	}
			});
	</script>
	<!-- 해당 필터 클릭 시 이벤트 끝-->
    </div>
		<!-- 필터 끝-->
		<!-- Guest house 목록을 리스트로 뽑아주기 -->
	<table id="ajaxTable" width="60%" height="10%" border="0" cellpadding="1">
    <c:forEach var="list" items="${list}" varStatus="i">
    	<tr align="left" >
    	<td rowspan="5" width="33%" align="center" style="padding-top:20px;padding-bottom:30px;">
    		<a href="guestdetail.do?g_no=${list.g_no}&idx=${list.g_no}&check_in=${list.check_in}&check_out=${list.check_out}">
    		<img src = "${list.g_url}" width="90%" height="180px"></a>
    		<!--<img src = "resources/images/${list.g_url}.PNG" width="200px" height="120px">-->
    	</td>
    	<td style="font-size:24px;padding-top:10px;">
    		<a href="guestdetail.do?g_no=${list.g_no}&idx=${list.g_no}&check_in=${list.check_in}&check_out=${list.check_out}">
    		${list.g_name}</a>
    		<button type="submit" id="likebtn" class="filter__refresh-btn"style="font-size:16px;"><em>좋아요</em></button>
      	</td>
      	</tr>
      	<tr><td>list.rating, reply count</td></tr>
      	<tr>
      		<td>
      			<i style="font-size:18px;font-weight:bold;color:black;">숙박&nbsp;</i>
      			<i>14:00~&nbsp;</i>
      			<i style="width:15px; height: 15px; background-color:#ff2d60; color:white;">기본</i> 
      			<i style="font-size:18px;font-weight:bold;color:black;">&nbsp;&nbsp;${list.low_price} 원</i>
      		</td>
      	</tr>
      	<tr><td>쿠폰 및 테마 공백 </td></tr>
      	<tr><td style="padding-bottom:30px;">&nbsp;</td></tr>
      	<tr><td colspan="2"><hr color="#D5D5D5" align="center" width=97%></hr></td></tr>
      	<script>
      		x[${i.index}] = ${list.g_position_n};
  			y[${i.index}] = ${list.g_position_e}; 
  			name[${i.index}] = '${list.g_name}';
  			url[${i.index}] = '${list.g_url}';
  			area = '${param.area}';
  		</script>
	</c:forEach>
    </table>
      	
    <!-- <script> //좋아요 클릭 이벤트
		jQuery("#likebtn").click(function(){
			if(jQuery("#likebtn").class("filter__refresh-btn")){
				jQuery("#likebtn").css("background-color","black");
		    } else {  
		    	//if else 써서 이미지 바꿔주고 동적으로 데이터값 넘겨주기 
		    } 
		});
	</script> -->
   	</div>

 <script>
 	var map;
 	if(area=='my'){
 		map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.4945220,127.0280080),
       	zoom: 9
    	});
 	}else{
 		map = new naver.maps.Map('map', {
 	        center: new naver.maps.LatLng(x[0],y[0]),
 	       	zoom: 9
 	    });
 	}

    var markers = [];
    var infoWindows = [];
    
    for(var i=0;i<x.length;i++){
	    var marker = new naver.maps.Marker({
	    	map: map,
	    	position: new naver.maps.LatLng(x[i],y[i]),
	    });
	    
	   // 마크 클릭시 인포윈도우 오픈
	    var infowindow = new naver.maps.InfoWindow({
	    	content: '<h6>'+name[i]+'</h6><div align="center"><a href="guestdetail.do" target="_blank"><img src="'+url[i]+'"width="120px" height="120px"></a></div>',
	    	 maxWidth: 140,
	    	    backgroundColor: "#eee",
	    	    borderColor: "#2db400",
	    	    borderWidth: 5,
	    	    anchorSize: new naver.maps.Size(30, 30),
	    	    anchorSkew: true,
	    	    anchorColor: "#eee",
	    	    pixelOffset: new naver.maps.Point(20, -20)
	    });

	    markers.push(marker);
	    infoWindows.push(infowindow);	    
}


    naver.maps.Event.addListener(map, 'idle', function() {
        updateMarkers(map, markers);
    });

    function updateMarkers(map, markers) {

        var mapBounds = map.getBounds();
        var marker, position;

        for (var i = 0; i < markers.length; i++) {

            marker = markers[i]
            position = marker.getPosition();

            if (mapBounds.hasLatLng(position)) {
                showMarker(map, marker);
            } else {
                hideMarker(map, marker);
            }
        }
    }

    function showMarker(map, marker) {

        if (marker.setMap()) return;
        marker.setMap(map);
    }

    function hideMarker(map, marker) {

        if (!marker.setMap()) return;
        marker.setMap(null);
    }

    // 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
    function getClickHandler(seq) {
        return function(e) {
            var marker = markers[seq],
                infoWindow = infoWindows[seq];

            if (infoWindow.getMap()) {
                infoWindow.close();
            } else {
                infoWindow.open(map, marker);
            }
        }
    }

    for (var i=0, ii=markers.length; i<ii; i++) {
        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
    }
 	
   </script>


</body>
</html>