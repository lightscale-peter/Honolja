<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[img_reply_of_reply.jsp]</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>
	<!-- 댓글 출력 란 -->
	<c:forEach var="list_rr" items="${list_rr}" varStatus="j">
		<tr>
			<td style="padding: 0 80px 0 150px;">
				<!-- 작성자 -->
				<h3 style="font-weight: bold; margin-top: 10px;">
					<img style="width: 20px;" src="resources/info_images/reply_icon.PNG">
					${list_rr.u_id}
					<span style="font-weight: normal; font-size: 12px;">
						<fmt:formatDate value="${list_rr.irr_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span>
				</h3>		 
				<p>
				<!-- 댓글 내용 -->
				${list_rr.irr_content}
			</td>
			<td style="vertical-align: middle;">
			<!-- 댓글 수정/삭제 버튼 -->		
				<button type="button" class="btn btn-success btn-xs" onclick="reply_update(${j.index}, ${list.irr_no });">수정</button>
				<button type="button" class="btn btn-danger btn-xs" onclick = "delete_reply_confirm(${list.irr_no});">삭제</button>
			</td>
		</tr>
	</c:forEach>
</body>
</html>