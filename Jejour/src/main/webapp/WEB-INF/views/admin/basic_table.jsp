<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<c:import url="../admincommon/adminheader.jsp"/>

<!-- **********************************************************************************************************************************************************
        좌측메뉴바
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">관리자</h5>

          <li class="mt">
            <a href="${pageContext.request.contextPath}/admin/admin.do">
              <i class="fa fa-dashboard"></i>
              <span>대시보드</span>
            </a>
          </li>
          
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/admin/memberManager.do">
              <i class="fa fa-users"></i>
              <span>회원 관리</span>
            </a>
          </li>
          
          <li class="sub-menu">
            <a class="active" href="javascript:;">
              <i class="fa fa-th"></i>
              <span>게시판 관리</span>
              </a>
            <ul class="sub">
              <li class="active"><a href="${pageContext.request.contextPath}/admin/hotspotManager.do">리뷰 게시판</a></li>
              <li><a href="${pageContext.request.contextPath}/admin/flashManager.do">번개 게시판</a></li>
              <li><a href="${pageContext.request.contextPath}/admin/etc.do">보류</a></li>
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
        <h3><i class="fa fa-angle-right"></i> 리뷰 게시판 관리</h3>
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
              
              <h4><i class="fa fa-angle-right"></i> 게시글 랭킹</h4>
              <hr>
              <table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>게시글 수</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>24</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>15</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>11</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- /col-md-12 -->
          <div class="col-md-12 mt">
            <div class="content-panel">
              <table class="table table-hover">
                <h4><i class="fa fa-angle-right"></i> 댓글 랭킹</h4>
                <hr>
                <thead>
                  <tr>
                    <th>#</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>댓글 수</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>43</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>31</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>Simon</td>
                    <td>Mosa</td>
                    <td>25</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- /col-md-12 -->
        </div>
        <!-- row -->
        <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
            <div class="adv-table">  
              <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
                <h4><i class="fa fa-angle-right"></i> 리뷰 게시판</h4>
                <hr>
                <thead>
                  <tr>
                    <th><i class="fa fa-bullhorn"></i> 제 목</th>
                    <th class="hidden-phone"><i class="fa fa-user"></i> 작성자</th>
                    <th><i class="fa fa-bookmark"></i> 조회수</th>
                    <th><i class=" fa fa-edit"></i> Status</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <a href="basic_table.html#">Company Ltd</a>
                    </td>
                    <td class="hidden-phone">Lorem Ipsum dolor</td>
                    <td>12000.00$ </td>
                    <td><span class="label label-info label-mini">Due</span></td>
                    <td>
                      <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                      <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                      <button class="btn btn-danger btn-xs" type="button" onclick="deletebtn();"><i class="fa fa-trash-o "></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <a href="basic_table.html#">
                        Dashio co
                        </a>
                    </td>
                    <td class="hidden-phone">Lorem Ipsum dolor</td>
                    <td>17900.00$ </td>
                    <td><span class="label label-warning label-mini">Due</span></td>
                    <td>
                      <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                      <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                      <button class="btn btn-danger btn-xs" type="button" onclick="deletebtn();"><i class="fa fa-trash-o "></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <a href="basic_table.html#">
                        Another Co
                        </a>
                    </td>
                    <td class="hidden-phone">Lorem Ipsum dolor</td>
                    <td>14400.00$ </td>
                    <td><span class="label label-success label-mini">Paid</span></td>
                    <td>
                      <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                      <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                      <button class="btn btn-danger btn-xs" type="button" onclick="deletebtn();"><i class="fa fa-trash-o "></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <a href="basic_table.html#">Dashio ext</a>
                    </td>
                    <td class="hidden-phone">Lorem Ipsum dolor</td>
                    <td>22000.50$ </td>
                    <td><span class="label label-success label-mini">Paid</span></td>
                    <td>
                      <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                      <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                      <button class="btn btn-danger btn-xs" type="button" onclick="deletebtn();"><i class="fa fa-trash-o "></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <a href="basic_table.html#">Total Ltd</a>
                    </td>
                    <td class="hidden-phone">Lorem Ipsum dolor</td>
                    <td>12120.00$ </td>
                    <td><span class="label label-warning label-mini">Due</span></td>
                    <td>
                      <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                      <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                      <button class="btn btn-danger btn-xs" type="button" onclick="deletebtn();"><i class="fa fa-trash-o "></i></button>
                    </td>
                  </tr>
                </tbody>
              </table>
              </div>
            </div>
            <!-- /content-panel -->
          </div>
          <!-- /col-md-12 -->
        </div>
        <!-- /row -->

        <!--스크립트-->
        <script>
          function deletebtn(){
            if (confirm("정말 삭제하시겠습니까??") == true){    //확인
              document.form.submit();
            }else{   //취소
            return;
            }
          }
        </script>

      </section>
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
   
    $(document).ready(function() {
      
        //Insert a 'details' column to the table
       
      var nCloneTh = document.createElement('th');
      var nCloneTd = document.createElement('td');
      nCloneTd.innerHTML = '<img src="lib/advanced-datatable/images/details_open.png">';
      nCloneTd.className = "center";

     

      /*
       * Initialse DataTables, with no sorting on the 'details' column
       */
      
      var oTable = $('#hidden-table-info').dataTable({
        "aoColumnDefs": [{
          "bSortable": false,
          "aTargets": [0]
        }],
        "aaSorting": [
          [1, 'asc']
        ]
      });
      
      /* Add event listener for opening and closing details
       * Note that the indicator for showing which row is open is not controlled by DataTables,
       * rather it is done here
       */
      /*
      $('#hidden-table-info tbody td img').live('click', function() {
        var nTr = $(this).parents('tr')[0];
        if (oTable.fnIsOpen(nTr)) {
           //This row is already open - close it 
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
			Created with BrotherTravelingStudio template by <a href="https://templatemag.com/">TemplateMag</a>
		</div>
		<a href="basic_table.html#" class="go-top"> <i
			class="fa fa-angle-up"></i>
		</a>
	</div>
</footer>
<!--footer end-->
</section>

<c:import url="../admincommon/adminfooter.jsp"/>
