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
</style>
</head>
<body>
	<div id="myCarousel" class="carousel slide" data-ride="carousel"
		data-interval="false">
		<c:forEach var="img" items="${img}" varStatus="status">
			<div class="carousel-inner">
				<div class="item <c:if test='${status.first}'>active</c:if>">
					<img src="${img.i_url}" alt="" style="width: 100%; height: 400px">
				</div>
				<%-- <div class="item">
					<img src="${img[1]}" alt="" style="width: 100%; height: 400px">
				</div>
				<div class="item">
					<img src="${img[2]}" alt="" style="width: 100%; height: 400px">
				</div> --%>
			</div>
		</c:forEach>
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
					<div>
						<h2>
							<em>서울 담소정 게스트하우스</em>
						</h2>
						<div>서울특별시 종로구 가회동 57</div>
						<div>050350517823</div>
						<div>레이팅바 및 후기댓글갯수</div>
					</div>
					<div>필터 보여주는 구간</div>
				</section>
				<section>
					<div>
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a href="#room-info" data-toggle="tab">객실정보</a></li>
							<li><a href="#reply" data-toggle="tab">후기</a></li>
						</ul>
						<div class="tab-content" id="my-tab-content">
							<div class="tab-pane active" id="room-info">
								<c:forEach var="list" items="${list}">
									<div class="row">
										<div class="col-sm-7">
											<div id="${list.r_no}" class="carousel slide"
												data-ride="carousel" data-interval="false">
												<div class="carousel-inner">
													<div class="item active">
														<img src="${list.img_url}" alt="첫번째 슬라이드" width="500px"
															height="300px">
													</div>
													<div class="item">
														<img src="${list.img_url2}" alt="두번째 슬라이드" width="500px"
															height="300px">
													</div>
													<div class="item">
														<img src="${list.img_url3}" alt="세번째 슬라이드" width="500px"
															height="300px">
													</div>
												</div>
												<a class="left carousel-control" href="#${list.r_no}"
													data-slide="prev"> <span
													class="glyphicon glyphicon-chevron-left"></span> <span
													class="sr-only">Previous</span>
												</a> <a class="right carousel-control" href="#${list.r_no}"
													data-slide="next"> <span
													class="glyphicon glyphicon-chevron-right"></span> <span
													class="sr-only">Next</span>
												</a>
											</div>
										</div>
										<div class="col-sm-4">
											<div>
												<br>
												<h2>
													<em>${list.r_name}</em>
												</h2>
											</div>
											<p>
											<div>${list.r_content}</div>
											<br>
											<div align="right">
												<font color="#FF69B4" size="15px"><fmt:formatNumber
														value="${list.r_price}" pattern="###,###,###.##" /> </font><i>원</i>
											</div>
											<button type="button" class="btn btn-primary btn-block"
												href="">예약 하기</button>
										</div>
									</div>
									<hr>
								</c:forEach>
							</div>
							<div class="tab-pane" id="reply">
								<c:import url="guestReview.jsp"></c:import>
							</div>
						</div>
					</div>
				</section>
			</div>
			<div class="col-sm-4">
				<div id="map" style="width: 400px; height: 400px;" align="center"></div>
				<script>
					var map = new naver.maps.Map('map', {
						center : new naver.maps.LatLng(37.494805, 127.027540),
						zoom : 10
					});

					var marker = new naver.maps.Marker(
							{
								position : new naver.maps.LatLng(37.494805,
										127.027540),
								map : map
							});
					// 마커 클릭 이벤트 처리 ( 클릭할 경우 infowindow에 등록된 이미지와 이름이 뜸 )
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
							});
				</script>
			</div>
		</div>
	</div>
</body>
</html>