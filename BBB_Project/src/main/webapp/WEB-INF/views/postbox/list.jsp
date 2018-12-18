<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>
	<section class="content-header">
		<h1><a href="#">내</a> 사서함</h1>
		<ol class="breadcrumb">
			<li><a href="<%= request.getContextPath() %>/postbox/search">postbox</a></li>
			<li><a href="<%= request.getContextPath() %>/postbox/list"><b>list</b></a></li>
		</ol>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-9">
				<ul class="timeline">
					<!-- sample-column -->
					<li>
						<i class="fa fa-user bg-aqua"></i>
						<div class="timeline-item">
							<span class="time"><i class="fa fa-clock-o"></i>&nbsp;날짜</span>
							<h3 class="timeline-header">내 메시지</h3>
							<div class="timeline-body">내용이 들어간다 들어간다.</div>
							<div class="timeline-footer">
								※ 바닥에 무슨 내용을 넣어야 할지 모르겠다.
							</div>
						</div>
					</li>
					<!-- sample-column.end -->
					<li>
						<i class="fa fa-user bg-green"></i>
						<div class="timeline-item">
							<span class="time"><i class="fa fa-clock-o"></i>&nbsp;날짜</span>
							<h3 class="timeline-header"><a href="#">유저 이름</a>이 들어갈 곳</h3>
							<div class="timeline-body">내용을 보낸다. 너에게</div>
							<div class="timeline-footer">
								※ 바닥에 무슨 내용을 넣어야 할지 모르겠다.
							</div>
						</div>
					</li>
					<li>
						<i class="fa fa-user"></i>
						<div class="timeline-item">
							<span class="time"><i class="fa fa-clock-o"></i>&nbsp;???</span>
							<h3 class="timeline-header">내게서 무엇을 숨기려 하는가</h3>
							<div class="timeline-body">숨겨진 내용입니다</div>
						</div>
					</li>
					<!-- input-sample -->
					<li>
						<i class="fa fa-user fa-user bg-aqua"></i>
						<div class="timeline-item">
							<h3 class="timeline-header">글 쓰기</h3>
							<div class="timeline-body"><label>내용</label><textarea class="form-control" type="text" name="comment" placeholder="내용을 입력..." style="resize:vertical;"></textarea></div>
							<div class="timeline-footer">
								<button class="btn btn-primary btn-xs">입력</button>
								<button class="btn btn-danger btn-xs">취소</button>
								
							</div>
						</div>
					</li>
					<!-- input-sample.end -->
				</ul>
				
				<div class="box-footer">
					<ul class="pagination pagination-sm no-margin pull-right">
						<li><a href="#">&lt;&lt;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">&gt;&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
</body>