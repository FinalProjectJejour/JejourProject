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
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
  
   	
   	<c:import url="../common/header.jsp">
		<c:param name="data" value="schedule"/>
	</c:import>

    <style>
	
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
        font-size: 14px;
      }
      
      
      
      .filebox label {
	 	display: inline-block;
	  	padding: .5em .75em;
	  	color: #999;
	    font-size: inherit;
	    line-height: 36px;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
	   } 
	            
	  .filebox input[type="file"] {
	   	position: absolute;
	    width: 1px;
	    height: 1px;
	    padding: 0;
	    margin: -1px;
	    overflow: hidden;
	    clip:rect(0,0,0,0);
	    border: 0; 
	   }
      
      
    
      #calendar {
        max-width: 2100px;
        margin: 50px auto;
      }
      
      div#board-container label.custom-file-label{text-align:left;}
    
    	
    		.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
			.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
			.map_wrap {position:relative;width:100%;height:500px;}
			#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
			.bg_white {background:#fff;}
			#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
			#menu_wrap .option{text-align: center;}
			#menu_wrap .option p {margin:10px 0;}  
			#menu_wrap .option button {margin-left:5px;}
			#placesList li {list-style: none;}
			#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
			#placesList .item span {display: block;margin-top:4px;}
			#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
			#placesList .item .info{padding:10px 0 10px 55px;}
			#placesList .info .gray {color:#8a8a8a;}
			#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
			#placesList .info .tel {color:#009900;}
			#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
			#placesList .item .marker_1 {background-position: 0 -10px;}
			#placesList .item .marker_2 {background-position: 0 -56px;}
			#placesList .item .marker_3 {background-position: 0 -102px}
			#placesList .item .marker_4 {background-position: 0 -148px;}
			#placesList .item .marker_5 {background-position: 0 -194px;}
			#placesList .item .marker_6 {background-position: 0 -240px;}
			#placesList .item .marker_7 {background-position: 0 -286px;}
			#placesList .item .marker_8 {background-position: 0 -332px;}
			#placesList .item .marker_9 {background-position: 0 -378px;}
			#placesList .item .marker_10 {background-position: 0 -423px;}
			#placesList .item .marker_11 {background-position: 0 -470px;}
			#placesList .item .marker_12 {background-position: 0 -516px;}
			#placesList .item .marker_13 {background-position: 0 -562px;}
			#placesList .item .marker_14 {background-position: 0 -608px;}
			#placesList .item .marker_15 {background-position: 0 -654px;}
			#pagination {margin:10px auto;text-align: center;}
			#pagination a {display:inline-block;margin-right:10px;}
			#pagination .on {font-weight: bold; cursor: default;color:#777;}
			
			
/* 스케줄 가이드 css */
			
*, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  background: white;
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
}

.skw-pages {
  overflow: hidden;
  position: relative;
  height: 100vh;
}

