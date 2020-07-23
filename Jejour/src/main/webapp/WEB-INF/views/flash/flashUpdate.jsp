<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

	<c:import url="../common/header.jsp"/>
	
    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate mx-auto">
            <form action="">
              <h2 class="mb-3"><label style="width: 15%;">제목 :</label><input type="text" name="first_name" placeholder="" onfocus="this.placeholder = ''" onblur="this.placeholder = ''" required="" class="single-input"></h2>
              <br>
              <p><label style="width: 15%;">성별 :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;남자</p>
              <p><label style="width: 15%;">인원 :</label><input type="text" name="first_name" placeholder="ex)3명" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ex)3명'" required="" class="multi-input"></p>
              <p><label style="width: 15%;">일시 :</label><input type="datetime-local" name="first_name" placeholder="ex)2020-11-11" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ex)2020-11-11'" required="" class="multi-input"></p>
              <p><label style="width: 15%;">장소 :</label><input type="text" name="first_name" placeholder="ex)밑의 지도에서 검색하여 핀을 클릭하세요!" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ex)밑의 지도에서 검색하여 핀을 클릭하세요!'" required="" class="multi-input" readonly ></p>
              <p><label style="width: 15%;">내용 :</label><input type="text" name="first_name" placeholder="ex)같이 맛있게 먹고 노실 분!" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ex)같이 맛있게 먹고 노실 분!'" required="" class="multi-input"></p>
              <!-- input hidden으로 경도, 위도 받아오기! -->
              <br>
              <p>
                <img src="images/image_6.jpg" alt="" class="img-fluid">
              </p>
              <br>
              <div style="text-align: center;">
                <input type="submit" class="search-submit btn btn-primary" value="수정완료">
                &nbsp;&nbsp;
                <input type="button" class="search-submit btn btn-primary" value="삭제하기">
                &nbsp;&nbsp;
                <input type="button" class="search-submit btn btn-primary" value="목록으로">
              </div>
            </form>
            </div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->
    
    <c:import url="../common/footer.jsp"/>
    