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
        <a class="navbar-brand" href="${pageContext.request.contextPath}">Jejour</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active"><a href="${pageContext.request.contextPath}" class="nav-link">Home</a></li>
            <li class="nav-item dropdown">
              <a href="" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Plan</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/planner/plannerSee.do">Schedule</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/reservation.do">Reservation</a>
              </div>
            </li>
            <!--<li class="nav-item"><a href="#" class="nav-link">Developer</a></li>-->
            <li class="nav-item"><a href="${pageContext.request.contextPath}/planner/plannerShare.do" class="nav-link">Share Plan</a></li>
            <li class="nav-item dropdown">
              <a href="" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Board</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/hotspotBoard/hotspotList.ho">HotSpot</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/flashBoard/flashList.fl">Meet</a>
              </div>
            </li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/topN/topN.do" class="nav-link">Top N</a></li>
            <c:if test="${ empty member }">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/member/memberLoginFormView.do" class="nav-link">Login</a></li>
            </c:if>
            <c:if test="${ !empty member }">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/member/memberLogout.do" class="nav-link">LogOut</a></li>
            </c:if>
            
            <c:if test="${ !empty member }">
            <li class="nav-item dropdown">
              <a href="" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Page</a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberUdpate.do">Update Info</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberPlan.do">My Plan</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/admin.do">Manager</a>
              </div>
            </li>
            </c:if>
          </ul>
        </div>
      </div>
    </nav>
    <!-- END nav -->
    
    <section class="home-slider owl-carousel">
      <div class="slider-item" style="background-image: url('${pageContext.request.contextPath}/resources/images/beach.jpg');">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center">
            <div class="col-md-7 col-sm-12 ftco-animate">
              <h1 class="mb-3">Experience the best trip ever</h1>
            </div>
          </div>
        </div>
      </div>

      <div class="slider-item" style="background-image: url('${pageContext.request.contextPath}/resources/images/horse.jpg');">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center">
            <div class="col-md-7 col-sm-12 ftco-animate">
              <h1 class="mb-3">Making the most out of your holiday</h1>
            </div>
          </div>
        </div>
      </div>

      <div class="slider-item" style="background-image: url('${pageContext.request.contextPath}/resources/images/sanbang.jpg');">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-center">
            <div class="col-md-7 col-sm-12 ftco-animate">
              <h1 class="mb-3">Travel Operator Just For You</h1>
            </div>
          </div>
        </div>
      </div>
    </section>
    