<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

	<c:import url="../common/header.jsp"/>

    <section class="ftco-section bg-light" style="padding-top: 4em;">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-right">
            <button type="button" class="btn btn-primary" onclick="goFlashBoardInsert();">작성하기</button>
          </div>
        </div>

        <br>
        <br>
        <div class="row">
        <c:forEach items="${list}" var="f"> 
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="blog-entry">
              <div class="block-20">
              <div id="${f.FNo}" style="height: 100%; width: 100%;"></div>
              </div>
              <div class="text p-4">
                <div class="meta">
                  <div><a href="#">${f.FMeetDate} ${f.FMeetTime}</a></div>
                  <div><a href="#">${f.userId}</a></div>
                </div>
                <div style="height: 120px;">
                <h3 class="heading"><a href="#">${f.FTitle}</a></h3>
                </div>
                <p class="clearfix">
                  <a href="#" class="float-left">Read more</a>
                  <a href="#" class="float-right meta-chat"><span class="icon-chat"></span> 3</a>
                </p>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
		
		<c:out value="${pageBar}" escapeXml="false"/>
		
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <script>
     function goFlashBoardInsert(){
    	 location.href = "${pageContext.request.contextPath}/flashBoard/flashBoardForm.fl";
     }
    </script>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8c0b6988029a8eedd98928d0fab7698&libraries=services"></script>
    <c:forEach items="${list}" var="f"> 
	<script>
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
	
	var iwContent${f.FNo} = '<div style="padding:5px; color:black; text-align:center;">${f.FMapTitle}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition${f.FNo} = new kakao.maps.LatLng(${f.FMapY}, ${f.FMapX}); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow${f.FNo} = new kakao.maps.InfoWindow({
	    position : iwPosition${f.FNo}, 
	    content : iwContent${f.FNo} 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow${f.FNo}.open(map${f.FNo}, marker${f.FNo});
	</script>
	</c:forEach>

	<c:import url="../common/footer.jsp"/>
	