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
							<button type="button" class="btn btn-primary"
								onclick="hist_go();">수정 이력</button>
							<button type="submit" class="btn btn-warning"
								style="margin-left: 20px; margin-right: 20px;">수정</button>
						</div>
					</form>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="chart_div"></div>
					<div class="row">
						<div class="col-sm-5">
							<div class="dataTables_info" id="example2_info" role="status"
								aria-live="polite">
								Showing <b>${ fn:length(ganttList) }</b> entries
							</div>
						</div>
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

		function drawChart() {
			/* var ganttList = new Array();
			var temp;
			<c:forEach var="gantt" items="${ ganttList }">
			temp = {		
				gcNum : ${ gantt.gcNum },
				uddNum : ${ gantt.uddNum },
				udId : '${ gantt.udId }',
				udName : '${ gantt.udName }',
				startDate : Date(),
				endDate : Date(<fmt:formatDate value="${gantt.endDate}" pattern="yyyy,MM,dd"/>),
				percentage : ${ gantt.percentage }
			};
			ganttList.push(temp);
			</c:forEach> */
			
			var data = new google.visualization.DataTable();
			
			data.addColumn('string', 'Task ID');
		    data.addColumn('string', 'Task Name');
		    data.addColumn('string', 'Resource');
		    data.addColumn('date', 'Start Date');
		    data.addColumn('date', 'End Date');
		    data.addColumn('number', 'Duration');
		    data.addColumn('number', 'Percent Complete');
		    data.addColumn('string', 'Dependencies');
		    
			/* 
			data.addColumn('number', 'Task ID');
			data.addColumn('number', 'Task Name');
			data.addColumn('string', 'Resource');
			data.addColumn('number', 'Duration');
			data.addColumn('number', 'Percent Complete');
			data.addColumn('string', 'Dependencies');
			 */
			 
			
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
			//awlefwaoifnawefbwelafubwaeilfbwaelfbawfjawebfliawebf
			 //data.addRow( [ganttList[0].udId, ganttList[0].udName, ganttList[0].startDate, ganttList[0].endDate] );
			/* data.addRows([
					[ '2014Spring', 'Spring 2014', 'spring',
							new Date(2014, 2, 22), new Date(2014, 5, 20), null,
							100, null ],
					[ '2014Summer', 'Summer 2014', 'summer',
							new Date(2014, 5, 21), new Date(2014, 8, 20), null,
							100, null ],
					[ '2014Autumn', 'Autumn 2014', 'autumn',
							new Date(2014, 8, 21), new Date(2014, 11, 20),
							null, 100, null ],
					[ '2014Winter', 'Winter 2014', 'winter',
							new Date(2014, 11, 21), new Date(2015, 2, 21),
							null, 100, null ],
					[ '2015Spring', 'Spring 2015', 'spring',
							new Date(2015, 2, 22), new Date(2015, 5, 20), null,
							50, null ],
					[ '2015Summer', 'Summer 2015', 'summer',
							new Date(2015, 5, 21), new Date(2015, 8, 20), null,
							0, null ],
					[ '2015Autumn', 'Autumn 2015', 'autumn',
							new Date(2015, 8, 21), new Date(2015, 11, 20),
							null, 0, null ],
					[ '2015Winter', 'Winter 2015', 'winter',
							new Date(2015, 11, 21), new Date(2016, 2, 21),
							null, 0, null ],
					[ 'Football', 'Football Season', 'sports',
							new Date(2014, 8, 4), new Date(2015, 1, 1), null,
							100, null ],
					[ 'Baseball', 'Baseball Season', 'sports',
							new Date(2015, 2, 31), new Date(2015, 9, 20), null,
							14, null ],
					[ 'Basketball', 'Basketball Season', 'sports',
							new Date(2014, 9, 28), new Date(2015, 5, 20), null,
							86, null ],
					[ 'Hockey', 'Hockey Season', 'sports',
							new Date(2014, 9, 8), new Date(2015, 5, 21), null,
							89, null ] ]); */

			var options = {
				height : 400,
				gantt : {
					trackHeight : 30
				}
			};

			var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

			chart.draw(data, options);
		}
	</script>
</body>