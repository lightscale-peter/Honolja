<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
	<script src ="js/bootstrap.js"></script>
    <script type="text/javascript">
		function popupwindow(url, title, w, h) {
			
			var left = (screen.width/2) - (w/2);
			var top = (screen.height/2) - (h/2) - 50;
			
			return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
    	}
    </script>
    
</head>
<body>
	<!-- 상단 바 -->
	<div class = "header">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="main.do">Honolja</a>
				</div>
				<ul class="nav navbar-nav">
					<li ${notice}><a href="list.do?area=my">내 주변</a></li>
					<li ${group}><a href="location.do">지역</a></li>
					<li ${group}><a href="#">캐스트</a></li>
					<li ${test}><a href="test.do">TEST</a></li>
				</ul>
  				
  				<form class="navbar-form navbar-left" action="list.do">
     				<div class="form-group">
     					<div class="col-xs-8">
        					<input class="form-control" id="search" name="keyword" placeholder="Submit" value="${sval}" size="25">
      					</div>
      					<div class="col-xs-2">
      					<button type="submit" class="btn btn-primary">검색</button>
      					</div>
      				</div>
    			</form>
    			
				<c:choose>
					<c:when test="${param.checked == ''}">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
							<li onclick="popupwindow('popup.do?host=${param.host}', 'login', 350, 350)"><a href="#"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span>마이페이지</a></li>
							<li onclick="popupwindow('popup.do', 'login', 350, 350)"><a href="#"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</nav>
	</div>

	

</body>
</html>