<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<head>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<style>
		.btntoTop {
		    width: 44px;
		    height: 44px;
		    position: fixed;
		    bottom: 30px;
		    right: 30px;
		    background-color: #1161ee;
		    border-radius: 2px;
		    text-align: center;
		    line-height: 40px;
		    cursor: pointer;
		    opacity: 0;
		    -webkit-transition: opacity 0.2s ease;
		    transition: opacity 0.2s ease;
		}
		.btntoTop:before {
		    content: "∧";
		    display: inline-block;
		    vertical-align: middle;
		    font: 20px 'FontAwesome';
		    color : white;
		}
		.btntoTop.active {
		    opacity: 1;
		    z-index: 999;
		}
		.btntoTop.active:hover{
		    opacity:0.8;
		}
		
		@FONT-FACE {
			font-family: 'bm';
			src:url("${pageContext.request.contextPath}/resources/fonts/BMJUA_ttf.ttf");
		}

		#loading {
			height: 100%;
			left: 0px;
			position: fixed;
			_position:absolute; 
			top: 0px;
			width: 100%;
			filter:alpha(opacity=50);
			-moz-opacity:0.5;
			opacity : 0.5;
		}
	
		.loading {
			background-color: white;
			z-index: 199;
		}
	
		#loading_img{
			position:absolute; 
			top:50%;
			left:50%;
			height:35px;
			margin-top:0px;
			margin-left:0px;	
			z-index: 200;
		}
	</style>
</head>

<c:import url="../common/header.jsp">
	<c:param name="data" value="jejuPlace"/>
