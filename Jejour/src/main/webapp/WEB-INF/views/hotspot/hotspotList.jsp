<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
	
	<c:import url="../common/header.jsp"/>
	
    <!-- END slider -->

    <!-- ----------------------------------------------------------------------- -->
    <!-- ----------------------------------------------------------------------- -->
    <!-- ----------------------------------------------------------------------- -->

    <section class="ftco-section bg-light" style="padding-top: 4em;">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-right">
            <input type="button" class="btn btn-primary" onclick="fn_gohotspotInsert();" value="작성하기"/>
          </div>
        </div>

        <br>
        <br>

        <div class="row">
          <c:forEach items="${holist}" var="h"> 
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="blog-entry">
              <a href=<c:url value='/hotspotBoard/hotspotDetail.ho?no=${h.HNo}'/> class="block-20" style="background-image: url('${pageContext.request.contextPath}/resources/images/hotspotimg/desc/${h.HPreview}');">
              </a>
              <div class="text p-4">
                <div class="meta">
                  <div><a href="#">${h.HDate}</a></div>
                  <div><a href="#">${h.userId}</a></div>
                </div>
                <div  style="height: 120px;">
                <h3 class="heading"><a href="#">${h.HTitle}</a></h3>
                <p class="clearfix">
                </div>
               <!-- <a href="#" class="float-right meta-chat"><span class="icon-chat"></span> 댓글 갯수 적어야함</a> -->
               <%-- <div><a href="#">조회수 : ${h.HCount}</a></div> --%>
                </p>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">  
              <ul>
          		 <c:out value="${pageBar}" escapeXml="ture"/>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>


    <!------------------------------------------------------------------------------------------------------->
    <script>
		function fn_gohotspotInsert(){
			location.href = "${pageContext.request.contextPath}/hotspotBoard/hotspotInsert.ho";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var boardNo = $(this).attr("id");
				console.log("hNo="+hNo);
			});
		});
	</script>
   
   <c:import url="../common/footer.jsp"/>
   