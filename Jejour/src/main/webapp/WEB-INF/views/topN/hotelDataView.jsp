<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

	<c:import url="../common/header.jsp">
		<c:param name="data" value="top10"/>
	</c:import>
	<head>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	</head><x></x>
    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-10">
            <div class="row">
                        <div id="top_x_div" style="width: 900px; height: 500px;"></div>
            </div>  
          </div>
          <!-- END -->
          <!---->
          <div class="col-lg-2">
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>Categories</h3>
                <li><a href="<c:url value='/topN/topN.do?category=숙박'/>">Hotels </a></li>
                <li><a href="<c:url value='/topN/topN.do?category=식당' />">Restaureant </a></li>
                <li><a href="<c:url value='/topN/topN.do?category=관광명소' />">Tour </a></li>
                <li><a href="<c:url value='/topN/topN.do?category=카페' />">Cafe</a></li>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	
	  <script type="text/javascript">
	    google.charts.load('current', {'packages':['bar']});
	    google.charts.setOnLoadCallback(drawStuff);
	
	    function drawStuff() {
	      var data = new google.visualization.arrayToDataTable([
	        ['${category}', 'Percentage'],
	        <c:forEach items="${list}" var="t"> 
	        ["${t.mapTitle}", ${t.count}/${total}*100],
	        </c:forEach>
	      ]);
	
	      var options = {
	        title: 'Chess opening moves',
	        width: 900,
	        legend: { position: 'none' },
	        chart: { title: '${category} Category',
	                 subtitle: 'popularity by percentage' },
	        bars: 'horizontal', // Required for Material Bar Charts.
	        axes: {
	          x: {
	            0: { side: 'top', label: 'Percentage'} // Top x-axis.
	          }
	        },
	        bar: { groupWidth: "90%" }
	      };
	
	      var chart = new google.charts.Bar(document.getElementById('top_x_div'));
	      chart.draw(data, options);
	    };
	  </script>
	
   	<c:import url="../common/footer.jsp"/>