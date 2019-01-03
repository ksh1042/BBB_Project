<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
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
</style>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">간트차트 리스트</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="content">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">간트차트</h3>
					<form id="frm" method="post">
						<div id="btn-custom" style="float: right;">
							<button type="button" class="btn btn-primary" onclick="hist_go();">수정 이력</button>
							<button type="submit" class="btn btn-warning" style="margin-left:20px; margin-right:20px;">수정</button>
						</div>
					</form>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<%-- <div id="example2_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6"></div>
						</div>
						<div class="row" style="overflow:scroll;overflow-y:hidden;">
							<div class="col-sm-12">
								<table id="example2"
									class="table table-bordered table-hover dataTable" role="grid"
									aria-describedby="example2_info">
									<tr role="row">
										<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column ascending">단위업무ID</th>
										<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column ascending">단위업무명</th>
										<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column ascending">담당자</th>
										<th class="sorting" tabindex="0" aria-controls="example2"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column ascending">비고</th>
										<th colspan="${ ganttSize }">차트</th>
									</tr>
									<c:if test="${ empty ganttList }">
										<tr role="row" class="odd"><td colspan="11" style="text-align:center;">표시할 내용이 없습니다</td></tr>
									</c:if>
									<c:forEach var="gantt" items="${ ganttList }" varStatus="stat">
										<tr role="row" class="${ (stat.count mod 2)==0 ? 'even':'odd' }">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</c:forEach>
									<c:forEach var="unit" items="${ unitList }">
										<tr>
											<td>${ unit.udId }</td> 
											<td>${ unit.udName }</td>
											<td>${ unit.udManager }</td>
											<td>
												
											</td>
											<c:forEach begin="1" end="${ ganttSize }">
												<td class="gantt-cell"></td>
											</c:forEach>
										</tr>
									</c:forEach>
									<tr>
										<th>단위업무ID</th>
										<th>단위업무명</th>
										<th>담당자</th>
										<th>비고</th>
										<th colspan="${ ganttSize }">차트</th>
									</tr>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-5">
								<div class="dataTables_info" id="example2_info" role="status"
									aria-live="polite">Showing <b>${ f:length() }</b> entries</div>
							</div>
						</div>
					</div> --%>
					<div class="box-body">
						<div id="chart_div"></div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
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
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'gantt' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function daysToMilliseconds(days) {
			return days * 24 * 60 * 60 * 1000;
		}

		function drawChart() {

			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Task ID');
			data.addColumn('string', 'Task Name');
			data.addColumn('date', 'Start Date');
			data.addColumn('date', 'End Date');
			data.addColumn('number', 'Duration');
			data.addColumn('number', 'Percent Complete');
			data.addColumn('string', 'Dependencies');

			data.addRows([
					[ 'Research', 'Find sources', new Date(2015, 0, 1),
							new Date(2015, 0, 5), null, 100, null ],
					[ 'Write', 'Write paper', null, new Date(2015, 0, 9),
							daysToMilliseconds(3), 25, 'Research,Outline' ],
					[ 'Cite', 'Create bibliography', null,
							new Date(2015, 0, 7), daysToMilliseconds(1), 20,
							'Research' ],
					[ 'Complete', 'Hand in paper', null, new Date(2015, 0, 10),
							daysToMilliseconds(1), 0, 'Cite,Write' ],
					[ 'Outline', 'Outline paper', null, new Date(2015, 0, 6),
							daysToMilliseconds(1), 100, 'Research' ] ]);

			var options = {
				height : 275
			};

			var chart = new google.visualization.Gantt(document
					.getElementById('chart_div'));

			chart.draw(data, options);
		}
	</script>
</body>