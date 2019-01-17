<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<style>
th {
	text-align: center;
}

tr.even td {
	background-color: : #FAFAFA;
}

td.gantt-cell {
	width: 20px;
	background-color: #AA8888;
}
#chart_div>div>div>svg>g text:hover  {
	cursor: pointer;
}
</style>
</head>
<body>

<section class="content-header">
		<h1>간트차트</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath() %>/project/main?pjNum=${logonProject.pjNum}">
				<i class="fa fa-dashboard">&nbsp;&nbsp;&nbsp;${logonProject.name }</i></a></li>
			<li class="active">간트차트</li>
		</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<form id="frm" method="post">
						<div id="btn-custom" style="float: right;">
							<button type="button" class="btn btn-primary"
								onclick="hist_go();">수정 이력</button>
							<c:if test="${ logonProject.creator eq loginUser.id }">
								<button type="submit" class="btn btn-warning"
									style="margin-left: 20px; margin-right: 20px;">수정</button>
							</c:if>
						</div>
					</form>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="chart_div"></div>
					<div class="row">
						<div class="col-sm-5">
							<div class="dataTables_info" id="example2_info" role="status" aria-live="polite">
								Showing <b>${ fn:length(ganttList) }</b> entries
							</div>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
	</div>
</section>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		$('a.postboxLink').on('click', function(e) {
			e.preventDefault();
			var url = "<%=request.getContextPath()%>/postbox/list?id="+$(this).attr('href');
			window.open(url,"_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=900, height=800, top=300, left=300, ");
		});
		function hist_go() {
			location.href = '<%=request.getContextPath()%>/project/gantt/history';
		}
	</script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'gantt' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			
			var data = new google.visualization.DataTable();
			
			data.addColumn('string', 'Task ID');
		    data.addColumn('string', 'Task Name');
		    data.addColumn('string', 'Resource');
		    data.addColumn('date', 'Start Date');
		    data.addColumn('date', 'End Date');
		    data.addColumn('number', 'Duration');
		    data.addColumn('number', 'Percent Complete');
		    data.addColumn('string', 'Dependencies');
		   
			
			data.addRows([
				<c:forEach var="gantt" items="${ganttList}">
				[
					'${gantt.udId}', 
					'${gantt.udName}', 
					'${gantt.rdName}',
					new Date(<fmt:formatDate value="${gantt.startDate}" pattern="yyyy,MM,dd"/>), 
					new Date(<fmt:formatDate value="${gantt.endDate}" pattern="yyyy,MM,dd"/>), 
					0, 
					${gantt.percentage}, 
					null
					
				],
				</c:forEach>
			]);
			var parentDiv = $('#chart_div').parent();
			var options = {
				height : 40*${ fn:length( ganttList ) } + 50,
				width : parentDiv.width(),
				gantt : {
					trackHeight : 40
				}
			};

			var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

			chart.draw(data, options);
		}
	</script>
</body>