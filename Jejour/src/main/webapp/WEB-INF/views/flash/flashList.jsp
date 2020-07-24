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

	<c:import url="../common/header.jsp"/>

    <section class="ftco-section bg-light" style="padding-top: 4em;">
      <div class="container">
        <div class="row">
        	<div class="col-md-2">
				<select class="custom-select" id="searchCondition" name="searchCondition" style="height:40px;">
				  <option value="all">전체 검색</option>
				  <option value="userId">작성자</option>
				  <option value="fMapTitle">장소</option>
				  <option value="fContent">내용</option>
				</select>
			</div>
			<div class="col-md-7">
				<input type="search" id="keyword" class="multi-input" placeholder="검색어를 입력해보세요!">
			</div>
       		<div class="col-md-1 text-left">
         		<button type="button" class="btn btn-outline-secondary" onclick="search();">검색하기</button>
       		</div>
       		<div class="col-md-2 text-right">
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
                  <div><a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=${f.FNo}">${f.FMeetDate} ${f.FMeetTime}</a></div>
                  &nbsp;
                  <div><a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=${f.FNo}">${f.userId}</a></div>
                </div>
                <div style="height: 120px;">
                <h3 class="heading"><a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=${f.FNo}">${f.FTitle}</a></h3>
                </div>
                <p class="clearfix">
                  <a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=${f.FNo}" class="float-left">Read more</a>
                  <a href="#" class="float-right meta-chat"><span class="icon-chat"></span> 3</a>
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
    
    <script>
     function goFlashBoardInsert(){
    	 location.href = "${pageContext.request.contextPath}/flashBoard/flashBoardForm.fl";
     }
    </script>
    
    <script>
    	var cPage = 1;
    	
    	function search(){
  			cPage = 1;
    		
    		$.ajax({
    			url : '${pageContext.request.contextPath}/flashBoard/search.fl',
    			type : 'get',
    			data : {
    				async : false,
    				searchCondition : $('#searchCondition').val(),
    				keyword : $('#keyword').val(),
    				cPage : cPage
    			},
    			success : function(list){
    				console.log(list);
    				
    				if(list.list == null || list.list.length == 0) {
    					alert("검색 결과가 없습니다!")
    				} else {
    					$(".ftco-animate").remove();
    					$("#pageBar").remove();
    					
    					$('#pageBarDiv').append(
    				        	'<div class="col text-center" id="pageBar">' +
    				        	list.pageBar +
	    			           	'</div>'
    					);
	    					
						function fn_paging(cPage,numPerPage){location.href='flashList.fl?cPage='+cPage;}
    					
    					for(var i in list.list){
    						console.log(new Date(list.list[i].fmeetDate));
    						var fullDate = (new Date(list.list[i].fmeetDate));
    						var year = fullDate.getFullYear();
    						var month = fullDate.getMonth() + 1;
    						var day = fullDate.getDate();
    						
    						var fmonth;
    						
    						if(month < 10) {
    							fmonth = '0' + month;
    						} else {
    							fmonth = month;
    						}
    						
	    					$('#flashBoardList').append(
	    							'<div class="col-md-6 col-lg-3 ftco-animate">' +
		    				            '<div class="blog-entry">' +
		    				              '<div class="block-20">' +
		    				              	'<div id="' + list.list[i].fno + '" style="height: 100%; width: 100%;"></div>' +
		    				              '</div>' +
		    				              '<div class="text p-4">' +
		    				                '<div class="meta">' +
		    				                  '<div><a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=' + list.list[i].fno + '"' + '>' + year + '-' + fmonth + '-' + day + '  ' + list.list[i].fmeetTime + '</a></div>' +
		    				                  '<div><a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=' + list.list[i].fno + '"' + '>' + list.list[i].userId + '</a></div>' +
		    				                '</div>' +
		    				                '<div style="height: 120px;">' +
		    				                '<h3 class="heading"><a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=' + list.list[i].fno + '"' + '>' + list.list[i].ftitle + '</a></h3>' +
		    				                '</div>' +
		    				                '<p class="clearfix">' +
		    				                  '<a href="${pageContext.request.contextPath}/flashBoard/flashBoardDetail.fl?fNo=' + list.list[i].fno + '"' + 'class="float-left">Read more</a>' +
		    				                  '<a href="#" class="float-right meta-chat"><span class="icon-chat"></span> 3</a>' +
		    				                '</p>' +
		    				              '</div>' +
		    				            '</div>' +
	    				            '</div>'
	    					);
	    					
		    					var mapContainer = document.getElementById(list.list[i].fno),
		    				    mapOption = {  
		    				        center: new kakao.maps.LatLng(list.list[i].fmapY, list.list[i].fmapX),
		    				        level: 3
		    				    };
		    					var map = new kakao.maps.Map(mapContainer, mapOption);
		    					
		    					// 마커가 표시될 위치입니다 
		    					var markerPosition  = new kakao.maps.LatLng(list.list[i].fmapY, list.list[i].fmapX); 
		    					
		    					// 마커를 생성합니다
		    					var marker = new kakao.maps.Marker({
		    					    position: markerPosition
		    					});
		    					
		    					// 마커가 지도 위에 표시되도록 설정합니다
		    					marker.setMap(map);
	
		    					var iwContent = '<div style="padding:5px; color:black; text-align:center; font-size:14px;" class="info">' + list.list[i].fmapTitle + '<br><br></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    					iwPosition = new kakao.maps.LatLng(list.list[i].fmapY, list.list[i].fmapX);  //인포윈도우 표시 위치입니다
	
		    					// 인포윈도우를 생성합니다
		    					var infowindow = new kakao.maps.InfoWindow({
		    					    position : iwPosition, 
		    					    content : iwContent
		    					});
		    					  
		    					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		    					infowindow.open(map, marker);
		    					
		    					};
	    					}

							var counter = function() {
								
								$('#section-counter').waypoint( function( direction ) {
		
									if( direction === 'down' && !$(this.element).hasClass('ftco-animated') ) {
		
										var comma_separator_number_step = $.animateNumber.numberStepFactories.separator(',')
										$('.number').each(function(){
											var $this = $(this),
												num = $this.data('number');
												console.log(num);
											$this.animateNumber(
											  {
											    number: num,
											    numberStep: comma_separator_number_step
											  }, 7000
											);
										});
										
									}
		
								} , { offset: '95%' } );
		
							}
							counter();

							var contentWayPoint = function() {
								var i = 0;
								$('.ftco-animate').waypoint( function( direction ) {
		
									if( direction === 'down' && !$(this.element).hasClass('ftco-animated') ) {
										
										i++;
		
										$(this.element).addClass('item-animate');
										setTimeout(function(){
		
											$('body .ftco-animate.item-animate').each(function(k){
												var el = $(this);
												setTimeout( function () {
													var effect = el.data('animate-effect');
													if ( effect === 'fadeIn') {
														el.addClass('fadeIn ftco-animated');
													} else if ( effect === 'fadeInLeft') {
														el.addClass('fadeInLeft ftco-animated');
													} else if ( effect === 'fadeInRight') {
														el.addClass('fadeInRight ftco-animated');
													} else {
														el.addClass('fadeInUp ftco-animated');
													}
													el.removeClass('item-animate');
												},  k * 50, 'easeInOutExpo' );
											});
											
										}, 100);
										
									}
		
								} , { offset: '95%' } );
							};
							contentWayPoint();
    			},
    			error : function(){
    				alert("서치 실패!");
    			}
    		});
    	}
    </script>
    
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
	