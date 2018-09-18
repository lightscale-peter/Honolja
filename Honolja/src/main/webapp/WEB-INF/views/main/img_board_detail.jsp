<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[img_board_detail.jsp]</title>
</head>
<body style="margin-top: 50px;">
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="img_board" value="${img_board}"></c:param>
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="img_board.do"></c:param>
	</c:import>

	<div class="container" style="margin-top: 80px;">
		<h2>여행지정보 게시판</h2>
		<p>여행지에 대한 정보를 공유하는 공간입니다. 광고/홍보용 사진은 삭제됨을 알려드립니다.</p>            
		<table class="table" style="margin-top: 30px;">
			<thead>
				<tr>
					<th colspan="4" style="font-size: 25px;">제목 : ${dto.i_title }</th>
				</tr>
				<tr>
					<th>작성자 : ${dto.u_id }</th>
					<th>
						작성일 : <fmt:formatDate value="${dto.i_date }" pattern="yyyy-MM-dd"/>
					</th>
					<th>조회수 : ${dto.i_viewcnt }</th>
					<th>추천수 : ${dto.i_starcnt }</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4">
						첨부이미지 : <a href = "img_board_detail_download.do?i_no=${param.i_no}">
						${dto. i_originalFileName}</a>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="height: 500px;">${dto.i_content}</td>
				</tr>

				<tr>
					<td colspan="4" style="text-align: right;">
						<button type="button" class="btn btn-default btn-sm">
							<span class="glyphicon glyphicon-thumbs-up"></span> Like
				        </button>
				        &nbsp;
						<button type="button" class="btn btn-info">글 수정</button>
						&nbsp;
						<button type="button" class="btn btn-danger">글 삭제</button>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
</body>
</html>