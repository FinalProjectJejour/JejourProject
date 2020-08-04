<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
</head>
<style>
	@import url('https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&subset=cyrillic,cyrillic-ext,devanagari,greek,greek-ext,latin-ext,vietnamese');

body{
    width: 100%;
  	height: 100vh;
  	background: #000;
  	display: block;
  	margin:0
  	

}

/* #Cursor
================================================== */
.cursor,
.cursor2,
.cursor3{
    position: fixed;
    border-radius: 50%; 
    transform: translateX(-50%) translateY(-50%);
    pointer-events: none;
    left: -100px;
    top: 50%
}
.cursor{
    background-color: #fff;
    height: 0;
    width: 0;
    z-index: 99999;
}
.cursor2,.cursor3{
    height: 36px;
    width: 36px;
    z-index:99998;
    -webkit-transition:all 0.3s ease-out;
    transition:all 0.3s ease-out
}
.cursor2.hover,
.cursor3.hover{
    -webkit-transform:scale(2) translateX(-25%) translateY(-25%);
    transform:scale(2) translateX(-25%) translateY(-25%);
    border:none
}
.cursor2{
    border: 2px solid #fff;
    box-shadow: 0 0 22px rgba(255, 255, 255, 0.6);
}
.cursor2.hover{
    background: rgba(255,255,255,.1);
    box-shadow: 0 0 12px rgba(255, 255, 255, 0.2);
}

/* #Slider
================================================== */

.section{
    position: relative;
    width: 100%;
    

    height: 100vh;
    background-color: #212121;
}

/* Case Study Showcase
================================================== */

.case-study-wrapper {
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 10;
    width: auto;
    margin: 0;
    padding: 0;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    list-style: none;
}
.case-study-wrapper .case-study-name a {
    position: relative;
    list-style: none;
    margin: 0;
    display: block;
    text-align: center;
    padding: 0;
    font-size: 28px;
    margin-top: 25px;
    margin-bottom: 25px;
    font-family: 'Poppins', sans-serif;
    font-weight: 500;
    line-height: 1.3;
    letter-spacing: 2px;
    color: #8e8d9a;
    opacity: 0.5;
    text-decoration: none;
    -webkit-transition: all 300ms linear;
    transition: all 300ms linear; 
}   
.case-study-wrapper .case-study-name a:hover {
    text-decoration: none;
}   
.case-study-wrapper .case-study-name.active a {
    opacity: 1;
    color: #fff;
}   
.case-study-images {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    margin:0;
    z-index:2;
}   
.case-study-images li {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    overflow: hidden;
    list-style:none;
    -webkit-transition: all 300ms linear;
    transition: all 300ms linear; 
}   
.case-study-images li .img-hero-background{
    position: absolute;
    width: 100%;
    height: 100%;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    background-position:center center;
    background-repeat:no-repeat;
    top: 0;
    left: 0;
    overflow: hidden;
    list-style:none;
    opacity: 0;
    -webkit-transform: translateY(-30px);
    transform: translateY(-30px);
    -webkit-transition: all 300ms linear;
    transition: all 300ms linear; 
}
.case-study-images li.show .img-hero-background {
    opacity: 1;
    -webkit-transform: translateY(0);
    transform: translateY(0);
} 
.case-study-images li .case-study-title{
    position: absolute;
    bottom: 30px;
    left: 30px;
    display: block;
    opacity: 0;
    color: #fff;
    z-index: 19;
    letter-spacing: 1px;
    font-size: 14px;
    font-family: 'Roboto', sans-serif;
    -webkit-writing-mode: vertical-lr;
    writing-mode: vertical-lr;
    font-weight: 400;
    line-height: 16px;
    color: #fff; 
    font-style: italic;
    -webkit-transform: translateX(-100%);
    transform: translateX(-100%);
    -webkit-transition: all 300ms linear;
    transition: all 300ms linear; 
}
.case-study-images li.show .case-study-title {
    opacity: 1;
    -webkit-transform: translateX(0);
    transform: translateX(0);
} 
.case-study-images li .hero-number-back{
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    display: block;
    list-style:none;
    opacity: 0;
    font-size: 18vw;
    font-family: 'Poppins', sans-serif;
    font-weight: 900;
    line-height: 1;
    color: rgba(255,255,255,.12);
    z-index: 1;
    -webkit-transition: all 300ms linear;
    transition: all 300ms linear; 
} 
.case-study-images li .hero-number{
    position: absolute;
    bottom: 40px;
    left: 50%;
    width: 40px;
    margin-left: -70px;
    display: block;
    letter-spacing: 2px;
    text-align: center;
    list-style:none;
    opacity: 0;
    font-size: 13px;
    font-family: 'Poppins', sans-serif;
    font-weight: 300;
    line-height: 1;
    color: #fff;
    z-index: 6;
    -webkit-transform: translateY(100%);
    transform: translateY(100%);
    -webkit-transition: all 300ms linear;
    transition: all 300ms linear; 
} 
.case-study-images li .hero-number-fixed{
	
    bottom: 40px;
    left: 50%;
    margin-left: 30px;
    width: 40px;
    text-align: center;
    letter-spacing: 2px;
    list-style:none;
    font-size: 13px;
    font-family: 'Poppins', sans-serif;
    font-weight: 300;
    line-height: 1;
    color: #fff;
    z-index: 6;
}
.case-study-images li .hero-number-fixed:before{
    position: absolute;
    content: '';
    top: 50%;
    left: -60px;
    width: 60px;
    height: 1px;
    z-index: 1;
    background-color: rgba(255,255,255,.4);
}
.case-study-images li.show .hero-number {
    opacity: 1;
    -webkit-transform: translateY(0);
    transform: translateY(0);
} 
.case-study-images li.show .hero-number-back {
    opacity: 1;
} 
.dark-over-hero{
    position:absolute;
    width:100%;
    height:100%;
    top:0;
    left:0;
    z-index:5;
    background-color: #050505;
    opacity: 0.2;
}
.case-study-images li:nth-child(1) .img-hero-background{
    background-image: url("${pageContext.request.contextPath }/resources/images/airplane3.jpg");
}
.case-study-images li:nth-child(2) .img-hero-background{
    background-image: url("${pageContext.request.contextPath }/resources/images/rent3.jpg");
}
.case-study-images li:nth-child(3) .img-hero-background{
    background-image: url("${pageContext.request.contextPath }/resources/images/hotel3.jpg");
}
.case-study-images li:nth-child(4) .img-hero-background{
    background-image: url("${pageContext.request.contextPath }/resources/images/ship.jpg");
}

