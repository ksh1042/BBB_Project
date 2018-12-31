<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>

	<div class="container">
		<section class="content-header" style="cursor:pointer;" onclick="javascript:location.href='<%=request.getContextPath()%>/project/issue/list';">
		<h3>이슈 게시판</h3>
	    </section>
	      
	    <section class="content">
		
			<form role="form" action="modify" method="post">
				<input type='hidden' name='iNum' value="${issue.iNum}"> 
				<input type='hidden' name='page' value="${cri.page}"> 
				<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
				<input type='hidden' name='searchType' value="${cri.searchType}">
				<input type='hidden' name='keyword' value="${cri.keyword}">
			</form>
			
	      <!-- row -->
	      <div class="row">
	        <div class="col-md-12">
	          <!-- The time line -->
	          <ul class="timeline">
	            <!-- timeline time label -->
	            <li class="time-label">
	                  <span class="bg-red">
	                    ${issue.title }
	                  </span>
	            </li>
	            <!-- /.timeline-label -->
	            <!-- timeline item -->
	            <li>
	              <i class="fa fa-envelope bg-blue"></i>
	
	              <div class="timeline-item">
	                <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>
	
	                <h3 class="timeline-header">upport Team</a> sent you an email</h3>
	
	                <div class="timeline-body">
	                  Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
	                  weebly ning heekya handango imeem plugg dopplr jibjab, movity
	                  jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
	                  quora plaxo ideeli hulu weebly balihoo...
	                </div>
	                <div class="timeline-footer">
	                  <a class="btn btn-primary btn-xs">Read more</a>
	                  <a class="btn btn-danger btn-xs">Delete</a>
	                </div>
	              </div>
	            </li>
	            <!-- END timeline item -->
	            <li>
	              <i class="fa fa-clock-o bg-gray"></i>
	            </li>
	          </ul>
	        </div>
	        <!-- /.col -->
	      </div>
	      <!-- /.row -->
	
	      <div class="row" style="margin-top: 10px;">
	        <div class="col-md-12">
	          <div class="box box-primary">
	            <div class="box-header">
	              <h3 class="box-title"><i class="fa fa-code"></i> Timeline Markup</h3>
	            </div>
	            <div class="box-body">
	                  <pre style="font-weight: 600;">
	                  </pre>
	            </div>
	            <!-- /.box-body -->
	          </div>
	          <!-- /.box -->
	        </div>
	        <!-- /.col -->
	      </div>
	      <!-- /.row -->
	
	  </section>







<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script>


</script>

</body>