.skw-page {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
}
.skw-page__half {
  position: absolute;
  top: 0;
  width: 50%;
  height: 100vh;
  -webkit-transition: -webkit-transform 1s;
  transition: -webkit-transform 1s;
  transition: transform 1s;
  transition: transform 1s, -webkit-transform 1s;
}
.skw-page__half--left {
  left: 0;
  -webkit-transform: translate3d(-32.4vh, 100%, 0);
          transform: translate3d(-32.4vh, 100%, 0);
}
.skw-page__half--right {
  left: 50%;
  -webkit-transform: translate3d(32.4vh, -100%, 0);
          transform: translate3d(32.4vh, -100%, 0);
}
.skw-page.active .skw-page__half {
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
}
.skw-page__skewed {
  overflow: hidden;
  position: absolute;
  top: 0;
  width: 140%;
  height: 100%;
  -webkit-transform: skewX(-18deg);
          transform: skewX(-18deg);
  background: #000;
}
.skw-page__half--left .skw-page__skewed {
  left: -40%;
}
.skw-page__half--right .skw-page__skewed {
  right: -40%;
}
.skw-page__content {
  display: -webkit-box;
  display: flex;
  -webkit-box-align: center;
          align-items: center;
  -webkit-box-pack: center;
          justify-content: center;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
          flex-flow: column wrap;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  padding: 0 30%;
  color: #fff;
  -webkit-transform: skewX(18deg);
          transform: skewX(18deg);
  -webkit-transition: opacity 1s, -webkit-transform 1s;
  transition: opacity 1s, -webkit-transform 1s;
  transition: transform 1s, opacity 1s;
  transition: transform 1s, opacity 1s, -webkit-transform 1s;
  background-size: cover;
}
.skw-page__half--left .skw-page__content {
  padding-left: 30%;
  padding-right: 30%;
  -webkit-transform-origin: 100% 0;
          transform-origin: 100% 0;
}
.skw-page__half--right .skw-page__content {
  padding-left: 30%;
  padding-right: 30%;
  -webkit-transform-origin: 0 100%;
          transform-origin: 0 100%;
}
.skw-page.inactive .skw-page__content {
  opacity: 0.5;
  -webkit-transform: skewX(18deg) scale(0.95);
          transform: skewX(18deg) scale(0.95);
}
.skw-page__heading {
  margin-bottom: 15px;
  text-transform: uppercase;
  font-size: 55px;
  text-align: center;
}
.skw-page__description {
  font-size: 28px;
  text-align: center;
}
.skw-page__link {
  color: #FFA0A0;
}
.skw-page-1 .skw-page__half--left .skw-page__content {
  background-image: url("${pageContext.request.contextPath }/resources/images/updateinfo6.jpg");
}
.skw-page-1 .skw-page__half--right .skw-page__content {
  background: #292929;
}


@FONT-FACE {
			font-family: 'bm';
			src:url("${pageContext.request.contextPath}/resources/fonts/BMJUA_ttf.ttf");
		}

