<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<sec:authentication property="principal" var="pinfo" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap import -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- 추가 import -->
<script src="https://kit.fontawesome.com/1e1a69f988.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="/resources/js/reply2.js"></script>
<script type="text/javascript" src="/resources/js/favorite.js"></script>
<script type="text/javascript"
	src=" //dapi.kakao.com/v2/maps/sdk.js?appkey=f2ce3ae8264eed849df9ea6f9ad313b9&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/contents.css">
<link rel="stylesheet" type="text/css" href="/resources/css/respond.css">
<script type="text/javascript" src="/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/resources/js/slick.min.js"></script>
<script type="text/javascript" src="/resources/js/common_ui.js"></script>
<script type="text/javascript" src="/resources/js/common_fn.js"></script>
<script type="text/javascript" src="/resources/js/calendar.js"></script>
<script type="text/javascript" src="/resources/js/layout.js"></script>
<!-- menu css -->
<!-- <link href="http://www.blueb.co.kr/data/201010/IJ12873478039948/style.css" media="all" rel="stylesheet" type="text/css" /> -->
<!-- font -->
<!-- <link href="https://fonts.googleapis.com/css?family=Prompt:400,500,700" rel="stylesheet"> -->
<!-- kakao login -->
<style>
@font-face { font-family: 'Arita-dotum-Medium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Arita-dotum-Medium.woff') format('woff'); font-weight: normal; font-style: normal; }
*{
	font-family: 'Arita-dotum-Medium';
}
.header{
	float: left;
	/* font-family: 'Prompt', 'Noto Sans KR',dotum,'돋움',vernade,arial,sans-serif; */
	font-family: 'Arita-dotum-Medium';
	display: flex;
	padding-left: 42%;
	margin: 0 auto;
	border: 1px solid none;
}
.header-title{
	display: block;
	padding-top: 10px;
}
.header-login{
	padding-top: 50px;
	justify-content: flex-end;
	margin-left: 300px;
}
.header-menu{

	display: flex;
	border-bottom: 1px solid nono;
	font-family: 'Arita-dotum-Medium';
	padding-left: 33%;
	margin-left: 15px;
	font-size: 20px;
}
</style>
</head>
<body>

	<header>
		<div class='header'>
			<div class='header-title'>
				<h1>
					<a href="/"><img class="header_img maintitle"
						src="https://trello-attachments.s3.amazonaws.com/5d6613e9716d6e23f5e579bb/312x140/3f52467f9d01dd9ce0a0f28eacece66e/%EB%A1%9C%EA%B3%A0.png"
						alt="Cinque Terre"></a>
				</h1>
			</div>
			<div class="header-login">
				<ul class="nav justify-content-center">
					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
							<li class="nav-item" id="side_item"><a
							class="nav-link" href="/admin/main">관리자 페이지</a></li>
						</sec:authorize>
						<sec:authorize access="!hasRole('ROLE_ADMIN')">
							<li class="nav-item" id="side_item"><a
								class="nav-link" href="/member/myPage">나의 페이지</a></li>
						</sec:authorize>
					<li class="nav-item" id="side_item"><a
						class="nav-link" href="/logout">로그아웃</a></li>
					<li class="nav-item" id="side_item"><a
						class="nav-link" href="/exhibition/favoriteList">관심목록</a></li>	
					<li class="nav-item" id="side_item"><a
						class="nav-link" href="/exhibition/recentlyView">최근본상품</a><div></div></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
					<li class="nav-item" id="side_item"><a
						class="nav-link" href="/member/joinForm">회원가입</a></li>
					<li class="nav-item" id="side_item"><a
						class="nav-link" href="/member/loginForm">로그인</a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
		<div class="header-menu">
			<nav class="navbar navbar-expand-sm">
				<div class="collapse navbar-collapse" id="navbarsExample03">
					<ul class="navbar-nav justify-content-center">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown03"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&nbsp;이용안내&nbsp;</a>
							<div class="dropdown-menu" aria-labelledby="dropdown03">
								<a class="dropdown-item" href="#">화랑안내</a> 
								<a class="dropdown-item" href="/notice/noticeList">공지사항</a> 
								<a class="dropdown-item" href="/faq/faqList">FAQ</a>
							</div>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown03"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&nbsp;&nbsp;화랑&nbsp;</a>
							<div class="dropdown-menu" aria-labelledby="dropdown03">
								<a class="dropdown-item" href="/exhibition">공연·전시</a>
								<a class="dropdown-item" href="/exhibition/mapList">네비게이션</a>
							</div>
						</li>
						<li class="nav-item">
        					<a class="nav-link" href="/review/reviewboard">&nbsp;관람후기&nbsp;</a>
        				</li>
        				<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown03"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&nbsp;커뮤니티&nbsp;</a>
							<div class="dropdown-menu" aria-labelledby="dropdown03">
								<a class="dropdown-item" href="/board/freeboard">자유게시판</a>
								<a class="dropdown-item" href="/recommend/recommendboard">홍보</a>
								<a class="dropdown-item" href="/report/reportList">신고</a>
							</div>
						</li>
        				<li class="nav-item">
        					<a class="nav-link" href="/funding/list">&nbsp;크라우드펀딩&nbsp;</a>
        				</li>
					</ul>
				</div>

			</nav>
		</div>
</header>