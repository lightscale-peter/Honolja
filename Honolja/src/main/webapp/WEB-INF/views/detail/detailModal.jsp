<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script src="./resources/js/detail.js"></script>
<link rel="stylesheet" href="./resources/css/detail.css">
<style type="text/css">
.thank-you-pop {
	width: 100%;
	padding: 20px;
	text-align: center;
}

.thank-you-pop img {
	width: 76px;
	height: auto;
	margin: 0 auto;
	display: block;
	margin-bottom: 25px;
}

.thank-you-pop h1 {
	font-size: 42px;
	margin-bottom: 25px;
	color: #5C5C5C;
}

.thank-you-pop p {
	font-size: 20px;
	margin-bottom: 27px;
	color: #5C5C5C;
}

.thank-you-pop h3.cupon-pop {
	font-size: 25px;
	margin-bottom: 40px;
	color: #222;
	display: inline-block;
	text-align: center;
	padding: 10px 20px;
	border: 2px dashed #222;
	clear: both;
	font-weight: normal;
}

.thank-you-pop h3.cupon-pop span {
	color: #03A9F4;
}

.thank-you-pop a {
	display: inline-block;
	margin: 0 auto;
	padding: 9px 20px;
	color: #fff;
	text-transform: uppercase;
	font-size: 14px;
	background-color: #8BC34A;
	border-radius: 17px;
}

.thank-you-pop a i {
	margin-right: 5px;
	color: #fff;
}

#ignismyModal .modal-header {
	border: 0px;
}

.Walia {
	margin-top: 80px;
	background-color: White;
	border-radius: 12px;
	box-shadow: 0px 0px 1px 1px rgba(204, 204, 204, 0.30);
}

.btn-style {
	color: white !important;
	background-color: #666666 !important;
	margin-top: 20px;
	margin-bottom: 25px;
	border-radius: 8px;
	border: 1px solid transparent;
	text-decoration: none;
	display: inline-block !important;
}

.h2back h2 {
	background-color: #666666;
	color: white;
	margin-top: 0px;
	border-radius: 12px 12px 0px 0px;
	font-size: 14px;
	font-size: 20px;
	padding: 10px;
}

.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: white;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="modal fade" id="ignismyModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="">
								<span>×</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="thank-you-pop">
								<img
									src="http://goactionstations.co.uk/wp-content/uploads/2017/03/Green-Round-Tick.png"
									alt="">
								<h1 id="modal_title"></h1>
								<p id="modal_body"></p>
								<!-- 	<h3 class="cupon-pop">
									Your Id: <span>12345</span>
								</h3> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="modal fade" id="reservationModal" role="dialog">
			<div class="modal-dialog">
				<div class="col-md-8 col-md-offset-2 col-sm-6 col-sm-offset-3 Walia">
					<div class="backcolor">
						<span class="close" data-dismiss="modal">×</span>
						<div class="row text-center h2back">
							<h2>예약 확인</h2>
						</div>
						<form>
							<div class="col-md-6 col-sm-6">
								<label>이름: </label> <input type="text" class="form-control"
									placeholder="Walia">
							</div>
							<div class="col-md-6 col-sm-6">
								<label>방 이름: </label> <input type="text" class="form-control"
									placeholder="Walia">
							</div>
							<div class="col-md-6 col-sm-6">
								<label> 가격: </label> <input type="text" class="form-control"
									placeholder="Punjab">
							</div>
							<div class="col-md-6 col-sm-6">
								<label> 인원: </label> <input type="text" class="form-control"
									placeholder="9876543210">
							</div>
							<div class="col-md-12 col-sm-12">
								<div class="col-md-6 col-sm-6">
									<a href="#">
										<button type="button" class="btn-style form-control">예약신청
										</button>
									</a>
								</div>
								<div class="col-md-6 col-sm-6">
									<a href="#">
										<button type="button" class="btn-style form-control">취소
										</button>
									</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-notify modal-info">
			<div class="modal-content">
				<div class="modal-header1" id="modal_title">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title1"></h4>
				</div>
				<div class="modal-body1" id="modal_body"></div>
				<div class="modal-footer1">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>