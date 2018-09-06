<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[login_popup.jsp]</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body style="text-align: center;margin: 50px;">


	${script }


	<form class="form-horizontal" action="/honolja/popup.do" method = "get">
		<div class="form-group">
			<label class="control-label col-sm-2" for="email">Id:</label>
			<div class="col-sm-10">
				<input type="text" name = "id" class="form-control" id="id" placeholder="Enter id">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pwd">Password:</label>
			<div class="col-sm-10"> 
				<input type="password" name = "pwd" class="form-control" id="pwd" placeholder="Enter password">
			</div>
		</div>
		<div class="form-group"> 
			<div class="col-sm-offset-2 col-sm-10">
				<div class="checkbox">
		       	 <label><input type="checkbox"> Remember me</label>
				</div>
			</div>
		</div>
		<div class="form-group"> 
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">로그인</button>
				&nbsp;&nbsp;
				<button type="reset" class="btn btn-default">다시쓰기</button>
			</div>
		</div>
	</form>
</body>
</html>