/* 스케줄 가이드 css의 끝 */
	
    </style>
    
    
    
  </head>
  
  <body>
    
    <c:set var="no" value="<%=no %>"/>
    <c:set var="title" value="<%=title %>"/>
    <c:set var="theme" value="<%=theme %>"/>
    <c:set var="start_date" value="<%=start_date %>"/>
    <c:set var="return_date" value="<%=return_date %>"/>
    <c:set var="reservationPage" value="window.open('${pageContext.request.contextPath}/planner/reservationGo.do', 'reservationPage', 'width=1350,height=950');"/>
    
  	 
   
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
                      <div class="filebox">
                      	<label for="upFile1">사진 등록</label>
                      	<input type="file" name="upFile" id="upFile1">
                      </div>
                      
                      <div class="check-in one-third"><input type="text" name="title" id="title1" class="form-control" placeholder="일정 제목"></div>

                      <div class="check-in one-third"><input type="date" id="start_date1" class="form-control" name="start_date" placeholder="Start date"></div>

                      <div class="check-out one-third"><input type="date" id="return_date1" class="form-control" name="return_date" placeholder="Return date"></div>
                      
                    </div>
                    <input type="hidden" name="userId" id="userId1" value="${member.userId}">
                    <input type="hidden" name="pWriter" id="pWriter" value="${member.userName}">
                    <input type="hidden" name="theme" id="theme" value="혼자">  
                    <input type="hidden" name="status" id="status" value="Y"> 
                    <!-- <input type="submit" class="search-submit btn btn-primary" value="나홀로 GO"> -->  
                    <button type="button" class="search-submit btn btn-primary" onclick="setPlanner1();">일정 만들기</button>
                  </form>
                </div>
              </div>
              <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <div class="block-17">
                  <form name="boardFrm" action="${pageContext.request.contextPath}/planner/AttachmentInsert.do" method="post" class="d-block d-lg-flex" id="goAhead2" onsubmit="return validate2();" enctype="multipart/form-data">
                    <div class="fields d-block d-lg-flex">
                    
                      

                      <div class="filebox">
                      	<label for="upFile2">사진 등록</label>
                      	<input type="file" name="upFile" id="upFile2">
                      </div>
                      
                      <div class="check-in one-third"><input type="text" name="title" id="title2" class="form-control" placeholder="일정 제목"></div>

                      <div class="check-in one-third"><input type="date" id="start_date2" class="form-control" name="start_date" placeholder="Start date"></div>

                      <div class="check-out one-third"><input type="date" id="return_date2" class="form-control" name="return_date" placeholder="Return date"></div>
                      
                    </div>
                    <input type="hidden" name="userId" id="userId2" value="${member.userId}">
                    <input type="hidden" name="pWriter" id="pWriter" value="${member.userName}">
                    <input type="hidden" name="theme" id="theme" value="연인">
                    <input type="hidden" name="status" id="status" value="Y"> 
                    <button type="button" class="search-submit btn btn-primary" onclick="setPlanner2();">일정 만들기</button>
                  </form>
                </div>
              </div>
              <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                <div class="block-17">
                  <form name="boardFrm" action="${pageContext.request.contextPath}/planner/AttachmentInsert.do" method="post" class="d-block d-lg-flex" id="goAhead3" onsubmit="return validate3();" enctype="multipart/form-data">
                    <div class="fields d-block d-lg-flex">

                      <div class="filebox">
                      	<label for="upFile3">사진 등록</label>
                      	<input type="file" name="upFile" id="upFile3">
                      </div>
                      
					  <div class="check-in one-third"><input type="text" name="title" id="title3" class="form-control" placeholder="일정 제목"></div>

                      <div class="check-in one-third"><input type="date" id="start_date3" class="form-control" name="start_date" placeholder="Start date"></div>

                      <div class="check-out one-third"><input type="date" id="return_date3" class="form-control" name="return_date" placeholder="Return date"></div>
                      
                    </div>
                    <input type="hidden" name="userId" id="userId3" value="${member.userId}">
                    <input type="hidden" name="pWriter" id="pWriter" value="${member.userName}">
                    <input type="hidden" name="theme" id="theme" value="친구">  
                    <input type="hidden" name="status" id="status" value="Y">   
                    <button type="button" class="search-submit btn btn-primary" onclick="setPlanner3();">일정 만들기</button>
                  </form>
                </div>
              </div>
              <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                <div class="block-17">
                  <form name="boardFrm" action="${pageContext.request.contextPath}/planner/AttachmentInsert.do" method="post" class="d-block d-lg-flex" id="goAhead4" onsubmit="return validate4();" enctype="multipart/form-data">
                    <div class="fields d-block d-lg-flex">
                      
                      <div class="filebox">
                      	<label for="upFile4">사진 등록</label>
                      	<input type="file" name="upFile" id="upFile4">
                      </div>
                      
					  <div class="check-in one-third"><input type="text" name="title" id="title4" class="form-control" placeholder="일정 제목"></div>

                      <div class="check-in one-third"><input type="date" id="start_date4" class="form-control" name="start_date" placeholder="Start date"></div>

                      <div class="check-out one-third"><input type="date" id="return_date4" class="form-control" name="return_date" placeholder="Return date"></div>

                      
                    </div>
                    <input type="hidden" name="userId" id="userId4" value="${member.userId}">
                    <input type="hidden" name="pWriter" id="pWriter" value="${member.userName}">
                    <input type="hidden" name="theme" id="theme" value="부모님">   
                    <input type="hidden" name="status" id="status" value="Y"> 
                    <button type="button" class="search-submit btn btn-primary" onclick="setPlanner4();">일정 만들기</button>
                  </form>
                </div>
              </div>
              <div class="tab-pane fade" id="v-pills-family" role="tabpanel" aria-labelledby="v-pills-family-tab">
                <div class="block-17">
                  <form name="boardFrm" action="${pageContext.request.contextPath}/planner/AttachmentInsert.do" method="post" class="d-block d-lg-flex" id="goAhead5" onsubmit="return validate5();" enctype="multipart/form-data">
                    <div class="fields d-block d-lg-flex">

                      <div class="filebox">
                      	<label for="upFile5">사진 등록</label>
                      	<input type="file" name="upFile" id="upFile5">
                      </div>

				 	  <div class="check-in one-third"><input type="text" name="title" id="title5" class="form-control" placeholder="일정 제목"></div>

                      <div class="check-in one-third"><input type="date" id="start_date5" class="form-control" name="start_date" placeholder="Start date"></div>

                      <div class="check-out one-third"><input type="date" id="return_date5" class="form-control" name="return_date" placeholder="Return date"></div>
                      
                    </div>
                    <input type="hidden" name="userId" id="userId5" value="${member.userId}">
                    <input type="hidden" name="pWriter" id="pWriter" value="${member.userName}">
                    <input type="hidden" name="theme" id="theme" value="가족">   
                    <input type="hidden" name="status" id="status" value="Y"> 
                    <button type="button" class="search-submit btn btn-primary" onclick="setPlanner5();">일정 만들기</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </c:if>
    
    
    <c:if test="${no eq null and pNo eq null }">
    <!-- 일정세우기 가이드 화면 -->
   
    <div class="skw-pages">
    <div class="skw-page skw-page-1 active">
      <div class="skw-page__half skw-page__half--left">
        <div class="skw-page__skewed">
          <div class="skw-page__content"></div>
        </div>
      </div>
      <div class="skw-page__half skw-page__half--right">
     
        
        <div class="skw-page__skewed">
          <div class="skw-page__content">
            <h2 class="skw-page__heading" style="color:skyblue; font-family: bm;">여행계획하기</h2>
            <br><br>
            <p class="skw-page__description" style="font-family: bm;">1.여행 테마를 선택해보세요! ex)연인</p>
            <p class="skw-page__description" style="font-family: bm;">2.사진 및 제목 등록!(썸네일)</p>
            <p class="skw-page__description" style="font-family: bm;">3.날짜선택 후 일정만들기 버튼클릭!</p>
          </div>
        </div>
      </div>
    </div>
  <!-- 일정세우기 가이드 화면의 끝 -->
    </c:if>
	<c:if test="${no ne null or pNo ne null }">
    <section class="ftco-section contact-section">
      <div class="container">
        <div class="row block-9 mb-4">
        </div>
        <div class="row mt-5">
          <div class="col-md-8 map_wrap mx-auto">
          	
          	
			  	<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			    <div id="menu_wrap" class="bg_white">
		        	<div class="option">
			            <div>
			            <!-- form에서 div로 변경 작업
			                <form onsubmit="searchPlaces(); return false;">
			                              키워드 : <input type="text" value="제주" id="keyword" size="15"> 
	                    	<button type="submit">검색하기</button> 
		                	</form>
		                 -->
            			    <div>
			                              키워드 : <input type="text" value="제주" id="keyword" size="15"> 
	                    	<button type="button" onclick="searchPlaces();">검색하기</button> 
		                	</div>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
          
          
          
          
          
          </div>
          <div class="col-md-4">
            <form action="${pageContext.request.contextPath}/plannerPart/plannerPartMake.do" id="makingPlan" method="post" onsubmit="return pass();">
              <div class="form-group">
                <span>장소 : <input type="text" id="fMapTitle"  class=" form-control" name="mapTitle" placeholder="지도의 마크를 클릭하세요"></span>
              </div>
              <div class="form-group">
                <span>일정 시작 : <input type="datetime-local" min="${start_date}" max="${return_date}" class=" form-control" name="startTime" id="startTime_ck"></span>
              </div>
              <div class="form-group">
                <span>일정 끝 : <input type="datetime-local" min="${start_date}" max="${return_date}" class=" form-control" name="endTime" id="endTime_ck"></span>
              </div>
              <div class="form-group">
                <span>예상금액 : <input type="number" class="form-control" name="money" placeholder="숫자만 기입"></span>
              </div>
              <div class="form-group">
                <span>한줄평 : <textarea cols="30" rows="3" class="form-control" name="reason" id="describe" placeholder="가서 하고싶은 것 등을 적으시오"></textarea></span>
              </div>
              
              <input type="hidden" name="calendar_set" id="calendar_set" value="${calendar_set}">
              <c:if test="${no ne null }"><input type="hidden" name="pNo" id="pNo" value="${no}"></c:if>
              <c:if test="${pNo ne null }"><input type="hidden" name="pNo" id="pNo" value="${pNo}"></c:if>
              <input type="hidden" name="start_date" id="start_date" value="${start_date}">
              <input type="hidden" name="return_date" id="return_date" value="${return_date}">
              
              <input type="hidden" id="categoryName" name="category">
              <input type="hidden" id="fMapX" name="mapX">
              <input type="hidden" id="fMapY" name="mapY">
              
              
	              <div class="form-group" style="float:right">
	                <button type="button" class="btn btn-primary py-3 px-4" onclick="save();">Save</button>
	              </div>
              </c:if>
            </form>
          </div>
        </div>
        
        <form action="${pageContext.request.contextPath}/plannerPart/plannerPartDelete.do" id="deletePlan" method="post">
        	<input type="hidden" name="calendar_set" id="calendar_set" value="${calendar_set}">
              <c:if test="${no ne null }"><input type="hidden" name="pNo" id="pNo" value="${no}"></c:if>
              <c:if test="${pNo ne null }"><input type="hidden" name="pNo" id="pNo" value="${pNo}"></c:if>
              <input type="hidden" name="start_date" id="start_date" value="${start_date}">
              <input type="hidden" name="return_date" id="return_date" value="${return_date}">
              <input type="hidden" id="ppnoNumber"  class=" form-control" name="ppNo">
        </form>
        
        
        <div style="position: fixed; right: 20px; bottom: 50px;">
			<input type="submit" class="btn btn-primary py-3 px-4" onclick="${reservationPage}" value="예매페이지" />
  		</div>
        
        <c:if test="${pNo ne null }">
        	<div id='calendar'></div>
        	<form action="${pageContext.request.contextPath}/planner/plannerSeeConfirm.do?pNo=${pNo}" id="confirming">
        		<input type="hidden" name="pNo" id="pNo" value="${pNo}">
        		
		        <div class="form-group" style="float:right">
		        	<button type="button" class="btn btn-primary py-3 px-4" onclick="goConfirming();">확인하러 가기</button>
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
  <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8c0b6988029a8eedd98928d0fab7698&libraries=services"></script>
  <script>
  	
  /* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate1(){
		var user = $("#userId1").val();
		var content = $("#title1").val();
		var start = $("#start_date1").val();
		var end = $("#return_date1").val();
		
		if(user.trim().length==0){
			alert("로그인을 해야 진행이 가능해요~~");
			return false;
		}
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
		if(start > end){
			alert("플래너 이렇게 짤거야?");
			return false;
		}
		return true;
	}
	function validate2(){
		var user = $("#userId2").val();
		var content = $("#title2").val();
		var start = $("#start_date2").val();
		var end = $("#return_date2").val();
		
		if(user.trim().length==0){
			alert("로그인을 해야 진행이 가능해요~~");
			return false;
		}
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
		if(start > end){
			alert("플래너 이렇게 짤거야?");
			return false;
		}
		return true;
	}
	function validate3(){
		var user = $("#userId3").val();
		var content = $("#title3").val();
		var start = $("#start_date3").val();
		var end = $("#return_date3").val();
		
		if(user.trim().length==0){
			alert("로그인을 해야 진행이 가능해요~~");
			return false;
		}
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
		if(start > end){
			alert("플래너 이렇게 짤거야?");
			return false;
		}
		return true;
	}
	function validate4(){
		var user = $("#userId4").val();
		var content = $("#title4").val();
		var start = $("#start_date4").val();
		var end = $("#return_date4").val();
		
		if(user.trim().length==0){
			alert("로그인을 해야 진행이 가능해요~~");
			return false;
		}
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
		if(start > end){
			alert("플래너 이렇게 짤거야?");
			return false;
		}
		return true;
	}
	function validate5(){
		var user = $("#userId5").val();
		var content = $("#title5").val();
		var start = $("#start_date5").val();
		var end = $("#return_date5").val();
		
		if(user.trim().length==0){
			alert("로그인을 해야 진행이 가능해요~~");
			return false;
		}
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
		if(start > end){
			alert("플래너 이렇게 짤거야?");
			return false;
		}
		return true;
	}
  
	function setPlanner1(){
		/*
		if($("#upFile1").val().trim()==0){
			alert("사진을 넣어주세요~~");
			return false;
		}
		*/
		$("#goAhead1").submit();
		
	}
	function setPlanner2(){
		$("#goAhead2").submit();
		
	}
	function setPlanner3(){
		$("#goAhead3").submit();
		
	}
	function setPlanner4(){
		$("#goAhead4").submit();
		
	}
	function setPlanner5(){
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

	function pass(){
		var content = $("#fMapTitle").val();
		var startTime = $("#startTime_ck").val();
		var endTime = $("#endTime_ck").val();
		var chk="T";
		
		if(content.trim().length==0){
			alert("위치를 정해주세요~");
			return false;
		}
		if(startTime.indexOf(chk)==-1){
			alert("일정 시간까지 입력 부탁해요~~");
			return false;
		}
		if(endTime.indexOf(chk)==-1){
			alert("일정은 꼼꼼히... ");
			return false;
		}
		if(startTime > endTime){
			alert("시간을 잘 확인해요..");
			return false;
		}
		return true;
	}
	
	
	function save(){
		
		$("#makingPlan").submit();
		
	}
	
	function goConfirming(){
		
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
  	      now: '${start}',
  	      editable: true,
  	      aspectRatio: 1.8,
  	      scrollTime: '06:00',
  	      headerToolbar: {
  	        left: 'today prev,next',
  	        center: 'title',
  	        right: 'resourceTimelineDay,timeGridWeek,dayGridMonth'
  	      },
  	      customButtons: {
  	        promptResource: {
  	          text: '+ room',
  	          click: function() {
  	            var title = prompt('Room name');
  	            if (title) {
  	              calendar.addResource({ title: title });
  	            }
  	          }
  	        }
  	      },
  	      initialView: 'resourceTimelineDay',
  	      views: {
  	        resourceTimelineThreeDays: {
  	          type: 'resourceTimeline',
  	          duration: { days: 3 },
  	          buttonText: '3 days'
  	        }
  	      },
  	      resourceAreaHeaderContent: 'Plan',
  	      resourceLabelDidMount: function(arg) {
  	        var resource = arg.resource;

  	        arg.el.addEventListener('click', function() {
  	          if (confirm('Are you sure you want to delete ' + resource.title + '?')) {
  	        	$('#ppnoNumber').val(resource.id);
  	        	$("#deletePlan").submit();
  	            resource.remove();
  	          }
  	        });
  	      },
  	      resources: [
  	    	<c:forEach items="${list}" var="p" varStatus="loop">
	    	  	{ id: '${p.ppNo}', title: '${p.mapTitle}', eventColor: 'green' }
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

      
  	
  	
	var markers = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);
	
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
				
			// 유병호 추가
			console.log(places[i]);
			
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title, url, category, x, y) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	            // 마커 클릭시 이동
	            kakao.maps.event.addListener(marker, 'click', function() {
	            	$('#fMapTitle').val(title);
	            	$('#fMapTitle').attr('readonly', true);
	            	$('#categoryName').val(category);
	            	console.log(x);
	            	console.log(y);
	            	$('#fMapX').val(x);
	            	$('#fMapY').val(y);
	            });
	            // 검색 결과 입력시 이동
	            itemEl.onclick =  function () {
	            	window.open('about:blank').location.href=url;
	            };
	           
	        })(marker, places[i].place_name, places[i].place_url, places[i].category_group_name, places[i].x, places[i].y);
	        
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
		
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	};
 
  </script>
 
    
  </body>
</html>