<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Site</title>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
</head>
<style>
	*, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  background: #15181A;
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
  background-image: url("${pageContext.request.contextPath }/resources/images/updateinfo5.jpg");
}
.skw-page-1 .skw-page__half--right .skw-page__content {
  background: #292929;
}
.skw-page-2 .skw-page__half--left .skw-page__content {
  background: #292929;
}
.skw-page-2 .skw-page__half--right .skw-page__content {
  background-image: url("${pageContext.request.contextPath }/resources/images/intro2.png");
}
.skw-page-3 .skw-page__half--left .skw-page__content {
  background-image: url("${pageContext.request.contextPath }/resources/images/intro1.png");
}
.skw-page-3 .skw-page__half--right .skw-page__content {
  background: #292929;
}
.skw-page-4 .skw-page__half--left .skw-page__content {
  background: #292929;
}
.skw-page-4 .skw-page__half--right .skw-page__content {
  background-image: url("${pageContext.request.contextPath }/resources/images/intro4.png");
}
.skw-page-5 .skw-page__half--left .skw-page__content {
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/img-test.jpg");
}
.skw-page-5 .skw-page__half--right .skw-page__content {
  background: #292929;
}

@FONT-FACE {
			font-family: 'bm';
			src:url("${pageContext.request.contextPath}/resources/fonts/BMJUA_ttf.ttf");
		}

</style>
	<c:import url="../common/header.jsp">
		<c:param name="data" value="ourSite"/>
	</c:import>
<body>
	
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
            <h2 class="skw-page__heading" style="color:skyblue; font-family: bm;">환영합니다!</h2>
            <br><br>
            <p class="skw-page__description" style="font-family: bm;">마우스를 클릭 해보세요!</p>
            <p class="skw-page__description" style="font-family: bm;">저희 홈페이지에 대해 알아보세요!</p>
          </div>
        </div>
      </div>
    </div>
    <div class="skw-page skw-page-2">
      <div class="skw-page__half skw-page__half--left">
        <div class="skw-page__skewed">
          <div class="skw-page__content">
            <h2 class="skw-page__heading" style="color:skyblue; font-family: bm;">여행계획 하기!</h2>
            <br><br>
            <p class="skw-page__description" style="font-family: bm;">검색기능과 캘린더를 이용해서</p>
            <p class="skw-page__description" style="font-family: bm;">자기만의 여행계획을 세워보세요!</p>
          </div>
        </div>
      </div>
      <div class="skw-page__half skw-page__half--right">
        <div class="skw-page__skewed">
          <div class="skw-page__content"></div>
        </div>
      </div>
    </div>
    <div class="skw-page skw-page-3">
      <div class="skw-page__half skw-page__half--left">
        <div class="skw-page__skewed">
          <div class="skw-page__content"></div>
        </div>
      </div>
      <div class="skw-page__half skw-page__half--right">
        <div class="skw-page__skewed">
          <div class="skw-page__content">
            <h2 class="skw-page__heading" style="color:skyblue; font-family: bm;">여행계획이 어렵나요?</h2>
            <br><br>
            <p class="skw-page__description" style="font-family: bm;">그렇다면 저희 홈페이지에서</p>
            <p class="skw-page__description" style="font-family: bm;">많은 정보를 한번에 보면서 계획해보세요!</p>
          </div>
        </div>
      </div>
    </div>
    <div class="skw-page skw-page-4">
      <div class="skw-page__half skw-page__half--left">
        <div class="skw-page__skewed">
          <div class="skw-page__content">
            <h2 class="skw-page__heading" style="color:skyblue; font-family: bm;">좋은 여행계획은 뭘까요?</h2>
            <br><br>
            <p class="skw-page__description" style="font-family: bm;">회원님들의 계획을 공유하고</p>
            <p class="skw-page__description" style="font-family: bm;">좋은 계획이다 싶으면 댓글과 좋아요를 통해</p>
         	<p class="skw-page__description" style="font-family: bm;">회원님들과 함께 소통해보세요!</p>
          </div>
        </div>
      </div>
      <div class="skw-page__half skw-page__half--right">
        <div class="skw-page__skewed">
          <div class="skw-page__content"></div>
        </div>
      </div>
    </div>
    <div class="skw-page skw-page-5">
      <div class="skw-page__half skw-page__half--left">
        <div class="skw-page__skewed">
          <div class="skw-page__content"></div>
        </div>
      </div>
      <div class="skw-page__half skw-page__half--right">
        <div class="skw-page__skewed">
          <div class="skw-page__content">
           <h2 class="skw-page__heading" style="color:skyblue; font-family: bm;">가장 많이갔던 관광지는 어디일까요?</h2>
            <br><br>
            <p class="skw-page__description" style="font-family: bm;">각 카테고리별 TOP N을 통해</p>
         	<p class="skw-page__description" style="font-family: bm;">가고싶은 곳을 선택해보세요!</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <c:import url="../common/footer.jsp"/>

<script>
// var curPage = 1;
$(document).ready(function() {

	var curPage = 1;
	var numOfPages = $(".skw-page").length;
	var animTime = 1000;
	var scrolling = false;
	var pgPrefix = ".skw-page-";

	function pagination() {
	  scrolling = true;
		
	  $(pgPrefix + curPage).removeClass("inactive").addClass("active");
	  $(pgPrefix + (curPage - 1)).addClass("inactive");
	  $(pgPrefix + (curPage + 1)).removeClass("active");
	  

	  setTimeout(function() {
	    scrolling = false;
	  }, animTime);
	};
	

	function navigateUp() {
	  // if (curPage === 1) return;
	  curPage++;
	  pagination();
	};

	function navigateDown() {
	  if (curPage === numOfPages) return;
	  curPage--;
	  pagination();
	};
	
	
	//mousewheel DOMMouseScroll
	$(document).on("mouse click", function(e) {
	 // if (scrolling) return;
	 console.log(curPage);
	   if (curPage < 5) {
	    navigateUp();
	  
	   } else if(curPage == 5) {
	   	$(".skw-page").removeClass("active").removeClass("inactive");
	   	$($(".skw-page")[0]).addClass("active");
	   	curPage = 1;
	  } 
	  
	});

	$(document).on("keydown", function(e) {
	  if (scrolling) return;
	  if (e.which === 38) {
	    navigateUp();
	  } else if (e.which === 40) {
	    navigateDown();
	  }
	});

	});

</script>


</body>
</html>