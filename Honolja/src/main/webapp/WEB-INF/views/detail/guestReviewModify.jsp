<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lpJuL0fDxe8fMB7Sysgn&submodules=geocoder"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lpJuL0fDxe8fMB7Sysgn&submodules=geocoder"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="./resources/js/detail.js"></script>
<style type="text/css">
.review-info-title {
	margin-bottom: 20px;
}

.review-info {
	display: block;
	padding: 30px 10px;
	min-height: 140px;
}

.review-userinfo {
	margin-top: 20px;
	font-size: 13px;
	color: #888;
}

.review-userinfo .bar {
	margin: 0 10px;
	width: 1px;
	height: 13px;
	background-color: #ddd;
	display: inline-block;
	vertical-align: middle;
}

.review-info__content {
	font-size: 15px;
}

.badge-best {
	background-color: #ff2d60;
}

.badge-best, .badge-live, .badge-visited {
	color: #fff;
	display: inline-block;
	font-size: 12px;
	padding: 3px 5px 2px;
	margin-right: 5px;
}

.place-room__message {
	min-height: 22px;
	margin-top: 30px;
	padding: 18px 20px 14px;
	background-color: #f1fcfc;
	border: 1px solid #e3eded;
	font-size: 13px;
}

a {
	color: #666666;
	text-decoration: none;
	cursor: pointer;
}

i, em, address {
	font-style: normal;
}

.icon-staylist-score {
	width: 16px;
	height: 16px;
}

.icon-staylist-score.score10 {
	background-position: 0 0;
}

.icon-staylist-score.score05 {
	background-position: -18px 0;
}

.icon-staylist-score.score00 {
	background-position: -38px 0;
}

.icon-staylist {
	display: inline-block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	vertical-align: middle;
	background:
		url(https://yaimg.yanolja.com/joy/pw/search/icon-staylist.svg)
		no-repeat;
}

.review-info__content {
	font-size: 15px;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.place-review__item.is-thumbnail .review-info {
	padding-left: 240px;
}

.place-review__image {
	left: 10px;
	top: 30px;
	width: 210px;
	height: 140px;
}

.empty-content {
	padding: 200px 0 120px;
	text-align: center;
}

.empty__text {
	color: #333;
	font-size: 14px;
	font-weight: 700;
}

.empty__sub-text, .empty__text {
	display: block;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<form id="modifyForm" method="post">
			<input type="hidden" value="${review.re_no}" name="re_no"> <input
				type="hidden" value="${review.u_id}" name="u_id"> <input
				type="hidden" value="${review.i_name}" name="i_name"> <input
				type="hidden" value="${review.g_no}" name="g_no">
			<div class="row">
				<c:if test="${review.re_img != null}">
					<div class="col-sm-4">
						<div class="place-review__image"
							style="background-image: url(./resources/images/${review.re_img}.jpg); background-size: cover; background-position: center center;"></div>
					</div>
				</c:if>
				<br>
				<div class="col" class="review-info">
					<div class="review-info__title">
						<div class="form-group">
							<span class="badge-rap"><i class="badge-best"><em>${review.re_like}</em></i></span>
							<c:if test="${review.re_score == 5 }">
								<span class="score-rap pull-right"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i></span>
							</c:if>
							<c:if test="${review.re_score == 4 }">
								<span class="score-rap pull-right"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:if>
							<c:if test="${review.re_score == 3 }">
								<span class="score-rap pull-right"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:if>
							<c:if test="${review.re_score == 2 }">
								<span class="score-rap pull-right"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:if>
							<c:if test="${review.re_score == 1 }">
								<span class="score-rap pull-right"><i
									class="icon-staylist icon-staylist-score score10"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i><i
									class="icon-staylist icon-staylist-score score00"></i></span>
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<input class="form-control" type="text" name="re_title"
							value="${review.re_title}">
					</div>
					<div class="form-group">
						<textarea class="form-control" rows="4" cols="100%"
							name="re_content">${review.re_content}</textarea>
					</div>
					<div class="review-userinfo">
						<div class="form-group col-md-4">
							<img
								src="//member.yanolja.com/include/img/picture/default_picture.png"
								class="img-circle" alt="프로필사진" width="34px;" /> <span
								class="nicname">${review.u_id}</span><i class="bar"></i><span
								class="roomtype">${review.i_name}</span><i class="bar"></i><span
								class="date"><fmt:formatDate value="${review.re_date}"
									pattern="yyyy-MM-dd" /></span>
						</div>
						<div class="form-group col-md-3">
							<select class="form-control sm-3" id="re_like" name="re_like">
								<option value="추천" selected="selected">추천</option>
								<option value="비추천">비추천</option>
							</select>
						</div>
						<div class="form-group col-md-3">
							<select class="form-control sm-3" id="re_score" name="re_score">
								<option selected="selected">별점</option>
								<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5">★★★★★</option>
							</select>
						</div>
						<div class="btn-group pull-right">
							<button type="submit" class="btn btn-info" role="button"
								onclick="modify(${review.re_no})">확인</button>
							<button type="button" class="btn btn-secondary" role="button"
								onclick="review(${review.g_no})">취소</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>