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
 	<script>
 	var x= new Array();
	var y= new Array();
	var name= new Array();
	var url= new Array();
	</script>
</head>

<body id="page-top">
<!-- Navigation ===메인 상단고정 바( 내주변, 지역등등 상단배치시 필요한것들 + 달력) -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="margin-bottom:0; border:0;width:100%;
    background-color:white; height:70px" >
      <div class="container" style="position:fixed;margin-bottom:0; border:0;width:100%;
    background-color:white; height:60px">
      <table>
       <tr>
       <td colspan="5" width="100px"><a class="navbar-brand js-scroll-trigger" href="main.do">Main</a></td>
       <td width="100px"><a class="navbar-brand js-scroll-trigger" href="list.do">내 주변</a></td>
       <!-- <td width="100px"><a class="navbar-brand js-scroll-trigger" href="list.do?...">내 주변</a></td> -->
       <td width="100px"><a class="navbar-brand js-scroll-trigger" href="location.do">지역</a></td>
       <!--<td width="100px"><a class="navbar-brand js-scroll-trigger" href="location.do?...">지역</a></td>  -->
       <td width="100px"><a class="navbar-brand js-scroll-trigger" href="search.do">숙소검색</a></td>
       <td width="100px"><a class="navbar-brand js-scroll-trigger" href="cast.do">캐스트</a></td></tr>
        </table>
      </div>
       </nav>
		<!-- 달력 시작 -->   
		
<div style="background-color:#A6A6A6;width:100%;hright:300px;margin-bottom:0; border:0;">

    <div style="position:fixed;margin-left:2%;" >
    	<input name="check_in" id="datepicker" width="150px" value="체크인"/> 
    </div>
    
    <div style="position:fixed;margin-left:14%; margin-bottom:80%;" > ------->> </div>
    
    <div style="position:fixed; margin-left:18%; margin-bottom:80%;">
    	<input name="check_out" id="datepicker1" width="150px"value="체크아웃"/>
    </div>
    
    <div style="position:fixed; margin-left:30%; margin-bottom:80%;">
    	<input type="text" id="date" width="50px" value="몇박 몇일??"/>
    </div>
    
</div>
    <script>
        $('#datepicker').datepicker({
        	format: 'yyyy/mm/dd'
        });
        $('#datepicker1').datepicker({
        	format: 'yyyy/mm/dd'
        });
    </script>

      	<!-- 지도 우측배치로 고정 -->
	<div style= "right:0; position:fixed;">	
		<div id="map" style="width:650px;height:650px;margin-top:30px;"></div>
	</div>
	      <br><br>
        <!-- 필터 담을것. 기본순/테마/가격대선택/예약가능/.......필터초기화-->
	<div>
    	<div><p>
     		<input type="button" name="basic" value="기본순">
     		<input type="button" name="basic" value="테마">
     		<input type="button" name="basic" value="숙소특징">
     		<input type="button" name="basic" value="가격대선택">
     		<input type="button" name="basic" value="예약가능">
     		<input type="button" name="basic" value="필터 초기화">
    	</div>
		<!-- 필터 끝-->
		
		<!-- Guest house 목록을 리스트로 뽑아주기 -->
      	<table width="700" border="1" cellpadding="1">
      	<c:forEach var="listlo" items="${listlo}" varStatus="i">
      	
      	<tr align="left">
      		<td rowspan="8" width="100"><a href="detail.do?idx=${listlo.g_no}">
      		<img src = "${listlo.g_url}" width="200px" height="120px">
      		<!--<img src = "resources/images/${list.g_url}.PNG" width="200px" height="120px">-->
      		</a></td><!-- image불러올 때 .PNG대소문자 구분함. -->
      		<td><a href="detail.do?idx=${listlo.g_no}"> ${listlo.g_name}</a></td>
      	</tr>
      		<tr><td>listlo.rating, reply count </td></tr>
      		<tr><td>listlo.input time, price </td></tr>
      		<tr><td>공백 </td></tr>
      		<tr><td>쿠폰 및 테마 공백 </td></tr>
      		<tr><td rowspan="3">&nbsp;</td></tr>
      		<tr><td>&nbsp;</td></tr>
      		<tr><td>&nbsp;</td></tr>
      		<script>
      			x[${i.index}] = ${listlo.g_position_n};
  				y[${i.index}] = ${listlo.g_position_e}; 
  				name[${i.index}] = '${listlo.g_name}';
  				url[${i.index}] = '${listlo.g_url}';
  			</script>
		</c:forEach>
      	</table>
      
	</div>
	
 <script>
    var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(33.3795635,126.5586996), //제주도 정 가운데 지표임 추후 데이터 추가 및 수정 필요
       	zoom: 5
    });

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