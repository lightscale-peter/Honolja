<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lpJuL0fDxe8fMB7Sysgn&submodules=geocoder"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="./resources/js/detail.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var g_no = "<c:out value='${g_no}'/>";
	$("#roominfos").tab('show');
	roominfo(g_no);
})
</script>
<style type="text/css">
#detail-info {
	margin-top: 20px;
}

#my-tab-content {
	margin-top: 20px;
}

.badge-live {
	color: #fff;
	/*display: inline-block;*/
	font-size: 12px;
	padding: 3px 5px 2px;
	margin-right: 5px;
	background-color: #18d0c5;
}

i, em, address {
	font-style: normal;
}

.detail-info__title {
	font-size: 42px;
	color: #333;
	margin-bottom: 5px;
	font-weight: 200;
	letter-spacing: -1px;
}

.detail-info__address {
	font-size: 14px;
}

.detail-info__score {
	margin-top: 20px;
}

.icon-staylist-score {
	width: 16px;
	height: 16px;
}

.icon-staylist-score.score10 {
	background-position: 0 0;
}

.icon-staylist-score.score05 {
	background-position: -18px 0;
}

.icon-staylist-score.score00 {
	background-position: -38px 0;
}

.icon-staylist {
	display: inline-block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	vertical-align: middle;
	background:
		url(https://yaimg.yanolja.com/joy/pw/search/icon-staylist.svg)
		no-repeat;
}

.review-info__content {
	font-size: 15px;
}
</style>
</head>
<body>
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="access_token" value="${access_token}"></c:param>
		<c:param name="host" value="main.do"></c:param>
	</c:import>
	<div id="myCarousel" class="carousel slide" data-ride="carousel"
		data-interval="false">
		<div class="carousel-inner">
			<c:forEach var="img" items="${img}" varStatus="status">
				<div class="item <c:if test='${status.first}'>active</c:if>">
					<img src="${img.img_url}" alt="" style="width: 100%; height: 400px">
				</div>
			</c:forEach>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<div class="container">
		<div class="row justify-content-center">
			<div id="detail-info" class="col-sm-8">
				<section>
					<h2 class="detail-info__title">${info.g_name}</h2>
					<div class="detail-info__address">
						<div>${info.g_addr}</div>
						<div></div>
					</div>
					<div class="detail-info__score">
						<span class="score-rap"><i
							class="icon-staylist icon-staylist-score score10"></i><i
							class="icon-staylist icon-staylist-score score10"></i><i
							class="icon-staylist icon-staylist-score score10"></i><i
							class="icon-staylist icon-staylist-score score10"></i><i
							class="icon-staylist icon-staylist-score score05"></i></span><em>
							후기 ${rcnt}개 </em>
					</div>
					<br>
				</section>
				<section>
					<div>
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a href="#room-info" data-toggle="tab"
								onclick="roominfo(${g_no})">객실정보</a></li>
							<li><a href="#review" data-toggle="tab"
								onclick="review(${g_no})">후기</a></li>
						</ul>
						<div class="tab-content" id="my-tab-content">
							<div class="tab-pane active" id="room-info">
								<div id="roominfos"></div>
							</div>
							<div class="tab-pane" id="review">
								<div id="reviews"></div>
							</div>
						</div>
					</div>
				</section>
			</div>
			<div class="col-sm-4">
				<div id="map" style="width: 400px; height: 400px;" align="center"></div>
				<script>
					var x = <c:out value='${info.g_position_n}'/>;
					var y = <c:out value='${info.g_position_e}'/>;
					var map = new naver.maps.Map('map', {
						center : new naver.maps.LatLng(x, y),
						zoom : 10
					});

					var marker = new naver.maps.Marker(
							{
								position : new naver.maps.LatLng(x, y),
								map : map
							});
					/*// 마커 클릭 이벤트 처리 ( 클릭할 경우 infowindow에 등록된 이미지와 이름이 뜸 )
					naver.maps.Event.addListener(marker, "click", function(e) {
						if (infowindow.getMap()) {
							infowindow.close();
						} else {
							infowindow.open(map, marker);
						}
					});
					 // 마크 클릭시 인포윈도우 오픈 
					var infowindow = new naver.maps.InfoWindow(
							{
								//띄워줄 이름과 사이트 이미지, 클릭했을경우 이동할 url 주소를 입력해주면 된다.
								content : '<a href="http://bitcamp.co.kr/index.php?main_page=home"><h4>[비트캠프 서초센터]</h4></a>'
							}); */
				</script>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-notify modal-info">
			<div class="modal-content">
				<div class="modal-header" id="modal_title">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" id="modal_body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="reviewDelete" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" aria-hidden="true">×</button>
					<h4 class="smaller lighter blue no-margin modal-title">알림</h4>
				</div>
				<div class="modal-body">'삭제'버튼을 누르면 해당 게시글이 삭제됩니다. 정말로
					삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="modalDelbtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<c:import url="http://localhost:8080/honolja/footer.do"></c:import>
</body>
</html>