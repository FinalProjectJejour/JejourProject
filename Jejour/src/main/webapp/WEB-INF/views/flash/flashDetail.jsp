<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
	<head>
		<style>
			.info {
				width:200px;
				height:60px;
			}
		</style>
	</head>
	
	<c:import url="../common/header.jsp">
		<c:param name="data" value="flash"/>
	</c:import>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate mx-auto">
            <h2 class="mb-3">${FlashBoard.FTitle}</h2>
            <div class="meta text-left" style="color: tomato; font-weight: 400; margin-top: -15px;">
              작성자 : ${FlashBoard.FWriter} &nbsp;&nbsp;
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
            <br><br>
            <div style="text-align: center;">
            <c:if test="${FlashBoard.userId eq member.userId}">
              <input type="button" class="search-submit btn btn-primary" value="수정하기" onclick="goFlashBoardUpdate();">
              &nbsp;&nbsp;
            </c:if>
              <input type="button" class="search-submit btn btn-primary" value="목록으로" onclick="goFlashList();">
            </div>
          </div>
        </div> <!-- .col-md-8 -->
		
		<br><br>
        <div class="col-md-8 mx-auto">
          <a href="#" class="read" style="font-weight: bolder; font-size: 20px;">댓글 목록</a>
          <hr />
        </div>

        <br>
        
        <!-- 댓글 리스트! -->
        <div class="replyArea">
          <div class="row">
            <div class="col-md-8 mx-auto" id="replySelectArea"> <!-- 게시글의 댓글 목록 구현부 -->
            </div>   
          </div>
        </div>
        
		<!-- 댓글 작성 하는 곳! -->
        <div class="row">
          <div class="col-lg-8 mx-auto">
            <div class="replyWriteArea" style="border: 1px solid gray; border-radius: 10px;">
              <form id="insertComment" name="insertComment" method="post">
                <div class="text-left" style="padding-left: 15px;">
                  <div style="height : 10px"></div>
                  <a style="font-weight: 900; color: black;">${member.userName}</a>
                </div>
                <div class="comment_form mx-auto" style="text-align: center;">
               	  <input type="hidden" name="userId" value="${member.userId}"/>
                  <input type="hidden" name="fcWriter" value="${member.userName}"/>
                  <input type="hidden" name="fNo" value="${FlashBoard.FNo}" />
                  <input type="hidden" name="reffcNo" value="0" />
                  <input type="hidden" name="fcLevel" value="1" />
           
                  <textArea rows="3" cols="80" id="fcContent" name="fcContent" style="border:none; width:97%; resize:none; outline: 0;" placeholder="댓글을 입력해보세요!"></textArea>
                </div>
                <div class="text-right">
                  <button type="button" class="btn btn-md btn-info" id="addReply" style="border-radius: 10px;"
                  onclick="goInsertComment();">댓글 등록</button>&nbsp;&nbsp;&nbsp;
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
    
    // 댓글 달기
    function goInsertComment() {
    	var formData = $("#insertComment").serialize();
    	
    	$.ajax({
    		url : '${pageContext.request.contextPath}/flashComment/flashCommentInsert.fl',
    		type : 'post',
    		data : formData,
    		success : function(data) {
    			console.log("insert 성공!");
    			$("#fcContent").val('');

				var fullDate = (new Date(data.fcDate));
				var year = fullDate.getFullYear();
				var month = fullDate.getMonth() + 1;
				var day = fullDate.getDate();
				
				var fmonth;
				
				if(month < 10) {
					fmonth = '0' + month;
				} else {
					fmonth = month;
				}
				
				$('#replySelectArea').append(
						'<table id="replySelectTable" style="margin-left : ' + ((data.fcLevel - 1)*80) + 'px; width : ' + (100 - ((data.fcLevel - 1)*10.9)) + '%;" class="replyList' + data.fcLevel + ' text-left">' +
			                '<tr>' +
			                  '<td style="width:80px;"><b>&nbsp;&nbsp;' + data.fcWriter + '</b></td>' +
			                  '<td>' +  year + '-' + fmonth + '-' + day  + '</td>' +
			                  '<td align="center">' +
			                    '<div class="text-right">' +
			                      '<input type="hidden" name="fcNo" value=' + '"' + data.fcNo +'"' + '/>' + 
			                      '<button type="button" class="updateBtn btn btn-md btn-info"' + 
			                        'onclick="goUpdateComment(this);" style="border-radius: 10px;">수정하기</button>' +
			                      '<button type="button" class="updateConfirm btn btn-md btn-info"' +
			                        'onclick="goUpdateConfirm(this);"' +
			                        'style="display:none; border-radius: 10px;" >수정완료</button> &nbsp;' +
			                      '<button type="button" class="deleteBtn btn btn-md btn-info"' +
			                        'onclick="goDeleteComment(this);" style="border-radius: 10px;">삭제하기</button> &nbsp;' +
			                    '</div>' +
			                  '</td>' +
			                '</tr>' +
			                '<tr class="comment replyList">' +
			                  '<td colspan="3" style="background : transparent; text-align : center">' +
			                  '<textarea class="reply-content" cols="105" rows="2" style="border:none; width:97%; resize:none; outline: none;"' +
			                  'readonly="readonly">' + data.fcContent +
			                  '</textarea>' +
			                  '<hr>' +
			                  '</td>' +
			                '</tr>' +
		                '</table>'
				);
    		},
    		error : function() {
    			console.log("insert 실패!");
			}
    	});
	}
    
    // 댓글 삭제
    function goDeleteComment(obj) {
    	
    	$.ajax({
    		url : '${pageContext.request.contextPath}/flashComment/flashCommentDelete.fl',
    		type : 'post',
    		data : {
    			async : false,
    			fcNo : $(obj).siblings('input').val(),
    		},
    		success : function(){
    			console.log("delete 성공!");
    			$(obj).parent().parent().parent().parent().parent().remove();
    		},
    		error : function() {
    			console.log("delete 실패!");
			}
    	});
    	
    }
    
    // 댓글 수정
    function goUpdateComment(obj) {
    	$(obj).parent().parent().parent().next().find('textarea').removeAttr('readonly');
		$(obj).siblings('.updateConfirm').css('display','inline');
		$(obj).css('display', 'none');
    }
    
    // 댓글 수정 완료
    function goUpdateConfirm(obj) {
    	
    	$.ajax({
    		url : '${pageContext.request.contextPath}/flashComment/flashCommentUpdate.fl',
    		type : 'post',
    		data : {
    			fcContent : $(obj).parent().parent().parent().next().find('textarea').val(),
    			fcNo : $(obj).siblings('input').val()
    		},
    		success : function(){
    			console.log("update 성공!");
    			
    			$(obj).parent().parent().parent().next().find('textarea').prop('readonly', true);
    			$(obj).siblings('.updateBtn').css('display','inline');
    			$(obj).css('display', 'none');
    			
    		}
    		
    	});
    }
    
    // 답글 달기
    function reComment(obj) {
    	$(obj).siblings('.insertConfirm').css('display','inline');
    	$(obj).css('display', 'none');
    	
		var htmlForm = 
			/*
			'<tr class="comment">'
				+'<td colspan="3" style="background : transparent; text-align : center;">'
					+ '<textarea class="reply-content" cols="105" rows="4" style="border: 1px solid gray; border-radius: 10px; width:97%; resize:none; outline: none;" placeholder="답글을 입력해보세요!"></textarea>'
				+ '<hr>'
				+ '</td>'
			+ '</tr>';
			*/
			'<tr class="comment">' +
				'<td></td>' +
				'<td colspan="2" style="background : transparent; text-align : center;">' +
					'<div style="border: 1px solid rgba(0, 0, 0, 0.1); border-radius: 10px;">' +
	            		'<div class="text-left" style="padding-left: 15px;">' +
	            			'<div style="height : 10px"></div>' +
	            			'<a style="font-weight: 900; color: black;">' + '${member.userName}' + '</a>' +
	          			'</div>' +
	          			'<div class="comment_form mx-auto" style="text-align: center;">' +
	            			'<textArea class="reply-content" rows="1" cols="80" style="border:none; width:97%; resize:none; outline: 0;" placeholder="답글을 입력해보세요!"></textArea>' +
	          			'</div>' +
	          			'<div class="text-right">' +
	            			'<button type="button" class="insertConfirm btn btn-md btn-info" id="addReply" style="border-radius: 10px;"' + 
	            			'onclick="reConfirm(this);">답글완료</button>&nbsp;&nbsp;&nbsp;' +
	          				'<div style="height : 10px"></div>' +
	          			'</div>' +
          			'</div>' +
				'<hr>' +
				'</td>' +
          	'</tr>';
          	
		$(obj).parents('table').append(htmlForm);
    }
    
    // 답글 완료
    function reConfirm(obj) {
    	
    	var reffcNo = $(obj).parents(".comment").prev().prev().children().eq(2).children().children().eq(2).val();
    	//console.log($(obj).parents(".comment").prev().prev().children().eq(2).children().children().eq(2).val());
    	var fcLevel = Number($(obj).parents(".comment").prev().prev().children().eq(2).children().children().eq(3).val()) + 1;
    	
    	var fcContent = $(obj).parent().prev().children().val();
    	// console.log($(obj).parent().prev().children().val());
    	
    	$.ajax({
    		url : '${pageContext.request.contextPath}/flashComment/flashCommentInsert.fl',
    		type : 'post',
    		data : {
    			async : false,
    			fNo : '${FlashBoard.FNo}',
    			userId : '${member.userId}',
    			fcWriter : '${member.userName}',
    			reffcNo : reffcNo,
    			fcLevel : fcLevel,
    			fcContent : fcContent
    		},
    		success : function(data) {
    			console.log("대댓글 성공!");
    			
    			$('#replySelectArea').children().remove();
    			
    			ReadAllComment();
			},
    		error : function() {
    			alert("실패!");
    		}
    	});
    	
    }
    
    
    
    
    </script>
    
    <script>
    // 전체 댓글 조회
    window.onload = ReadAllComment;
    
    function ReadAllComment(){
    	
    	$.ajax({
    		url : '${pageContext.request.contextPath}/flashComment/flashCommentList.fl',
    		type : 'post',
    		data : {
    			async : false,
    			fNo : ${FlashBoard.FNo}
    		},
    		success : function(data) {
    			console.log(data);
    			
    			if(data == null && data.length == 0) {
    				alert("댓글 없음!");
    			} else {
    				for(var i in data) {
						console.log(new Date(data[i].fcDate));
						var fullDate = (new Date(data[i].fcDate));
						var year = fullDate.getFullYear();
						var month = fullDate.getMonth() + 1;
						var day = fullDate.getDate();
						
						var fmonth;
						
						if(month < 10) {
							fmonth = '0' + month;
						} else {
							fmonth = month;
						}
						
						if(data[i].userId=='${member.userId}') {
	    					$('#replySelectArea').append(
    				              	'<table id="replySelectTable" style="margin-left : ' + ((data[i].fcLevel - 1)*80) + 'px; width : ' + (100 - ((data[i].fcLevel - 1)*10.9)) + '%;" class="replyList' + data[i].fcLevel + ' text-left">' +
		    			                '<tr>' +
		    			                  '<td style="width:80px;"><b>&nbsp;&nbsp;' + data[i].fcWriter + '</b></td>' +
		    			                  '<td>' +  year + '-' + fmonth + '-' + day  + '</td>' +
		    			                  '<td align="center">' +
		    			                    '<div class="text-right">' +
		    			                      '<input type="hidden" name="fcNo" value=' + '"' + data[i].fcNo + '"' + '/>' + 
		    			                      '<button type="button" class="updateBtn btn btn-md btn-info"' + 
		    			                        'onclick="goUpdateComment(this);" style="border-radius: 10px;">수정하기</button>' +
		    			                      '<button type="button" class="updateConfirm btn btn-md btn-info"' +
		    			                        'onclick="goUpdateConfirm(this);"' +
		    			                        'style="display:none; border-radius: 10px;" >수정완료</button> &nbsp;' +
		    			                      '<button type="button" class="deleteBtn btn btn-md btn-info"' +
		    			                        'onclick="goDeleteComment(this);" style="border-radius: 10px;">삭제하기</button> &nbsp;' +
		    								  '<input type="hidden" name="userId" value=' + '"' + data[i].userId + '"' + '/>' +
		    								  '<input type="hidden" name="reffcNo" value=' + '"' + data[i].reffcNo + '"' + '/>' +
		    								  '<input type="hidden" name="fcLevel" value=' + '"' + data[i].fcLevel + '"' + '/>' +
		    			                    '</div>' +
		    			                  '</td>' +
		    			                '</tr>' +
		    			                '<tr class="comment replyList">' +
		    			                  '<td colspan="3" style="background : transparent; text-align : center">' +
		    			                  '<textarea class="reply-content" cols="105" rows="2" style="border:none; width:98%; resize:none; outline: none;"' +
		    			                  'readonly="readonly">' + data[i].fcContent +
		    			                  '</textarea>' +
		    			                  '<hr>' +
		    			                  '</td>' +
		    			                '</tr>' +
    			                   	'</table>'
	    					);
						} else {
	    					$('#replySelectArea').append(
	    							'<table id="replySelectTable" style="margin-left : ' + ((data[i].fcLevel - 1)*80) + 'px; width : ' + (100 - ((data[i].fcLevel - 1)*10.9)) + '%;" class="replyList' + data[i].fcLevel + ' text-left">' +
		    			                '<tr>' +
		    			                  '<td style="width:80px;"><b>&nbsp;&nbsp;' + data[i].fcWriter + '</b></td>' +
		    			                  '<td>' +  year + '-' + fmonth + '-' + day  + '</td>' +
		    			                  '<td align="center">' +
		    			                    '<div class="text-right">' +
		    			                      '<input type="hidden" name="fcNo" value=' + '"' + data[i].fcNo +'"' + '/>' + 
		    								  '<input type="hidden" name="userId" value=' + '"' + data[i].userId + '"' + '/>' +
		    								  '<input type="hidden" name="reffcNo" value=' + '"' + data[i].fcNo + '"' + '/>' +
		    								  '<input type="hidden" name="fcLevel" value=' + '"' + data[i].fcLevel + '"' + '/>' + '&nbsp;&nbsp;' +

		    								  '<button type="button" class="insertBtn btn btn-md btn-info" onclick="reComment(this);" style="border-radius: 10px;">답글달기</button>&nbsp;&nbsp;' +
		    								  //'<button type="button" class="insertConfirm btn btn-md btn-info" onclick="reConfirm(this);" style="display:none; border-radius: 10px;" >답글완료</button>&nbsp;&nbsp;' +
		    								  
		    			                    '</div>' +
		    			                  '</td>' +
		    			                '</tr>' +
		    			                '<tr class="comment replyList">' +
		    			                  '<td colspan="3" style="background : transparent; text-align : center">' +
		    			                  '<textarea class="reply-content" cols="105" rows="2" style="border:none; width:98%; resize:none; outline: none;"' +
		    			                  'readonly="readonly">' + data[i].fcContent +
		    			                  '</textarea>' +
		    			                  '<hr>' +
		    			                  '</td>' +
		    			                '</tr>' +
	    			                '</table>'
	    					);
						}
    				}
    				
    			}
			},
			error : function() {
				console.log("댓글 전체 조회 실패!");
			}
    	});
    
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
	
	var iwContent = '<div style="padding:5px; color:black; text-align:center; font-size:14px;" class="info">${FlashBoard.FMapTitle}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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
	