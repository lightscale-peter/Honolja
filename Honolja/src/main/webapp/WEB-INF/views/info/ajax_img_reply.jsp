<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[img_reply.jsp]</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>
	<div class="container">            
		<table class="table">
			<thead>
				<tr>
					<th colspan="2"></th>
				</tr>
				<tr>
			        <th colspan="2">
			        	<!-- 댓글 입력 란 -->
						<div class="form-group" style="margin: 10px 0 10px 0;">
							<form action="img_reply_insert.do">
								<label style="margin-left: 110px;">Comment:</label>
								<textarea id = "ir_content" name="ir_content" style="width: 80%; margin: auto; resize: none;" class="form-control" rows="5" id="comment"></textarea>
								<div style="margin-top: 15px; text-align: right; margin-right: 110px;">
									<input id = "i_no" type="hidden" name="i_no" value="${param.i_no }">
									<input id = "u_id" type="hidden" name="u_id" value="${param.checked }">
									<button id = "reply_btn" type="button" class="btn btn-default">작성 완료</button>
								</div>
							</form>
						</div>
			        </th>
				</tr>
			</thead>
			<tbody>
				<!-- 댓글 출력 란 -->
				<c:forEach var="list" items="${list}">
					<tr>
						<td style="padding: 0 80px 0 80px;">
							<!-- 작성자 -->
							<h3 style="font-weight: bold; margin-top: 10px;">
								${list.u_id }
								<span style="font-weight: normal; font-size: 12px;">
									<fmt:formatDate value="${list.ir_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
							</h3>		 
							<p>
							<!-- 댓글 내용 -->
							${list.ir_content}
						</td>
						<td>
							<!-- 댓글 수정/삭제 버튼 -->
							<button type="button" class="btn btn-success btn-xs">수정</button>
							<button type="button" class="btn btn-danger btn-xs">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>