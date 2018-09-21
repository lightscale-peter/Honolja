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

<link rel="stylesheet" href="./resources/css/detail.css">

</head>
<body>
	<c:forEach var="list" items="${list}">
		<div class="row">
			<div class="col-sm-7">
				<div id="${list.r_no}" class="carousel slide" data-ride="carousel"
					data-interval="false">
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
				<button type="button" class="btn btn-primary btn-block" href="">예약
					하기</button>
			</div>
		</div>
		<hr>
	</c:forEach>
</body>
</html>