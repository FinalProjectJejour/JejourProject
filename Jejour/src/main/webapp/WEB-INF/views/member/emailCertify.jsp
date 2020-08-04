<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
</head>
<style>


/* 버튼 css의 시작*/
.underline-btn {
    display: inline-block;
    padding: 1em 0;
    border-radius: 0;
    color: #1f83e1;
    margin-top: 4rem;
    margin-left: 200px;
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

header {
   background-color: #1f83e1;	
   height: 50px;
}

header img {

   padding: 0px 0px 0px 0px;
}

*{
  margin:0; padding:0;
  font-size:15px; 
  line-height:1;
  box-sizing: border-box;
}

/* 라벨 css 시작 */


.email {
  position: absolute;
  margin-left:150px;
  width: 100%;
  max-width: 280px;
}
.email .label {
  position: absolute;
  top: 16px;
  left: 0;
  font-size: 16px;
  color: #9098a9;
  font-weight: 500;
  transform-origin: 0 0;
  transition: all 0.2s ease;
}
.email svg {
  position: absolute;
  left: 0;
  bottom: 0;
  height: 26px;
  fill: none;
}
.email svg path {
  stroke: #c8ccd4;
  stroke-width: 2;
}
.email svg path d {
  transition: all 0.2s ease;
}
.email .border {
  position: absolute;
  bottom: 0;
  left: 120px;
  height: 2px;
  right: 0;
  background: #c8ccd4;
}
.email input {
  -webkit-appearance: none;
  width: 100%;
  border: 0;
  font-family: inherit;
  padding: 12px 0;
  height: 48px;
  font-size: 16px;
  font-weight: 500;
  background: none;
  border-radius: 0;
  color: #223254;
  transition: all 0.15s ease;
}
.email input:not(:placeholder-shown) + span {
  color: #5a667f;
  transform: translateY(-26px) scale(0.75);
}
.email input:focus {
  background: none;
  outline: none;
}
.email input:focus + span {
  color: #07f;
  transform: translateY(-26px) scale(0.75);
  transition-delay: 0.1s;
}
.email input:focus + span + svg path {
  stroke: #07f;
  animation: elasticInput 0.4s ease forwards;
}

.email input:focus + span + svg + .border {
  background: #07f;
}


@-moz-keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}
@-webkit-keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}
@-o-keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}
@keyframes elasticInput {
  50% {
    d: path("M2,2 C21,17 46,25 74,25 C102,25 118,25 120,25");
  }
}





</style>
<body>

<header>
<img src="${pageContext.request.contextPath}/resources/images/jejulogo.png" width="150" 
         alt="logo"/>
</header>

<br><br><br><br><br><br>
<form action="${pageContext.request.contextPath}/member/auth.do" method="post">


			  <label class="email">
			    <input type="text" id="email" name="email" placeholder="&nbsp;"
			    	   required oninvalid="this.setCustomValidity('이메일을 입력해주세요')">
			    <span class="label">Email</span>
				    <svg width="120px" height="26px" viewBox="0 0 120 26">
				      <path d="M0,25 C21,25 46,25 74,25 C102,25 118,25 120,25"></path>
				    </svg>
			    <span class="border"></span>
			  </label>
 				
 				<br><br><br>
   			    <input type="hidden" name="checkEmailDup" id="checkEmailDup" value="0"/>
               <button type="submit" name="submit" class="underline-btn"
               style="border:0; background-color:white; width:150px;" onclick="check();">이메일 인증받기</button>
</form>

<div style="margin-top:70px; margin-left:55px;">
<span style="color:green; font-weight: bold; text-align:center; padding-top:100px;">이메일 인증 (이메일을 인증 받아야</span>
<span style="color:red; font-weight: bold;">다음 단계</span>
<span style="color:green; font-weight: bold;">로 넘어갈 수 있습니다.)</span>
</div>
<script>

$(function(){
	/* 이메일 유효성 체크 */
	$("#email").on("change",function() {
            
		var re2 = /^[a-z][a-z0-9_-]{3,11}@([a-z\d\.-]+)\.([a-z\.]{2,9})$/g;
            
            if (!re2.test($("#email").val())) {
                alert("이메일 형식에 맞지않습니다 다시입력해주세요!");
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
                        		alert("사용가능한 이메일입니다!");
                                $("#checkEmailDup").val(1);
                            } else {
                                alert("이미 사용중인 이메일입니다.");
                                $("#email").val('');
                                $("#email").focus();
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
});

	
			function check(){
				//이메일 중복체크여부
				if($("#checkEmailDup").val()==0){
				    alert("사용가능한 이메일을 입력해주세요.");
				    return false();
				}

					return true;
				}
		


</script>      
      

</body>
</html>