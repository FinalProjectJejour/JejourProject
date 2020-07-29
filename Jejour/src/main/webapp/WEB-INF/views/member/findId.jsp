<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 찾기</title>

<style>
*{
  margin:0;
  padding:0;
  font-size:15px; 
  line-height:1.3;
}

ul{
	list-style:none;
	}

.btnCon:target  {
  background : lightgray;
}
.btnCon:target .card{
  display: block;
}

.card-title {
   text-align: center; font-size : 1.5rem;
   margin : 20px;
   font-weight: bold;
   font-size: 1.5rem;
}


.tabmenu {
	text-align : center;
}

header {
   background-color: #1f83e1;
   
   height: 50px;
}
header img {
   padding: 0px;
}
.tap>button {
   width: 100%;
   font-size : 85%;
   border: 0;
   padding: 10px;
   color: black;
   background: white;
}

*, *:before, *:after {
    box-sizing: border-box;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}


.underline-btn {
    display: inline-block;
    padding: 1em 0;
    border-radius: 0;
    color: #1f83e1;
    margin-top: 2rem;
    font-weight: bold;
    font-size: 1rem;
    letter-spacing: 2px;
    text-transform: uppercase;
    text-decoration: none;
    position: relative;
}

.underline-btn::before {
  content: '';
  position: absolute;
  bottom: 0%;
  left: 0px;
  width: 100%;
  height: 1px;
  background: #6098FF;
  display: block;
  -webkit-transform-origin: right top;
  -ms-transform-origin: right top;
  transform-origin: right top;
  -webkit-transform: scale(0, 1);
  -ms-transform: scale(0, 1);
  transform: scale(0, 1);
  -webkit-transition: transform 0.4s cubic-bezier(1, 0, 0, 1);
  transition: transform 0.4s cubic-bezier(1, 0, 0, 1)
}

.underline-btn:hover::before {
  -webkit-transform-origin: left top;
  -ms-transform-origin: left top;
  transform-origin: left top;
  -webkit-transform: scale(1, 1);
  -ms-transform: scale(1, 1);
  transform: scale(1, 1)
}


</style>
<script src="../resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
   <header>
     <img src="${pageContext.request.contextPath}/resources/images/jejulogo.png" width="150"
         alt="logo" style = " left : 15px; "/>
   </header>
   
   <br />
   
   <div class = "tabmenu">
   <form action="${pageContext.request.contextPath}/member/goPwdSet.do">
   
   
   
   <c:if test="${ check == -1 }"> <!-- 잘못된 정보 입력시 -->
   	<div style="margin-left:55px; margin-top:70px;">
   	<p style="color:red; font-size:22px;">해당하는 아이디가 없습니다</p><br>
   	<p>성명과 이메일을 알맞게 입력해주세요!</p>
	<button type="button" onclick="fn_back();" class="underline-btn" style="border:0; background-color:white;">다시 찾기</button>
	</div>   
   </c:if>
   
   
   <c:if test="${ check == 1 }"> <!-- 해당하는 아이디가 있을시 -->
    	<p style=" margin-top:85px;"> <span style="font-size:22px; color:blue; font-weight: bold; text-align:center;">${ name }</span>
    		님의 아이디는
    	<span style="font-size:22px; color:blue; font-weight: bold">"${ userId }"</span>
    		입니다.</p><br/>
    	<a class="underline-btn" href="#" onclick="fn_loginId();" style="margin-top: 20px; margin-right: 40px;">Login</a>

    	<input type="hidden" name="userId" value="${ userId }"/>
    	<input type="hidden" name="name" value="${ name }"/>
    	<input type="hidden" name="email" value="${ email }"/>
    	<button type="submit" class="underline-btn" style="border:0; background-color:white;">Password Set</button>
    </c:if>
    
    </form>
   </div>
   	
   <script>
   function fn_back(){
	   location.href = '${pageContext.request.contextPath}/member/memberfindidForm.do';
   }
   
   function fn_loginId(){
		opener.document.getElementById("userId").value = '${ userId }';
		window.close();
	}
   </script>
   

</body>
</html>
