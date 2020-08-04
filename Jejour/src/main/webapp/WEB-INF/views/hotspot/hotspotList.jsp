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
	
    <!-- END slider -->

    <!-- ----------------------------------------------------------------------- -->
    <!-- ----------------------------------------------------------------------- -->
    <!-- ----------------------------------------------------------------------- -->

    <section class="ftco-section bg-light" style="padding-top: 4em;">
      <div class="container">
        <div class="row">
	        <div class="col-md-2">
				<select class="custom-select" id="searchCondition" name="searchCondition" style="height:40px;">
				  <option value="all">전체 검색</option>
				  <option value="fWriter">작성자</option>
				  <option value="fTitle">제목</option>
				</select>
			</div>
			<div class="col-md-7">
				<input type="search" id="keyword" class="multi-input" placeholder="검색어를 입력해보세요!">
			</div>
       		<div class="col-md-1 text-left">
         		<button type="button" class="btn btn-outline-secondary" onclick="search();">검색하기</button>
       		</div>
          	<div class="col-md-2 text-right">
         			<input type="button" class="btn btn-primary" onclick="fn_gohotspotInsert();" value="작성하기"/>
         		</div>
        </div>

        <br>
        <br>
        <div class="row" id="hotspotBoardList">
          <c:forEach items="${holist}" var="h"> 
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="blog-entry">
              <a href=<c:url value='/hotspotBoard/hotspotDetail.ho?no=${h.HNo}'/> class="block-20" style="background-image: url('${pageContext.request.contextPath}/resources/images/hotspotimg/desc/${h.HPreview}');">
              </a>
              <div class="text p-4">
                <div class="meta">
                  <div><a href="#">${h.HDate}</a></div>
                  <div><a href="#">${h.HWriter}</a></div>
                </div>
                <div  style="height: 120px;">
                <h3 class="heading"><a href="#">${h.HTitle}</a></h3>
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
        <div class="row mt-5" id="pageBarDiv">
          <div class="col text-center" id="pageBar">
            <div class="block-27">  
              <ul>
          		 <c:out value="${pageBar}" escapeXml="ture"/>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>


    <!------------------------------------------------------------------------------------------------------->
    <script>
	    function fn_gohotspotInsert(){
	   	 if('${member}' != null && '${member}' != '') {
	  	 		location.href = "${pageContext.request.contextPath}/hotspotBoard/hotspotInsert.ho";
	   	 } else {
	   		 alert("로그인 후 이용하세요!");
	   	 }
	    }
		
/*  		$(function(){
			$("tr[id]").on("click",function(){
				var boardNo = $(this).attr("id");
				console.log("hNo="+hNo);
			});
		}); */
		 
		var cPage = 1;
    	
    	function search(){
  			cPage = 1;
    		
    		$.ajax({
    			url : '${pageContext.request.contextPath}/hotspotBoard/search.ho',
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
    					            '<div class="block-27">' +
    					              '<ul>' +
    					          		 '<c:out value="' + list.pageBar + '" escapeXml="ture"/>' +
    					              '</ul>' +
    					            '</div>' +
    					          '</div>'
    					);
	    				
						// function fn_paging(cPage,numPerPage){location.href='flashList.fl?cPage='+cPage;}
    					
    					for(var i in list.list){
    						console.log(list.list);
    						console.log(new Date(list.list[i].hdate));
    						var fullDate = (new Date(list.list[i].hdate));
    						var year = fullDate.getFullYear();
    						var month = fullDate.getMonth() + 1;
    						var day = fullDate.getDate();
    						
    						var fmonth;
    						
    						if(month < 10) {
    							fmonth = '0' + month;
    						} else {
    							fmonth = month;
    						}
    						console.log("hno : "+ i + " : " + list.list[i].hno);
    						console.log("date : "+ i + " : " + year + fmonth + day);
    						console.log("hno : "+ i + " : " + list.list[i].hwriter);
    						console.log("hno : "+ i + " : " +list.list[i].htitle);
    						console.log("hno : "+ i + " : " +list.list[i].hpreview);
    						
	    					$('#hotspotBoardList').append(	    						    				            
		    				            '<div class="col-md-6 col-lg-3 ftco-animate">' +
		    				            '<div class="blog-entry">' +
		    				              '<a href=<c:url value="/hotspotBoard/hotspotDetail.ho?no=' + list.list[i].hno + '"/> class="block-20" style="background-image: url(\'${pageContext.request.contextPath}/resources/images/hotspotimg/desc/' + list.list[i].hpreview +  '\');">' +
		    				              '</a>' +
		    				              '<div class="text p-4">' +
		    				                '<div class="meta">' +
		    				                  '<div><a href="#">' + year + '-' + fmonth + '-' + day + '</a></div>' +
		    				                  '<div><a href="#">' + list.list[i].hwriter + '</a></div>' +
		    				                '</div>' +
		    				                '<div  style="height: 120px;">' +
		    				                '<h3 class="heading"><a href="#">' + list.list[i].htitle + '</a></h3>' +
		    				                '</div>' +
		    				              '</div>' +
		    				            '</div>'+
		    				          '</div>'
	    					);
    					}
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
   
   <c:import url="../common/footer.jsp"/>
   