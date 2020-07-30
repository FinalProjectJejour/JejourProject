<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%  
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String theme = request.getParameter("theme");
	String start_date = request.getParameter("start_date");
	String return_date = request.getParameter("return_date");
%>
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

    <link href='${pageContext.request.contextPath }/resources/lib/main.css' rel='stylesheet' />
    <script src='${pageContext.request.contextPath }/resources/lib/main.js'></script>
    
    <c:import url="../common/header.jsp"/>

    <style>
	
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        font-size: 14px;
      }
    
      #calendar {
        max-width: 2100px;
        margin: 50px auto;
      }
      
      div#board-container label.custom-file-label{text-align:left;}
    
    </style>
  </head>
  
  <body>
    
    <!-- END nav -->
    
    
    <!-- END slider -->
    <c:set var="no" value="<%=no %>"/>
    <c:set var="title" value="<%=title %>"/>
    <c:set var="theme" value="<%=theme %>"/>
    <c:set var="start_date" value="<%=start_date %>"/>
    <c:set var="return_date" value="<%=return_date %>"/>
    <c:set var="reservationPage" value="window.open('${pageContext.request.contextPath}/planner/goReservation.do', 'reservationPage', 'width=1000,height=800');"/>
    
    <!-- 
    <div style="position: fixed; right: 20px; bottom: 50px;">
    	<form action="${pageContext.request.contextPath}/planner/goReservation.do" id="goreservation">
			<button type="button" class="btn btn-primary py-3 px-4" onclick="goreservation()">예매페이지</button>  
		</form> 
  	</div>
  	 -->
  	 
  	
  	
   
    <c:if test="${no eq null and pNo eq null }">
    <div class="ftco-section-search">
      <div class="container">
        <div class="row">
          <div class="col-md-12 tabulation-search">
            <div class="element-animate">
              <div class="nav nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical" >
                <a class="nav-link p-3 active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true"><span>01</span>혼자</a>
                <a class="nav-link p-3" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false"><span>02</span> 연인/커플</a>
                <a class="nav-link p-3" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false"><span>03</span> 친구/지인</a>
                <a class="nav-link p-3" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false"><span>04</span> 부모님</a>
                <a class="nav-link p-3" id="v-pills-family-tab" data-toggle="pill" href="#v-pills-family" role="tab" aria-controls="v-pills-family" aria-selected="false"><span>05</span> 가족</a>
              </div>
            </div>
              
            <div class="tab-content py-5" id="v-pills-tabContent">
              <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <div class="block-17">
                  <form name="boardFrm" action="${pageContext.request.contextPath}/planner/AttachmentInsert.do" method="post" class="d-block d-lg-flex" id="goAhead1" onsubmit="return validate1();" enctype="multipart/form-data">
                    <div class="fields d-block d-lg-flex">
                    
                      <!-- <div class="fileArea" style="background-image: url('${pageContext.request.contextPath}/resources/images/insert-picture-icon.jpg'); background-repeat: no-repeat;"> -->
                      <div class="fileArea1" style="display:none;">
                      	<input type="file" class="custom-file-input" name="upFile" id="upFile1">
                      </div>
                      
                      <div class="check-in one-third"><input type="text" name="title" id="title1" class="form-control" placeholder="일정 제목"></div>

                      <div class="check-in one-third"><input type="date" id="start_date1" class="form-control" name="start_date" placeholder="Start date"></div>

                      <div class="check-out one-third"><input type="date" id="return_date1" class="form-control" name="return_date" placeholder="Return date"></div>
                      
                    </div>
                    <input type="hidden" name="theme" id="theme" value="혼자">  
                    <input type="hidden" name="status" id="status" value="Y"> 
                    <!-- <input type="submit" class="search-submit btn btn-primary" value="나홀로 GO"> -->  
                    <button type="button" class="search-submit btn btn-primary" onclick="setPlanner1();">나홀로 GO</button>
                  </form>
                </div>
              </div>
              <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <div class="block-17">
                  <form name="boardFrm" action="${pageContext.request.contextPath}/planner/AttachmentInsert.do" method="post" class="d-block d-lg-flex" id="goAhead2" onsubmit="return validate2();" enctype="multipart/form-data">
                    <div class="fields d-block d-lg-flex">
                    
                      

                      <div class="fileArea2" style="display:none;">
                      	<input type="file" class="custom-file-input" name="upFile" id="upFile2">
                      </div>
                      
                      <div class="check-in one-third"><input type="text" name="title" id="title2" class="form-control" placeholder="일정 제목"></div>

                      <div class="check-in one-third"><input type="date" id="start_date2" class="form-control" name="start_date" placeholder="Start date"></div>

                      <div class="check-out one-third"><input type="date" id="return_date2" class="form-control" name="return_date" placeholder="Return date"></div>
                      
                    </div>
                    <input type="hidden" name="theme" id="theme" value="연인">
                    <input type="hidden" name="status" id="status" value="Y"> 
                    <button type="button" class="search-submit btn btn-primary" onclick="setPlanner2();">연인과 함께</button>
                  </form>
                </div>
              </div>
              <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                <div class="block-17">
                  <form name="boardFrm" action="${pageContext.request.contextPath}/planner/AttachmentInsert.do" method="post" class="d-block d-lg-flex" id="goAhead3" onsubmit="return validate3();" enctype="multipart/form-data">
                    <div class="fields d-block d-lg-flex">

                      <div class="fileArea3" style="display:none;">
                      	<input type="file" class="custom-file-input" name="upFile" id="upFile3">
                      </div>
                      
					  <div class="check-in one-third"><input type="text" name="title" id="title3" class="form-control" placeholder="일정 제목"></div>

                      <div class="check-in one-third"><input type="date" id="start_date3" class="form-control" name="start_date" placeholder="Start date"></div>

                      <div class="check-out one-third"><input type="date" id="return_date3" class="form-control" name="return_date" placeholder="Return date"></div>
                      
                    </div>
                    <input type="hidden" name="theme" id="theme" value="친구">  
                    <input type="hidden" name="status" id="status" value="Y">   
                    <button type="button" class="search-submit btn btn-primary" onclick="setPlanner3();">친구랑~</button>
                  </form>
                </div>
              </div>
              <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                <div class="block-17">
                  <form name="boardFrm" action="${pageContext.request.contextPath}/planner/AttachmentInsert.do" method="post" class="d-block d-lg-flex" id="goAhead4" onsubmit="return validate4();" enctype="multipart/form-data">
                    <div class="fields d-block d-lg-flex">
                      
                      <div class="fileArea4" style="display:none;">
                      	<input type="file" class="custom-file-input" name="upFile" id="upFile4">
                      </div>
                      
					  <div class="check-in one-third"><input type="text" name="title" id="title4" class="form-control" placeholder="일정 제목"></div>

                      <div class="check-in one-third"><input type="date" id="start_date4" class="form-control" name="start_date" placeholder="Start date"></div>

                      <div class="check-out one-third"><input type="date" id="return_date4" class="form-control" name="return_date" placeholder="Return date"></div>

                      
                    </div>
                    <input type="hidden" name="theme" id="theme" value="부모님">   
                    <input type="hidden" name="status" id="status" value="Y"> 
                    <button type="button" class="search-submit btn btn-primary" onclick="setPlanner4();">부모님^^</button>
                  </form>
                </div>
              </div>
              <div class="tab-pane fade" id="v-pills-family" role="tabpanel" aria-labelledby="v-pills-family-tab">
                <div class="block-17">
                  <form name="boardFrm" action="${pageContext.request.contextPath}/planner/AttachmentInsert.do" method="post" class="d-block d-lg-flex" id="goAhead5" onsubmit="return validate5();" enctype="multipart/form-data">
                    <div class="fields d-block d-lg-flex">

                      <div class="fileArea5" style="display:none;">
                      	<input type="file" class="custom-file-input" name="upFile" id="upFile5">
                      </div>

				 	  <div class="check-in one-third"><input type="text" name="title" id="title5" class="form-control" placeholder="일정 제목"></div>

                      <div class="check-in one-third"><input type="date" id="start_date5" class="form-control" name="start_date" placeholder="Start date"></div>

                      <div class="check-out one-third"><input type="date" id="return_date5" class="form-control" name="return_date" placeholder="Return date"></div>
                      
                    </div>
                    <input type="hidden" name="theme" id="theme" value="가족">   
                    <input type="hidden" name="status" id="status" value="Y"> 
                    <button type="button" class="search-submit btn btn-primary" onclick="setPlanner5();">가족과 함께</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </c:if>

    <section class="ftco-section contact-section">
      <div class="container">
        <div class="row block-9 mb-4">
        </div>
        <div class="row mt-5">
          <div class="col-md-8" id="map"></div>
          <div class="col-md-4">
            <form action="${pageContext.request.contextPath}/plannerPart/plannerPartMake.do" id="makingPlan" method="post">
              <div class="form-group">
                <input type="datetime-local" min="${start_date}" max="${return_date}" class=" form-control" name="startTime">
              </div>
              <div class="form-group">
                <input type="datetime-local" min="${start_date}" max="${return_date}" class=" form-control" name="endTime">
              </div>
              <div class="form-group">
                <input type="number" class="form-control" name="money" placeholder="ACCOUNT">
              </div>
              <div class="form-group">
                <textarea cols="30" rows="7" class="form-control" name="reason" id="describe" placeholder="DESCRIBE"></textarea>
              </div>
              
              <input type="hidden" name="calendar_set" id="calendar_set" value="${calendar_set}">
              <c:if test="${no ne null }"><input type="hidden" name="pNo" id="pNo" value="${no}"></c:if>
              <c:if test="${pNo ne null }"><input type="hidden" name="pNo" id="pNo" value="${pNo}"></c:if>
              <input type="hidden" name="start_date" id="start_date" value="${start_date}">
              <input type="hidden" name="return_date" id="return_date" value="${return_date}">
              <div class="form-group" style="float:right">
                <button type="button" class="btn btn-primary py-3 px-4" onclick="save();">Save</button>
              </div>
            </form>
          </div>
        </div>
        
        <div id='calendar'></div>
        
        <div style="position: fixed; right: 20px; bottom: 50px;">
			<input type="submit" class="btn btn-primary py-3 px-4" onclick="${reservationPage}" value="예매페이지" />
  		</div>
        
        <c:if test="${pNo ne null }">
        	<form action="${pageContext.request.contextPath}/planner/plannerSeeConfirm.do?pNo=${pNo}" id="confirming">
        		<input type="hidden" name="pNo" id="pNo" value="${pNo}">
        		
		        <div class="form-group" style="float:right">
		        	<button type="button" class="btn btn-primary py-3 px-4" onclick="confirm();">확인하러 가기</button>
		        </div>
		        
	        </form>
        </c:if>
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
  <script src="${pageContext.request.contextPath }/resources/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath }/resources/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

  <script>
  	
  /* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate1(){
		var content = $("#title1").val();
		var start = $("#start_date1").val();
		var end = $("#return_date1").val();
		
		if(content.trim().length==0){
			alert("제목을 입력하세요");
			return false;
		}
		if(start.trim().length==0){
			alert("출발 날짜를 입력하시오 ");
			return false;
		}
		if(end.trim().length==0){
			alert("마지막 날짜를 입력하시오");
			return false;
		}
		return true;
	}
	function validate2(){
		var content = $("#title2").val();
		var start = $("#start_date2").val();
		var end = $("#return_date2").val();
		if(content.trim().length==0){
			alert("제목을 입력하세요");
			return false;
		}
		if(start.trim().length==0){
			alert("출발 날짜를 입력하시오 ");
			return false;
		}
		if(end.trim().length==0){
			alert("마지막 날짜를 입력하시오");
			return false;
		}
		return true;
	}
	function validate3(){
		var content = $("#title3").val();
		var start = $("#start_date3").val();
		var end = $("#return_date3").val();
		if(content.trim().length==0){
			alert("제목을 입력하세요");
			return false;
		}
		if(start.trim().length==0){
			alert("출발 날짜를 입력하시오 ");
			return false;
		}
		if(end.trim().length==0){
			alert("마지막 날짜를 입력하시오");
			return false;
		}
		return true;
	}
	function validate4(){
		var content = $("#title4").val();
		var start = $("#start_date4").val();
		var end = $("#return_date4").val();
		if(content.trim().length==0){
			alert("제목을 입력하세요");
			return false;
		}
		if(start.trim().length==0){
			alert("출발 날짜를 입력하시오 ");
			return false;
		}
		if(end.trim().length==0){
			alert("마지막 날짜를 입력하시오");
			return false;
		}
		return true;
	}
	function validate5(){
		var content = $("#title5").val();
		var start = $("#start_date5").val();
		var end = $("#return_date5").val();
		if(content.trim().length==0){
			alert("제목을 입력하세요");
			return false;
		}
		if(start.trim().length==0){
			alert("출발 날짜를 입력하시오 ");
			return false;
		}
		if(end.trim().length==0){
			alert("마지막 날짜를 입력하시오");
			return false;
		}
		return true;
	}
  
	function setPlanner1(){
		$('#upFile1').click();
		
		$("#goAhead1").submit();
		
	}
	function setPlanner2(){
		$('#upFile2').click();
		
		$("#goAhead2").submit();
		
	}
	function setPlanner3(){
		$('#upFile3').click();
		
		$("#goAhead3").submit();
		
	}
	function setPlanner4(){
		$('#upFile4').click();
		
		$("#goAhead4").submit();
		
	}
	function setPlanner5(){
		$('#upFile5').click();
		
		$("#goAhead5").submit();
		
	}
	
	/*부트스트랩 : file 변경시 파일명 보이기 */
	$(function(){
		$('[name=title]').on('change',function(){
		    //var fileName = $(this).val();//C:\fakepath\파일명
		    var titleName = this.title[0].name;//파일명(javascript)
		    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
		    //var fileName = $(this).prop('files')[0].name;//파일명(jquery)
			//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
		    console.log($(this).val());
		    $(this).next('.fileArea').html(titleName);
		})
	});

	function save(){
		
		$("#makingPlan").submit();
		
	}
	
	function confirm(){
		
		$("#confirming").submit();
		
	}
	
	/*
	function goreservation(){
		${"goreservation"}.submit();
	}
  	*/

    
    document.addEventListener('DOMContentLoaded', function() {
    	
        var calendarEl = document.getElementById('calendar');
    
        var calendar = new FullCalendar.Calendar(calendarEl, {
          now: '2020-07-29',
          editable: true, // enable draggable events
          aspectRatio: 1.8,
          scrollTime: '00:00', // undo default 6am scrollTime
          headerToolbar: {
            left: 'today prev,next',
            center: 'title',
            right: 'resourceTimelineDay,timeGridWeek,dayGridMonth'
          },
          initialView: 'resourceTimelineDay',
          views: {
            resourceTimelineThreeDays: {
              type: 'resourceTimeline',
              duration: { days: 3 },
              buttonText: '3 days'
            }
          },
          resourceAreaHeaderContent: 'Rooms',
          resourceLabelContent: function(arg) {
            return 'Auditorium ' + arg.resource.id.toUpperCase();
          },
          resourceLabelDidMount: function(arg) {
            if (arg.resource.id == 'h') {
              arg.el.style.backgroundColor = 'rgb(255, 243, 206)';
            }
          },
          resources: [
        	  <c:forEach items="${list}" var="p" varStatus="loop">
        	  	{ id: '${p.ppNo}' }
        	  	<c:if test="${!loop.last}">,</c:if>
        	  </c:forEach>
          ],
          events: [
        	  	<c:forEach items="${list}" var="pl" varStatus="status">
      	  			{ id: '${pl.ppNo}', resourceId: '${pl.ppNo}', start: '${pl.startTime}', end: '${pl.endTime}',  title: '${pl.mapTitle}' }
      	  			<c:if test="${!status.last}">,</c:if>
      	 		</c:forEach>
          ]
        });
    
        calendar.render();
      });

      
 
    
  </script>
    
  </body>
</html>