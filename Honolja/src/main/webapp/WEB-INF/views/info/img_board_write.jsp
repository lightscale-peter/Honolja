<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>[img_board_write.jsp]</title>
	
	<script type="text/javascript">
		function make_file_btn(){
			document.getElementById("update_file").innerHTML = 
				"파일 첨부 : <input style=\"display: inline;\" type=\"file\" name = \"upload_f\">";
		}
		
		function popupWindow(url, title, w, h) {
			
			var left = (screen.width/2) - (w/2);
			var top = (screen.height/2) - (h/2) - 50;
			
			return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
    	}
	</script>
	
</head>
<body style="margin-top: 50px;">
	<c:import url="http://localhost:8080/honolja/header.do">
		<c:param name="img_board" value="${img_board}"></c:param>
		<c:param name="checked" value="${checked}"></c:param>
		<c:param name="host" value="img_board.do"></c:param>
	</c:import>
	
	<!-- Modal(== alert) 기능 구현 시 필요 -->
	<jsp:include page="modal_confirm.jsp"/>
	
	<c:choose>
		<c:when test="${u_id == ''}">
			<script type="text/javascript">
				$(document).ready(function(){
					$('#alertbox').ready(function(){
						$("#error").html("로그인이 필요합니다. 로그인 하시겠습니까?");
						$('#myModal').modal("show");
						$('#check_btn').click(function(){
							popupWindow('login_popup.do?host=' + 'img_board_write.do', 'login', 410, 450);
						});
						$('#cancel_btn').click(function(){
							location.href = 'img_board.do';
						});
					});
				});
			</script>
		</c:when>
		<c:otherwise>
			<div class="container" style="margin-top: 80px;">
				<h2>리뷰 게시판</h2>
				<p>게스트 하우스에 대한 정보를 공유하는 공간입니다. 광고/홍보용 사진은 삭제됨을 알려드립니다.</p> 
				<c:choose>
					<c:when test="${param.i_no != null }">
						<form action="img_board_update_backend.do" enctype="multipart/form-data" method="post">
					</c:when>
					<c:otherwise>
						<form action="img_board_write_backend.do" enctype="multipart/form-data" method="post">
					</c:otherwise>
				</c:choose>           
					<table class="table" style="margin-top: 30px;">
						<thead>
							<tr>
								<th colspan="2" style="font-size: 25px;">
									제목 : <input name = "title" value="${dto.i_title }" style="display: inline; width: 90%;" type="text" class="form-control" id="usr">
								</th>
							</tr>
							<tr>
								<th colspan="2">작성자 : ${checked }</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2" style="height: 500px;">
									<textarea name = "content" class="form-control" id="comment" style="resize: none; height: 100%;">${dto.i_content }</textarea>
								</td>
							</tr>
							<tr>
								<td style="text-align: left;">
									<c:choose>
										<c:when test="${dto.i_originalFileName != null}">
											<span id = "update_file">
												파일 첨부 : <button type="button" class="btn btn-success" onclick="make_file_btn();">파일 변경</button>
												&nbsp;${dto.i_originalFileName}
											</span>
										</c:when>
										<c:otherwise>
											파일 첨부 : <input style="display: inline;" type="file" name = "upload_f">
										</c:otherwise>
									</c:choose>
								</td>
								<td style="text-align: right;">
									<input type="hidden" name="id" value = "${checked}">
									<input type="hidden" name = "i_no" value = "${param.i_no }">
									<button type="submit" class="btn btn-info">작성 완료</button>
									&nbsp;
									<button type="reset" class="btn btn-danger">다시 작성</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>