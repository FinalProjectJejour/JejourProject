<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 설정하기</title>

<style>
*{
  margin:0; padding:0;
  font-size:15px; 
  line-height:1;
}

.btnCon:target  {
  background : lightgray;
}

.tabmenu {
	text-align : center;
}

header {
   background-color: #1f83e1;	
   height: 50px;
}

header img {

   padding: 0px 0px 0px 0px;
}

/* 버튼 css의 시작*/
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
/* 버튼 css의 끝 */

/* input password css의 시작*/
body {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  text-align: center;
}

.form-container {
  display: block;
  width: 500px;
  margin: 20px auto;
  text-align: left;
}

lable {
  display: block;
  position: relative;
  text-transform: uppercase;
  color: #aaa;
}

input[type='password'] {
  width: 100%;
  box-sizing: border-box;
  height: 55px;
  display: inline-block;
  border: 3px solid #2F96EF;
  border-radius: 5px;
  padding: 0 15px;
  margin: 10px 0;
  transition: .2s;
}

input[type='password']:focus {
  outline: none;
   -moz-outline: none;
   -webkit-outline: none;
}

lable:before {
  content: "\f070";
  color: #aaa;
  font-size: 22px;
  font-family: FontAwesome;
  position: absolute;
  right: 25px;
  top: 44px;
}

.progress-bar_wrap {
  width: 300px;
  height: 5px;
  background: #F6F6FA;
  display: inline-block;
  vertical-align: middle;
  overflow: hidden;
  border-radius: 5px;
}



.form-1 .progress-bar_item {
  display: inline-block;
  height: 100%;
  width: 33.33%;
  float: left;
  visibility: hidden;
  transition: background-color .2s, visisility .1s;
}

.form-1 .active {
  visibility: visible;
}

.progress-bar_item-1 {
  
}

.progress-bar_item-2 {

}

.progress-bar_item-3 {

}

.progress-bar_text {
  display: inline-block;
  color: #aaa;
  margin-left: 5px;
  transition: .2s;
}



.form-2 .progress-bar_item {
  display: inline-block;
  height: 100%;
  width: 32.5%;
  margin-right: .8%;
  border-radius: 5px;
  float: left;
  
  transition: background-color .2s, visisility .1s;
}

.form-2 .progress-bar_item-1.active {
  background-color: #FF4B47;
}

.form-2 .progress-bar_item-2.active {
  background-color: #F9AE35;
}

.form-2 .progress-bar_item-3.active {
  background-color: #2DAF7D;
}
/* input password css의 끝*/



</style>
<script src="../resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
   <header>
      <img src="${pageContext.request.contextPath}/resources/images/jejulogo.png" width="150" 
         alt="logo"/>
   </header>
   
   <div class="form-container">
		<form class="form-4">
		  <lable>Password
		  	<input type="hidden" id="userId" name="userId" value="${ userId }"/>
    		<input type="hidden" id="name" name="name" value="${ name }"/>
			<input class="input-4" type="password" name="userPwd" id="userPwd"
			placeholder="영문,숫자  6~18자 입력" required>
			</lable>
		  <span class="progress-bar_text">Password is blank</span>
		</form>
	  </div>
	  <div class="form-container">
		<form class="form-5">
		  <lable>Password Check
			<input class="input-5" type="password" id="chkPwd" name="chkPwd" required>
			</lable>
		  <span class="progress-bar_text">Password is blank</span>
		</form>
		<button type="button" class="underline-btn" onclick="checkPwd();"
			style="border:none;
				   background-color:white;
				   margin-left:350px;">비밀번호 변경하기</button>
	  </div>
   
   	
   <script>
   $( document ).ready(function() {
	   
	   const changeText = function (el, text, color) {
	     el.text(text).css('color', color);
	   };

	   
	   $('.input-4').keyup(function(){
	     let len = this.value.length;
	     const pbText = $('.form-4 .progress-bar_text');

	     if (len === 0) {
	       $(this).css('border-color', '#2F96EF');
	       changeText(pbText, 'Password is blank', '#aaa');
	     } else if (len > 0 && len <= 4) {
	       $(this).css('border-color', '#FF4B47');
	       changeText(pbText, 'Too weak', '#FF4B47');
	     } else if (len > 4 && len <= 8) {
	       $(this).css('border-color', '#F9AE35');
	       changeText(pbText, 'Could be stronger', '#F9AE35');
	     } else {
	       $(this).css('border-color', '#2DAF7D');
	       changeText(pbText, 'Strong password', '#2DAF7D');
	     } 
	   });
	   
	   $('.input-5').keyup(function(){
		     let len = this.value.length;
		     const pbText = $('.form-5 .progress-bar_text');

		     if (len === 0) {
		       $(this).css('border-color', '#2F96EF');
		       changeText(pbText, 'Password is blank', '#aaa');
		     } else if (len > 0 && len <= 4) {
		       $(this).css('border-color', '#FF4B47');
		       changeText(pbText, 'Too weak', '#FF4B47');
		     } else if (len > 4 && len <= 8) {
		       $(this).css('border-color', '#F9AE35');
		       changeText(pbText, 'Could be stronger', '#F9AE35');
		     } else {
		       $(this).css('border-color', '#2DAF7D');
		       changeText(pbText, 'Strong password', '#2DAF7D');
		     } 
		   });
	   
	 });
 
	
   
		function checkPwd(){
			
			var reg1 = /^[A-Za-z0-9_-]{6,18}$/;
			
			if (!reg1.test($('#userPwd').val())) {
				alert('영어 숫자를 조합해서 6~18자입력해주세요');
			
			} else if($('#userPwd').val() != $('#chkPwd').val()){
				alert('비밀번호가 일치하지 않습니다.');
			
			} else {
	
			$.ajax({
				url: '${pageContext.request.contextPath}/member/setUserPwd.do',
				
				data : {
						userPwd : $('#userPwd').val(),
						userId: $('#userId').val()
						
						},
				
				success : function(data){
						console.log(data);
				
					if(data.result == 1){
							alert('${ name }님의 비밀번호 수정이 완료되었습니다.');
							window.close();
					
					} else {
							alert('서버오류, 관리자에게 문의하세요!');
						}
					}
					
				}); 
			}
		}
		
   </script>
   

</body>
</html>