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
  margin:0; padding:0;
  font-size:15px; 
  line-height:1.3;
}
ul{list-style:none;}
.tabmenu{ 
  max-width:500px; 
   position:relative; 
      margin : 20px;
}
.tabmenu ul li{
  display:  inline-block;
  width:25%; 
  float:left;  
  text-align:center; 
  background :white;
}
.tabmenu ul li a{
  display:block;
  height:25px;
  top : 10px;
  text-decoration:none; 
  color : black;
  vertical-align: middle;
}
.card{
  display:none; 
  text-align:left; 
  width : 500px;
  left : 0;
   padding: 3px 10px 20px 30px;
  position:absolute; 
     border: 1px gray solid;
    background-color: white;
}
.btnCon:target  {
  background : lightgray;
}
.btnCon:target .card{
  display: block;
}
.tmenu{
padding: 10px 0 0 0;
}
.card-title {
   text-align: center; font-size : 1.5rem;
   margin : 20px;
   font-weight: bold;
   font-size: 1.5rem;
}
td>div {
   padding: 0 0 0 15px;
}
#tb{
margin : 25px;
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
   width: 20%;
   font-size : 85%;
   border: 0;
   padding: 10px;
   color: black;
   background: white;
}
</style>
<script src="../resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
   <header>
     <img src="${pageContext.request.contextPath}/resources/images/" width="150"
         alt="logo" style = " left : 15px; "/>
   </header>
   
   <br />
   
   <div class = "tabmenu">
   <form action="${pageContext.request.contextPath}/member/goPwdSet.do">
   
   
   
   <c:if test="${ check == -1 }"> <!-- 잘못된 정보 입력시 -->
   	<p style="color:red; font-size:22px;">해당하는 아이디가 없습니다</p><br>
   	<p>이름과 이메일을 알맞게 입력해주세요!</p>
	<button type="button" onclick="fn_back();">다시 찾기</button>
   </c:if>
   
   
   <c:if test="${ check == 1 }"> <!-- 해당하는 아이디가 있을시 -->
    	<p> <span style="font-size:22px; color:blue; font-weight: bold">${ name }</span>
    		고객님의 아이디는
    	<span style="font-size:22px; color:blue; font-weight: bold">"${ userId }"</span>
    		입니다.</p><br/>
    	<button type="button" onclick="fn_loginId();">돌아가기</button>&nbsp;
    	<input type="hidden" name="userId" value="${ userId }"/>
    	<input type="hidden" name="name" value="${ name }"/>
    	<input type="hidden" name="email" value="${ email }"/>
    	<button type="submit">비밀번호 재설정</button>
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
