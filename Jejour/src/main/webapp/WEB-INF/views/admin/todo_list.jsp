<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<c:import url="../admincommon/adminheader.jsp" />

<!-- **********************************************************************************************************************************************************
        좌측메뉴바
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="#"><img src="../resources/images/admin.png" class="img-circle" width="80"></a></p>
          <h5 class="centered">관리자</h5>

          <li class="mt">
            <a href="${pageContext.request.contextPath}/admin/admin.do">
              <i class="fa fa-dashboard"></i>
              <span>대시보드</span>
            </a>
          </li>
          
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/admin/memberManager.do" class="active">
              <i class="fa fa-users"></i>
              <span>회원 관리</span>
            </a>
          </li>
          
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-th"></i>
              <span>게시판 관리</span>
              </a>
            <ul class="sub">
              <li><a href="${pageContext.request.contextPath}/admin/hotspotManager.do">리뷰 게시판</a></li>
              <li><a href="${pageContext.request.contextPath}/admin/flashManager.do">번개 게시판</a></li>
              
            </ul>
          </li>
          
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-desktop"></i>
              <span>UI 요소</span>
              </a>
            <ul class="sub">
              <li><a href="${pageContext.request.contextPath}/admin/general.do">General</a></li>
              <li><a href="${pageContext.request.contextPath}/admin/buttons.do">Buttons</a></li>
              <li><a href="${pageContext.request.contextPath}/admin/panels.do">Panels</a></li>
              <li><a href="${pageContext.request.contextPath}/admin/font.do">Font Awesome</a></li>
            </ul>
          </li>
          
 
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->

<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<!-- page start-->
			<div class="content-panel ">
				<div class="adv-table">
					<table cellpadding="0" cellspacing="0" border="0"
						class="display table table-bordered" id="hidden-table-info">
						<h4>
							<i class="fa fa-angle-right"></i> 회원 관리
						</h4>
						<hr>
						<thead>
							<tr>
								<th><i class="fa fa-user"></i> ID</th>
								<th class="hidden-phone"><i class="fa fa-smile-o">NAME</i></th>
								<th><i class="fa fa-phone"></i>PHONE</th>
								<th><i class=" fa fa-envelope"></i> EMAIL</th>
								<th><i class=" fa fa-envelope"></i> ADDRESS</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach items="${list}" var="member">
							<tr>
								<td>${member.userId}</td>
								<td class="hidden-phone">${member.userName}</td>
								<td>${member.phone}</td>
								<td><span class="label label-info label-mini">${member.email}</span>
								</td>
								<td>${member.address}</td>
								<td>
									<button type="button" class="btn btn-danger btn-xs" onclick="deletebtn('${member.userId}');">
										<i class="fa fa-trash-o "></i>
									</button>
								</td>
							</tr>
						</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
			<!-- page end-->
		</div>

		<script>
		
			function deletebtn(userId) {
				
				
				if (confirm("정말 강퇴하시겠습니까??") == true) { //확인
					
					location.href = '${pageContext.request.contextPath}/admin/banMember.do?userId='+userId;
					
				} else { //취소
					return;
				}
			}
			
			 
		</script>
		<!-- /row -->
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->

<script type="text/javascript">
	/* Formating function for row details */
	/*
	function fnFormatDetails(oTable, nTr) {
	  var aData = oTable.fnGetData(nTr);
	  var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
	  sOut += '<tr><td>Rendering engine:</td><td>' + aData[1] + ' ' + aData[4] + '</td></tr>';
	  sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
	  sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
	  sOut += '</table>';

	  return sOut;
	}
	 */

	$(document)
			.ready(
					function() {

						//Insert a 'details' column to the table

						var nCloneTh = document.createElement('th');
						var nCloneTd = document.createElement('td');
						nCloneTd.innerHTML = '<img src="lib/advanced-datatable/images/details_open.png">';
						nCloneTd.className = "center";

						/*
						 * Initialse DataTables, with no sorting on the 'details' column
						 */
						var oTable = $('#hidden-table-info').dataTable({
							"aoColumnDefs" : [ {
								"bSortable" : false,
								"aTargets" : [ 0 ]
							} ],
							"aaSorting" : [ [ 1, 'asc' ] ]
						});

						/* Add event listener for opening and closing details
						 * Note that the indicator for showing which row is open is not controlled by DataTables,
						 * rather it is done here
						 */
						/*
						$('#hidden-table-info tbody td img').live('click', function() {
						 var nTr = $(this).parents('tr')[0];
						 if (oTable.fnIsOpen(nTr)) {
						   // This row is already open - close it 
						   this.src = "lib/advanced-datatable/media/images/details_open.png";
						   oTable.fnClose(nTr);
						 } else {
						   // Open this row 
						   this.src = "lib/advanced-datatable/images/details_close.png";
						   oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr), 'details');
						 }
						});
						 */
					});
</script>
<!--footer 시작-->
<footer class="site-footer">
	<div class="text-center">
		<p>
			&copy; Copyrights <strong>JEJOUR</strong>. All Rights Reserved
		</p>
		<div class="credits">
			Created with BrotherTravelingStudio template by <a
				href="https://templatemag.com/">TemplateMag</a>
		</div>
		<a href="todo_list.html#" class="go-top"> <i
			class="fa fa-angle-up"></i>
		</a>
	</div>
</footer>
<!--footer end-->
</section>

<c:import url="../admincommon/adminfooter.jsp" />
