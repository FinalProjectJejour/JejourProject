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
            <h2 class="mb-3">제주도 맛집 모닥치기에서 떡튀순 부수실 분 ?</h2>
            <div class="meta text-left" style="color: tomato; font-weight: 400; margin-top: -15px;">
              작성자 : 유병호 &nbsp;&nbsp;
              작성일 : 2020-07-13
            </div>
            <hr>
            <br>
            <p>성별 : 남자</p>
            <p>인원 : 3명</p>
            <p>만나는 날 : 2020-07-14 14:00</p>
            <p>장소 : 제주도 서귀포시 OO동 모닥치기 앞</p>
            <p>내용 : 안녕하세요 ㅎㅎ 남자 3명이서 놀러왔습니다~ 훈남 3명이구요 같이 밥 맛있게 먹고 놀 분?</p>
            <br>
            <p>
              <img src="images/image_6.jpg" alt="" class="img-fluid">
            </p>
            <br>
            <div style="text-align: center;">
              <input type="submit" class="search-submit btn btn-primary" value="수정하기">
              &nbsp;&nbsp;
              <input type="submit" class="search-submit btn btn-primary" value="목록으로">
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
                  <input type="hidden" name="writer" value="<%=m.getmId()%>"/>
                  <input type="hidden" name="bno" value="<%=b.getBno()%>" />
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

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

	<script>
    function updateReply(obj) {
      // 현재 위치와 가장 근접한 textarea 접근하기
      $(obj).parent().parent().parent().next().find('textarea')
      .removeAttr('readonly');
      
      // 수정 완료 버튼을 화면 보이게 하기
      $(obj).siblings('.updateConfirm').css('display','inline');
      
      // 수정하기 버튼 숨기기
      $(obj).css('display', 'none');
    }
    
    function updateConfirm(obj) {
      // 댓글의 내용 가져오기
      var content
        = $(obj).parent().parent().parent().next().find('textarea').val();
      
      // 댓글의 번호 가져오기
      var cno = $(obj).siblings('input').val();
      
      // 게시글 번호 가져오기
      var bno = '<%=b.getBno()%>';
      
      location.href="/codingPanda/updateComment.bo?"
           +"cno="+cno+"&bno="+bno+"&content="+content;
    }
    
    function deleteReply(obj) {
      // 댓글의 번호 가져오기
      var cno = $(obj).siblings('input').val();
      
      // 게시글 번호 가져오기
      var bno = '<%=b.getBno()%>';
      
      location.href="/codingPanda/deleteComment.bo"
      +"?cno="+cno+"&bno="+bno;
    }
    
    function reComment(obj){
      // 추가 완료 버튼을 화면 보이게 하기
      $(obj).siblings('.insertConfirm').css('display','inline');
      
      // 클릭한 버튼 숨기기
      $(obj).css('display', 'none');
      
      // 내용 입력 공간 만들기
      var htmlForm = 
        '<tr class="comment"><td></td>'
          +'<td colspan="3" style="background : transparent;">'
            + '<textarea class="reply-content" style="background : white; resize:none;" cols="105" rows="2"></textarea>'
          + '</td>'
        + '</tr>';
      
      $(obj).parents('table').append(htmlForm);
      
    }
    
    function reConfirm(obj) {
      // 댓글의 내용 가져오기
      
      // 참조할 댓글의 번호 가져오기
      var refcno = $(obj).siblings('input[name="refcno"]').val();
      var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;
      
      // console.log(refcno + " : " + level);
      
      // 게시글 번호 가져오기
      var bno = '<%=b.getBno()%>';
      
      var parent = $(obj).parent().parent();
      var grandparent = parent.parent();
      var siblingsTR = grandparent.siblings().last();
      
      var content = siblingsTR.find('textarea').val();
      
      
      location.href='/codingPanda/insertComment.bo'
                 + '?writer=<%= m.getmId() %>'
                 + '&replyContent=' + content
                 + '&bno=' + bno
                 + '&refcno=' + refcno
                 + '&clevel=' + level;
    }
  </script>

	<c:import url="../common/footer.jsp"/>
	