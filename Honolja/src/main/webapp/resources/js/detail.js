/**
 * 
 */

function roominfo(g_no) {
	$.ajax({
		url : 'roominfo.do',
		type : 'GET',
		data : {
			g_no : g_no
		},
		success : function(data) { // 서버에 대한 정상응답이 오면 실행, callback
			$("#roominfos").tab('show');
			$("#roominfos").html(data);
		}
	});
}

function review(g_no) {
	$.ajax({
		url : 'review.do',
		type : 'GET',
		data : {
			g_no : g_no
		},
		success : function(data) { // 서버에 대한 정상응답이 오면 실행, callback
			$("#reviews").tab('show');
			$("#reviews").html(data);
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}

function reviewBtn() {

<<<<<<< HEAD
	if ($.trim($("#re_content").val()) == "") {
		$('#modal_title').html("확인").css("background-color", "red");
		$('#modal_body').html("댓글 내용을 입력해주세요.");
=======
	if ($.trim($("#re_content").val()) == ""
			|| $.trim($("#re_content").val()) == null) {
		$('#modal_title').html("확인").css("background-color", "red");
		$('#modal_body').html("댓글 내용을 입력해주세요.");
		$("#messageModal").modal("show");
		return false;
	}

	if ($("re_score").val() == null || $("re_score").val() == "") {
		$('#modal_title').html("확인").css("background-color", "red");
		$('#modal_body').html("별점을 선택해 주세요.");
>>>>>>> branch 'master' of https://github.com/duracelldog/Honolja
		$("#messageModal").modal("show");
		return false;
	}

	var dataForm = $('#reviewForm').serialize();

	$.ajax({
		url : 'reviewAdd.do',
		type : 'post',
		data : dataForm,
		success : function(data) { // 서버에 대한 정상응답이 오면 실행, callback
			$('#modal_title').html("확인");
			$('#modal_body').html("저장 되었습니다.");
			$("#messageModal").modal("show");
			$("#reviews").html(data);
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	})
}

function remove(re_no, g_no) {

	$.ajax({
		url : 'reviewDel.do',
		type : 'post',
		data : {
			re_no : re_no,
			g_no : g_no
		},
		success : function(data) {
			$('#modal_title').html("확인");
			$('#modal_body').html("삭제 되었습니다.");
			$("#messageModal").modal("show");
			$("#reviews").html(data);
		}
	})
}

function premodify(re_no) {

	if (confirm("수정 하시겠습니까??")) {

		$.ajax({
			url : 'reviewPremod.do',
			type : 'post',
			data : {
				re_no : re_no
			},
			success : function(data) {
				$("#reviewModify_" + re_no).html(data);
				$('#reviewModify_' + re_no).focus();
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
}

function modify(re_no) {

	var dataForm = $('#modifyForm').serialize();

	$.ajax({
		url : 'reviewModify.do',
		type : 'post',
		data : dataForm,
		success : function(data) {
			$("#reviews").html(data);
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	})
}

function answer(re_no, g_no) {

	var dis = $("#view_" + re_no).css("display");

	if (dis == 'none') {
		$.ajax({
			url : 'answerPreAdd.do',
			type : 'post',
			data : {
				re_no : re_no,
				g_no : g_no
			},
			success : function(data) {
				$("#view_" + re_no).show();
				$("#view_" + re_no).focus();
				$("#view_" + re_no).html(data);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	} else {
		$("#view_" + re_no).hide();
	}
}

function answerAdd() {

	var dataForm = $("#answerForm").serialize();

	$.ajax({
		url : 'answerAdd.do',
		type : 'post',
		data : dataForm,
		success : function(data) {
			$("#reviews").html(data);
			$('#modal_title').html("확인");
			$('#modal_body').html("저장 되었습니다.");
			$("#messageModal").modal("show");
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	})
}

function answerView(re_no) {
	var dis = $("#view_" + re_no).css("display");

	if (dis == 'none') {
		$.ajax({
			url : 'answer.do',
			type : 'post',
			data : {
				re_no : re_no
			},
			success : function(data) {
				$("#view_" + re_no).show();
				$("#view_" + re_no).focus();
				$("#view_" + re_no).html(data);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	} else {
		$("#view_" + re_no).hide();
	}
}

function modifyClose(re_no) {
	$('#reviewModify_' + re_no).hide();
	$('#reviewModify_' + re_no).focus();
}

function answerDel(re_no, g_no) {

	$.ajax({
		url : 'answerDel.do',
		type : 'post',
		data : {
			re_no : re_no,
			g_no : g_no
		},
		success : function(data) {
			$('#modal_title').html("확인");
			$('#modal_body').html("삭제 되었습니다.");
			$("#messageModal").modal("show");
			$("#reviews").html(data);

		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	})
}