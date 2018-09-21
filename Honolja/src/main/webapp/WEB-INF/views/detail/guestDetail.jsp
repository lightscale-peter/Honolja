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
<!-- 달력 사용하기  -->
<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="./resources/js/detail.js"></script>
<link rel="stylesheet" href="./resources/css/detail.css">
<script type="text/javascript">
$(document).ready(function() {
	var g_no = <c:out value='${g_no}'/>;
	$("#roominfos").tab('show');
	roominfo(g_no);
})
</script>
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
						<c:choose>
							<c:when test="${avg == 5}">
								<span class="score-rap"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i></span>
							</c:when>
							<c:when test="${5 > avg && avg >= 4.5}">
								<span class="score-rap"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score05"></i></span>
							</c:when>
							<c:when test="${4.5 > avg && avg > 4}">
								<span class="score-rap"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:when>
							<c:when test="${4 > avg && avg >= 3.5}">
								<span class="score-rap"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score05"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:when>
							<c:when test="${3.5 > avg && avg >= 3}">
								<span class="score-rap"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:when>
							<c:when test="${3 > avg && avg >= 2.5}">
								<span class="score-rap"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score05"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:when>
							<c:when test="${2.5 > avg && avg >= 2}">
								<span class="score-rap"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:when>
							<c:when test="${2 > avg && avg >= 1.5}">
								<span class="score-rap"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score05"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:when>
							<c:when test="${1.5 > avg && avg >= 1}">
								<span class="score-rap"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:when>
							<c:otherwise>
								<span class="score-rap"><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:otherwise>
						</c:choose>
						<em> 후기 ${rcnt}개 </em>
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
				<div class="datepicker-content">
					<div class="DateRangePicker-top">
						<span class="f-left">체크인</span><span class="f-right">체크아웃</span>
					</div>
					<div class="DateRangePicker">
						<div class="container-fluid DateInput">
							<div class="row">
								<div class="col-md-5">
									<input type="text" name="startDate" id="startDate"
										value="2018-09-20" />
								</div>
								<div class="col-md-2">
									<span class="glyphicon glyphicon-arrow-right"
										aria-hidden="true"></span>
								</div>
								<div class="col-md-5">
									<input type="text" name="endDate" id="endDate"
										value="2018-09-20" />
								</div>
							</div>
						</div>
					</div>
					<div class="DateRangePicker-bottom">
						<span class="f-right">1박</span>
					</div>
				</div>
				<div id="map" style="width: 400px; height: 400px;" align="center"></div>
			</div>
		</div>
		<script type="text/javascript">
		$(function() {
		 $('#startDate').datepicker({ 
				showOn:"both",
				buttonImageOnly:true,
				buttonText:"날짜 선택",
				format: 'yyyy-mm-dd',
				numberOfMonths : 1,
				firstDay : 1,
				minDate : '0',
				maxDate: '+2Y',
				showMonthAfterYear : true,
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
					'8월', '9월', '10월', '11월', '12월'],
				monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월',
					'7월', '8월', '9월', '10월', '11월', '12월'],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토'],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토'],
				dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
			}); 
		 
			$('#endDate').datepicker({ 
				showOn:"both",
				buttonImageOnly:true,
				buttonText:"날짜 선택",
				format: 'yyyy-mm-dd',
				numberOfMonths : 1,
				firstDay : 1,
				minDate : '0',
				maxDate: '+2Y',
				showMonthAfterYear : true,
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
					'8월', '9월', '10월', '11월', '12월'],
				monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월',
					'7월', '8월', '9월', '10월', '11월', '12월'],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토'],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토'],
				dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
				onSelect : function(dateStr){
					var min = $(this).datepicker('getDate');
					$('#startDate').datepicker('option','minDate', min || '0');
					datrpicked();
				}
			});
		})
					var x = <c:out value='${info.g_position_n}'/>;
					var y = <c:out value='${info.g_position_e}'/>;
					var map = new naver.maps.Map('map', {
						center : new naver.maps.LatLng(x, y),
						zoomControl: true,
				        zoomControlOptions: {
				            style: naver.maps.ZoomControlStyle.SMALL,
				            position: naver.maps.Position.TOP_RIGHT
				        }
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