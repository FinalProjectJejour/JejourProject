<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../admincommon/adminheader.jsp" />

<!-- **********************************************************************************************************************************************************
        좌측메뉴바
        *********************************************************************************************************************************************************** -->
<!--sidebar start-->
<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">
			<p class="centered">
				<a href="#"><img src="../resources/images/admin.png"
					class="img-circle" width="80"></a>
			</p>
			<h5 class="centered">관리자</h5>

			<li class="mt"><a
				href="${pageContext.request.contextPath}/admin/admin.do"
				class="active"> <i class="fa fa-dashboard"></i> <span>대시보드</span>
			</a></li>

			<li class="sub-menu"><a
				href="${pageContext.request.contextPath}/admin/memberManager.do">
					<i class="fa fa-users"></i> <span>회원 관리</span>
			</a></li>

			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-th"></i> <span>게시판 관리</span>
			</a>
				<ul class="sub">
					<li><a
						href="${pageContext.request.contextPath}/admin/hotspotManager.do">리뷰
							게시판</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/flashManager.do">번개
							게시판</a></li>
					
				</ul></li>

			<li class="sub-menu"><a href="javascript:;"> <i
					class="fa fa-desktop"></i> <span>UI 요소</span>
			</a>
				<ul class="sub">
					<li><a
						href="${pageContext.request.contextPath}/admin/general.do">General</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/buttons.do">Buttons</a></li>
					<li><a
						href="${pageContext.request.contextPath}/admin/panels.do">Panels</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/font.do">Font
							Awesome</a></li>
				</ul></li>


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
		<div class="row">
			<div class="col-lg-9 main-chart">
				<!--CUSTOM CHART START -->
				<div class="border-head">
					<h3>월별 이용자수</h3>
				</div>
				<div class="custom-bar-chart">
					<ul class="y-axis">
						<li><span>300</span></li>
						<li><span>240</span></li>
						<li><span>180</span></li>
						<li><span>120</span></li>
						<li><span>60</span></li>
						<li><span>0</span></li>
					</ul>
					<c:forEach items="${bbbbbmonth}" var="month">
						<div class="bar " style="margin: 0px 5%;">
							<div class="title">${month.month}</div>
							<div class="value tooltips"
								data-original-title="${month.monthVisit }" data-toggle="tooltip"
								data-placement="top">${month.monthVisit }</div>
						</div>
					</c:forEach>

					<c:forEach items="${bbbbmonth}" var="month">
						<div class="bar " style="margin: 0px 5%;">
							<div class="title">${month.month}</div>
							<div class="value tooltips"
								data-original-title="${month.monthVisit }" data-toggle="tooltip"
								data-placement="top">${month.monthVisit }</div>
						</div>
					</c:forEach>

					<c:forEach items="${bbbmonth}" var="month">
						<div class="bar " style="margin: 0px 5%;">
							<div class="title">${month.month}</div>
							<div class="value tooltips"
								data-original-title="${month.monthVisit }" data-toggle="tooltip"
								data-placement="top">${month.monthVisit }</div>
						</div>
					</c:forEach>

					<c:forEach items="${bbmonth}" var="month">
						<div class="bar " style="margin: 0px 5%;">
							<div class="title">${month.month}</div>
							<div class="value tooltips"
								data-original-title="${month.monthVisit }" data-toggle="tooltip"
								data-placement="top">${month.monthVisit }</div>
						</div>
					</c:forEach>

					<c:forEach items="${bmonth}" var="month">
						<div class="bar " style="margin: 0px 5%;">
							<div class="title">${month.month}</div>
							<div class="value tooltips"
								data-original-title="${month.monthVisit }" data-toggle="tooltip"
								data-placement="top">${month.monthVisit }</div>
						</div>
					</c:forEach>

					<c:forEach items="${month}" var="month">
						<div class="bar " style="margin: 0px 5%;">
							<div class="title">${month.month}</div>
							<div class="value tooltips"
								data-original-title="${month.monthVisit }" data-toggle="tooltip"
								data-placement="top">${month.monthVisit }</div>
						</div>
					</c:forEach>
				</div>
				<!--custom chart end-->




				<!-- /row -->
				<!-- 방문자 위젯 -->


				<div class="row">
					<c:forEach items="${total}" var="total">
						<div class="col-lg-4 col-md-4 col-sm-4 mb">
							<div class="darkblue-panel pn">

								<div class="darkblue-header">
									<h5>방문자 수</h5>
								</div>
								<h1 class="mt">
									<i class="fa fa-user fa-3x"></i>
								</h1>
								<p>오늘 +${total.todayVisit }</p>
								<footer>
									<div class="centered">
										<h5>
											<i class="fa fa-trophy"></i> TOTAL : ${total.totalVisit }
										</h5>
									</div>
								</footer>
							</div>
						</div>
					</c:forEach>
					<!-- /col-md-4 -->
					<!--  PROFILE 02 PANEL -->
					<c:forEach items="${mcount}" var="mcount">
						<div class="col-lg-4 col-md-4 col-sm-4 mb">
							<div class="darkblue-panel pn"
								style="background-color: darkslategrey;">

								<div class="darkblue-header">
									<h5>총회원 수</h5>
								</div>
								<h1 class="mt">
									<i class="fa fa-group fa-3x"></i>
								</h1>

								<footer>
									<div class="centered">
										<h5 style="font-size: 17px">
											<i class="fa fa-hand-o-right"
												style="font-size: 16px; margin-top: 13px;"></i>
											${mcount.MCount} 명
										</h5>
									</div>
								</footer>
							</div>
						</div>
					</c:forEach>
					<!--/ col-md-4 -->
					<div class="col-lg-4 col-md-4 col-sm-4 mb">
						<table class="type09">
							<thead>
								<tr>
									<th scope="cols">카테고리</th>
									<th scope="cols">컨텐츠 수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">Plan</th>
									<td><c:forEach items="${pcount}" var="pcount">${pcount.PCount }</c:forEach></td>
								</tr>
								<tr>
									<th scope="row">Hotspot</th>
									<td><c:forEach items="${hcount}" var="hcount">${hcount.HCount }</c:forEach></td>
								</tr>
								<tr>
									<th scope="row">Meet</th>
									<td><c:forEach items="${fcount}" var="fcount">${fcount.FCount }</c:forEach></td>
								</tr>
							</tbody>
						</table>

					</div>
					<!-- /col-md-4 -->
				</div>
				<!-- /row -->
			</div>
			<!-- /col-lg-9 END SECTION MIDDLE -->
			<!-- **********************************************************************************************************************************************************
              RIGHT SIDEBAR CONTENT
              *********************************************************************************************************************************************************** -->
			<div class="col-lg-3 ds">
				<!-- CALENDAR-->
				<div id="calendar" class="mb">
					<div class="panel green-panel no-margin">
						<div class="panel-body">
							<div id="date-popover" class="popover top"
								style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
								<div class="arrow"></div>
								<h3 class="popover-title" style="disadding: none;"></h3>
								<div id="date-popover-content" class="popover-content"></div>
							</div>
							<div id="my-calendar"></div>
						</div>
					</div>
				</div>
				<!-- / calendar -->
			</div>
			<!-- /col-lg-3 -->
		</div>
		<!-- /row -->
	</section>
