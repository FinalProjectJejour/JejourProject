<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<head>
<style>
.single-input {
	display: inline-block;
	width: 85%;
	line-height: 40px;
	border: none;
	outline: none;
	background: #f9f9ff;
	padding: 0 20px;
}
</style>

<!-- 섬머노트 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>

<c:import url="../common/header.jsp" />

<section class="ftco-section">
	<div class="container">
		<form action="hotspotUpdate.ho">
		
			<div class="row">
				<div class="col-md-8 ftco-animate mx-auto">
				<input type="hidden" name="hNo" value="${HotspotBoard.HNo}">
					<!-- 제목이 들어갈 부분 -->
					<h2 class="mb-3">
						<label style="width: 15%;">제목 :</label><input type="text"
							name="hTitle" placeholder="제목을 입력해주세요."
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '제목을 입력하시라닌깐요!'" required=""
							class="single-input" value="${HotspotBoard.HTitle}">
					</h2>
				</div>
				<br>
				<div class="mx-auto">
					<textarea id="pdCont" class="summernote" name="hContent">${HotspotBoard.HContent}</textarea>
				</div>
				<br>
			</div>
			<div class="row">
				<div class="mx-auto">
					<br>
					<br> <input type="submit"
						class="search-submit btn btn-primary" value="수정완료">
					&nbsp;&nbsp; <input type="button"
						class="search-submit btn btn-primary"
						onclick="fn_gohotspotlist();" value="목록으로">
				</div>
			</div>
			<!-- .col-md-8 -->
		</form>
	</div>
</section>
<!-- .section -->
<br>
<br>
<br>
<br>
<script>
	//여기 아래 부분
	var check = $('.summernote')
			.summernote(
					{
						focus : true,
						width : 800,
						height : 600 // 에디터 높이
						,
						minHeight : null // 최소 높이
						,
						maxHeight : null // 최대 높이
						//, focus : true // 에디터 로딩후 포커스를 맞출지 여부
						,
						lang : "ko-KR" // 한글 설정
						,
						placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
						,
						toolbar : [
								// [groupName, [list of button]]
								[ 'style', [ 'style' ] ],
								[
										'font',
										[ 'strikethrough', 'bold', 'underline',
												'clear' ] ],
								[ 'Font Style', [ 'fontname' ] ],
								[ 'fontsize', [ 'fontsize' ] ],
								[ 'color', [ 'color' ] ],
								[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
								[ 'table', [ 'table' ] ],
								[ 'height', [ 'height' ] ],
								[ 'insert', [ 'link', 'picture', 'video' ] ],
								[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ],
						callbacks : {
							onImageUpload : function(files, editor,
									welEditorble) {
								console.log(files);
								console.log(files[0]);
								data = new FormData();
								data.append("file", files[0]);

								$
										.ajax({
											data : data,
											type : "post",
											url : '${pageContext.request.contextPath}/hotspotBoard/summernote.ho', // servlet url
											cache : false,
											contentType : false,
											processData : false,
											success : function(fileUrl) {
												check.summernote('insertImage',
														fileUrl);
												alert("성공이미지 : " + fileUrl);
											},
											error : function(request, status,
													error) {
												alert("code:" + request.status
														+ "\n" + "message:"
														+ request.responseText
														+ "\n" + "error:"
														+ error);
												console
														.log("왜안되니 파일22"
																+ files);
											}
										});
							}
						}
					});

	$("div.note-editable")
			.on(
					'drop',
					function(e) {
						for (i = 0; i < e.originalEvent.dataTransfer.files.length; i++) {
							uploadSummernoteImageFile(
									e.originalEvent.dataTransfer.files[i],
									$("#summernote")[0]);
						}
						e.preventDefault();
					});

	function fn_gohotspotlist() {
		location.href = "${pageContext.request.contextPath}/hotspotBoard/hotspotList.ho";
	}
</script>



<c:import url="../common/footer.jsp" />