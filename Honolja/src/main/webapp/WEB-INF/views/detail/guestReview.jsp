<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<c:if test="${review == null}">
		<div class="empty-content">
			<img
				src="https://yaimg.yanolja.com/joy/pw/common/empty/empty-icon__review.svg"
				class="empty__image" alt="img">
			<div class="empty__texts">
				<em class="empty__text">아직 작성된 후기가 없습니다.</em>
			</div>
		</div>
	</c:if>
	<div class="place-room__message">
		<i class="badge-live">바른후기</i>
		<!-- react-text: 1237 -->
		는 숙소에 직접 방문한 회원만 작성할 수 있습니다.
		<!-- /react-text -->
	</div>
	<c:forEach var="review" items="${review}">
		<c:choose>
			<c:when test="${review.re_img == null}">
				<div class="place-review__item ">
					<div class="review-info">
						<div class="review-info__title">
							<span class="badge-rap"><i class="badge-best"><em>${review.re_like}</em></i></span><strong>${review.re_title}</strong>
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
						<p class="review-info__content">${review.re_content}</p>
						<div class="review-userinfo">
							<div class="col-md-1">
								<img src="http://placehold.it/80" class="img-circle" alt="프로필사진"
									width="34px;" />
							</div>
							<div class="col-md-11">
								<span class="nicname">${review.u_id}</span><i class="bar"></i><span
									class="roomtype">${review.i_name}</span><i class="bar"></i><span
									class="date"><fmt:formatDate value="${review.re_date}"
										pattern="yyyy-MM-dd" /></span>
							</div>
						</div>
					</div>
					<hr>
				</div>
			</c:when>
			<c:otherwise>
				<div class="place-review__item.is-thumbnail">
					<div class="row">
						<div class="col-sm-4">
							<div class="place-review__image"
								style="background-image: url(./resources/images/${review.re_img}.jpg); background-size: cover; background-position: center center;"></div>
						</div>
						<div class="col-sm-8" class="review-info">
							<div class="review-info__title">
								<span class="badge-rap"><i class="badge-best"><em>${review.re_like}</em></i></span><strong>${review.re_title}
								</strong>
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
							<p class="review-info__content">${review.re_content}</p>
							<div class="review-userinfo">
								<div class="col-md-1">
									<img src="http://placehold.it/80" class="img-circle"
										alt="프로필사진" width="34px;" />
								</div>
								<div class="col-md-11">
									<span class="nicname">${review.u_id}</span><i class="bar"></i><span
										class="roomtype">${review.i_name}</span><i class="bar"></i><span
										class="date"><fmt:formatDate value="${review.re_date}"
											pattern="yyyy-MM-dd" /></span>
								</div>
							</div>
						</div>
					</div>
					<hr>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</body>
</html>