<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login & Sign Up</title>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

</head>
   <style>
body{
	margin:auto;
	color:#6a6f8c;
	background:#c8c8c8;
	font:600 16px/18px 'Open Sans',sans-serif;
    background-image: url('${pageContext.request.contextPath }/resources/images/jejulogin.jpg');
    background-repeat: no-repeat;
    background-size : cover;
}

*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

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
	padding:50px 70px 700px 70px;
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
	cursor: pointer;
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
	padding:15px 20px;
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
.login-form .group .button{
	background:#1161ee;
}



.Phone {
    width: 29%;
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

div#userId-container{position:relative;}
div#userId-container span.guide{display:none;
								font-size: 12px;
								position:absolute;
								top:12px; right:10px;
								margin-top:37px;
								margin-right: 35px;}
div#userId-container span.ok{color:green;}
div#userId-container span.error, span.invalid{color:red;}
div#email-container{position:relative;}
div#email-container span.guide {display:none;
								font-size: 12px;
								position:absolute;
								top:12px; right:10px;
								margin-top:42px;
								margin-right: 100px;}
div#email-container span.ok{color:green;}
div#email-container span.error{color:red;}    

button, .button{
	cursor: pointer;
}

</style>

<body>
	 <div class="login-wrap">
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">회원가입</label>
            <div class="login-form">
            
            <!-- 로그인폼 -->
            <form id="memberlogin" action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">   
                <div class="sign-in-htm">
                    <div class="group" style="margin-left:25px; margin-top: 120px;">
                        <br><br>
                        
                        <label for="user" class="label" style="font-size: 20px;">아이디</label><br><br>
                        <input id="userId" name="userId" type="text" class="input" style="width: 90%;" required/>
                    </div>
                    <div class="group" style="margin-left:25px; margin-top:50px;">
                        <br><br>
                        <label for="pass" class="label" style="font-size: 20px;">비밀번호</label><br><br>
                        <input id="userPwd" name="userPwd" type="password" class="input" data-type="password" style="width: 90%;" required oninvalid="this.setCustomValidity('비밀번호를 입력해주세요')">
                    </div>
                    <div class="group" style="text-align:center;">
                        <br><br>
                        <!-- 로그인시 유효성 체크 -->
                        <label class="logincheck" id="logincheck" for="logincheck"></label>
                    </div>
                    <div class="group" style="text-align:center; margin-top:50px">
                        <br><br><br>
                        <input type="submit" class="button" value="Login" style="width: 90%; font-size: 20px; font-weight: bold;">
                        <br><br>
                        <button class="button" style="width: 90%; font-size: 20px; font-weight: bold;" onclick="goMain();">Home</button>
                        
                    </div>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <a href = '${pageContext.request.contextPath}/member/memberfindidForm.do' 
                        onclick = "createPopupWin('memberfindidForm.do',
                            '개인정보 찾기', 600, 400);return false">아이디/비밀번호 찾기</a>
                    </div>
                </div>
             </form>
           <!-- 로그인폼의 끝 -->
               
           <!-- 회원가입 -->    
           <form action="${pageContext.request.contextPath}/member/memberinsert.do" id="memberinsert" method="post">
               <div class="sign-up-htm">
                    <div class="group" id="userId-container" style="margin-left:40px;">
                        <br>
                    	<label for="user" class="label" style="font-size: 18px;">아이디</label><br>
                        <input id="userIdcheck" name="userId" type="text" class="input" style="width: 90%;" required />
                        <br>
                        <!-- 중복체크 -->
                        <span class="guide ok">사용 가능</span>
				        <span class="guide error">사용 불가</span>
				        <span class="guide invalid">4글자 미만</span>
				        <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
                    
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="user" class="label" style="font-size: 18px;">성명</label><br>
                        <input id="userName" name="userName" type="text" class="input" style="width: 90%;" required oninvalid="this.setCustomValidity('이름을 입력해주세요')"
                        placeholder="한글만 2-4글자 입력"/>
                    	<br>
                        <label class="nameCheck" id="nameCheck" for="nameCheck"></label>
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="user" class="label" style="font-size: 18px;">성별</label><br>
                        <select name="gender" id="gender" class=input id="gender" style="width: 90%;" required>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">비밀번호</label><br>
                        <input id="password1" name="userPwd" type="password" class="input" data-type="password" style="width: 90%;"
                        		placeholder="영문,숫자 6~18자리 " required oninvalid="this.setCustomValidity('비밀번호를 입력해주세요')">
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">비밀번호 확인</label><br>
                        <input id="password2" type="password" class="input" data-type="password" style="width: 90%;">
                        <br>
                        
                        <!-- 비밀번호 확인 -->
                        <label id="pwdResult" class="pwdResult" for="pwdResult"></label>
                    </div>  
  					
  					<!-- 이메일 인증 -->
                    <div class="group" id="email-container" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">이메일</label><br><br>
                        <input id="email" type="email" class="input" name="email" style="width: 70%;" required
                        	   oninvalid="this.setCustomValidity('이메일을 인증해주세요')"
                        	   placeholder="이메일 인증해주세요!" readonly>
                        
						<span class="guide ok">사용 가능</span>
						<span class="guide error">사용불가</span>

                        
                        <button class="input"
                        onclick = "createEmailCer('certifyForm.do',
                            '이메일 인증', 600, 400);return false" style="color:white; background-color:#1161ee;">인증</button>
				   </div>

                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">연락처</label><br>
                        <input type="text" id="Phone" name="phone" class="Phone" style="width: 90%;" placeholder="-없이입력">
                     	<br>
                        <label class="phoneNumCheck" id="phoneNumCheck" for="phoneNumCheck"></label>
                    </div>               
                      <div class="group" style="margin-left: 40px;">
                        <label for="pass" class="label" style="font-size: 18px;">우편번호</label>
                        <br>
						<input type="text" class="input" id="zipCode"
												name="zipCode" style="width: 70%;" required>
						<button type="button" class="input" style="color:white; background-color:#1161ee;" onclick="addrSearch();">검색</button>
                        <br><br>
                        <label for="pass" class="label" style="font-size: 18px;">주소</label>
                        <br>
						<input type="text" class="input" id="address1" name="address1" style="width: 90%;" required>
						<br><br>
                        <label for="pass" class="label" style="font-size: 18px;">상세주소</label>
                        <br>
                        <input type="text" class="input" id="address2" name="address2" style="width: 90%;">
                    </div>				
                    <br>
                    <div class="group" style="text-align:center; margin-top:30px;">
                    	<button type="button" class="button" style="width: 80%; font-size: 20px; font-weight: bold;" onclick="updateMember();">Sign up</button>
                        <!-- <input type="submit" class="button" value="Sign Up" style="width: 80%; font-size: 20px; font-weight: bold;"> -->
                    </div>
                
                </div>
               </form>
            </div>
        </div>
      </div>
     


