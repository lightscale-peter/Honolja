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
	


  
</head>
<body style="margin-top: 50px;">
 
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="test" value="${test}"></c:param>
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="test.do"></c:param>
	</c:import>
	



<input type = "checkbox" name ="dfsdfs" value = "sdds" onclick = "alert('dfsdffsd');">안녕


</body>
</html>