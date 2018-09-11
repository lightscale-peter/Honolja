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
 	
 	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- 달력 사용하기  -->
	<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    
    <!-- naver MAP API 받아오기 -->
 	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=U7Zqn2z2m6oFf4fS07JV&submodules=geocoder"></script>
 	<style>
 	.filter-icon__refresh {
    width: 18px;
    height: 18px;
    background: url(https://yaimg.yanolja.com/joy/pw/search/filter-icon__refresh.svg) 50%;
	}
	.filter-icon {
    display: inline-block;
    overflow: hidden;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
    vertical-align: middle;
	}
	i, em, address {
    font-style: normal;
	}
	i, cite, em, var, address, dfn {
    font-style: italic;
}
.filter__refresh-btn {
    font-size: 14px;
    color: #aaa;
}
button {
    outline: none;
    border: 0 none;
    background-color: transparent;
    cursor: pointer;
}
button, input, textarea, select, td, th {
    font-family: "Apple SD Gothic Neo", "Nanum Barun Gothic", "NanumBarunGothic", sans-serif !important;
}
label, button, a {
    cursor: pointer;
    text-decoration: none;
}
body, h1, h2, h3, h4, h5, h6, input, textarea, select, button, table {
    font-family: "Apple SD Gothic Neo", "Nanum Barun Gothic", "NanumBarunGothic", sans-serif !important;
    color: #666666;
    font-size: 16px;
    -webkit-text-size-adjust: none;
    -ms-text-size-adjust: 100%;
    -webkit-tap-highlight-color: transparent;
}
user agent stylesheet
input[type="button" i], input[type="submit" i], input[type="reset" i], input[type="file" i]::-webkit-file-upload-button, button {
    align-items: flex-start;
    text-align: center;
    cursor: default;
    color: buttontext;
    background-color: buttonface;
    box-sizing: border-box;
    padding: 2px 6px 3px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonface;
    border-image: initial;
}
user agent stylesheet
input, textarea, select, button {
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    margin: 0em;
    font: 400 13.3333px Arial;
}
user agent stylesheet
input, textarea, select, button, meter, progress {
    -webkit-writing-mode: horizontal-tb !important;
}
body {
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
body {
    min-width: 1280px;
    margin: 0 auto;
    -ms-word-break: break-all;
    word-break: break-all;
    -webkit-text-size-adjust: none;
    -moz-text-size-adjust: none;
    -ms-text-size-adjust: none;
}
body, h1, h2, h3, h4, h5, h6, input, textarea, select, button, table {
    font-family: "Apple SD Gothic Neo", "Nanum Barun Gothic", "NanumBarunGothic", sans-serif !important;
    color: #666666;
    font-size: 16px;
    -webkit-text-size-adjust: none;
    -ms-text-size-adjust: 100%;
    -webkit-tap-highlight-color: transparent;
}
 	</style>
 	<script>
	 	var x= new Array();
		var y= new Array();
		var name= new Array();
		var url= new Array();
		var area;
	</script>
</head>

<body id="page-top" style="margin-top:51px;" >
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="main.do"></c:param>
	</c:import>
			<!-- 달력 시작 -->  
		  
<div style="position:fixed; background-color:#D5D5D5;width:100%;height:50px;margin-bottom:0;margin-top:0; border:0;">
	<div style="margin-top:10px;">
    	<div style="position:fixed;margin-left:1%;" >
    		<input type="text" aria-label="YYYY-MM-DD" name="startDate" id="startDate" width="150px" placeholder="YYYY-MM-DD" value="${param.check_in}" 
    		autoComplete="off" aria-describedby="DateInput_screen-reader-message-startDate" style="color:black;" /> 
    	</div>
   
   		<div class="DateRangePickerInput__arrow" aria-hidden="true" role="presentation"><span></span></div> 
   
    	<div style="position:fixed; margin-left:12%; margin-bottom:80%;">
    		<input type="text" aria-label="YYYY-MM-DD" name="endDate" id="endDate" width="150px" placeholder="YYYY-MM-DD" value="${param.check_out}"
    	 	aria-describedby="DateInput_screen-reader-message-endDate" style="color:black;" />
    	</div>
    
    	<div style="position:fixed; margin-left:22%; margin-bottom:80%;">
    		<img src="https://yaimg.yanolja.com/joy/pw/place/bullet-datepicker-check.svg" alt>
    		<span>${date}박 ${date}일</span>
		</div>
    </div>
</div>
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
       <div style="padding-top:40px">
   	<!-- 지도 우측배치로 고정 -->
	<div style= "right:0; position:fixed;width:40%;height:100%;">	
		<div id="map" style="width:100%;height:100%;margin-top:10px;"></div>
		</div>
        <!-- 필터 담을것. 기본순/테마/가격대선택/예약가능/.......필터초기화-->
	<div style="left:0; width:50% padding-left: 30px; padding-right:30px;padding-left:30px;">
    	<div style="padding-top: 13px;padding-bottom: 12px;"><p>
     		<input type="button" name="basic" value="기본순">
     		<input type="button" name="basic" value="테마">
     		<input type="button" name="basic" value="숙소특징">
     		<input type="button" name="basic" value="가격대선택">
     		<input type="button" name="basic" value="예약가능">
     		<button type="button" class="filter__refresh-btn f-right">
     		<i class="filter-icon filter-icon__refresh"></i>
     		<!-- react-text: 390 --> <!-- /react-text -->
     		<em>필터 초기화</em>
     		</button>
    	</div>
		<!-- 필터 끝-->
		
		<!-- Guest house 목록을 리스트로 뽑아주기 -->
		
      	<table id="ajaxTable" width="60%" height="10%" border="0" cellpadding="1">
      	<c:forEach var="list" items="${list}" varStatus="i">
      	<tr align="left" >
      		<td rowspan="5" width="33%" align="center" style="padding-top:20px;padding-bottom:30px;">
      		<a href="detail.do?g_no=${list.g_no}&idx=${list.g_no}&check_in=${param.check_in}&check_out=${param.check_out}">
      		<img src = "${list.g_url}" width="90%" height="180px">
      		<!--<img src = "resources/images/${list.g_url}.PNG" width="200px" height="120px">-->
      		</a></td><!-- image불러올 때 .PNG대소문자 구분함. -->
      		<td style="font-size:24px;padding-top:10px;"><a href="detail.do?g_no=${list.g_no}&idx=${list.g_no}&check_in=${param.check_in}&check_out=${param.check_out}"> ${list.g_name}</a></td>
      	</tr>
      		<tr><td>list.rating, reply count </td></tr>
      		<tr><td>list.input time, price </td></tr>
      		<tr><td>쿠폰 및 테마 공백 </td></tr>
      		<tr><td style="padding-bottom:30px;">&nbsp;</td></tr>
      		<tr><td colspan="2"><hr color="#D5D5D5" align="center" WIDTH=97%></hr></td></tr>
      		<script>
      			x[${i.index}] = ${list.g_position_n};
  				y[${i.index}] = ${list.g_position_e}; 
  				name[${i.index}] = '${list.g_name}';
  				url[${i.index}] = '${list.g_url}';
  				area = '${param.area}';
  			</script>
		</c:forEach>
      	</table>
	</div>
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
	    	content: '<h6>'+name[i]+'</h6><div align="center"><a href="detail.do" target="_blank"><img src="'+url[i]+'"width="120px" height="120px"></a></div>',
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