/* #Media
================================================== */

@media (max-width: 991px) { 
    .case-study-images li .hero-number-back{
        font-size: 26vw;
    } 
}

@media (max-width: 767px) { 
    .case-study-wrapper .case-study-name a {
        font-size: 20px;
        letter-spacing: 1px;
    }
    .case-study-images li .hero-number-back{
        font-size: 32vw;
    } 
}

/* #Link to page
================================================== */

.link-to-portfolio {

    top: 30px;
    right: 30px;
    z-index: 20;
    cursor: pointer;
    width: 40px;
    height: 40px;
    text-align: center;
    border-radius: 3px;
    background-position: center center;
    background-size: cover;
    background-image: url('https://ivang-design.com/ig-logo.jpg');
    box-shadow: 0 0 0 2px rgba(255,255,255,.3);
    transition: opacity .2s, border-radius .2s, box-shadow .2s;
    transition-timing-function: ease-out;
}
.link-to-portfolio:hover {
    opacity: 0.8;
    border-radius: 50%;
    box-shadow: 0 0 0 2px rgba(255,255,255,0);
}
 

</style>




<body>
  
  	   <div class="section">
            <ul class="case-study-wrapper">
                <li class="case-study-name">                                
                    <a href="https://www.tripadvisor.co.kr/CheapFlightsHome" target="_blank" class="hover-target">Plane Reservation</a>
                </li>
                <li class="case-study-name">                                            
                    <a href="https://rentinjeju.com/?gclid=CjwKCAjw34n5BRA9EiwA2u9k39wmGrtWSF3hqYCRp1uupXa-k6bhfFfVdy8Okug-HKdQoz_qjonXgBoC0Z8QAvD_BwE" target="_blank" class="hover-target">Rental Car</a>
                </li>
                <li class="case-study-name">                                            
                    <a href="https://www.booking.com/accommodation/region/kr/jeju.ko.html?aid=398997;label=jeju-3xiYXZYm3X%2A2qNM_AZxxWgS366455538929%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-2635673379%3Alp1009871%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YeHkCqp9rpjzBdqoe_CbKeE;sid=005483c1c45b0a1e8a696d863701beaa;keep_landing=1&gclid=CjwKCAjw34n5BRA9EiwA2u9k3-InhufTgO-4yH9yteJix-vUhL2X2NSmDetijOgSSZltW31WDxQo4RoCpXIQAvD_BwE&" target="_blank" class="hover-target">Accommodations</a>
                </li>
                <li class="case-study-name">                                            
                    <a href="http://www.vepyo.com/html/" target="_blank" class="hover-target">Cruise</a>
                </li>
            </ul>
            <ul class="case-study-images">
                <li>
                    <div class="img-hero-background"></div> 
                    <div class="dark-over-hero"></div>  
                    <div class="hero-number-back"></div> 
                    <div class="hero-number"></div> 
                    <div class="hero-number-fixed">04</div> 
                    <div class="case-study-title">항공 예약</div> 
                </li>
                <li>
                    <div class="img-hero-background"></div> 
                    <div class="hero-number-back"></div> 
                    <div class="hero-number"></div>  
                    <div class="case-study-title">렌트카 예약</div> 
                </li>
                <li>
                    <div class="img-hero-background"></div>
                    <div class="hero-number-back"></div>  
                    <div class="hero-number"></div> 
                    <div class="case-study-title">숙박 예약</div> 
                </li>
                <li>
                    <div class="img-hero-background"></div> 
                    <div class="hero-number-back"></div> 
                    <div class="hero-number"></div> 
                    <div class="case-study-title">크루저 예약</div> 
                </li>
            </ul>   
        </div>
        


        
        <!-- Page cursor
        ================================================== -->
        
        <div class='cursor' id="cursor"></div>
        <div class='cursor2' id="cursor2"></div>
        <div class='cursor3' id="cursor3"></div> 
  	
  	

