<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
 	<c:import url="../common/header.jsp">
		<c:param name="data" value="schedule"/>
	</c:import>
    
    <style>
    	.history__content::after {
			position: absolute;
			left: 50%;
			top: -40px;
			width: 2px;
			height: ${listLength*240}px;
			background: rgba(29, 28, 28, 0.3);
			-webkit-transform: translateX(-1px);
			-ms-transform: translateX(-1px);
			transform: translateX(-1px);
			content: "";
		}
    	
    </style>

  </head>
  <body>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="row">

              <section class="history spad">
                <div class="container">
                	<c:if test="${member.userId eq planner.userId}">
	                   <form name="instanceMakePlan" action="${pageContext.request.contextPath}/planner/deletePlan.do" method="post">
	                        <input type="hidden" name="pNo" id="pNo" value="${pNo}">
	                        <input type="submit" class="search-submit btn btn-primary" value="일정 삭제(*주의)" style="background-color: red;">
	                    </form>
                    </c:if>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title history-title">
                                <h5>Our History</h5>
                                <h2>How I Plan</h2>
                                <c:if test="${member.userId eq planner.userId}">
	                                <form name="instanceMakePlan" action="${pageContext.request.contextPath}/planner/instanceMakePlan.do" method="post">
	                                	<input type="hidden" name="pNo" id="pNo" value="${pNo}">
	                                	<input type="hidden" name="startDay" id="startDay" value="${startDay}">
	                                	<input type="hidden" name="endDay" id="endDay" value="${endDay}">
	                                	<input type="submit" class="search-submit btn btn-primary" value="+일정">
	                                </form>
                                </c:if>
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
                            			<c:if test="${member.userId eq planner.userId}">
	                            			<form name="instanceUpdatePlan" action="${pageContext.request.contextPath}/planner/instanceUpdatePlan.do" method="post" style="float:left; margin-right:10px;">
	                            				<input type="hidden" name="ppNo" id="ppNo" value="${pl.ppNo}">
	                                        	<input type="hidden" name="pNo" id="pNo" value="${pNo}">
	                                        	<input type="submit" class="search-submit btn btn-primary" value="수정" style="background-color: green;">
	                                        </form>
	                                        <form name="instanceDeletePlan" action="${pageContext.request.contextPath}/plannerPart/instanceDeletePlan.do" method="post" style="float:left;">
	                                        	<input type="hidden" name="ppNo" id="ppNo" value="${pl.ppNo}">
	                                        	<input type="hidden" name="pNo" id="pNo" value="${pNo}">
	                                        	<input type="submit" class="search-submit btn btn-primary" value="삭제" style="background-color: red;">
											</form>
										</c:if>
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
                            			<c:if test="${member.userId eq planner.userId}">
	                                       <form name="instanceUpdatePlan" action="${pageContext.request.contextPath}/planner/instanceUpdatePlan.do" method="post" style="float:left; margin-right:10px;">
	                            				<input type="hidden" name="ppNo" id="ppNo" value="${pl.ppNo}">
	                                        	<input type="hidden" name="pNo" id="pNo" value="${pNo}">
	                                        	<input type="submit" class="search-submit btn btn-primary" value="수정" style="background-color: green;">
	                                        </form>
	                                       <form name="instanceDeletePlan" action="${pageContext.request.contextPath}/plannerPart/instanceDeletePlan.do" method="post" style="float:left;">
	                                        	<input type="hidden" name="ppNo" id="ppNo" value="${pl.ppNo}">
	                                        	<input type="hidden" name="pNo" id="pNo" value="${pNo}">
	                                        	<input type="submit" class="search-submit btn btn-primary" value="삭제" style="background-color: red;">
											</form>
										</c:if>
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
          <div class="col-lg-4 sidebar">
          
			<div class="sidebar-box ftco-animate">
			  <c:if test="${member.userId eq planner.userId}">
			  	<form action="${pageContext.request.contextPath}/planner/changeStatus.do" id="StatusChange">
			  	  <input type="hidden" name="pNo" id="pNo" value="${pNo}">
				  <h3>Status 설정</h3>
				  <c:if test="${planner.status ne 'N' }">
					  <input type="radio" name="status" value="Y" checked>공개 &nbsp;&nbsp;&nbsp; 
					  <input type="radio" name="status" value="N">비공개
				  </c:if>
				  <c:if test="${planner.status eq 'N' }">
				  	  <input type="radio" name="status" value="Y">공개 &nbsp;&nbsp;&nbsp; 
					  <input type="radio" name="status" value="N" checked>비공개
				  </c:if>
				  <button type="button"  class="btn btn-primary py-2 px-4" onclick="changeStatus();">Status 변경</button>
				 </form>
			  </c:if>
              <h3>Theme</h3>
              <div class="tagcloud">
	              <c:if test="${member.userId ne planner.userId}">
	                <c:choose>
		                <c:when test="${planner.theme eq '혼자'}"><a href="#" class="tag-cloud-link" style="background-color:#007bff">혼자</a><a href="#" class="tag-cloud-link">연인</a><a href="#" class="tag-cloud-link">친구</a><a href="#" class="tag-cloud-link">부모님</a><a href="#" class="tag-cloud-link">가족</a></c:when>
						<c:when test="${planner.theme eq '연인'}"><a href="#" class="tag-cloud-link">혼자</a><a href="#" class="tag-cloud-link" style="background-color:#007bff">연인</a><a href="#" class="tag-cloud-link">친구</a><a href="#" class="tag-cloud-link">부모님</a><a href="#" class="tag-cloud-link">가족</a></c:when>
						<c:when test="${planner.theme eq '친구'}"><a href="#" class="tag-cloud-link">혼자</a><a href="#" class="tag-cloud-link">연인</a><a href="#" class="tag-cloud-link" style="background-color:#007bff">친구</a><a href="#" class="tag-cloud-link">부모님</a><a href="#" class="tag-cloud-link">가족</a></c:when>
						<c:when test="${planner.theme eq '부모님'}"><a href="#" class="tag-cloud-link">혼자</a><a href="#" class="tag-cloud-link">연인</a><a href="#" class="tag-cloud-link">친구</a><a href="#" class="tag-cloud-link" style="background-color:#007bff">부모님</a><a href="#" class="tag-cloud-link">가족</a></c:when>
						<c:when test="${planner.theme eq '가족'}"><a href="#" class="tag-cloud-link">혼자</a><a href="#" class="tag-cloud-link">연인</a><a href="#" class="tag-cloud-link">친구</a><a href="#" class="tag-cloud-link">부모님</a><a href="#" class="tag-cloud-link" style="background-color:#007bff">가족</a></c:when>
	                </c:choose>
	              </c:if>
	              <c:if test="${member.userId eq planner.userId}">
	                <c:choose>
		                <c:when test="${planner.theme eq '혼자'}">
		                	<a class="tag-cloud-link" style="background-color:#007bff">혼자</a>
		                	<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct12">
		                		<input type="hidden" name="theme" id="theme" value="연인">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct12()">연인</a>
		                	</form>
		                	<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct13">
		                		<input type="hidden" name="theme" id="theme" value="친구">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct13()">친구</a>
		                	</form>
		                	<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct14">
		                		<input type="hidden" name="theme" id="theme" value="부모님">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct14()">부모님</a>
		                	</form>
		                	<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct15">
		                		<input type="hidden" name="theme" id="theme" value="가족">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct15()">가족</a>
		                	</form>
		                </c:when>
						<c:when test="${planner.theme eq '연인'}">
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct21">
		                		<input type="hidden" name="theme" id="theme" value="혼자">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct21()">혼자</a>
		                	</form>
							<a href="#" class="tag-cloud-link" style="background-color:#007bff">연인</a>
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct23">
		                		<input type="hidden" name="theme" id="theme" value="친구">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct23()">친구</a>
		                	</form>
		                	<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct24">
		                		<input type="hidden" name="theme" id="theme" value="부모님">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct24()">부모님</a>
		                	</form>
		                	<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct25">
		                		<input type="hidden" name="theme" id="theme" value="가족">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct25()">가족</a>
		                	</form>
						</c:when>
						<c:when test="${planner.theme eq '친구'}">
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct31">
		                		<input type="hidden" name="theme" id="theme" value="혼자">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct31()">혼자</a>
		                	</form>
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct32">
		                		<input type="hidden" name="theme" id="theme" value="연인">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct32()">연인</a>
		                	</form>
							<a href="#" class="tag-cloud-link" style="background-color:#007bff">친구</a>
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct34">
		                		<input type="hidden" name="theme" id="theme" value="부모님">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct34()">부모님</a>
		                	</form>
		                	<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct35">
		                		<input type="hidden" name="theme" id="theme" value="가족">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct35()">가족</a>
		                	</form>
						</c:when>
						<c:when test="${planner.theme eq '부모님'}">
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct41">
		                		<input type="hidden" name="theme" id="theme" value="혼자">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct41()">혼자</a>
		                	</form>
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct42">
		                		<input type="hidden" name="theme" id="theme" value="연인">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct42()">연인</a>
		                	</form>
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct43">
		                		<input type="hidden" name="theme" id="theme" value="친구">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct43()">친구</a>
		                	</form>
							<a href="#" class="tag-cloud-link" style="background-color:#007bff">부모님</a>
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct45">
		                		<input type="hidden" name="theme" id="theme" value="가족">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct45()">가족</a>
		                	</form>
						</c:when>
						<c:when test="${planner.theme eq '가족'}">
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct51">
		                		<input type="hidden" name="theme" id="theme" value="혼자">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct51()">혼자</a>
		                	</form>
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct52">
		                		<input type="hidden" name="theme" id="theme" value="연인">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct52()">연인</a>
		                	</form>
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct53">
		                		<input type="hidden" name="theme" id="theme" value="친구">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct53()">친구</a>
		                	</form>
							<form action="${pageContext.request.contextPath}/planner/changeTheme.do" id="fct54">
		                		<input type="hidden" name="theme" id="theme" value="부모님">
	                            <input type="hidden" name="pNo" id="pNo" value="${pNo}">
		                		<a class="tag-cloud-link" onclick="ct54()">부모님</a>
		                	</form>
							<a href="#" class="tag-cloud-link" style="background-color:#007bff">가족</a>
						</c:when>
	                </c:choose>
	              </c:if>
              </div>
            </div>
            
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>Categories</h3>
                <c:forEach items="${cclist}" var="cc" varStatus="catecount">
                	<c:if test="${cc.category eq null }">
                		<li><a>기타<span>${cc.count}개</span></a></li>
                	</c:if>
                	<c:if test="${cc.category ne null }">
                		<li><a>${cc.category}<span>${cc.count}개</span></a></li>
                	</c:if>
                </c:forEach>
              </div>
            </div>
            
            

            <div class="sidebar-box ftco-animate">
              <h3>일정 제작자의 말</h3>
              <p><c:out value="${describe}"/></p>
              <c:if test="${member.userId eq planner.userId}">
              	<form action="${pageContext.request.contextPath}/planner/changeDescribe.do" id="DescribeChange">
              		<input type="hidden" name="pNo" id="pNo" value="${pNo}">
              		<input type="hidden" name="describe" id="describe" value="${describe}">
              		<button type="button"  class="btn btn-primary py-2 px-4" onclick="changeDescribe();">Describe 변경</button>
              	</form>
              </c:if>
            </div>
            <c:if test="${member.userId ne null}">
	            <div class="sidebar-box ftco-animate" style="text-align: center;">
	            	<form action="${pageContext.request.contextPath}/plannerLike/recommend.do" id="good1" style="float:left;">
	            		<input type="hidden" name="pNo" id="pNo" value="${pNo}">
	            		<input type="hidden" name="userId" id="userId" value="${member.userId}">
	            		<input type="hidden" name="good" id="good" value="Y">
	            		<input type="image" src="${pageContext.request.contextPath }/resources/images/like.jpg" alt="" onclick="go1()" style="width:100px"/>
	            	</form>
	                <form action="${pageContext.request.contextPath}/plannerLike/recommend.do" id="good2">
	            		<input type="hidden" name="pNo" id="pNo" value="${pNo}">
	            		<input type="hidden" name="userId" id="userId" value="${member.userId}">
	            		<input type="hidden" name="good" id="good" value="N">
	            		<input type="image" src="${pageContext.request.contextPath }/resources/images/unlike.jpg" alt="" onclick="go2()"style="width:100px" />
	            	</form>
	                
		            <br>
		            <!-- 좋아요 갯수 -->
		            <a style="color:green;">${like}</a>
		            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            <a style="color:red;">${unlike}</a>
		            
	          	</div>
          	</c:if>

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
  
  <script>
  function changeStatus(){
		
		$("#StatusChange").submit();
			
	}
  function changeDescribe(){
		
		$("#DescribeChange").submit();
			
	}
  
  function ct12(){
		$("#fct12").submit();
	}
  function ct13(){
		$("#fct13").submit();
	}
  function ct14(){
		$("#fct14").submit();
	}
  function ct15(){
		$("#fct15").submit();
	}
  function ct21(){
		$("#fct21").submit();
	}
  function ct23(){
		$("#fct23").submit();
	}
  function ct24(){
		$("#fct24").submit();
	}
  function ct25(){
		$("#fct25").submit();
	}
  function ct31(){
		$("#fct31").submit();
	}
  function ct32(){
		$("#fct32").submit();
	}
  function ct34(){
		$("#fct34").submit();
	}
  function ct35(){
		$("#fct35").submit();
	}
  function ct41(){
		$("#fct41").submit();
	}
  function ct42(){
		$("#fct42").submit();
	}
  function ct43(){
		$("#fct43").submit();
	}
  function ct45(){
		$("#fct45").submit();
	}
  function ct51(){
		$("#fct51").submit();
	}
  function ct52(){
		$("#fct52").submit();
	}
  function ct53(){
		$("#fct53").submit();
	}
  function ct54(){
		$("#fct54").submit();
	}
  
  function go1(){
		$("#good1").submit();
	}
  function go2(){
		$("#good2").submit();
	}
  </script>
    
  </body>
</html>