</section>
<!--main content end-->
<style>
table.type09 {
    border-collapse: collapse;
    text-align: center;
    line-height: 2.8;

}
table.type09 thead th {
text-align: center;
    padding: 2px;
    font-weight: bold;
    vertical-align: center;
    color: #35404D;
    border-bottom: 3px solid gray;
}
table.type09 tbody th {
text-align: center;
    width: 250px;
    padding: 2px;
    font-size:20px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 250px;
    padding: 2px;
    font-size:21px;
    font-weight: bold;
    vertical-align: center;
    border-bottom: 1px solid #ccc;
}
</style>
<script type="application/javascript">
	
	
	
		
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.php?action=1",
          modal: true
        },
        legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
          },
          {
            type: "block",
            label: "Regular event",
          }
        ]
      });
    });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
	


</script>

<script type="application/javascript">
	
	
	
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.php?action=1",
          modal: true
        },
        legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
          },
          {
            type: "block",
            label: "Regular event",
          }
        ]
      });
    });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }



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
		<a href="adminindex.html#" class="go-top"> <i
			class="fa fa-angle-up"></i>
		</a>
	</div>
</footer>
<!--footer end-->
</section>

<script
	src="${pageContext.request.contextPath}/resources/lib/zabuto_calendar.js"></script>

<c:import url="../admincommon/adminfooter.jsp" />