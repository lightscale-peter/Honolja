<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>대댓글리스트</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">

</head>
<body>

	<c:forEach var="dto" items="${list}">
	<li id="note-title" class="list-group-item note-title" style="margin-left: 10%;">
	
	<div class="media" id="c_5818" >
		<div class="photo pull-left" >
			<div class="media-object" >
			</div>
		</div>
	</div>
		<div class="media-body" >
			<div class="media-heading">
				<b><a href="javascript:void(0);" onclick="showSideView(this, 'bsocks', '갈루노', '', '');"> 
				<span class="member"> ${dto.u_id }</span></a></b> <span
					class="font-11 text-muted"> <span class="media-info">
						<i class="fa fa-clock-o"></i> ${dto.brr_date}
				</span> 
				 <a href="boardrreplyinsertForm.do?idx=${dto.b_no}&br_no=${dto.brr_no}">답글달기</a></span>
				<div class="media-content"> ${dto.brr_content} 
				 &nbsp;
				 </div>
			</div>
		</div>
			<input type="hidden" id="br_no" name="br_no" value="${dto.br_no}">
			<input type="hidden" id="b_no" name="b_no" value="${dto.b_no}">
		
		<div align="right">
					 <a href="boardrreplyedit.do?idx=${dto.b_no}&br_no=${dto.brr_no}">[수정]</a>
					 <a href="boardrreplydelete.do?idx=${b_no}&brr_no=${dto.brr_no}">[삭제]</a>
		</div>
			<br>
			</li>
		</c:forEach>
	
	
</body>
</html>