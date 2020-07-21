<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>


<c:import url="../common/header.jsp"/>

<br><br>
    <div class="ftco-section-search" style="background-color:#1161ee;">
        <div class="container">
          <div class="row">
           <div class="col-md-12 tabulation-search">
            <br><br>
              <div class="tab-content py-5" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                  <div class="block-17">
                    <form action="" method="post" class="d-block d-lg-flex">
                      <div class="fields d-block d-lg-flex">
                        <label style="font-size: 38px; color:white; font-weight: bold;">${ member.Name }님의</label>
                        <label style="font-size: 20px; color:white; margin-left: 10px; margin-top: 22px;">일정 보관함</label>
                      </div>
                      <button class="search-submit btn btn-primary" style="border-radius:25px; border: white;">Other Plan</button>  
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
   <p>총 ${totalContents }건의 게시물이 있습니다.</p>
   <br><br>

   <!-- 나의 일정리스트 시작-->
    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row">
          <c:forEach items="${list}" var="b"> 
          <!-- 게시물 하나의 UI -->
          <div class="col-md-6 col-lg-3 ftco-animate">
            <div class="blog-entry">
              <a href="blog-single.html" class="block-20" style="background-image: url('images/image_1.jpg');">
              </a>
              <div class="text p-4">
                <div class="meta">
                  <div><a href="#">${ planner.date }</a></div>
                  <div><a href="#">${ member.userName }</a></div>
                </div>
                <h3 class="heading"><a href="#">${ planner.describe }</a></h3>
                <p class="clearfix">
                  <a href="#" class="float-left">Read more</a>
                  <a href="#" class="float-right meta-chat"><span class="icon-thumbs-o-up"></span>${ plannerLike.good }</a>
                </p>
              </div>
            </div>
          </div>
         </c:forEach>
        <!-- 게시물 하나의 UI의 끝  -->
       
       </div>

        <!-- 페이징처리 UI <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div> -->
      </div>
    </section>
   <!-- 나의일정 보관함의 끝 -->

<c:import url="../common/footer.jsp"/>

