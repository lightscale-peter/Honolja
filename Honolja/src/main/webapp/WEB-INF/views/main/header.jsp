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
    <script type="text/javascript">
		function popupwindow(url, title, w, h) {
			
			var left = (screen.width/2) - (w/2);
			var top = (screen.height/2) - (h/2) - 50;
			
			return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
    	}
		
		function sendPost(url, name, value){
			
			var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "Post");
				form.setAttribute("action", url);

			 
			var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", name);
				hiddenField.setAttribute("value", value);
				
			form.appendChild(hiddenField);
			
			//form.target = url;
			
			document.body.appendChild(form);

			form.submit();
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
					<li ${param.notice}><a href="#">공지사항</a></li>
					<li ${param.group}><a href="#">소모임</a></li>
					<li ${param.myplace}><a href="list.do?area=my">내주변</a></li>
					<li ${param.area}><a href="location.do">지역</a></li>
					<li ${param.cast}><a href="#">캐스트</a></li>
					<li ${param.test}><a href="#" onclick="sendPost('test.do', 'access_token', '${param.access_token }');">TEST</a></li>
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
    			

				<!-- 로그인 / 비 로그인, 버튼 전환 -->
				<c:choose>
					<c:when test="${param.checked == '' || param.checked == null}">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
							<li onclick="popupwindow('popup.do?host=${param.host}', 'login', 410, 450)"><a href="#"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#"><span class="glyphicon glyphicon-user"></span>마이페이지</a></li>
							<li onclick="location.href = 'logout.do?host=${param.host}'"><a href="#"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
						</ul>
					</c:otherwise>
				</c:choose>

			</div>
		</nav>
	</div>

	

</body>
</html>