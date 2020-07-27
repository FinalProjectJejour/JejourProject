<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
       
       *{
         margin: 0; padding: 0;
          font-size:15px; 
          line-height:1.3;
        }
        ul{list-style:none;}
        
      
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
           padding: 0 30px 0 30px;
        }
        
        #tb{
        margin : 30px;

        text-align:center;
        border: 1px black solid;
        border-radius: 1rem;
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
</head>
<body>

<header>
    <img src="${pageContext.request.contextPath}/resources/images/LOGO_white.png" width="150"
       alt="logo" style = " left : 15px; "/>
</header>
 
   
        <h3 class="card-title" style="margin-top:30px;">아이디 찾기</h3>
          <form action="${pageContext.request.contextPath}/member/memberFindid.do" class="findid" method="get">
          <div id ="tb">
             
             <table>
                <tr>
                   <td>이름</td>
                   <td>
                   	  <div class="form-label-group" >
                         <input type="text" id="name" name="name" class="name"
                            placeholder="성명" required autofocus>
                      </div>
                   </td>
                   <td rowspan="3">
                       <div>
                          <button class="searchbtn" type="submit">찾기</button>
                       </div>
                  </td>
            </tr>
            <tr>
                <td>이메일 입력</td>
                <td>
                    <div class="form-label-group">
                        <input type="text" id="email" name="email" class="email" required>
                    </div>
                </td>              
           	</tr>
           	
         </table>
        
        </div>
     </form>
</body>
</html>