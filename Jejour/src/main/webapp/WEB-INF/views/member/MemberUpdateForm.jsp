<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Update Info</title>
<link rel = "stylesheet" href = "resources/assets/plugins/bootstrap/css/bootstrap.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<style>
body{
	
	color:#6a6f8c;
	background:#c8c8c8;
	font:600 16px/18px 'Open Sans',sans-serif;
    background-repeat: no-repeat;
    background-size : cover;
    background-image: url('${pageContext.request.contextPath }/resources/images/updateinfo5.jpg');
}

*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block;}
a{color:inherit;text-decoration:none;}

.login-wrap{
  
    margin:auto;
    margin-top: 5%;
    margin-bottom: 5%;
	max-width:525px;
	min-height:670px;
	position:relative;
}
.login-html{
	width:100%;
	height:100%;
	position: relative;
	padding:50px 70px 780px 70px;
	background:rgba(0,51,153,.65);
}
.login-html .sign-in-htm,
.login-html .sign-up-htm{
	top:0;
	left:0;
	right:0;
	bottom:0;
	position: absolute;
	transform:rotateY(180deg);
	backface-visibility:hidden;
	transition:all .7s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
	display:none;
}

.login-form .group .label
{
	font-size: 20px;
}
.login-html .tab{
	font-size:22px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
	color:#fff;
	border-color:white;
	/* #1161ee */
}
.login-form{
	min-height:345px;
	position:relative;
	perspective:1000px;
	transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .button{
	color:#fff;
}

.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 25px;
	border-radius:25px;
    background:rgba(255,255,255,.9);

}
.login-form .group input[data-type="password"]{
	-webkit-text-security:circle;
}
.login-form .group .label{
	color:#aaa;
	font-size:12px;
}


.Phone {
    height: 100%;
    border:none;
    text-align: center;
    padding:15px 20px;
    border-radius:25px;
    background:rgba(255,255,255,.9);
}

.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
	top:6px;
	right:0;
	transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
	transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
	transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
	transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
    color:white;
}

/* 버튼 CSS */

button {

  background-color: #233142;
  border: none;
  border-radius: 4px;
  color: #ccc;
  font-size: 15px;
  letter-spacing: 2px;
  
}



#button1 {
   background-color: #233142;
  -webkit-transform: translate3d(-50%, -50%, 0);
          transform: translate3d(-50%, -50%, 0);
}

.button {
  background-color: #233142;
  cursor: pointer;
  -webkit-transition: box-shadow 0.1s linear;
  transition: box-shadow 0.1s linear;
}

.button:hover {
  box-shadow: 0 10px 0 rgba(0, 0, 0, 0.2);
}

div#email-container{position:relative;}
div#email-container span.guide {display:none;
								font-size: 12px;
								position:absolute;
								top:12px; right:10px;
								margin-top:39px;
								margin-right: 115px;}
div#email-container span.ok{color:green;}
div#email-container span.error{color:red;}




</style>

