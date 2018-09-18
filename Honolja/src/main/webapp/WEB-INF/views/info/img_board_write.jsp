<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[img_board_write.jsp]</title>
</head>
<body style="margin-top: 50px;">
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="img_board" value="${img_board}"></c:param>
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="img_board.do"></c:param>
	</c:import>

	<div class="container" style="margin-top: 80px;">
		<h2>리뷰 게시판</h2>
		<p>게스트 하우스에 대한 정보를 공유하는 공간입니다. 광고/홍보용 사진은 삭제됨을 알려드립니다.</p> 
		<form action="img_board_write_backend.do" enctype="multipart/form-data" method="post">           
			<table class="table" style="margin-top: 30px;">
				<thead>
					<tr>
						<th colspan="2" style="font-size: 25px;">
							제목 : <input name = "title" style="display: inline; width: 90%;" type="text" class="form-control" id="usr">
						</th>
					</tr>
					<tr>
						<th colspan="2">작성자 : ${checked }</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" style="height: 500px;">
							<textarea name = "content" class="form-control" id="comment" style="resize: none; height: 100%;"></textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align: left;">
							파일 첨부 : <input style="display: inline;" type="file" name = "upload_f">
						</td>
						<td style="text-align: right;">
							<input type="hidden" name="id" value = "${checked}">
							<button type="submit" class="btn btn-info">작성 완료</button>
							&nbsp;
							<button type="reset" class="btn btn-danger">다시 작성</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>