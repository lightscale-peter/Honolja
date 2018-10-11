<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
	<script type="text/javascript">
	function del(b_no) {
		
		if(confirm("게시글을 삭제하시겠습니까?")==true) {
			location.href = "boarddelete.do?idx="+b_no;
		}
			return false;
	}
	
	</script>
  
</head>
<body id="page-top" style="margin-top:51px;" >

	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="checked" value="${checked}" />
		<c:param name="host" value="main.do" />
	</c:import>
	
	<div class="container">
		<h2> <a href="board.do">자유게시판</a> </h2>
		<form>
			<div class="form-group">
				<label for="usr">제목:</label>
				 <input type="text" class="form-control" id="usr" readonly="readonly" value="${dto.b_title}"> <br>
				<label for="comment">Comment:</label>
				<textarea name="b_content" class="form-control" rows="10" id="comment" readonly="readonly">${dto.b_content}  </textarea>
			</div>
		</form>
		
		<c:if test="${dto.b_originalfilename  != null }">
			<img src='${pageContext.request.contextPath}/resources/bupload/${img}' width=100 height=100 border=0> <br> 
			<font color="red"> ${dto.b_originalfilename} </font>
		</c:if>
		<c:if test="${sessionScope.checked eq dto.u_id}">
			<span style="float: right">
				<a href ="boardedit.do?idx=${dto.b_no}">[수정]</a> 
				<a href="javascript:void(0);" onclick="del(${dto.b_no});">[삭제]</a> 
			</span>
		</c:if>
		<c:import url="/boardreply.do" />
	</div>





</body>
</html> 