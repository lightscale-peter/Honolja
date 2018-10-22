<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
<style type="text/css">
	 
	 .ff {
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	 }
	 
	 table.ta {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  	margin : 20px 10px;
	}

	table.ta td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
	}
	 
</style>
	
	
</head>
<body>

	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="main.do"></c:param>
	</c:import>

	<div style="height: 100px;"></div>
	
	<div>
  		<c:import url="http://localhost:8080/honolja/mypage.do">
		</c:import>
	</div>


<div align="center">

 <h1>Reservation Info</h1>

	<table class="ta">
	<c:forEach var="listRS" items="${listRS}">
		<tr>
			<td rowspan="4">${listRS.img_url}</td>
			<td>${listRS.r_name}</td>
		</tr>
		<tr><td>${listRS.u_id}</td></tr>
		<tr><td>${listRS.res_price}</td></tr>
		<tr><td>
				
	 	<fmt:parseDate value="${listRS.res_startdate}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/> ~ 
  	<fmt:parseDate value="${listRS.res_enddate}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/>
      
		</td></tr>
	</c:forEach>
	</table>
=======
<title>mypage_rsvt.jsp</title>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
<style type="text/css">
	 
	 .ff {
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	 }
	 
	 table.ta {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  	margin : 20px 10px;
	}

	table.ta td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
	}
	 
</style>
	
	
</head>
<body>

	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="main.do"></c:param>
	</c:import>

	<div style="height: 100px;"></div>
	
	<div>
  		<c:import url="http://localhost:8080/honolja/side_mypage.do">
		</c:import>
	</div>


<div align="center">

 <h1>Reservation Info</h1>

	<table class="ta">
	<c:forEach var="listRS" items="${listRS}">
		<tr>
			<td rowspan="6">${listRS.img_url}</td>
			<td><a href="guestdetail.do?g_no=${listRS.r_no}">${listRS.r_name}</a></td>
		</tr>
		<tr><td>${listRS.u_id}</td></tr>
		<tr><td>${listRS.res_price}</td></tr>
		<tr><td>${listRS.res_people}</td></tr>
		<tr><td>
			<fmt:formatDate value="${listRS.res_date}" pattern="yyyy-MM-dd"/>
		</td></tr>
		<tr><td>
		
		<fmt:parseDate value="${listRS.check_in}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/> ~ 
  	<fmt:parseDate value="${listRS.check_out}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/>
		
		</td></tr>
	</c:forEach>
	</table>
	
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
</div>

	<div class="ff">
		<c:import url="http://localhost:8080/honolja/footer.do" />
	</div>



</body>
</html>