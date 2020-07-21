<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <style>
        *{
         margin: 0; padding: 0;
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
          margin-top: 5%;
          display:none; 
          text-align:left; 
          width : 500px;
          left : 0;
           padding: 3px 10px 20px 20px;
          position:absolute; 
             border: 1px rgb(77, 89, 245) solid;
            background-color: rgb(255, 255, 255);
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
        margin : 30px;
        }
        .searchbtn {
           border: 0;
           border-radius: 1rem;
           letter-spacing: .1rem;
           font-weight: bold;
           padding: 1rem;
           color: black;
           width: 100px;
           height: 55px;
           background:rgba(0,51,153,.5);
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
           background:rgba(0,51,153,.5);
        }
        
        </style>
<body>
<header>
    <img src="" width="150"
       alt="logo" style = " left : 15px; "/>
 </header>
    
    <div class = "tabmenu">
    <ul>
       <li id = "tab1" class = "btnCon">
          <div class="card">
          <h3 class="card-title">아이디 찾기</h3>
          <form action="" class="findid" method="get">
          <div id ="tb">
             <table>
                <tr>
                   <td>이름</td>
                   <td><div class="form-label-group">
                         <input type="text" id="userName" name="userName" class="userInfo"
                            placeholder="성명" required autofocus>
                      </div></td>
                   <td rowspan="3">
                       <div>
                          <button class="searchbtn" type="submit"
                             onclick="return check();">찾기</button>
                       </div>
                </td>
            </tr>
            <tr></tr>
            <tr>
                <td>주민등록번호</td>
                <td>
                    <div class="form-label-group">
                        <input type="text" id="RRN1" name="RRN1" class="userInfo" size=7
                        required> -
                        <input type="password" id="RRN2" name="RRN2" size=7 class="userInfo" required>
                    </div>
                </td>
               
           </tr>
         </table>
        </div>
       </form>
      </div>
     </li>
    </ul>
  </div>

 
    
    <script>
    function check(){
       if($('#userName').val() == null){
          alert('이름을 입력해주세요');
          return false;
       } else if ($('#userNum1').val() == null || $('#userNum2').val() == null ) {
          alert('주민등록번호를 입력해주세요');
          return false;
       }
    }
    </script>

</body>
</html>