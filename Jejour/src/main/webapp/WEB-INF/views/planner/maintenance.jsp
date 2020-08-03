<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Voyage - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,600,700" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">

    
    <c:import url="../common/header.jsp" />

  </head>
  <body>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="row">

              <section class="history spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title history-title">
                                <h5>Our History</h5>
                                <h2>How I Plan</h2>
                                <form name="instanceMakePlan" action="${pageContext.request.contextPath}/planner/instanceMakePlan.do" method="post">
                                	<input type="hidden" name="pNo" id="pNo" value="${pNo}">
                                	<input type="hidden" name="startDay" id="startDay" value="${startDay}">
                                	<input type="hidden" name="endDay" id="endDay" value="${endDay}">
                                	<input type="submit" class="search-submit btn btn-primary" value="+일정">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="history__content">
                        <div class="row">
                            <div class="col-lg-5 col-md-5">
                            	
                            	<c:forEach items="${list}" var="pl" varStatus="status" begin="0" step="2">
                            		<div class="history__item left__item">
                            			<div class="history__date"></div>
                            			<span>'${pl.startTime}'</span>
                            			<h4><c:out value="${pl.mapTitle}"/></h4>
                            			<img src="img/history/history-1.jpg" alt="">
                            			<p><c:out value="${pl.money}"/>원</p>
                            			<p><c:out value="${pl.reason}"/></p>
                            			
                            			<form name="instanceUpdatePlan" action="${pageContext.request.contextPath}/planner/instanceUpdatePlan.do" method="post">
                            				<input type="hidden" name="ppNo" id="ppNo" value="${pl.ppNo}">
                                        	<input type="hidden" name="pNo" id="pNo" value="${pNo}">
                                        	<input type="submit" class="search-submit btn btn-primary" value="수정" style="background-color: green;">
                                        </form>
                                        <form name="instanceDeletePlan" action="${pageContext.request.contextPath}/plannerPart/instanceDeletePlan.do" method="post">
                                        	<input type="hidden" name="ppNo" id="ppNo" value="${pl.ppNo}">
                                        	<input type="hidden" name="pNo" id="pNo" value="${pNo}">
                                        	<input type="submit" class="search-submit btn btn-primary" value="삭제" style="background-color: red;">
										</form>
                            		</div>
                            	</c:forEach>
                            	
                            </div>
                            <div class="col-lg-5 offset-lg-2 col-md-5 offset-md-2">
                            
                            	<c:forEach items="${list}" var="pl" varStatus="status" begin="1" step="2">
                            		<c:if test="${list[0] ne null }">
                            			<div class="history__item right__first__item">
                            		</c:if>
                            		<c:if test="${status.index ne 0 }">
                            			<div class="history__item mb-0">
                            		</c:if>
                            			<div class="history__date"></div>
                            			<span>'${pl.startTime}'</span>
                            			<h4><c:out value="${pl.mapTitle}"/></h4>
                            			<img src="img/history/history-1.jpg" alt="">
                            			<p><c:out value="${pl.money}"/>원</p>
                            			<p><c:out value="${pl.reason}"/></p>
                            			
                                       <form name="instanceUpdatePlan" action="${pageContext.request.contextPath}/planner/instanceUpdatePlan.do" method="post">
                            				<input type="hidden" name="ppNo" id="ppNo" value="${pl.ppNo}">
                                        	<input type="hidden" name="pNo" id="pNo" value="${pNo}">
                                        	<input type="submit" class="search-submit btn btn-primary" value="수정" style="background-color: green;">
                                        </form>
                                       <form name="instanceDeletePlan" action="${pageContext.request.contextPath}/plannerPart/instanceDeletePlan.do" method="post">
                                        	<input type="hidden" name="ppNo" id="ppNo" value="${pl.ppNo}">
                                        	<input type="hidden" name="pNo" id="pNo" value="${pNo}">
                                        	<input type="submit" class="search-submit btn btn-primary" value="삭제" style="background-color: red;">
										</form>
                            			</div>
                            			
                            	
                            	</c:forEach>
                                


                        </div>
                    </div>
                </div>
            </section>
            <!-- History Section End -->
            
            </div>  
          </div>
          <!-- END -->
          <!---->
          <div class="col-lg-4 sidebar">
          <!-- 
            <div class="sidebar-box ftco-animate">
              <div class="search-tours bg-light p-4">
                <h3>Cost</h3>
                <form action="" method="post">
                  <div class="fields">
                    <div class="row flex-column">

                      <div class="textfield-search col-sm-12 group mb-3"><input type="text" class="form-control" placeholder="Search Location"></div>

                      <div class="check-in col-sm-12 group mb-3"><input type="text" id="checkin_date" class="form-control" placeholder="Check-in date"></div>

                      <div class="check-out col-sm-12 group mb-3"><input type="text" id="checkout_date" class="form-control" placeholder="Check-out date"></div>
                      <div class="select-wrap col-sm-12 group mb-3">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="" id="" class="form-control">
                          <option value="">Guest</option>
                          <option value="">1</option>
                          <option value="">2</option>
                          <option value="">3</option>
                          <option value="">4+</option>
                        </select>
                      </div>
                      <div class="col-sm-12 group mb-3">
                        <input type="submit" class="search-submit btn btn-primary" value="Confirm">
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
			 -->
			<div class="sidebar-box ftco-animate">
              <h3>Tag Cloud</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">나혼자</a>
                <a href="#" class="tag-cloud-link">연인</a>
                <a href="#" class="tag-cloud-link">친구</a>
                <a href="#" class="tag-cloud-link">부모님</a>
                <a href="#" class="tag-cloud-link">가족</a>
              </div>
            </div>
            
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>Categories</h3>
                <li><a href="#">Tours <span>(12)</span></a></li>
                <li><a href="#">Hotels <span>(22)</span></a></li>
                <li><a href="#">Cruises <span>(37)</span></a></li>
                <li><a href="#">Restaurant <span>(42)</span></a></li>
                <li><a href="#">Destination <span>(14)</span></a></li>
              </div>
            </div>
            
            

            <div class="sidebar-box ftco-animate">
              <h3>일정 제작자의 말</h3>
              <p><c:out value="${describe}"/></p>
            </div>
            <div class="sidebar-box ftco-animate" style="text-align: center;">
              <img class ="img" src="images/like.jpg" alt="" onclick="" style="width:100px">
              &nbsp;&nbsp;&nbsp;&nbsp;
              <img class ="img" src="images/unlike.jpg" alt="" onclick=""style="width:100px">
            <br>
            <!-- 좋아요 갯수 -->
            <h2 style="color:green; display:inline-block;">0</h2>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h2 style="color:red; display:inline-block;">0</h2>
            
          
          </div>

          </div>
      </div>
      </div>
    </section>

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Voyage Fellow Tourist</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Book Now</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Flight</a></li>
                <li><a href="#" class="py-2 d-block">Hotels</a></li>
                <li><a href="#" class="py-2 d-block">Tour</a></li>
                <li><a href="#" class="py-2 d-block">Car Rent</a></li>
                <li><a href="#" class="py-2 d-block">Beach &amp; Resorts</a></li>
                <li><a href="#" class="py-2 d-block">Mountains</a></li>
                <li><a href="#" class="py-2 d-block">Cruises</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Top Deals</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Luxe Hotel</a></li>
                <li><a href="#" class="py-2 d-block">Venice Tours</a></li>
                <li><a href="#" class="py-2 d-block">Deluxe Hotels</a></li>
                <li><a href="#" class="py-2 d-block">Boracay Beach &amp; Resorts</a></li>
                <li><a href="#" class="py-2 d-block">Beach &amp; Resorts</a></li>
                <li><a href="#" class="py-2 d-block">Fuente Villa</a></li>
                <li><a href="#" class="py-2 d-block">Japan Tours</a></li>
                <li><a href="#" class="py-2 d-block">Philippines Tours</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Contact Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">198 West 21th Street, Suite 721 New York NY 10016</a></li>
                <li><a href="#" class="py-2 d-block">+ 1235 2355 98</a></li>
                <li><a href="#" class="py-2 d-block">info@yoursite.com</a></li>
                <li><a href="#" class="py-2 d-block">email@email.com</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <ul class="ftco-footer-social list-unstyled float-md-right float-lft">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/aos.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
    
  </body>
</html>