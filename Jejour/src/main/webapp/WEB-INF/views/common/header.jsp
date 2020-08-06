<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>Jejour</title>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/LogoMini.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,600,700" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    
    <style>
 		@FONT-FACE {
			font-family: 'bm';
			src:url("${pageContext.request.contextPath}/resources/fonts/JejuHallasan.ttf");
		}
    </style>
  </head>
  <body>
    
    <c:if test="${ !empty member }">
    <div style="font-size: 13px; color: white; background: transparent !important; position: absolute; left: 0; right: 0; z-index: 3; text-align: right; margin-right: 30px;">
      <div style="height: 10px;"></div>
      <p>${ member.userName }님, 환영합니다!</p>
    </div>
    </c:if>
    
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
      <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/intro/main.do">
        <img src="${pageContext.request.contextPath}/resources/images/Logo.png" alt="Jejour" style="width: 180px; height: 50px;" /></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
          <ul class="navbar-nav ml-auto">
            <%-- <li class="nav-item active"><a href="${pageContext.request.contextPath}" class="nav-link">Home</a></li> --%>
            <li class="nav-item dropdown">
              <a href="" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Plan</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/planner/plannerSee.do">Schedule</a>
                <a class="dropdown-item" href="#" onclick="goReservation();">Reservation</a>
              </div>
            </li>
            <!--<li class="nav-item"><a href="#" class="nav-link">Developer</a></li>-->
            <li class="nav-item"><a href="${pageContext.request.contextPath}/planner/plannerShare.do" class="nav-link">Share Plan</a></li>
    		<li class="nav-item"><a href="${pageContext.request.contextPath}/tour/tourList.do" class="nav-link">Place</a></li>
            <li class="nav-item dropdown">
              <a href="" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Board</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/hotspotBoard/hotspotList.ho">HotSpot</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/flashBoard/flashList.fl">Meet</a>
              </div>
            </li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/topN/topN.do?category=숙박" class="nav-link">Top 10</a></li>
            <c:if test="${ empty member }">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/member/memberLoginFormView.do" class="nav-link">Login</a></li>
            </c:if>
            <c:if test="${ !empty member }">
            <li class="nav-item dropdown">
              <a href="" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Page</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberUpdateFormView.do">Update Info</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberPlan.do?userId=${member.userId}">My Plan</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/HotspotBoard/myHotspot.ho?userId=${member.userId}">My HotSpot</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/flashBoard/myFlash.fl?userId=${member.userId}">My Meet</a>
                <c:if test="${member.userId eq 'admin'}">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/admin.do">Manager</a>
                </c:if>
              </div>
            </li>
            </c:if>
            <c:if test="${ !empty member }">
            <li class="nav-item"><a href="#" class="nav-link" onclick="logOutCheck();">LogOut</a></li>
            </c:if>
            
          </ul>
        </div>
      </div>
    </nav>
    <!-- END nav -->
    
    <c:if test="${ param.data ne 'main' }">
	    <section class="home-slider owl-carousel">
	      <div class="slider-item" style="background-image: url('${pageContext.request.contextPath}/resources/images/beach.jpg');">
	        <div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text align-items-center">
	            <div class="col-md-7 col-sm-12 ftco-animate">
                    <c:if test="${ param.data eq 'flash' }">
                    <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home</a></span> <span><a href="#">Board</a></span></p>
                    <h1 class="mb-3">Meeting</h1>
                    </c:if>
                    <c:if test="${ param.data eq 'hotSpot' }">
                    <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home</a></span> <span><a href="#">Board</a></span></p>
                    <h1 class="mb-3">HotSpot</h1>
                    </c:if>
                    <c:if test="${ param.data eq 'sharePlan' }">
                    <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home</a></span> <span><a href="#">Plan</a></span></p>
                    <h1 class="mb-3">SharePlan</h1>
                    </c:if>
                    <c:if test="${ param.data eq 'jejuPlace' }">
                    <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home</a></span> <span><a href="#">Place</a></span></p>
                    <h1 class="mb-3">Jeju Place</h1>
                    </c:if>
                    <c:if test="${ param.data eq 'myFlash' }">
                    <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home</a></span> <span><a href="#">My Page</a></span></p>
                    <h1 class="mb-3">My Meeting</h1>
                    </c:if>
                    <c:if test="${ param.data eq 'myPlan' }">
                    <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home</a></span> <span><a href="#">My Page</a></span></p>
                    <h1 class="mb-3">My Plan</h1>
                    </c:if>
                    <c:if test="${ param.data eq 'myHotSpot' }">
                    <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home</a></span> <span><a href="#">My Page</a></span></p>
                    <h1 class="mb-3">My HotSpot</h1>
                    </c:if>
                    <c:if test="${ param.data eq 'schedule' }">
                    <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home</a></span> <span><a href="#">Plan</a></span></p>
                    <h1 class="mb-3">Schedule</h1>
                    </c:if>
                    <c:if test="${ param.data eq 'top10' }">
                    <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home</a></span> <span><a href="#">Top 10</a></span></p>
                    <h1 class="mb-3">Top 10</h1>
                    </c:if>
	            </div>
	          </div>
	        </div>
	      </div>
	    </section>
    </c:if>
    
    <c:if test="${ param.data eq 'main' }">
    <section class="home-slider owl-carousel">
      <div class="slider-item" style="background-image: url('${pageContext.request.contextPath}/resources/images/beach.jpg');">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center">
            <div class="col-md-7 col-sm-12 ftco-animate">
              <h1 class="mb-3" style="font-family: bm;">Jejour로 <br>혼저옵서예</h1>
            </div>
          </div>
        </div>
      </div>

      <div class="slider-item" style="background-image: url('${pageContext.request.contextPath}/resources/images/horse.jpg');">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center">
            <div class="col-md-7 col-sm-12 ftco-animate">
              <h1 class="mb-3" style="font-family: bm;">제주 여행의 모든 것 <br>Jejour</h1>
            </div>
          </div>
        </div>
      </div>

      <div class="slider-item" style="background-image: url('${pageContext.request.contextPath}/resources/images/sanbang.jpg');">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center">
            <div class="col-md-7 col-sm-12 ftco-animate">
              <h1 class="mb-3" style="font-family: bm;">어디론가 <br>떠나고 싶을때 </h1>
            </div>
          </div>
        </div>
      </div>
    </section>
    </c:if>
    
    <script>
    function goReservation() {
    window.open('${pageContext.request.contextPath}/planner/goReservation.do','reservationPage','width=1350,height=950');
    };
    
    function logOutCheck() {

    	 if (confirm("어디가삼 ㅠㅠㅠ 진짜 로그아웃하삼?") == true){    

    	    location.href="${pageContext.request.contextPath}/member/memberLogout.do"; 

    	 }else{   //취소

    	     return false;

    	 }

    };
    </script>
    