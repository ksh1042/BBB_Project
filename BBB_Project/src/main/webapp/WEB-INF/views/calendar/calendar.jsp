<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/main/dist/css/fullcalendar.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/main/dist/css/fullcalendar.print.min.css"
	media="print">
</head>
<body>
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">회원리스트</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-left">
						<li class="breadcrumb-item">
							<button class="btn btn-primary" type="button" id="registerBtn">회원등록</button>
						</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
		</div>
	</div>
	<div class="content">
		<div class="box box-primary">
			<div class="box-body no-padding">
				<!-- THE CALENDAR -->
				<div id="calendar" class="fc fc-unthemed fc-ltr">
					<div class="fc-toolbar fc-header-toolbar">
						<div class="fc-left">
							<div class="fc-button-group">
								<button type="button"
									class="fc-prev-button fc-button fc-state-default fc-corner-left"
									aria-label="prev">
									<span class="fc-icon fc-icon-left-single-arrow"></span>
								</button>
								<button type="button"
									class="fc-next-button fc-button fc-state-default fc-corner-right"
									aria-label="next">
									<span class="fc-icon fc-icon-right-single-arrow"></span>
								</button>
							</div>
							<button type="button"
								class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled"
								disabled="">today</button>
						</div>
						<div class="fc-right">
							<div class="fc-button-group">
								<button type="button"
									class="fc-month-button fc-button fc-state-default fc-corner-left fc-corner-right">month</button>
							</div>
						</div>
						<div class="fc-center">
							<h2>December 2018</h2>
						</div>
						<div class="fc-clear"></div>
					</div>
					<div class="fc-view-container" style="">
						<div class="fc-view fc-month-view fc-basic-view" style="">
							<table class="">
								<thead class="fc-head">
									<tr>
										<td class="fc-head-container fc-widget-header"><div
												class="fc-row fc-widget-header">
												<table class="">
													<thead>
														<tr>
															<th class="fc-day-header fc-widget-header fc-sun"><span>Sun</span></th>
															<th class="fc-day-header fc-widget-header fc-mon"><span>Mon</span></th>
															<th class="fc-day-header fc-widget-header fc-tue"><span>Tue</span></th>
															<th class="fc-day-header fc-widget-header fc-wed"><span>Wed</span></th>
															<th class="fc-day-header fc-widget-header fc-thu"><span>Thu</span></th>
															<th class="fc-day-header fc-widget-header fc-fri"><span>Fri</span></th>
															<th class="fc-day-header fc-widget-header fc-sat"><span>Sat</span></th>
														</tr>
													</thead>
												</table>
											</div></td>
									</tr>
								</thead>
								<tbody class="fc-body">
									<tr>
										<td class="fc-widget-content"><div
												class="fc-scroller fc-day-grid-container"
												style="overflow: hidden; height: 665px;">
												<div class="fc-day-grid fc-unselectable">
													<div class="fc-row fc-week fc-widget-content"
														style="height: 110px;">
														<div class="fc-bg">
															<table class="">
																<tbody>
																	<tr>
																		<td
																			class="fc-day fc-widget-content fc-sun fc-other-month fc-past"
																			data-date="2018-11-25"></td>
																		<td
																			class="fc-day fc-widget-content fc-mon fc-other-month fc-past"
																			data-date="2018-11-26"></td>
																		<td
																			class="fc-day fc-widget-content fc-tue fc-other-month fc-past"
																			data-date="2018-11-27"></td>
																		<td
																			class="fc-day fc-widget-content fc-wed fc-other-month fc-past"
																			data-date="2018-11-28"></td>
																		<td
																			class="fc-day fc-widget-content fc-thu fc-other-month fc-past"
																			data-date="2018-11-29"></td>
																		<td
																			class="fc-day fc-widget-content fc-fri fc-other-month fc-past"
																			data-date="2018-11-30"></td>
																		<td class="fc-day fc-widget-content fc-sat fc-past"
																			data-date="2018-12-01"></td>
																	</tr>
																</tbody>
															</table>
														</div>
														<div class="fc-content-skeleton">
															<table>
																<thead>
																	<tr>
																		<td class="fc-day-top fc-sun fc-other-month fc-past"
																			data-date="2018-11-25"><span
																			class="fc-day-number">25</span></td>
																		<td class="fc-day-top fc-mon fc-other-month fc-past"
																			data-date="2018-11-26"><span
																			class="fc-day-number">26</span></td>
																		<td class="fc-day-top fc-tue fc-other-month fc-past"
																			data-date="2018-11-27"><span
																			class="fc-day-number">27</span></td>
																		<td class="fc-day-top fc-wed fc-other-month fc-past"
																			data-date="2018-11-28"><span
																			class="fc-day-number">28</span></td>
																		<td class="fc-day-top fc-thu fc-other-month fc-past"
																			data-date="2018-11-29"><span
																			class="fc-day-number">29</span></td>
																		<td class="fc-day-top fc-fri fc-other-month fc-past"
																			data-date="2018-11-30"><span
																			class="fc-day-number">30</span></td>
																		<td class="fc-day-top fc-sat fc-past"
																			data-date="2018-12-01"><span
																			class="fc-day-number">1</span></td>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td class="fc-event-container"><a
																			class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable"
																			style="background-color: #f56954; border-color: #f56954"><div
																					class="fc-content">
																					<span class="fc-time">12a</span> <span
																						class="fc-title">All Day Event</span>
																				</div></a></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="fc-row fc-week fc-widget-content"
														style="height: 110px;">
														<div class="fc-bg">
															<table class="">
																<tbody>
																	<tr>
																		<td class="fc-day fc-widget-content fc-sun fc-past"
																			data-date="2018-12-02"></td>
																		<td class="fc-day fc-widget-content fc-mon fc-past"
																			data-date="2018-12-03"></td>
																		<td class="fc-day fc-widget-content fc-tue fc-past"
																			data-date="2018-12-04"></td>
																		<td class="fc-day fc-widget-content fc-wed fc-past"
																			data-date="2018-12-05"></td>
																		<td class="fc-day fc-widget-content fc-thu fc-past"
																			data-date="2018-12-06"></td>
																		<td class="fc-day fc-widget-content fc-fri fc-past"
																			data-date="2018-12-07"></td>
																		<td class="fc-day fc-widget-content fc-sat fc-past"
																			data-date="2018-12-08"></td>
																	</tr>
																</tbody>
															</table>
														</div>
														<div class="fc-content-skeleton">
															<table>
																<thead>
																	<tr>
																		<td class="fc-day-top fc-sun fc-past"
																			data-date="2018-12-02"><span
																			class="fc-day-number">2</span></td>
																		<td class="fc-day-top fc-mon fc-past"
																			data-date="2018-12-03"><span
																			class="fc-day-number">3</span></td>
																		<td class="fc-day-top fc-tue fc-past"
																			data-date="2018-12-04"><span
																			class="fc-day-number">4</span></td>
																		<td class="fc-day-top fc-wed fc-past"
																			data-date="2018-12-05"><span
																			class="fc-day-number">5</span></td>
																		<td class="fc-day-top fc-thu fc-past"
																			data-date="2018-12-06"><span
																			class="fc-day-number">6</span></td>
																		<td class="fc-day-top fc-fri fc-past"
																			data-date="2018-12-07"><span
																			class="fc-day-number">7</span></td>
																		<td class="fc-day-top fc-sat fc-past"
																			data-date="2018-12-08"><span
																			class="fc-day-number">8</span></td>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td class="fc-event-container"><a
																			class="fc-day-grid-event fc-h-event fc-event fc-start fc-not-end fc-draggable"
																			style="background-color: #f39c12; border-color: #f39c12"><div
																					class="fc-content">
																					<span class="fc-time">12a</span> <span
																						class="fc-title">Long Event</span>
																				</div></a></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="fc-row fc-week fc-widget-content"
														style="height: 110px;">
														<div class="fc-bg">
															<table class="">
																<tbody>
																	<tr>
																		<td class="fc-day fc-widget-content fc-sun fc-past"
																			data-date="2018-12-09"></td>
																		<td class="fc-day fc-widget-content fc-mon fc-past"
																			data-date="2018-12-10"></td>
																		<td class="fc-day fc-widget-content fc-tue fc-past"
																			data-date="2018-12-11"></td>
																		<td class="fc-day fc-widget-content fc-wed fc-past"
																			data-date="2018-12-12"></td>
																		<td class="fc-day fc-widget-content fc-thu fc-today "
																			data-date="2018-12-13"></td>
																		<td class="fc-day fc-widget-content fc-fri fc-future"
																			data-date="2018-12-14"></td>
																		<td class="fc-day fc-widget-content fc-sat fc-future"
																			data-date="2018-12-15"></td>
																	</tr>
																</tbody>
															</table>
														</div>
														<div class="fc-content-skeleton">
															<table>
																<thead>
																	<tr>
																		<td class="fc-day-top fc-sun fc-past"
																			data-date="2018-12-09"><span
																			class="fc-day-number">9</span></td>
																		<td class="fc-day-top fc-mon fc-past"
																			data-date="2018-12-10"><span
																			class="fc-day-number">10</span></td>
																		<td class="fc-day-top fc-tue fc-past"
																			data-date="2018-12-11"><span
																			class="fc-day-number">11</span></td>
																		<td class="fc-day-top fc-wed fc-past"
																			data-date="2018-12-12"><span
																			class="fc-day-number">12</span></td>
																		<td class="fc-day-top fc-thu fc-today "
																			data-date="2018-12-13"><span
																			class="fc-day-number">13</span></td>
																		<td class="fc-day-top fc-fri fc-future"
																			data-date="2018-12-14"><span
																			class="fc-day-number">14</span></td>
																		<td class="fc-day-top fc-sat fc-future"
																			data-date="2018-12-15"><span
																			class="fc-day-number">15</span></td>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td class="fc-event-container" colspan="2"><a
																			class="fc-day-grid-event fc-h-event fc-event fc-not-start fc-end fc-draggable"
																			style="background-color: #f39c12; border-color: #f39c12"><div
																					class="fc-content">
																					<span class="fc-title">Long Event</span>
																				</div></a></td>
																		<td rowspan="2"></td>
																		<td rowspan="2"></td>
																		<td class="fc-event-container"><a
																			class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable"
																			style="background-color: #0073b7; border-color: #0073b7"><div
																					class="fc-content">
																					<span class="fc-time">10:30a</span> <span
																						class="fc-title">Meeting</span>
																				</div></a></td>
																		<td class="fc-event-container" rowspan="2"><a
																			class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable"
																			style="background-color: #00a65a; border-color: #00a65a"><div
																					class="fc-content">
																					<span class="fc-time">7p</span> <span
																						class="fc-title">Birthday Party</span>
																				</div></a></td>
																		<td rowspan="2"></td>
																	</tr>
																	<tr>
																		<td></td>
																		<td></td>
																		<td class="fc-event-container"><a
																			class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable"
																			style="background-color: #00c0ef; border-color: #00c0ef"><div
																					class="fc-content">
																					<span class="fc-time">12p</span> <span
																						class="fc-title">Lunch</span>
																				</div></a></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="fc-row fc-week fc-widget-content"
														style="height: 110px;">
														<div class="fc-bg">
															<table class="">
																<tbody>
																	<tr>
																		<td class="fc-day fc-widget-content fc-sun fc-future"
																			data-date="2018-12-16"></td>
																		<td class="fc-day fc-widget-content fc-mon fc-future"
																			data-date="2018-12-17"></td>
																		<td class="fc-day fc-widget-content fc-tue fc-future"
																			data-date="2018-12-18"></td>
																		<td class="fc-day fc-widget-content fc-wed fc-future"
																			data-date="2018-12-19"></td>
																		<td class="fc-day fc-widget-content fc-thu fc-future"
																			data-date="2018-12-20"></td>
																		<td class="fc-day fc-widget-content fc-fri fc-future"
																			data-date="2018-12-21"></td>
																		<td class="fc-day fc-widget-content fc-sat fc-future"
																			data-date="2018-12-22"></td>
																	</tr>
																</tbody>
															</table>
														</div>
														<div class="fc-content-skeleton">
															<table>
																<thead>
																	<tr>
																		<td class="fc-day-top fc-sun fc-future"
																			data-date="2018-12-16"><span
																			class="fc-day-number">16</span></td>
																		<td class="fc-day-top fc-mon fc-future"
																			data-date="2018-12-17"><span
																			class="fc-day-number">17</span></td>
																		<td class="fc-day-top fc-tue fc-future"
																			data-date="2018-12-18"><span
																			class="fc-day-number">18</span></td>
																		<td class="fc-day-top fc-wed fc-future"
																			data-date="2018-12-19"><span
																			class="fc-day-number">19</span></td>
																		<td class="fc-day-top fc-thu fc-future"
																			data-date="2018-12-20"><span
																			class="fc-day-number">20</span></td>
																		<td class="fc-day-top fc-fri fc-future"
																			data-date="2018-12-21"><span
																			class="fc-day-number">21</span></td>
																		<td class="fc-day-top fc-sat fc-future"
																			data-date="2018-12-22"><span
																			class="fc-day-number">22</span></td>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="fc-row fc-week fc-widget-content"
														style="height: 110px;">
														<div class="fc-bg">
															<table class="">
																<tbody>
																	<tr>
																		<td class="fc-day fc-widget-content fc-sun fc-future"
																			data-date="2018-12-23"></td>
																		<td class="fc-day fc-widget-content fc-mon fc-future"
																			data-date="2018-12-24"></td>
																		<td class="fc-day fc-widget-content fc-tue fc-future"
																			data-date="2018-12-25"></td>
																		<td class="fc-day fc-widget-content fc-wed fc-future"
																			data-date="2018-12-26"></td>
																		<td class="fc-day fc-widget-content fc-thu fc-future"
																			data-date="2018-12-27"></td>
																		<td class="fc-day fc-widget-content fc-fri fc-future"
																			data-date="2018-12-28"></td>
																		<td class="fc-day fc-widget-content fc-sat fc-future"
																			data-date="2018-12-29"></td>
																	</tr>
																</tbody>
															</table>
														</div>
														<div class="fc-content-skeleton">
															<table>
																<thead>
																	<tr>
																		<td class="fc-day-top fc-sun fc-future"
																			data-date="2018-12-23"><span
																			class="fc-day-number">23</span></td>
																		<td class="fc-day-top fc-mon fc-future"
																			data-date="2018-12-24"><span
																			class="fc-day-number">24</span></td>
																		<td class="fc-day-top fc-tue fc-future"
																			data-date="2018-12-25"><span
																			class="fc-day-number">25</span></td>
																		<td class="fc-day-top fc-wed fc-future"
																			data-date="2018-12-26"><span
																			class="fc-day-number">26</span></td>
																		<td class="fc-day-top fc-thu fc-future"
																			data-date="2018-12-27"><span
																			class="fc-day-number">27</span></td>
																		<td class="fc-day-top fc-fri fc-future"
																			data-date="2018-12-28"><span
																			class="fc-day-number">28</span></td>
																		<td class="fc-day-top fc-sat fc-future"
																			data-date="2018-12-29"><span
																			class="fc-day-number">29</span></td>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td class="fc-event-container"><a
																			class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable"
																			href="http://google.com/"
																			style="background-color: #3c8dbc; border-color: #3c8dbc"><div
																					class="fc-content">
																					<span class="fc-time">12a</span> <span
																						class="fc-title">Click for Google</span>
																				</div></a></td>
																		<td></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div class="fc-row fc-week fc-widget-content"
														style="height: 115px;">
														<div class="fc-bg">
															<table class="">
																<tbody>
																	<tr>
																		<td class="fc-day fc-widget-content fc-sun fc-future"
																			data-date="2018-12-30"></td>
																		<td class="fc-day fc-widget-content fc-mon fc-future"
																			data-date="2018-12-31"></td>
																		<td
																			class="fc-day fc-widget-content fc-tue fc-other-month fc-future"
																			data-date="2019-01-01"></td>
																		<td
																			class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
																			data-date="2019-01-02"></td>
																		<td
																			class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																			data-date="2019-01-03"></td>
																		<td
																			class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																			data-date="2019-01-04"></td>
																		<td
																			class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																			data-date="2019-01-05"></td>
																	</tr>
																</tbody>
															</table>
														</div>
														<div class="fc-content-skeleton">
															<table>
																<thead>
																	<tr>
																		<td class="fc-day-top fc-sun fc-future"
																			data-date="2018-12-30"><span
																			class="fc-day-number">30</span></td>
																		<td class="fc-day-top fc-mon fc-future"
																			data-date="2018-12-31"><span
																			class="fc-day-number">31</span></td>
																		<td class="fc-day-top fc-tue fc-other-month fc-future"
																			data-date="2019-01-01"><span
																			class="fc-day-number">1</span></td>
																		<td class="fc-day-top fc-wed fc-other-month fc-future"
																			data-date="2019-01-02"><span
																			class="fc-day-number">2</span></td>
																		<td class="fc-day-top fc-thu fc-other-month fc-future"
																			data-date="2019-01-03"><span
																			class="fc-day-number">3</span></td>
																		<td class="fc-day-top fc-fri fc-other-month fc-future"
																			data-date="2019-01-04"><span
																			class="fc-day-number">4</span></td>
																		<td class="fc-day-top fc-sat fc-other-month fc-future"
																			data-date="2019-01-05"><span
																			class="fc-day-number">5</span></td>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
		</div>

	</div>
	<script src="<%= request.getContextPath() %>/resources/main/dist/js/moment/moment.js"></script>
	<script src="<%= request.getContextPath() %>/resources/main/dist/js/fullcalendar.min.js"></script>
	
</body>