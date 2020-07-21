<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
	
	<c:import url="views/common/header.jsp"/>
	
    <section class="ftco-section">
      <div class="container-fluid">
        <div class="row no-gutters justify-content-center mb-5 pb-5 ftco-animate">
          <div class="col-md-7 text-center heading-section">
            <h2>Summer Attractions</h2>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-md-6 col-lg-3 ftco-animate">
            <a href="https://www.visitjeju.net/kr/detail/view?contentsid=CONT_000000000500697" 
            onclick="window.open(this.href); return false;" target="_blank" class="block-5" style="background-image: url('${pageContext.request.contextPath}/resources/images/hyupjae.jpg');">
              <div class="text">
                <h3 class="heading">협재 해수욕장</h3>
                <div class="post-meta">
                  <span>제주 제주시 한림읍 협재리 2497-1</span>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-3 ftco-animate">
            <a href="https://www.visitjeju.net/kr/detail/view?contentsid=CONT_000000000500146" 
            onclick="window.open(this.href); return false;" target="_blank" class="block-5" style="background-image: url('${pageContext.request.contextPath}/resources/images/donnaeco.jpg');">
              <div class="text">
                <h3 class="heading">돈내코 원앙폭포</h3>
                <div class="post-meta">
                  <span>제주 서귀포시 돈내코로 137</span>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-3 ftco-animate">
            <a href="https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000018383" 
            onclick="window.open(this.href); return false;" target="_blank" class="block-5" style="background-image: url('${pageContext.request.contextPath}/resources/images/hwanguzi.jpg');">
              <div class="text">
                <h3 class="heading">황우지 해안</h3>
                <div class="post-meta">
                  <span>제주 서귀포시 서홍동 766-1</span>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-3 ftco-animate">
            <a href="https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000019331" 
            onclick="window.open(this.href); return false;" target="_blank" class="block-5" style="background-image: url('${pageContext.request.contextPath}/resources/images/chunjaeyeon.jpg');">
              <div class="text">
                <h3 class="heading">천제연 폭포</h3>
                <div class="post-meta">
                  <span>제주 서귀포시 천제연로 132 천제연폭포관리소</span>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-3 ftco-animate">
            <a href="https://www.visitjeju.net/kr/detail/view?contentsid=CONT_000000000500707" 
            onclick="window.open(this.href); return false;" target="_blank" class="block-5" style="background-image: url('${pageContext.request.contextPath}/resources/images/hyuaeri.jpg');">
              <div class="text">
                <h3 class="heading">휴애리 자연생활공원</h3>
                <div class="post-meta">
                  <span>제주 서귀포시 남원읍 신례동로 256</span>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-3 ftco-animate">
            <a href="https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000001195" 
            onclick="window.open(this.href); return false;" target="_blank" class="block-5" style="background-image: url('${pageContext.request.contextPath}/resources/images/camelia.jpg');">
              <div class="text">
                <h3 class="heading">카멜리아힐</h3>
                <div class="post-meta">
                  <span>제주 서귀포시 안덕면 병악로 166</span>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-3 ftco-animate">
            <a href="https://www.visitjeju.net/kr/detail/view?contentsid=CONT_000000000500699" 
            onclick="window.open(this.href); return false;" target="_blank" class="block-5" style="background-image: url('${pageContext.request.contextPath}/resources/images/honinji.jpg');">
              <div class="text">
                <h3 class="heading">혼인지</h3>
                <div class="post-meta">
                  <span>제주 서귀포시 성산읍 혼인지로 39-22 혼인지</span>
                </div>
              </div>
            </a>
          </div>
          <div class="col-md-6 col-lg-3 ftco-animate">
            <a href="https://www.visitjeju.net/kr/detail/view?contentsid=CONT_000000000500565" 
            onclick="window.open(this.href); return false;" target="_blank" class="block-5" style="background-image: url('${pageContext.request.contextPath}/resources/images/aqua.jpg');">
              <div class="text">
                <h3 class="heading">아쿠아플라넷</h3>
                <div class="post-meta">
                  <span>제주 서귀포시 성산읍 섭지코지로 95</span>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </section>
    
    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2>Recommendation Schedule</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="carousel1 owl-carousel ftco-owl">
            <div class="item">
              <div class="blog-entry">
                <a href="blog-single.html" class="block-20" style="background-image: url('images/image_5.jpg');">
                  <div class="col-sm-4" style="text-align: center; background-color: #ff5f5f; color : white;">
                    가족
                  </div>
                </a>
                <div class="text p-4">
                  <div class="meta">
                    <div><a href="#">July 7, 2018</a></div>
                    <div><a href="#">Admin</a></div>
                  </div>
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <p class="clearfix">
                    <a href="#" class="float-left">Read more</a>
                    <a href="#" class="float-right meta-chat"><span class="icon-thumbs-o-up"></span> 3</a>
                  </p>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="blog-entry" data-aos-delay="100">
                <a href="blog-single.html" class="block-20" style="background-image: url('images/image_6.jpg');">
                  <div class="col-sm-4" style="text-align: center; background-color: #ff5f5f; color : white;">
                    친구
                  </div>
                </a>
                <div class="text p-4">
                  <div class="meta">
                    <div><a href="#">July 7, 2018</a></div>
                    <div><a href="#">Admin</a></div>
                  </div>
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <p class="clearfix">
                    <a href="#" class="float-left">Read more</a>
                    <a href="#" class="float-right meta-chat"><span class="icon-thumbs-o-up"></span> 3</a>
                  </p>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="blog-entry" data-aos-delay="200">
                <a href="blog-single.html" class="block-20" style="background-image: url('images/image_7.jpg');">
                  <div class="col-sm-4" style="text-align: center; background-color: #ff5f5f; color : white;">
                    부모님
                  </div>
                </a>
                <div class="text p-4">
                  <div class="meta">
                    <div><a href="#">July 7, 2018</a></div>
                    <div><a href="#">Admin</a></div>
                  </div>
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <p class="clearfix">
                    <a href="#" class="float-left">Read more</a>
                    <a href="#" class="float-right meta-chat"><span class="icon-thumbs-o-up"></span> 3</a>
                  </p>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="blog-entry" data-aos-delay="200">
                <a href="blog-single.html" class="block-20" style="background-image: url('images/image_8.jpg');">
                  <div class="col-sm-4" style="text-align: center; background-color: #ff5f5f; color : white;">
                    나홀로
                  </div>
                </a>
                <div class="text p-4">
                  <div class="meta">
                    <div><a href="#">July 7, 2018</a></div>
                    <div><a href="#">Admin</a></div>
                  </div>
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <p class="clearfix">
                    <a href="#" class="float-left">Read more</a>
                    <a href="#" class="float-right meta-chat"><span class="icon-thumbs-o-up"></span> 3</a>
                  </p>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="blog-entry" data-aos-delay="200">
                <a href="blog-single.html" class="block-20" style="background-image: url('images/image_4.jpg');">
                  <div class="col-sm-4" style="text-align: center; background-color: #ff5f5f; color : white;">
                    연인
                  </div>
                </a>
                <div class="text p-4">
                  <div class="meta">
                    <div><a href="#">July 7, 2018</a></div>
                    <div><a href="#">Admin</a></div>
                  </div>
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <p class="clearfix">
                    <a href="#" class="float-left">Read more</a>
                    <a href="#" class="float-right meta-chat"><span class="icon-thumbs-o-up"></span> 3</a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

	<c:import url="views/common/footer.jsp"/>
	