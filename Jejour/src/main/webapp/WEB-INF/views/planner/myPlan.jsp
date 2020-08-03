<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<c:import url="../common/header.jsp"/>
	<head>
		<style>
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

<div class="ftco-section-search" style="background-color:#1161ee;">
        <div class="container">
          <div class="row">
           <div class="col-md-12 tabulation-search">
            <br><br>
              <div class="tab-content py-5" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                  <div class="block-17">
                    <form action="${pageContext.request.contextPath}/planner/plannerShare.do" method="post" class="d-block d-lg-flex">
                      <div class="fields d-block d-lg-flex">
                        <label style="font-size: 38px; color:white; font-weight: bold;">${ member.userName }님의</label>
                        <label style="font-size: 20px; color:white; margin-left: 10px; margin-top: 22px;">일정 보관함</label>
                      </div>
                      <button class="search-submit btn btn-primary" style="border-radius:25px; border: white;"
                      		onclick="moveSharePlane();">Other Plan</button>  
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      	
      
      	<br><br>     
    <section class="ftco-section bg-light" style="padding-top: 4em;">
      <div class="container">
    	
    	<!-- 리스트시작 -->    
        <div class="row" id="sharePlanList">
        <c:forEach items="${list}" var="s">        
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="blog-entry">
              <a href="#" class="block-20" style="background-image: url('images/image_1.jpg'); text-align: right;">
                <div class="col-sm-4" style="text-align: center; background-color: #ff5f5f; color : white;">
                  	${s.theme}
                </div>
              </a>
              <div class="text p-4">
                <div class="meta">
                  <div><a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=${s.PNo}">${s.startDay}</a></div>
                  <div><a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=${s.PNo}">~</a></div>
                  <div><a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=${s.PNo}">${s.endDay}</a></div>
                </div>
                <div class="meta">
                  <div><a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=${s.PNo}">작성자 : ${s.PWriter}</a></div>
                </div>
                <div style="height: 120px;">
                	<h3 class="heading"><a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=${s.PNo}">${s.title}</a></h3>
                </div>
                <p class="clearfix">
                  <a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=${s.PNo}" class="float-left">Read more</a>
                  <a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=${s.PNo}" class="float-right meta-chat"><span class="icon-thumbs-o-up"></span>&nbsp;${s.likeCount}</a>
                </p>
              </div>
            </div>
          </div>
	
       </c:forEach>
      </div>
	
	
		<!-- 페이징 -->
        <div class="row mt-5" style="margin-bottom: -40px;" id="pageBarDiv">
        	<div class="col text-center" id="pageBar">
				<c:out value="${pageBar}" escapeXml="false"/>
           	</div>
        </div>
        
        </div>
    </section>

<br><br>

<script>
		
  $(function(){	
	var cPage = 1;
		
		function searchShare(){
			cPage = 1;
			
			$.ajax({
				url : '${pageContext.request.contextPath}/planner/searchShare.do',
				type : 'get',
				data : {
					async : false,
					searchCondition : $('#searchCondition').val(),
    				keyword : $('#keyword').val(),
    				cPage : cPage
				},
				success : function(item){
					console.log(item);
					
					if(item.list == null || item.list.length == 0) {
    					alert("검색 결과가 없습니다!")
    				} else {
    					$(".ftco-animate").remove();
    					$("#pageBar").remove();
    					
    					$('#pageBarDiv').append(
    				        	'<div class="col text-center" id="pageBar">' +
    				        	item.pageBar +
	    			           	'</div>'
    					);

    					for(var i in item.list){
    						
	    					$('#sharePlanList').append(
	    					          '<div class="col-md-6 col-lg-3 ftco-animate">' +
	    					            '<div class="blog-entry">' +
	    					              '<a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=' + item.list[i].pno + '" class="block-20" style="background-image: url(' + '\'' + '\'' + '); text-align: right;">' +
	    					                '<div class="col-sm-4" style="text-align: center; background-color: #ff5f5f; color : white;">' +
	    					                  	item.list[i].theme +
	    					                '</div>' +
	    					              '</a>' +
	    					              '<div class="text p-4">' +
	    					                '<div class="meta">' +
	    					                  '<div><a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=' + item.list[i].pno + '">' + item.list[i].startDay + '</a></div>' +
	    					                  '<div><a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=' + item.list[i].pno + '">~</a></div>' +
	    					                  '<div><a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=' + item.list[i].pno + '">' + item.list[i].endDay + '</a></div>' +
	    					                '</div>' +
	    					                '<div class="meta">' +
	    					                  '<div><a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=' + item.list[i].pno + '">' + '작성자 :' + item.list[i].pwriter + '</a></div>' +
	    					                '</div>' +
	    					                '<div style="height: 120px;">' +
	    					                	'<h3 class="heading"><a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=' + item.list[i].pno + '">' + item.list[i].title + '</a></h3>' +
	    					                '</div>' +
	    					                '<p class="clearfix">' +
	    					                  '<a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=' + item.list[i].pno + '" class="float-left">Read more</a>' +
	    					                  '<a href="${pageContext.request.contextPath}/planner/maintenanceGo.do?pNo=' + item.list[i].pno + '" class="float-right meta-chat"><span class="icon-thumbs-o-up"></span>' + '&nbsp;' + item.list[i].likeCount + '</a>' +
	    					                '</p>' +
	    					              '</div>' +
	    					            '</div>' +
	    					          '</div>'
	    					);
    					}
    					
    				}
					// $(".ftco-animate").remove(); 하여 다시 js의 이펙트 효과 추가해줘야 append 됐을 때 나타남! 
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
				error : function() {
					alert("서치 실패!");
				}
			});
		}
			
	});
	
	</script>

<c:import url="../common/footer.jsp"/>