<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Reply</title>

<script type="text/javascript">
	function check() {
		var content = myform2.br_content.value;

		if (content == "" || content == null) {
			alert("댓글 입력해주세요.");
			myform2.br_content.focus();
			return false;
		}
		document.myform2.submit();
	}

	function del2() {
		var br_no = document.getElementById("br_no").value;
		var b_no = document.getElementById("b_no").value;
		if (confirm("댓글을 삭제하시겠습니까?") == true) {
			location.href = "boardreplydelete.do?idx=" + b_no + "&br_no="+ br_no;
		}
		return false;
	}
</script>

</head>

<body>

	<form name="myform2" method="post" action="boardreplyinsert.do" onsubmit="check(); return false;">
		<br>
		 <span><strong>Comments</strong></span> <span id="cCnt"></span>
		<div class="input-group">
			 <textarea style="width: 1140px" rows="3" cols="30" id="comment" name="br_content" placeholder="댓글을 입력하세요"></textarea>
			<input type="submit" value="등록" class="btn pull-right btn-success"> <input type="hidden" name="b_no" value="${dto.b_no}" >
		</div>
	</form>

	<form>
	<br>
<li id="note-title" class="list-group-item note-title">
<div class="form-group">

	<h3 class="panel-title">
	
		댓글 <span id="note-count">${rcnt}</span>
		
	</h3>
</div>
</li>

	<c:forEach var="dto" items="${list}">
	<li id="note-title" class="list-group-item note-title">
		<div class="media-body">
			<div class="media-heading">
				<b><a href="javascript:void(0);" onclick="showSideView(this, 'bsocks', 'kk', '', '');"> 
				<span class="member"> ${dto.u_id }</span></a></b> <span
					class="font-11 text-muted"> <span class="media-info">
						<i class="fa fa-clock-o"></i> ${dto.br_date}
				</span> 
				 <a href="boardrreplyinsertForm.do?idx=${dto.b_no}&br_no=${dto.br_no}" onclick="reply();">댓글달기</a></span>
				<div class="media-content"> ${dto.br_content} </div>
			</div>
		</div>
			<input type="hidden" id="br_no" name="br_no" value="${dto.br_no}">
			<input type="hidden" id="b_no" name="b_no" value="${dto.b_no}">
		<div align="right">
			<a href="boardreplyedit.do?idx=${dto.b_no}&br_no=${dto.br_no}">[수정]</a>
			<a href="javascript:void(0);" onclick="contentedit(${b_no.br_content});">[수정222222]</a> 
			<a href="javascript:void(0);" onclick="del2(); return false; ">[삭제]</a>
		</div>
		
			<br>
		<div id="reply">
		</div>		
			</li>
			
	<c:import url="/boardrreply.do?idx=${dto.b_no}&br_no=${dto.br_no}" /> 
		</c:forEach>
	
</form>
                                    

          

<script type="text/javascript">
function contentedit(br_content) {
	 window.name = "parentForm";
     window.open("CommentUpdateFormAction.co?num="+comment_num,
                 "updateForm", "width=570, height=350, resizable = no, scrollbars = no");
}

function reply() {
	$("#reply").append("ddddddddddddddddddddddd");
}


</script>

</body>
</html>
