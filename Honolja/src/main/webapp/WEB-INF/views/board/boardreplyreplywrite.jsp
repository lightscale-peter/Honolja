<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>대댓글</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">

</head>
<body>
	<form method="post" action="boardrreplyinsert.do">
		<br>
		<div class="input-group">
			<span class="input-group-addon">댓글</span> 
			<input id="msg" type="text" class="form-control" name="brr_content" placeholder="댓글을 입력하세요.">
			 <input type="hidden" name="b_no" value="${b_no}"> 
			 <input type="hidden" name="br_no" value="${br_no}">
			 <input type="submit" value="등록">
		</div>
	</form>

</body>
</html>