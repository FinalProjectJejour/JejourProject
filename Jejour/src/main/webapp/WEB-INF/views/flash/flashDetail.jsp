<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

	<c:import url="../common/header.jsp"/>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate mx-auto">
            <h2 class="mb-3">${FlashBoard.FTitle}</h2>
            <div class="meta text-left" style="color: tomato; font-weight: 400; margin-top: -15px;">
              작성자 : 유병호 &nbsp;&nbsp;
              작성일 : ${FlashBoard.FDate}
            </div>
            <hr>
            <br>
            <p>성별 : 남자</p>
            <p>인원 : ${FlashBoard.FPeople}명</p>
            <p>만나는 날 : ${FlashBoard.FMeetDate} ${FlashBoard.FMeetTime}</p>
            <p>장소 : ${FlashBoard.FMapTitle}</p>
            <p>내용 : ${FlashBoard.FContent}</p>
            <br>
            <div>
            	<div id="map" style="width:100%;height:350px;"></div>
            </div>
            <br>
            <div style="text-align: center;">
              <input type="button" class="search-submit btn btn-primary" value="수정하기" onclick="goFlashBoardUpdate();">
              &nbsp;&nbsp;
              <input type="button" class="search-submit btn btn-primary" value="목록으로" onclick="goFlashList();">
            </div>
          </div>
        </div> <!-- .col-md-8 -->

        <br>
        <div class="col-md-8 mx-auto">
          <hr>
        </div>

        <br>

        <div class="replyArea">
          <div class="row">
            <div class="col-md-8 mx-auto" id="replySelectArea"> <!-- 게시글의 댓글 목록 구현부 -->
              <div style="border-bottom:1px solid gray;">
                <div style="height:5px;"></div>
                <table id="replySelectTable" class="text-left"
                style="margin-left : 0px; width : 100.0%;" class="replyList1">
                  <tr>
                    <td style="width:80px;"><b>&nbsp;&nbsp;유병호</b></td>
                    <td>2020-07-17</td>
                    <td align="center">
                      <div class="text-right">
                        <input type="hidden" name="cno" value="11"/>  
                        <button type="button" class="updateBtn btn btn-md btn-info" 
                          onclick="updateReply(this);" style="border-radius: 10px;">수정하기</button>
                        <button type="button" class="updateConfirm btn btn-md btn-info"
                          onclick="updateConfirm(this);"
                          style="display:none; border-radius: 10px;" >수정완료</button> &nbsp;
                        <button type="button" class="deleteBtn btn btn-md btn-info"
                          onclick="deleteReply(this);" style="border-radius: 10px;">삭제하기</button> &nbsp;
                      </div>
                    </td>
                  </tr>
                  <tr class="comment replyList1">
                    <td colspan="3" style="background : transparent;">
                    <textarea class="reply-content" cols="105" rows="2" style="border:none; width:100%; resize:none; outline: none;"
                    readonly="readonly">&nbsp;&nbsp;민혁이형은 내맘을 몰라
                    </textarea>
                    </td>
                  </tr>
                </table>
              </div>
            </div>   
          </div>
        </div>
    
        <br>

        <div class="row">
          <div class="col-lg-8 mx-auto">
            <div class="replyWriteArea" style="border: 1px solid gray; border-radius: 10px;">
              <form action="/codingPanda/insertComment.bo" method="post">
                <div class="text-left" style="padding-left: 15px;">
                  <div style="height : 10px"></div>
                  <a style="font-weight: 900; color: black;">박민혁</a>
                </div>
                <div class="comment_form mx-auto" style="text-align: center;">
                  <input type="hidden" name="writer" value="test"/>
                  <input type="hidden" name="bno" value="test" />
                  <input type="hidden" name="refcno" value="0" />
                  <input type="hidden" name="clevel" value="1" />
           
                  <textArea rows="3" cols="80" id="replyContent" name="replyContent" style="border:none; width:97%; resize:none; outline: 0;" placeholder="댓글을 입력해보세요!"></textArea>
                </div>
                <div class="text-right">
                  <button type="submit" class="btn btn-md btn-info" id="addReply" style="border-radius: 10px;">댓글 등록</button>&nbsp;&nbsp;&nbsp;
                <div style="height : 10px"></div>
                </div>
              </form>
            </div>
          </div>
        </div>
        
      </div>
    </section> <!-- .section -->  
    
    <script>
    function goFlashList(){
   	 	location.href = "${pageContext.request.contextPath}/flashBoard/flashList.fl";
    }
    
    function goFlashBoardUpdate(){
    	location.href = "${pageContext.request.contextPath}/flashBoard/flashBoardUpdateView.fl?fNo=${FlashBoard.FNo}";
    }
    </script>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8c0b6988029a8eedd98928d0fab7698&libraries=services"></script>
   	<script>
   	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${FlashBoard.FMapY}, ${FlashBoard.FMapX}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${FlashBoard.FMapY}, ${FlashBoard.FMapX}); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	var iwContent = '<div style="padding:5px;">${FlashBoard.FMapTitle}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(${FlashBoard.FMapY}, ${FlashBoard.FMapX}); //인포윈도우 표시 위치입니다
	
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
	</script>

	<c:import url="../common/footer.jsp"/>
	