</head>
<body>
	<div class="login-wrap">
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">정보수정</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
            <div class="login-form">
            
            <!-- 회원정보 수정폼의 시작  -->
            <form id="memberupdate" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
                <div class="sign-in-htm">
                    <div class="group" style="margin-left:40px; margin-top:25px">
                        <br><br>
                        <label for="user" class="label" style="font-size: 18px;">아이디</label>
                        <label style="color:white; margin-left: 70px;">${ member.userId }</label>
                    </div>
                    <br>
                    <div class="group" style="margin-left:40px; margin-top:25px">
                        <label for="user" class="label" style="font-size: 18px; width: 50%;">이름</label>
                        <label style="color:white; margin-left: 90px;">${ member.userName }</label>
                    </div>
                    <br>
                    <div class="group" style="margin-left:40px; margin-top:25px">
                        <label for="user" class="label" style="font-size: 18px;">성별</label><br>
                        <select name="gender" id="gender" class=input id="gender" style="width: 90%;" required>
                            <option  value="M">남자</option>
                            <option  value="F">여자</option>	
                        </select>
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">비밀번호</label><br>
                        <input id="password1" name="userPwd" type="password" class="input" data-type="password" style="width: 90%;"
                        	   placeholder="영문과 숫자 최소6~18자 입력" required>
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">비밀번호 확인</label><br>
                        <input id="password2" type="password" class="input" data-type="password" style="width: 90%;">
                        <br>
                        <label id="pwdResult" class="pwdResult" for="pwdResult"></label>
                    </div>
                    
                    <!-- 이메일 인증란 -->
                    <div class="group" id="email-container" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">이메일</label><br><br>
                        <input id="email" type="email" class="input" name="email" style="width: 65%;" required
                        	   oninvalid="this.setCustomValidity('이메일을 인증해주세요')"
                        	   placeholder="이메일 인증해주세요!" readonly>
                       
						<span class="guide ok">사용 가능</span>
						<span class="guide error">사용불가</span>

                        <span class="button" id="button1"
                        onclick = "createEmailCer('certifyForm.do',
                            '이메일 인증', 600, 400);return false" >인증</span>
				   </div>
				   <!-- 이메일의 끝  -->
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">휴대폰번호</label><br>
                        <input type="text" id="Phone" name="Phone" class="Phone" style="width:90%;" placeholder="-없이입력">
                        <br>
                        <label class="phoneNumCheck" id="phoneNumCheck" for="phoneNumCheck"></label>
                    </div>
                    <br>
                    <div class="group" style="margin-left: 40px;">
                        <label for="pass" class="label" style="font-size: 18px;">우편번호</label>
                        <br>
						<input type="text" class="input" id="zipCode"
												name="zipCode" style="width: 65%;" required>
						
						<span class="button" id="button1" onclick="addrSearch();">검색</span>
                        <br><br>
                        <label for="pass" class="label" style="font-size: 18px;">주소</label>
                        <br>
						<input type="text" class="input" id="address1" name="address1" style="width: 90%;" required>
						<br><br>
                        <label for="pass" class="label" style="font-size: 18px;">상세주소</label>
                        <br>
                        <input type="text" class="input" id="address2" name="address2" style="width: 90%;">
                    </div>
                  	
                    <div class="group" style="margin-top:100px; margin-left:190px;">
                        <input type="submit" class="button" id="button1" value="정보수정"
                               style="width:310px; font-size:18px; font-weight:bold;"/>
                    </div>
                    <div class="group" style="margin-top:20px; float:right;">
                    	<button class="button" id="button1" style="width:130px; font-size: 18px; font-weight: bold;" onclick="godelete();">회원탈퇴</button>
                    	<button class="button" id="button1" style="width:130px; font-size: 18px; font-weight: bold;" onclick="goMain();">홈으로</button>
                    </div>
                    
                    
                    <br>
                    
                </div>
               </form>
               <!-- 회원정보수정 폼의 끝 --> 
                
                <div class="sign-up-htm">
                    <!-- <div class="group" style="margin-left:40px;">
                        <br>
                        <label for="user" class="label" style="font-size: 18px;">아이디</label><br><br>
                        <input id="user" type="text" class="input" style="width: 60%;">
                        <button id="dupliCheck" class="input" >중복확인</button>
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">비밀번호</label><br><br>
                        <input id="pass" type="password" class="input" data-type="password" style="width: 90%;">
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">비밀번호 확인</label><br><br>
                        <input id="pass" type="password" class="input" data-type="password" style="width: 90%;">
                        <br><br>
                        <label style="color:red; font-weight: bold;"> 비밀번호가 일치하지않습니다. </label>
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">이메일주소</label><br><br>
                        <input id="pass" type="text" class="input" name="email" style="width: 90%;">
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">휴대폰번호</label><br><br>
                        <input type="text" id="Phone1" class="Phone">
                        <input type="text" id="Phone2" class="Phone">
                        <input type="text" id="Phone3" class="Phone"><br><br>
                        <label style="color:red;"> 숫자만 입력해주세요 </label>
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;" >주민등록번호</label><br><br>
                        <input type="text" id="RRN1" class="RRN">
                        <input type="text" id="RRN2" class="RRN">
                    </div>
                    <br>
                    <div class="group" style="text-align:center">
                        <input type="submit" class="button" value="Sign Up" style="width: 80%; font-size: 20px; font-weight: bold;">
                    </div> -->
                </div>
            </div>
        </div>
     </div>
     

