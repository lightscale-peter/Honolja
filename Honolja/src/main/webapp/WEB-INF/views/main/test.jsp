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
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.2.0/bootstrap-slider.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.2.0/css/bootstrap-slider.css">

<script type="text/javascript">


	
</script>

  
</head>
<body style="margin-top: 50px;">
 
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="test" value="${test}"></c:param>
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="test.do"></c:param>
	</c:import>
	
	
<input
	id="ex2" 
	class="span2"
	type="text"

	value="" 
	data-provide="slider"

	data-slider-min="10" 
	data-slider-max="1000" 
	data-slider-step="5" 
	data-slider-value="[250,450]"
>

dfssdfsdfsdf
</body>
</html>