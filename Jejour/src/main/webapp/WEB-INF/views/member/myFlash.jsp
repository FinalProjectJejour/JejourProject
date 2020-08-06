<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
	<head>
		<style>
			.info {
				width:200px;
				height:60px;
			}
		  	.multi-input {
			    display: inline-block;
			    width: 100%;
			    line-height: 30px;
			    border: 1px solid grey;
			    outline: none;
			    background: white;
			    padding: 0 20px;
			    height: 40px;
		  	}
		</style>
	</head>

	<c:import url="../common/header.jsp">
		<c:param name="data" value="myFlash"/>
	</c:import>
	
<div class="ftco-section-search" style="background-color:#1161ee;">
        <div class="container">
          <div class="row">
           <div class="col-md-12 tabulation-search">
            <br><br>
              <div class="tab-content py-5" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                  <div class="block-17">
                    <form action="${pageContext.request.contextPath}/flashBoard/flashList.fl" method="post" class="d-block d-lg-flex">
                      <div class="fields d-block d-lg-flex">
                        <label style="font-size: 38px; color:white; font-weight: bold;">${ member.userName }님의</label>
                        <label style="font-size: 20px; color:white; margin-left: 10px; margin-top: 22px;">번개 게시판</label>
                      </div>
                      <button class="search-submit btn btn-primary" style="border-radius:25px; border: white;"
                      		onclick="moveSharePlane();">Other FlaSh</button>  
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    <section class="ftco-section bg-light" style="padding-top: 4em;">
      <div class="container">
        <div class="row">
       		<div class="col-md-12 mx-auto text-right">
         		<button type="button" class="btn btn-primary" onclick="goFlashBoardInsert();">작성하기</button>
       		</div>
        </div>

        <br>
        <br>
        <div class="row" id="flashBoardList">
        <c:forEach items="${list}" var="f"> 
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="blog-entry">
              <div class="block-20">
              <div id="${f.FNo}" style="height: 100%; width: 100%;"></div>
              </div>
              <div class="text p-4">
                <div class="meta">
                  <div><a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=${f.FNo}">날짜 : ${f.FMeetDate} ${f.FMeetTime}</a></div>
                </div>
                <div class="meta">
                  <div><a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=${f.FNo}">작성자 : ${f.FWriter}</a></div>
                </div>
                <div style="height: 120px;">
                <h3 class="heading"><a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=${f.FNo}">${f.FTitle}</a></h3>
                </div>
                <p class="clearfix">
                  <a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=${f.FNo}" class="float-left">Read more</a>
                  <a href="#" class="float-right meta-chat"><span class="icon-chat"></span> ${f.commentCount}</a>
                </p>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
        
        <div class="row mt-5" style="margin-bottom: -40px;" id="pageBarDiv">
        	<div class="col text-center" id="pageBar">
				<c:out value="${pageBar}" escapeXml="false"/>
           	</div>
        </div>
      </div>
         
    </section>
        
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8c0b6988029a8eedd98928d0fab7698&libraries=services"></script>
	<script>
	function mapRead(){
    <c:forEach items="${list}" var="f"> 
	var mapContainer${f.FNo} = document.getElementById("${f.FNo}"),
    mapOption${f.FNo} = {  
        center: new kakao.maps.LatLng(${f.FMapY}, ${f.FMapX}),
        level: 3
    };
	var map${f.FNo} = new kakao.maps.Map(mapContainer${f.FNo}, mapOption${f.FNo});
	
	// 마커가 표시될 위치입니다 
	var markerPosition${f.FNo}  = new kakao.maps.LatLng(${f.FMapY}, ${f.FMapX}); 
	
	// 마커를 생성합니다
	var marker${f.FNo} = new kakao.maps.Marker({
	    position: markerPosition${f.FNo}
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker${f.FNo}.setMap(map${f.FNo});

	var iwContent${f.FNo} = '<div style="padding:5px; color:black; text-align:center; font-size:14px;" class="info">${f.FMapTitle}<br><br></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	iwPosition${f.FNo} = new kakao.maps.LatLng(${f.FMapY}, ${f.FMapX}); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow${f.FNo} = new kakao.maps.InfoWindow({
	    position : iwPosition${f.FNo}, 
	    content : iwContent${f.FNo} 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow${f.FNo}.open(map${f.FNo}, marker${f.FNo});
	
	</c:forEach>
	};
	mapRead();
	</script>
	
	<c:import url="../common/footer.jsp"/>
	