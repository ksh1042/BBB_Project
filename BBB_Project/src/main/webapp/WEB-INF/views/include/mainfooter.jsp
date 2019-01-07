<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
	</div>
	  <footer class="main-footer">
	    <div class="container">
	      <div class="pull-right hidden-xs">
	        <b>Version</b> alpha
	      </div>
	      <strong>Copyright &copy; 2018-2019 <a href="#">BBB Project</a>.</strong> All rights
	      reserved.
	    </div>
	    <!-- /.container -->
	  </footer>
	  
	  <!-- Control Sidebar -->
	  <aside class="control-sidebar control-sidebar-dark">
	    <!-- Create the tabs -->
	    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
	      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
	      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
	    </ul>
	    <!-- Tab panes -->
	    <div class="tab-content">
	      <!-- Home tab content -->
	      <div class="tab-pane active" id="control-sidebar-home-tab">
	        <h3 class="control-sidebar-heading">도메인 관리</h3>
	        <ul class="control-sidebar-menu">
	          <li>
	            <a href="<%=request.getContextPath()%>/notice/listPage">
	              <i class="menu-icon fa fa-calendar-check-o bg-red"></i>
	              <div class="menu-info">
	                <h4 class="control-sidebar-subheading">공지사항</h4>
	                <p>도메인 공지사항 관리</p>
	              </div>
	            </a>
	          </li>
	          
	          <li>
	            <a href="<%=request.getContextPath()%>/admin/memberList">
	              <i class="menu-icon fa fa-users bg-red"></i>
	              <div class="menu-info">
	                <h4 class="control-sidebar-subheading">회원관리</h4>
	                <p>회원 정보 조회 및 계정활성관리</p>
	              </div>
	            </a>
	          </li>
	          
	          <li>
	            <a href="<%=request.getContextPath()%>/question/listQna">
	              <i class="menu-icon glyphicon glyphicon-question-sign bg-red"></i>
	              <div class="menu-info">
	                <h4 class="control-sidebar-subheading">고객센터</h4>
	                <p>고객센터 내 문의사항 글 답변</p>
	              </div>
	            </a>
	          </li>
	          
	        </ul>
	        <!-- /.control-sidebar-menu -->
	        
	        <h3 class="control-sidebar-heading">Tasks Progress</h3>
	        <ul class="control-sidebar-menu">
	          <li>
	            <a href="javascript:;">
	              <h4 class="control-sidebar-subheading">
	                Custom Template Design
	                <span class="pull-right-container">
	                    <span class="label label-danger pull-right">70%</span>
	                  </span>
	              </h4>
	
	              <div class="progress progress-xxs">
	                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
	              </div>
	            </a>
	          </li>
	        </ul>
	        <!-- /.control-sidebar-menu -->
	
	      </div>
	      <!-- /.tab-pane -->
	      <!-- Stats tab content -->
	      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
	      <!-- /.tab-pane -->
	      <!-- Settings tab content -->
	      <div class="tab-pane" id="control-sidebar-settings-tab">
	        <form method="post">
	          <h3 class="control-sidebar-heading">General Settings</h3>
	
	          <div class="form-group">
	            <label class="control-sidebar-subheading">
	              Report panel usage
	              <input type="checkbox" class="pull-right" checked>
	            </label>
	
	            <p>
	              Some information about this general settings option
	            </p>
	          </div>
	          <!-- /.form-group -->
	        </form>
	      </div>
	      <!-- /.tab-pane -->
	    </div>
	  </aside>
	  <!-- /.control-sidebar -->
	  
	  
	</div>
	<!-- ./wrapper -->
	
	<!-- jQuery 3 -->
	<script src="<%=request.getContextPath()%>/resources/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>
</body>
</html>