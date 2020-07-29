<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 입력</title>
<% 
   request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
   //request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
   String email = request.getParameter("email"); 
%>
</head>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<body>
<script>
      
     /* 이메일 정보받아오기 */
	opener.document.getElementById("email").value = '${ email }';
	var auth = '${auth}';
	if(auth == 'true'){
		$(opener.document.querySelector('#email-container>.guide.ok')).show();
		$(opener.document.querySelector('#email-container>.guide.error')).hide();
	} /* else {
		$(opener.document.querySelector('#email-container>.guide.ok')).hide();
		$(opener.document.querySelector('#email-container>.guide.error')).show();
	} */
	window.close();

</script>
</body>
</html>