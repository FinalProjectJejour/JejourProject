<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
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




   	<c:import url="../common/header.jsp">
		<c:param name="data" value="schedule"/>
	</c:import>
<style>
.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}
</style>
</head>
<body>



	<!-- END slider -->

	<section class="ftco-section contact-section">
		<div class="container">
			<form
				action="${pageContext.request.contextPath}/planner/planConfirm.do"
				id="Plan" method="post">
			<h2 class="h4 mb-4">Is This Right?</h2>
			<div class="row mt-5">
				<div class="col-md-8 map_wrap mx-auto" id="map" ></div>
				<div class="col-md-4">
			 		<span>일정 제작자로서 남기고 싶은 말 : <textarea class="form-group" cols="30" rows="12" name="describe" id="describe" placeholder="일정에 관해 적고싶은말"></textarea></span>
			 	</div>
			</div>
			 
			 

			<div id='calendar'></div>
			&nbsp;
			
				<div class="form-group" style="float: right" id="confirmed">
					<input type="radio" name="status" value="Y" checked>공개
					&nbsp;&nbsp;&nbsp; <input type="radio" name="status" value="N">비공개
					&nbsp;&nbsp;&nbsp; <input type="hidden" name="pNo" id="pNo"
						value="${pNo}">
					<button type="button" class="btn btn-primary py-3 px-4"
						onclick="planConfirmed();">일정 완료</button>
				</div>
			</form>
		</div>


	</section>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Voyage Fellow Tourist</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
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
							<li><a href="#" class="py-2 d-block">Boracay Beach &amp;
									Resorts</a></li>
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
							<li><a href="#" class="py-2 d-block">198 West 21th
									Street, Suite 721 New York NY 10016</a></li>
							<li><a href="#" class="py-2 d-block">+ 1235 2355 98</a></li>
							<li><a href="#" class="py-2 d-block">info@yoursite.com</a></li>
							<li><a href="#" class="py-2 d-block">email@email.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<ul
							class="ftco-footer-social list-unstyled float-md-right float-lft">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/aos.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.timepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

	<script>
  	
	function planConfirmed(){
			
		$("#Plan").submit();
			
	}
  
  
  
 	document.addEventListener('DOMContentLoaded', function() {
  	
      var calendarEl = document.getElementById('calendar');
  
      var calendar = new FullCalendar.Calendar(calendarEl, {
        now: '${start}',
        editable: true, // enable draggable events
        aspectRatio: 1.8,
        scrollTime: '06:00', // undo default 6am scrollTime
        headerToolbar: {
          left: 'today prev,next',
          center: 'title',
          right: 'timeGridWeek,dayGridMonth'
        },
        initialView: 'timeGridWeek',
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
      	  	{ id: '${p.mapTitle}' }
      	  	<c:if test="${!loop.last}">,</c:if>
      	  </c:forEach>
        ],
        events: [
      	  	<c:forEach items="${list}" var="pl" varStatus="status">
    	  			{ id: '${pl.ppNo}', resourceId: '${pl.mapTitle}', start: '${pl.startTime}', end: '${pl.endTime}',  title: '${pl.mapTitle}' }
    	  			<c:if test="${!status.last}">,</c:if>
    	 		</c:forEach>
        ]
      });
  
      calendar.render();
    });
  </script>
  
  
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8c0b6988029a8eedd98928d0fab7698&libraries=services"></script>
	<script>
		
		// 유병호 작성 - 데이터베이스에서 가져올 경우 데이터(이름, x, y)를 input에 담았다는 가정하에 진행 
		// * 여러개일 경우 객체 리스트로 담아와서 for-each문 사용하면 됨
		var centerX=0;
		var centerY=0;
		var count, X, Y;
		<c:forEach items="${list}" var="pla" varStatus="xy">

    	  		X="${pla.mapX}";
    	  		Y="${pla.mapY}";
    	  		
    	  		centerX=parseFloat(centerX)+parseFloat(X);
    	  		centerY=parseFloat(centerY)+parseFloat(Y);


	  			count=${xy.count};
    	 </c:forEach>
    	 count=parseFloat(count);

    	 centerX/=count;
    	 centerY/=count;
    	 
    	 console.log("centerX : "+centerX);
  		console.log("centerY : "+centerY);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(centerY, centerX), // 지도의 중심좌표
		        level: 10 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		 
		// 마커를 표시할 위치와 title 객체 배열입니다 
		// 유병호 추가 - 나중에 데이터베이스에서 이름, y, x 좌표 가지고오면 될듯
		var positions = [
			<c:forEach items="${list}" var="plan" varStatus="cou">
  			{ content: '<div>${plan.mapTitle}</div>', latlng: new kakao.maps.LatLng("${plan.mapY}", "${plan.mapX}")}
  			<c:if test="${!status.last}">,</c:if>
			</c:forEach>
		];
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		    
		    // 항시 띄어놓을 경우 이렇게
		    infowindow.open(map, marker);
		   // over/out으로 진행시에는 밑에 주석 풀면됨
		    /*
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		    */
		}
		
		/*
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		*/
		
		//선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		var linePath = [
			<c:forEach items="${list}" var="plann" varStatus="coun">
				positions[${coun.index}].latlng
  				<c:if test="${!status.last}">,</c:if>
			</c:forEach>
		];
		
		/*
		// 지도에 표시할 선을 생성합니다
		var polyline = new kakao.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 3, // 선의 두께 입니다
		    strokeColor: '#FFAE00', // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});
		
		// 지도에 선을 표시합니다 
		polyline.setMap(map);
		
		console.log(polyline.getLength());
		
		var distance = Math.round(polyline.getLength());
		var position = positions[2].latlng;
		
		displayCircleDot(position, distance);
		
		function displayCircleDot(position, distance) {
		
		 if (distance > 0) {
		     // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
		     var distanceOverlay = new kakao.maps.CustomOverlay({
		         content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
		         position: position,
		         yAnchor: 1,
		         zIndex: 2
		     });
		
		     // 지도에 표시합니다
		     distanceOverlay.setMap(map);
		 }
		}
		*/
		
		
		//유병호 제작
		(function test(){
		   for(var i=0; i < positions.length - 1; i++){
		      
		      var line = [linePath[i], linePath[i+1]];
		      
		      var polyline = new kakao.maps.Polyline({
		          path: line, // 선을 구성하는 좌표배열 입니다
		          strokeWeight: 3, // 선의 두께 입니다
		          strokeColor: '#00FFFF', // 선의 색깔입니다
		          strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		          strokeStyle: 'solid' // 선의 스타일입니다
		      });
		      
		      polyline.setMap(map);
		      
		      console.log(polyline.getLength());
		      
		      var distance = Math.round(polyline.getLength());
		      var position = positions[i+1].latlng;
		      
		      displayCircleDot(position, distance);
		      
		      function displayCircleDot(position, distance) {
		
		          if (distance > 0) {
		              // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
		              var distanceOverlay = new kakao.maps.CustomOverlay({
		                  //content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
		                  position: position,
		                  yAnchor: 1,
		                  zIndex: 2
		              });
		
		              // 지도에 표시합니다
		              distanceOverlay.setMap(map);
		          }
		          
		      }
		      
		      
		   }
		})();
	
	</script>

</body>
</html>