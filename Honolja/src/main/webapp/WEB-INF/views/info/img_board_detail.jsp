<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[img_board_detail.jsp]</title>
	
	<script type="text/javascript">
	
		function like_btn_ajax(btn_flag){
				
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					document.getElementById("like_btn").innerHTML = this.responseText;
				}
			};
			
			if(btn_flag == 1){
				xhr.open("GET", "http://localhost:8080/honolja/like_btn.do?btn_flag=unlike&i_no=" + ${param.i_no} + "&u_id=" + "${checked}", true);
			}else if(btn_flag == 2){
				xhr.open("GET", "http://localhost:8080/honolja/like_btn.do?btn_flag=none&i_no=" + ${param.i_no} + "&u_id=" + "${checked}", true);
			}else{
				xhr.open("GET", "http://localhost:8080/honolja/like_btn.do?btn_flag=like&i_no=" + ${param.i_no} + "&u_id=" + "${checked}", true);
			}
			
			xhr.send();
		}
	
	</script>
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
					<td colspan="4" style="height: 500px;">
						<img style="display: block; margin: auto;" src="resources/info_images/${dto. i_originalFileName}">
						${dto.i_content}
					</td>
				</tr>

				<tr>
					<td style="text-align: left;">
						<button type="button" class="btn btn-default" onclick="location.href='img_board.do'">
							<span class="glyphicon glyphicon-list"></span> 리스트
				        </button>
					</td>
					<td colspan="3" style="text-align: right;">
						<span id = "like_btn">
							<c:choose>
								<c:when test="${likeCheck.il_like == 'like' }">
									<button type="button" class="btn btn-primary" onclick="like_btn_ajax(1);">
										<span class="glyphicon glyphicon-thumbs-up"></span> Like
									</button>
								</c:when>
								<c:when test="${likeCheck.il_like == 'unlike' }">
									<button type="button" class="btn btn-danger" onclick="like_btn_ajax(2);">
										<span class="glyphicon glyphicon-thumbs-down"></span> Unlike
									</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-default btn-sm" onclick="like_btn_ajax(3);">
										<span class="glyphicon glyphicon-thumbs-up"></span> Like
									</button>
								</c:otherwise>
							</c:choose>
				        </span>
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