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
<style>
body{
	margin:auto;
	color:#6a6f8c;
	background:#c8c8c8;
	font:600 16px/18px 'Open Sans',sans-serif;
    background-repeat: no-repeat;
    background-size : cover;
    background-image: url('images/updateinfo5.jpg');
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
	padding:50px 70px 430px 70px;
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
	border-color:#1161ee;
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
.login-form .group .button,
#dupliCheck{
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

#dupliCheck {
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

.RRN {
    width: 45%;
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

    </style>
</head>
<body>
	<div class="login-wrap">
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">정보수정</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
            <div class="login-form">
                <div class="sign-in-htm">
                    <div class="group" style="margin-left:40px;">
                        <br><br>
                        <label for="user" class="label" style="font-size: 18px;">아이디</label>
                        <label style="color:white; margin-left: 70px;">${ member.userId }</label>
                    </div>
                    <br>
                    <div class="group" style="margin-left:40px;">
                        <label for="user" class="label" style="font-size: 18px; width: 50%;">이름</label>
                        <label style="color:white; margin-left: 90px;">${ member.userName }</label>
                    </div>
                    <br>
                    <div class="group" style="margin-left:40px;">
                        <label for="user" class="label" style="font-size: 18px; width: 50%;">생년월일</label>
                        <label style="color:white; margin-left: 30px;">${ member.rrn }</label>
                    </div>
                    <br>
                    
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">비밀번호</label><br><br>
                        <input id="password1" name="userPwd1" type="password" class="input" data-type="password" style="width: 90%;">
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">비밀번호 확인</label><br><br>
                        <input id="password2" name="userPwd2" type="password" class="input" data-type="password" style="width: 90%;">
                        <br><br>
                        <label style="color:red; font-weight: bold;"> 비밀번호가 일치하지않습니다. </label>
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">이메일주소</label><br><br>
                        <input id="pass" name="email" type="text" class="input" name="email" style="width: 90%;">
                    </div>
                    <div class="group" style="margin-left:40px;">
                        <label for="pass" class="label" style="font-size: 18px;">휴대폰번호</label><br><br>
                        <input type="text" id="Phone1" name="Phone1" class="Phone">
                        <input type="text" id="Phone2" name="Phone2" class="Phone">
                        <input type="text" id="Phone3" name="Phone3" class="Phone"><br><br>
                        <label style="color:red;"> 숫자만 입력해주세요 </label>
                    </div>
                    <br>
                    <div class="group" style="text-align:center">
                        <input type="submit" class="button" value="Correct" style="width: 40%; font-size: 20px; font-weight: bold; ">
                        <button type="button" class="button" style="width: 40%; font-size: 20px; font-weight: bold; ">Home</button>
                    </div>
                </div>
                <div class="sign-up-htm">
                    <div class="group" style="margin-left:40px;">
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
                    </div>
                </div>
            </div>
        </div>
     </div>

</body>
</html>