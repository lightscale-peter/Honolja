<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<title>[main.jsp]</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- 상단 바 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Honolja</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">홈</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">소모임</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
			</ul>
		</div>
	</nav>
	
	<div>
		<!-- 카로셀 시작 -->
		<div class="container" style = "width:100%; position: relative;">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
			    <ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
			    </ol>
		
				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
				        <img src="resources/images/la.jpg" alt="Los Angeles" style="width:100%;height:650px;">
				        <div class="carousel-caption">
							<h3>Los Angeles</h3>
							<p>LA is always so much fun!</p>
				        </div>
					</div>
	
					<div class="item">
						<img src="resources/images/chicago.jpg" alt="Chicago" style="width:100%;height:650px;">
						<div class="carousel-caption">
							<h3>Chicago</h3>
							<p>Thank you, Chicago!</p>
			        	</div>
					</div>
			    
					<div class="item">
			        <img src="resources/images/ny.jpg" alt="New York" style="width:100%;height:650px;">
				        <div class="carousel-caption">
							<h3>New York</h3>
							<p>We love the Big Apple!</p>
				        </div>
					</div>
				</div>
		
			    <!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
					<span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
					<span class="sr-only">Next</span>
			    </a>
			</div>
		</div>
		<div style="position: absolute; left: 50%; top: 200px;">
			<select>
				<option>지역</option>
				<option>서울</option>
				<option>경기도</option>
				<option>충청도</option>
			</select>
		</div>
	</div>
</body>
</html>