<script>
	

	function createPopupWin(pageURL, pageTitle,popupWinWidth, popupWinHeight)
	{ var left = (screen.width - popupWinWidth) / 2; 
	  var top = (screen.height - popupWinHeight) / 2; 
				  
	  var myWindow = window.open(pageURL, pageTitle,  
				        	'width='  + popupWinWidth 
				        + ', height=' + popupWinHeight
				        + ', top='    + top
				        + ', left='   + left); } 
	
	function createEmailCer(pageURL, pageTitle,popupWinWidth, popupWinHeight)
	{ var left = (screen.width - popupWinWidth) / 2; 
	  var top = (screen.height - popupWinHeight) / 2; 
				  
	  var myWindow = window.open(pageURL, pageTitle,  
				        	'width='  + popupWinWidth 
				        + ', height=' + popupWinHeight
				        + ', top='    + top
				        + ', left='   + left); }

	$('#memberlogin').submit(function(event){
		$.ajax({
			url : '${pageContext.request.contextPath}/member/memberLogincheck.do',
			async : false,
			dataType: "json",
			data : {
				userId : $('#userId').val(),
				userPwd : $('#userPwd').val()
			}, success : function(data){
				console.log(data);
				if(data.result == 1) {
					$("#logincheck").html("<p style='color:red'>해당하는 사용자가 없습니다.</p>").fadeIn(500);
					$("#logincheck").delay(2000);
					$("#logincheck").fadeOut(500);
					
					event.preventDefault();
				} else if(data.result == 3){
					$("#logincheck").html("<p style='color:red'>비밀번호가 잘못 입력되었습니다.</p>").fadeIn(500);
					$("#logincheck").delay(2000);
					$("#logincheck").fadeOut(500);
					
					event.preventDefault();
			   } else if(data.result == 2) {
				   location.href = "/member/memberLogin.do";
			   }
			}
		});
		
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
	
	/* 이름 유효성체크  */
	$('#userName').change(function(){

        var reg4 = /^[가-힝]{2,4}$/;
    
        if (!reg4.test($('#userName').val())) {
            $('#nameCheck').html("<p style='color:red'>이름을 제대로 입력해주세요.</p>").fadeIn(500);
			$("#nameCheck").delay(2000);
			$("#nameCheck").fadeOut(500);
            $('#userName').val('');
			$('#userName').focus();
		}else {
			$('#nameCheck').html("<p style='color:#58FA58'>사용가능한 이름입니다.</p>").fadeIn(500);
			$("#nameCheck").delay(2000);
			$("#nameCheck").fadeOut(500); 
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

	/* 홈으로 이동 */
	function goMain() {
		location.href = '${pageContext.request.contextPath}/';
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
	
	
	$(function(){
		
		/* 이메일 유효성 체크 */
		$("#email").on("keyup",function() {
	            
			var re2 = /^[a-z][a-z0-9_-]{3,11}@([a-z\d\.-]+)\.([a-z\.]{2,9})$/g;
	            
	            if (!re2.test($("#email").val())) {
	                $("#email-container>.guide.error").show();
	                $("#email-container>.guide.ok").hide();
	                $("#email").val('');
	                $("#email").focus();
	            } else {
	            	$.ajax({
	                        url: "${pageContext.request.contextPath}/member/checkEmailDup.do",
	                        data: { email : $("#email").val() },
	                        dataType: "json",
	                        success: function(data) {
	                           
	                        	console.log(data);
	                            
	                        	if (data.isUsable == true) {
	                                $("#email-container>.guide.error").hide();
	                                $("#email-container>.guide.ok").show();
	                                $("#checkEmailDup").val(1);
	                            } else {
	                                $("#email-container>.guide.error").show();
	                                $("#email-container>.guide.ok").hide();
	                                $("#checkEmailDup").val(0);
	                            }
	                        },
	                        error: function(jqxhr, textStatus, errorThrown) {
	                            console.log("ajax 처리 실패");
	                            //에러로그
	                            console.log(jqxhr);
	                            console.log(textStatus);
	                            console.log(errorThrown);
	                        }

	                    });
	            }

	        });
		
		/* 아이디 중복검사 이벤트 추가 */
		$("#userIdcheck").on("keyup", function(){
			  var userId = $(this).val().trim();
			   if(userId.length<4) {
			        	$("#userId-container>.guide.error").hide();
			        	$("#userId-container>.guide.ok").hide();
			        	$("#userId-container>.guide.invalid").show();
			        	return;
			        	
			        } else {
			        	
				        $.ajax({
				            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
				            data : { userId : userId },
				            dataType: "json",
				            success : function(data){
				                console.log(data);
				                // if(data=="true") //stream 방식
				                if(data.isUsable==true){ //viewName 방식
				                    $("#userId-container>.guide.error").hide();
				                    $("#userId-container>.guide.invalid").hide();
				                    $("#userId-container>.guide.ok").show();
				                    $("#idDuplicateCheck").val(1);
				                } else {
				                    $("#userId-container>.guide.error").show();
				                    $("#userId-container>.guide.invalid").hide();
				                    $("#userId-container>.guide.ok").hide();
				                    $("#idDuplicateCheck").val(0);
				                }
				            }, error : function(jqxhr, textStatus, errorThrown){
				                console.log("ajax 처리 실패");
				                //에러로그
				                console.log(jqxhr);
				                console.log(textStatus);
				                console.log(errorThrown);
				            }
			        	});
			     	}
				});
	});
		/* 회원가입시 유효성체크 */
		
		function updateMember() {
			var confirm = window.confirm("이대로 회원가입 하시겠습니까?");
			 
			if($('.fail').length == 0 && confirm){
				$("#memberinsert").submit();
	       } else {
	           alert('비밀번호 양식에 맞지 않습니다.');

	           event.preventDefault();
	      }
		
			var userId = $("#userIdcheck");
			if(userId.val().trim().length<4){
				alert("아이디는 최소 4자리이상이어야 합니다.");
				userId.focus();
				return false;
			}
				
			
			//아이디중복체크여부
		    if($("#idDuplicateCheck").val()==0){
		        alert("사용가능한 아이디를 입력해주세요.");
		        return false();
		    }
			
			return true;
		}
		
	</script>

</body>
</html>