<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

	<title>[main.jsp]</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
    
    <script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
	
     
</head>
<body style="margin-top: 70px;">
	
	
	<!-- 상단 바 -->
	<div class = "header">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="main.do">Honolja</a>
				</div>
				<ul class="nav navbar-nav">
					<!-- 
					<li class="active"><a href="#">공지사항</a></li>
					 -->
					<li><a href="#">공지사항</a></li>
					<li><a href="#">소모임</a></li>
					<li><a href="test.do">TEST</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
				</ul>
			</div>
		</nav>
	</div>
	<!-- 공지사항 노출 부 -->

	공지사항 노출
	
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

		<div style="position: absolute; 
					left: 50%; 
					top: 50%;
					transform: translate(-50%,-50%); 
					background-color: white; 
					padding: 20px; 
					border-radius: 20px; 
					text-align: center;">	
					
			<form action="#">
				<div class="form-group">
					<label for="sel1">지역</label>
					<select class="form-control" id="sel1" name="area">
						<option>서울</option>
						<option>경기</option>
						<option>강원</option>
						<option>충북</option>
						<option>충남</option>
						<option>전북</option>
						<option>전남</option>
						<option>경북</option>
						<option>경남</option>
					</select>
				</div>
				<label for="sel1">Check-IN</label>							
					<div><input name="check_in" id="datepicker" width="276" /></div>
				<br>
					
				<label for="sel1">Check-OUT</label>
					<div><input name="check_out" id="datepicker1" width="276" /></div>
				<br>
					
				<div class="btn-group">
					<button type="submit" class="btn btn-primary">CHECK</button>
					<button type="reset" class="btn btn-primary">RESET</button>
				</div>				
			</form>
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
  
</body>
</html>