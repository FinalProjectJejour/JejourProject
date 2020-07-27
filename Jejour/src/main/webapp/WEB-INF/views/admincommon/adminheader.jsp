<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>JEJOUR ADMIN</title>

  <!-- CSS추가 -->
  <link href="${pageContext.request.contextPath}/resources/images/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/images/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${pageContext.request.contextPath}/resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/lib/gritter/css/jquery.gritter.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/lib/advanced-datatable/css/DT_bootstrap.css" />
  <link href="${pageContext.request.contextPath}/resources/lib/advancedle/css/-datatabdemo_table.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/lib/advanced-datatable/css/demo_page.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/lib/advanced-datatable/css/demo_table.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/table-responsive.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/admin-style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/style-responsive.css" rel="stylesheet">
  
<script src="${pageContext.request.contextPath}/resources/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/lib/bootstrap/js/bootstrap.min.js"></script>	

<script src="${pageContext.request.contextPath}/resources/lib/advanced-datatable/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/resources/lib/advanced-datatable/js/DT_bootstrap.js"></script>

<script class="include" src="${pageContext.request.contextPath}/resources/lib/jquery.dcjqaccordion.2.7.js"></script>
	
	
</head>

<body>
  <section id="container">
  <!--관리자페이지 헤더-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--좌상단로고-->
      <a href="${pageContext.request.contextPath}/admin/admin.do" class="logo"><b>JEJO<span>UR</span></b></a>
      <!--로고끝-->
      <div class="nav notify-row" id="top_menu">
        
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="login.html">Logout</a></li>
        </ul>
      </div>
    </header>
    <!--헤더끝-->