<script>

//이메일 인증창 띄우기
function createEmailCer(pageURL, pageTitle,popupWinWidth, popupWinHeight)
{ var left = (screen.width - popupWinWidth) / 2; 
  var top = (screen.height - popupWinHeight) / 2; 
			  
  var myWindow = window.open(pageURL, pageTitle,  
			        	'width='  + popupWinWidth 
			        + ', height=' + popupWinHeight
			        + ', top='    + top
			        + ', left='   + left); }


$(function(){
 	<c:if test="${ !empty member }">
		
 		//사용자 주소 가져오기
 		var addressArr='${ member.getAddress() }'.split('-');

		$('#zipCode').val(addressArr[0]);
		$('#address1').val(addressArr[1]);
		$('#address2').val(addressArr[2]);
		
		// 사용자 휴대폰번호 가져오기
		var phone = '${ member.getPhone()}'
		
		$('#Phone').val(phone);
		
		// 사용자 이메일 가져오기
		var email = '${ member.getEmail()}'
		
		$('#email').val(email);
		
	</c:if>	
 });
     
 /* 비밀번호 양식 */
		$('#password1').change(function() {
			
			var reg1 = /^[A-Za-z0-9_-]{6,18}$/;
			
			if (!reg1.test($('#password1').val())) {
				$('#pwdResult').addClass('fail').removeClass('success');
			} else {
				$('#pwdResult').addClass('success').removeClass('fail');
			}
		});
	
	
	
		/* 회원가입시 유효성체크 */
		function updateMember() {
			 var confirm = window.confirm("이대로 회원정보수정 하시겠습니까?");
			 
			if($('.fail').length == 0 && confirm){
				$("#memberinsert").submit();
				window.confirm("회원정보 수정완료!");
	       } else {
	           alert('비밀번호 양식에 맞지 않습니다.');
	           event.preventDefault();
	     
	       }
		};
		
		
		/* 비밀번호 일치여부 */
		$('#password2').change(
				function() {
					
					if ($('#password1').val() == $('#password2').val()) {
						$('#pwdResult').html("<p style='color:#58FA58'>비밀번호 값이 일치합니다.</p>").fadeIn(500);
						$("#pwdResult").delay(2000);
						$("#pwdResult").fadeOut(500);
					} else {
						$('#pwdResult').html("<p style='color:red'>비밀번호 값이 일치하지 않습니다.</p>").addClass('fail').removeClass('success').fadeIn(500);
						$("#pwdResult").delay(2000);
						$("#pwdResult").fadeOut(500);
						$('#password2').val('');
					}
				});
		
		
		
		
		/* 번호 유효성체크  */
		$('#Phone').change(function(){

	        var reg2 = /^[0-9]{9,11}$/g;
	    
	        if (!reg2.test($('#Phone').val())) {
	            $('#phoneNumCheck').html("<p style='color:red'>숫자만 입력해주세요.</p>").fadeIn(500);
				$("#phoneNumCheck").delay(2000);
				$("#phoneNumCheck").fadeOut(500);
	            $('#Phone').val('');
				$('#Phone').focus();
			  } else {
				$('#phoneNumCheck').html("<p style='color:#58FA58'>사용가능한 번호입니다.</p>").fadeIn(500);
				$("#phoneNumCheck").delay(2000);
				$("#phoneNumCheck").fadeOut(500);  
			  }
	    
		});
	    
	    /* 이메일 유효성체크 */
		$('#Email').change(function(){
			
			var reg3 = /^[a-z][a-z0-9_-]{3,11}@([a-z\d\.-]+)\.([a-z\.]{2,9})$/;
			
			if (!reg3.test($('#Email').val())) {
	            $('#EmailCheck').html("<p style='color:red'>이메일 형식에 맞게써주세요.</p>").fadeIn(500);
				$("#EmailCheck").delay(2000);
				$("#EmailCheck").fadeOut(500);
	            $('#Email').val('');
				$('#Email').focus();
			} else {
				$('#EmailCheck').html("<p style='color:#58FA58'>사용 가능한 이메일형식입니다.</p>").fadeIn(500);
				$("#EmailCheck").delay(2000);
				$("#EmailCheck").fadeOut(500);
			}
			
		});

		/* 홈으로 이동 */
		function goMain() {
			location.href = '${pageContext.request.contextPath}/';
		};
		
		function godelete() {
			
			if (confirm("정말 회원탈퇴 하실껀가요? (ノTДT)ノ") == true){    

				location.href = '${pageContext.request.contextPath}/member/memberDelete.do';

	    	 }else{   //취소

	    	     return false;

	    	 }
			
		};
		
		
		
		/* 주소찾기 */
		function addrSearch() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = ''; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수
							// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								fullAddr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								fullAddr = data.jibunAddress;
							}
							// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName : data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' (' + extraAddr
										+ ')' : '');
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							$('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
							$('#address1').val(fullAddr);
							// 커서를 상세주소 필드로 이동한다.
							$('#address2').focus();
						}
					}).open();
		};
     
     // 버튼 JS
     var $btn = document.getElementsByClassName("button");
	var mouseObj = {
	  mouseCoords: null,
	  mousetThreshold: 0.12,
	  manageMouseLeave: function (event) {
	    event.currentTarget.style.boxShadow = "0 0 0 rgba(0,0,0,0.2)";
	    // update btn gradient
	    event.currentTarget.style.background = "#233142";
	  },
	  manageMouseMove: function (event) {
	    var dot, eventDoc, doc, body, pageX, pageY;
	
	    event = event || window.event; // IE-ism
	    target = event.currentTarget;
	    // (old IE)
	    if (event.pageX == null && event.clientX != null) {
	      eventDoc = (event.target && event.target.ownerDocument) || document;
	      doc = eventDoc.documentElement;
	      body = eventDoc.body;
	
	      event.pageX =
	        event.clientX +
	        ((doc && doc.scrollLeft) || (body && body.scrollLeft) || 0) -
	        ((doc && doc.clientLeft) || (body && body.clientLeft) || 0);
	      event.pageY =
	        event.clientY +
	        ((doc && doc.scrollTop) || (body && body.scrollTop) || 0) -
	        ((doc && doc.clientTop) || (body && body.clientTop) || 0);
	    }
	
	    // Use event.pageX / event.pageY here
	
	    //normalize
	    //bodyRect = document.body.getBoundingClientRect(),
	    var elemRect = target.getBoundingClientRect(), //$btn.getBoundingClientRect(),
	      mean = Math.round(elemRect.width / 2);
	    //offset   = elemRect.top - bodyRect.top;
	
	    //mouseObj.mouseCoords = {mouse_x: event.pageX - elemRect.left , mouse_y:event.pageY - elemRect.top}
	    mouseObj.mouseCoords = {
	      mouse_true_x: event.pageX - elemRect.left,
	      mouse_x: (event.pageX - elemRect.left - mean) * mouseObj.mousetThreshold,
	      mouse_y: event.pageY - elemRect.top
	    };
	    mouseObj.manageButtonShadow(-1, target);
	  },
	  manageButtonShadow: function (direction, target) {
	    if (mouseObj.mouseCoords) {
	      mouseObj.mouseCoords.mouse_x = Math.floor(mouseObj.mouseCoords.mouse_x);
	      target.style.boxShadow =
	        direction * mouseObj.mouseCoords.mouse_x + "px 10px 0 rgba(0,0,0,0.2)";
	
	      // update btn gradient
	      target.style.background =
	        "radial-gradient(at " +
	        mouseObj.mouseCoords.mouse_true_x +
	        "px, #2a3d52 0%, #233142 80%)";
	    }
	  }
	};

	// init listeners
	for (i = 0; i < $btn.length; i++) {
	  $btn[i].addEventListener("mousemove", mouseObj.manageMouseMove, false);
	  $btn[i].addEventListener("mouseleave", mouseObj.manageMouseLeave, false);
	}
     
     
     </script>

</body>
</html>