</c:import>

	    <div class="container" style="padding-top: 50px;">
	        <div class="row">
	        	<div class="col-lg-1"></div>
	        	<div class="col-lg-7" id="selectBar" style="font-weight: bolder;">
	        		<h1 class="mb-3" id="selectName" style="font-family: bm; color: #1161ee; margin-top: 8px;"># 제주도의 자연 관광지</h1>
	        	</div>
	        	<div class="col-lg-3 text-right">
					<select class="custom-select" id="searchCondition" name="searchCondition" style="height:40px; font-family: bm; width: 120px; margin-top: 20px;">
					  <option value="">분류 선택</option>
					  <option value="A01">자연</option>
					  <option value="A02">인문</option>
					  <option value="39">음식</option>
					  <option value="32">숙박</option>
					</select>
			
					<button class="btn btn-outline-secondary" onclick="search();" style="font-family: bm; margin-top: 20px;">이동하기</button>
				</div>
				<div class="col-lg-1"></div>
			</div>
		</div>
	
	
	<section class="ftco-section" style="padding: 3em 0;">
      <div class="container">
        <div class="row" id="tourList">
          
        </div>
      </div>
	<div class="col-lg-8 mx-auto" style="text-align: center;">
    	<div id="paging">
    		<div id="loading" class="loading"></div><img id="loading_img" class="loading" alt="loading" src="${pageContext.request.contextPath}/resources/images/loading_ani.gif"/>
    	</div>
	</div>
	
    </section>
    
	
	
	<script>
		$(function(){
				var page = 1;
				
				$.ajax({
					url : 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=IAr2WQZNdPm4pTR4rKCJJ5yENQV%2By1d1YupI3UuGLDsZLMVu8XeVwumY0yFJzhzckDIEaoUicd2kU955TTgV9w%3D%3D&contentTypeId=12&areaCode=39&sigunguCode=&cat1=A01&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=' + page + '&MobileOS=ETC&MobileApp=AppTest&_type=json',
					type : 'get',
					success : function(data){
						console.log(data.response.body);
						
						var list = data.response.body.items.item;
					    
						for(var i in list) {

							if(list[i].firstimage != null ) {
								$('#tourList').append(
										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(' + list[i].firstimage + ');"></a>' +
							            '<div class="text text-center">' +
							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
							              //'<a href="#" class="read">Read more</a>' +
							            '</div>' +
							            '<br />' +
							            '<br />' +
							            '<br />' +
							          '</div>'
								);
							} else {
								$('#tourList').append(
										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(${pageContext.request.contextPath}/resources/images/LogoMini.png);"></a>' +
							            '<div class="text text-center">' +
							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
							              //'<a href="#" class="read">Read more</a>' +
							            '</div>' +
							            '<br />' +
							            '<br />' +
							            '<br />' +
							          '</div>'
								);
							}
						}
						
					}, fail : function(){
						alert("데이터 불러오기 실패!");
					}
				});
		});
		
		function search() {
			var searchCondition = $('#searchCondition').val();
			page = 1;
			
			if(searchCondition == '39' || searchCondition == '32'){
				$.ajax({
					url : 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=IAr2WQZNdPm4pTR4rKCJJ5yENQV%2By1d1YupI3UuGLDsZLMVu8XeVwumY0yFJzhzckDIEaoUicd2kU955TTgV9w%3D%3D&contentTypeId=' + searchCondition + '&areaCode=39&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=' + page + '&MobileOS=ETC&MobileApp=AppTest&_type=json',
					type : 'get',
					success : function(data){
						$('#tourList').children().remove();
						console.log(data.response.body);
						var list = data.response.body.items.item;
						
						$('#selectBar').children().remove();
						if(searchCondition == '39'){
							$('#selectBar').append(
								'<h1 class="mb-3" id="selectName" style="font-family: bm; color: #1161ee; margin-top: 8px;"># 제주도의 음식점</h1>'
							);						
						} else {
							$('#selectBar').append(
								'<h1 class="mb-3" id="selectName" style="font-family: bm; color: #1161ee; margin-top: 8px;"># 제주도의 숙박시설</h1>'
							);	
						}
						
						for(var i in list) {
							if(list[i].firstimage != null ) {
								$('#tourList').append(
										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(' + list[i].firstimage + ');"></a>' +
							            '<div class="text text-center">' +
							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
							              //'<a href="#" class="read">Read more</a>' +
							            '</div>' +
							            '<br />' +
							            '<br />' +
							            '<br />' +
							          '</div>'
								);
							} else {
								$('#tourList').append(
										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(${pageContext.request.contextPath}/resources/images/LogoMini.png);"></a>' +
							            '<div class="text text-center">' +
							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
							              //'<a href="#" class="read">Read more</a>' +
							            '</div>' +
							            '<br />' +
							            '<br />' +
							            '<br />' +
							          '</div>'
								);
							}
						}
						
						page++;
						
					}, fail : function(){
						alert("데이터 불러오기 실패!");
					}
				});
			} else if(searchCondition == ''){
				alert("분류를 선택하세요!");
			} else {
				$.ajax({
					url : 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=IAr2WQZNdPm4pTR4rKCJJ5yENQV%2By1d1YupI3UuGLDsZLMVu8XeVwumY0yFJzhzckDIEaoUicd2kU955TTgV9w%3D%3D&contentTypeId=12&areaCode=39&sigunguCode=&cat1=' + searchCondition + '&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json',
					type : 'get',
					success : function(data){
						$('#tourList').children().remove();
						console.log(data.response.body);
						var list = data.response.body.items.item;
						
						$('#selectBar').children().remove();
						if(searchCondition == 'A01'){
							$('#selectBar').append(
								'<h1 class="mb-3" id="selectName" style="font-family: bm; color: #1161ee; margin-top: 8px;"># 제주도의 자연 관광지</h1>'
							);						
						} else {
							$('#selectBar').append(
								'<h1 class="mb-3" id="selectName" style="font-family: bm; color: #1161ee; margin-top: 8px;"># 제주도의 인문 관광지</h1>'
							);	
						}
						
						for(var i in list) {
							if(list[i].firstimage != null ) {
								$('#tourList').append(
										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(' + list[i].firstimage + ');"></a>' +
							            '<div class="text text-center">' +
							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
							              //'<a href="#" class="read">Read more</a>' +
							            '</div>' +
							            '<br />' +
							            '<br />' +
							            '<br />' +
							          '</div>'
								);
							} else {
								$('#tourList').append(
										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(${pageContext.request.contextPath}/resources/images/LogoMini.png);"></a>' +
							            '<div class="text text-center">' +
							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
							              //'<a href="#" class="read">Read more</a>' +
							            '</div>' +
							            '<br />' +
							            '<br />' +
							            '<br />' +
							          '</div>'
								);
							}
						}
						
						page++;
						
					}, fail : function(){
						alert("데이터 불러오기 실패!");
					}
				});
			}
		}
	</script>
	
	<script>
	 // 로딩 중
	$('.loading').hide();
	
	$(document).ready(function(){
		$(window)
		.ajaxStart(function(){
			$('.loading').show();
		})
		.ajaxStop(function(){
			$('.loading').hide();
		});
	}); 

	// 무한 스크롤 이벤트 작성!
	var page = 2;
	window.onscroll = function(){
	    		var pageEnd = $('body').get(0).scrollHeight - $(window).scrollTop() - $(window).height();
	    		
	    		if(pageEnd < 500) {
	    		
	    			// console.log("이벤트 발생!");
	            	
	       			var searchCondition = $('#searchCondition').val();
	       			// console.log("이벤트 도달!");
	       			
	       			if(searchCondition == '39' || searchCondition == '32') {
	       				$.ajax({
	       					url : 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=IAr2WQZNdPm4pTR4rKCJJ5yENQV%2By1d1YupI3UuGLDsZLMVu8XeVwumY0yFJzhzckDIEaoUicd2kU955TTgV9w%3D%3D&contentTypeId=' + searchCondition + '&areaCode=39&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=' + page + '&MobileOS=ETC&MobileApp=AppTest&_type=json',
	       					type : 'get',
	       					async : false,
	       					success : function(data){
	       						
	       						console.log(data.response.body);
	       						console.log(page);
	       						
	       						var list = data.response.body.items.item;
	       						
	       						for(var i in list) {
	       							
	       							if(list[i].firstimage != null ) {
	       								$('#tourList').append(
	       										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
	       							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(' + list[i].firstimage + ');"></a>' +
	       							            '<div class="text text-center">' +
	       							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
	       							              //'<a href="#" class="read">Read more</a>' +
	       							            '</div>' +
	       							            '<br />' +
	       							            '<br />' +
	       							            '<br />' +
	       							          '</div>'
	       								);
	       							
	       							} else {
	       								$('#tourList').append(
	       										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
	       							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(${pageContext.request.contextPath}/resources/images/LogoMini.png);"></a>' +
	       							            '<div class="text text-center">' +
	       							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
	       							              //'<a href="#" class="read">Read more</a>' +
	       							            '</div>' +
	       							            '<br />' +
	       							            '<br />' +
	       							            '<br />' +
	       							          '</div>'
	       								);
	       							}
	       						}
	       						// window.scrollBy(-1000, 0);
	       						// location.href='#tourList';
	       						sleep(1000);
	       						page++;
	       						
	       						if(data.response.body.items == "" || data.response.body.items == null) {
	       							alert("데이터가 더이상 없습니다~!");
	       							location.href='#tourList';
	       						}
	       						
	       					}, error : function(){
	       						alert("데이터 불러오기 실패!");
	       					}
	       				});
	       				
	       			} else if(searchCondition == ''){
	       				
	       				$.ajax({
	    					url : 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=IAr2WQZNdPm4pTR4rKCJJ5yENQV%2By1d1YupI3UuGLDsZLMVu8XeVwumY0yFJzhzckDIEaoUicd2kU955TTgV9w%3D%3D&contentTypeId=12&areaCode=39&sigunguCode=&cat1=A01&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=' + page + '&MobileOS=ETC&MobileApp=AppTest&_type=json',
	    					type : 'get',
	    					async : false,
	    					success : function(data){
	    						var list = data.response.body.items.item;
	    					    
	    						for(var i in list) {

	    							if(list[i].firstimage != null ) {
	    								$('#tourList').append(
	    										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
	    							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(' + list[i].firstimage + ');"></a>' +
	    							            '<div class="text text-center">' +
	    							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
	    							              //'<a href="#" class="read">Read more</a>' +
	    							            '</div>' +
	    							            '<br />' +
	    							            '<br />' +
	    							            '<br />' +
	    							          '</div>'
	    								);
	    							} else {
	    								$('#tourList').append(
	    										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
	    							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(${pageContext.request.contextPath}/resources/images/LogoMini.png);"></a>' +
	    							            '<div class="text text-center">' +
	    							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
	    							              //'<a href="#" class="read">Read more</a>' +
	    							            '</div>' +
	    							            '<br />' +
	    							            '<br />' +
	    							            '<br />' +
	    							          '</div>'
	    								);
	    							}
	    						}
	    						
	    						sleep(1000);
	       						page++;
	       						
	       						if(data.response.body.items == "" || data.response.body.items == null) {
	       							alert("데이터가 더이상 없습니다~!");
	       							location.href='#tourList';
	       						}
	    						
	    					}, fail : function(){
	    						alert("데이터 불러오기 실패!");
	    					}
	    				});
	       				
	       			} else {
	       				
	       				$.ajax({
	       					url : 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=IAr2WQZNdPm4pTR4rKCJJ5yENQV%2By1d1YupI3UuGLDsZLMVu8XeVwumY0yFJzhzckDIEaoUicd2kU955TTgV9w%3D%3D&contentTypeId=12&areaCode=39&sigunguCode=&cat1=' + searchCondition + '&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=' + page + '&MobileOS=ETC&MobileApp=AppTest&_type=json',
	       					type : 'get',
	       					async : false,
	       					success : function(data){
	       						var list = data.response.body.items.item;
	       						
	       						for(var i in list) {
	       							if(list[i].firstimage != null ) {
	       								$('#tourList').append(
	       										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
	       							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(' + list[i].firstimage + ');"></a>' +
	       							            '<div class="text text-center">' +
	       							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
	       							              //'<a href="#" class="read">Read more</a>' +
	       							            '</div>' +
	       							            '<br />' +
	       							            '<br />' +
	       							            '<br />' +
	       							          '</div>'
	       								);
	       							} else {
	       								$('#tourList').append(
	       										'<div class="col-lg-3 promo ftco-animate fadeInUp ftco-animated">' +
	       							            '<a href="https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=' + list[i].title + '" target="_blank" class="promo-img mb-4" style="background-image: url(${pageContext.request.contextPath}/resources/images/LogoMini.png);"></a>' +
	       							            '<div class="text text-center">' +
	       							              '<h2 style="font-family: bm">' + list[i].title +'</h2>' +
	       							              //'<a href="#" class="read">Read more</a>' +
	       							            '</div>' +
	       							            '<br />' +
	       							            '<br />' +
	       							            '<br />' +
	       							          '</div>'
	       								);
	       							}
       							}
	       						//window.scrollBy(-1000, 0);
	       						sleep(1000);
	       						page++;
	       						
	       						if(data.response.body.items == "" || data.response.body.items == null) {
	       							alert("데이터가 더이상 없습니다~!");
	       							location.href='#tourList';
	       						}
	       						
	       					}, error : function(){
	       						alert("데이터 불러오기 실패!");
	       					}
	       				});
	       				
    			 }
    		}
	};
	
	function sleep (delay) {
	   $('.loading').css('display', 'block');
	   var start = new Date().getTime();
	   while (new Date().getTime() < start + delay);
	   $('.loading').css('display', 'none');
	}
	
	// 상단으로 이동
    var btnUp = $('<div/>', {'class':'btntoTop'});
    btnUp.appendTo('body');
    $(document)
        .on('click', '.btntoTop', function() {
            $('html, body').animate({
                scrollTop: 0
            }, 700);
        });

    $(window)
        .on('scroll', function() {
            if ($(this).scrollTop() > 200)
                $('.btntoTop').addClass('active');
            else
                $('.btntoTop').removeClass('active');
        });
    
	</script>

<c:import url="../common/footer.jsp"/>