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
       <td width="100px"><a class="navbar-brand js-scroll-trigger" href="location.do">지역</a></td>
       <td width="100px"><a class="navbar-brand js-scroll-trigger" href="search.do">숙소검색</a></td>
       <td width="100px"><a class="navbar-brand js-scroll-trigger" href="cast.do">캐스트</a></td></tr>
        </table>
      </div>
       </nav>
   
    <div style="position:fixed; background-color:#A6A6A6;" >
    <input name="check_in" id="datepicker" width="200" /> 
    </div>
    <div style="position:fixed; background-color:#A6A6A6; margin-left:20%; margin-bottom:80%;">
    <input name="check_out" id="datepicker1" width="200" />
    </div>

    <script>
        $('#datepicker').datepicker({
        	format: 'yyyy/mm/dd'
        });
        $('#datepicker1').datepicker({
        	format: 'yyyy/mm/dd'
        });
    </script>
    
  <!-- Guest house 목록을 리스트로 뽑아주고  + 지도 우측배치로 고정 -->
<br><br>

<div style= "right:0; position:fixed;">
	<div id="map" style= "width:600px;height:600px; margin-top:20px;"></div></div>
    

      <br><br>
        <!-- 필터 담을것. 기본순/테마/가격대선택/예약가능/.......필터초기화-->
	<div>
    	<div><p>
     		기본순  &nbsp;&nbsp;&nbsp;  테마&nbsp;&nbsp;&nbsp;    숙소특징 &nbsp;&nbsp;&nbsp;   가격대선택&nbsp;&nbsp;&nbsp;     예약가능  &nbsp;&nbsp;&nbsp;  필터 초기화
    	</div>
		<!-- 필터 끝-->

      	<table width="700" border=1 cellpadding="0">
      	<c:forEach var="list" items="${list}" varStatus="i">
      	
      	<tr align="left">
      		<td rowspan="5" width="100"><a href="detail.do?idx=${list.g_no}">
      		<img src = "${list.g_url}" width="200px" height="120px">
      		<!--<img src = "resources/images/${list.g_url}.PNG" width="200px" height="120px">-->
      		</a></td><!-- image불러올 때 .PNG대소문자 구분함. -->
      		<td><a href="detail.do?idx=${list.g_no}"> ${list.g_name}</a></td>
      	</tr>
      		<tr><td>list.rating, reply count </td></tr>
      		<tr><td>list.input time, price </td></tr>
      		<tr><td>공백 </td></tr>
      		<tr><td>공백 공백 공백 </td></tr>
      		<script>
      			x[i.index] = ${list.g_position_n};
      			y[i.index] = ${list.g_position_e}; 
  			</script>
		</c:forEach>
      	</table>
      
</div>
	<script> alert("text="+x[0]);</script>
	<!-- <input type="button" value="뒤로가기" onclick="location.href='main.do'"/> -->
	
	<script>
    	var map = new naver.maps.Map('map', {
        	center: new naver.maps.LatLng(37.4945220,127.0280080),
       	 	zoom: 10
    	});
    	var marker = new naver.maps.Marker({
    	    position: new naver.maps.LatLng(37.4945220,127.0280080),
    	    map: map
    	});

      //var map = new naver.maps.Map('map');  //37.4945220,127.0280080
      //var myaddress = '불정로 6';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          
          var result = response.result;
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          // 마크 클릭시 인포윈도우 오픈
          var infowindow = new naver.maps.InfoWindow({
              content: '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
          });
      });
      
      </script>
</body>
</html>