</body>
  
 
  
 <script>
 (function($) { "use strict";
 
 //Page cursors

 document.getElementsByTagName("body")[0].addEventListener("mousemove", function(n) {
     t.style.left = n.clientX + "px", 
     t.style.top = n.clientY + "px", 
     e.style.left = n.clientX + "px", 
     e.style.top = n.clientY + "px", 
     i.style.left = n.clientX + "px", 
     i.style.top = n.clientY + "px"
 });
 var t = document.getElementById("cursor"),
     e = document.getElementById("cursor2"),
     i = document.getElementById("cursor3");
 function n(t) {
     e.classList.add("hover"), i.classList.add("hover")
 }
 function s(t) {
     e.classList.remove("hover"), i.classList.remove("hover")
 }
 s();
 for (var r = document.querySelectorAll(".hover-target"), a = r.length - 1; a >= 0; a--) {
     o(r[a])
 }
 function o(t) {
     t.addEventListener("mouseover", n), t.addEventListener("mouseout", s)
 }
 
 $(document).ready(function() {
     
     /* Hero Case study images */            
     
     $('.case-study-name:nth-child(1)').on('mouseenter', function() {
         $('.case-study-name.active').removeClass('active');
         $('.case-study-images li.show').removeClass("show");
         $('.case-study-images li:nth-child(1)').addClass("show");
         $('.case-study-name:nth-child(1)').addClass('active');
     })
     $('.case-study-name:nth-child(2)').on('mouseenter', function() {
         $('.case-study-name.active').removeClass('active');
         $('.case-study-images li.show').removeClass("show");
         $('.case-study-images li:nth-child(2)').addClass("show");
         $('.case-study-name:nth-child(2)').addClass('active');
     })
     $('.case-study-name:nth-child(3)').on('mouseenter', function() {
         $('.case-study-name.active').removeClass('active');
         $('.case-study-images li.show').removeClass("show");
         $('.case-study-images li:nth-child(3)').addClass("show");
         $('.case-study-name:nth-child(3)').addClass('active');
     })
     $('.case-study-name:nth-child(4)').on('mouseenter', function() {
         $('.case-study-name.active').removeClass('active');
         $('.case-study-images li.show').removeClass("show");
         $('.case-study-images li:nth-child(4)').addClass("show");
         $('.case-study-name:nth-child(4)').addClass('active');
     })
     $('.case-study-name:nth-child(1)').trigger('mouseenter')
                 
 });

 
})(jQuery); 
 </script>
</body>
</html>