<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<body>
<!--       <div class="row">
        <div class="col-md-12">
          <div class="box box-solid">
         
            /.box-header
            <div class="box-body">
              <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                  <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                </ol>
                <div class="carousel-inner">
                  <div class="item active">
                    <img src="http://placehold.it/900x500/39CCCC/ffffff&text=I+Love+Bootstrap" alt="First slide" style="width:100%;">
                    <div class="carousel-caption">
                    </div>
                  </div>
                  <div class="item">
                    <img src="http://placehold.it/900x500/3c8dbc/ffffff&text=I+Love+Bootstrap" alt="Second slide" style="width:100%;">
                    <div class="carousel-caption">
                    </div>
                  </div>
                  <div class="item">
                    <img src="http://placehold.it/900x500/f39c12/ffffff&text=I+Love+Bootstrap" alt="Third slide" style="width:100%;">
                    <div class="carousel-caption">
                    </div>
                  </div>
                </div>
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                  <span class="fa fa-angle-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                  <span class="fa fa-angle-right"></span>
                </a>
              </div>
            </div>
            /.box-body
          </div>
          /.box
        </div>
        /.col
      </div>
      /.row
      END ACCORDION & CAROUSEL -->



 <!-- Main content -->
    <section class="content">
      
      <!-- 나의 참여목록 리스트 테이블 -->
      <div class="row">
        <!-- <div class="col-md-6"> -->
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header with-border">
            	<div class="select-list inv">
            		<ul class="select">
            			<li class="div" id="selected" style="width:100px;">
            				<button type="button"  class="btn btn-block btn-default">My PMS</button>
            			</li>
            			<li style="width:3px;">
            			</li>
            			<li class="add" style="width:100px;">
            				<button type="button"  class="btn btn-block btn-default">Request PMS</button>
            			</li>
            		</ul>
            		<!-- <div class="sibal saekki">
            	  		참여중인 프로젝트
              		</div>
	              	<div class="sibal">
        	      		신청중인 프로젝트
    	          	</div> -->
              	</div>
            </div>
            
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tr>
                  <th>#</th>
                  <th>프로젝트 명</th>
                  <th class="hidden-xs">개설자</th>
                  <th style="width:10%;">참여현황</th>
                </tr>
                
                
             	
				<c:forEach var="partake" items="${myPartakeList }" varStatus="num">
				<tr class="partakeList">
					<c:if test="${empty myPartakeList }">
						<td colspan="4">현재 진행중인 프로젝트가 없습니다.</td>
					</c:if>
					<c:if test="${!empty myPartakeList }">
	             	  <td>${num.index+1 }</td>
	                  <td>
	                  	<a href="<%=request.getContextPath() %>/project/main?pjNum=${partake.pjNum}">
	                  		${partake.name}
	                  	</a>
	                  </td>
	                  <td class="hidden-xs">${partake.creator}</td>
	                  <td><button type="button" disabled="disabled" class="btn btn-block btn-success">참여중</button></td>
                	</c:if>
                </tr>
				</c:forEach>
				
				<c:forEach var="bindProject" items="${bindProject }" varStatus="num">
					<c:if test="${empty bindProject }">
						<tr>
						<td colspan='4'>현재 신청중인 프로젝트가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty bindProject }">
					<tr class="bindList" id="bindList">	
		             	<td>${num.index+1 }</td>
		                <td>
			                <a href="<%=request.getContextPath() %>/project/main?pjNum=${partake.pjNum}">
			                  		${bindProject.name}
			                </a>
		                </td>
		                <td class="hidden-xs">${bindProject.creator}</td>
		                <td><button type="button" class="btn btn-block btn-warning cancel" id="${bindProject.pjNum }">신청중</button></td>
	                </tr>
	                </c:if>
				</c:forEach>
						  
              </table>
              
            </div>
            
            <!-- /.box-body -->
            <!-- / 나의 참여목록 리스트 테이블 끝 -->
                  
          </div>
          <!-- /.box -->
          <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-newProject">새 프로젝트</button>
          

        </div>
        
        <!-- /.col -->
      </div>
      <!-- /.row -->
     
      <!-- /.box -->
    </section>
    <!-- /.content -->
    <div class="modal fade" id="modal-newProject">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">프로젝트 생성</h4>
				</div>
				<div class="modal-body">
					<form action="" method="POST">			
						<input type="hidden" name="creator" value="${ loginUser.id }">
						<label class="control-label">프로젝트 이름</label>
						<input class="form-control " type="text" name="name" placeholder="프로젝트 이름">
						<span class="help-block" id="pNameHelp"><i class=""></i></span>
						<span class="glyphicon glyphicon-pencil form-control-feedback" id="pjNameIcon"></span><br/>
						<label class="control-label">프로젝트 설명</label>
						<textarea class="form-control" style="resize:none;" rows="10" placeholder="프로젝트 설명" name ="disc"></textarea><br/>
						<label class="control-label">공개</label><input type="radio" name="visibility" value="0" checked>
						<label class="control-label">비공개</label><input type="radio" name="visibility" value="1"><br/><br/>
						
						<!-- 프로젝트 기간  -->
						<div class="box">
					        <div class="box-header with-border">
						    	<h3 class="box-title">프로젝트 기간</h3>
								<div class="box-tools pull-right">
						            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
						            <i class="fa fa-minus"></i></button>
						        </div>
						    </div>
						    <div class="box-body">
						    	<label class="control-label">시작일</label>
						    	<input class="form-control" type="date" name="startDate">
						    	<span class="help-block" id="startDateHelp"><i class=""></i></span> <br/>
						    	<label class="control-label">마감일</label>
						    	<input class="form-control" type="date" name="endDate">
						    	<span class="help-block" id="endDateHelp"><i class=""></i></span> <br/>
						    </div>
						    <div class="box-footer">
						     	tip) 프로젝트 시작일, 마감일을 입력해보세요.
						    </div>
				    	</div>
					</form>
					</div>
				<div class="modal-footer">
					<!-- 프로젝트 기간.end -->
					<button type="button" id="create_btn" class="btn btn-block btn-success btn-lg" disabled>생성</button>
					<button type="button" id="cancel_btn" class="btn btn-block btn-danger btn-lg">취소</button>
				</div>
		</div>
	</div>
	</div>
	
	<!-- content.end -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		var pNameFlag = false;
		var startDateFlag = false;
		var endDateFlag = false;
		/* 유효성  */
		$('input[name="name"]').on('blur', function(e){
			$(this).css({ borderColor : 'red' });
			var pName = $(this).val();
			
			if(pName == null || pName == ''){
				$('#pNameHelp').css({ color : 'red' });
				$('#pNameHelp').html('프로젝트명을 입력하지 않으셨습니다.');
				$(this).focus();
				return;
			}
			if(pName.length > 75){
				$('#pNameHelp').css({ color : 'red' });
				$('#pNameHelp').html('프로젝트명은 75자를 넘을 수 없습니다.');
				$(this).focus();
				return;
			}
			/* 유효성 ajax */			
			$.ajax({
				url : '<%=request.getContextPath()%>/verify/pName/'+pName,
				type : 'GET',
				success : function(data){
					if(data=='OK'){
						$('input[name="name"]').css({ borderColor : 'green' });
						$('#pNameHelp').css({ color : 'green', fontWeight : 'bold' });
						$('#pNameHelp').html('사용 가능한 프로젝트명입니다.');
						$('span#pjNameIcon').removeClass('glyphicon-ok');
						$('span#pjNameIcon').removeClass('glyphicon-pencil');
						$('span#pjNameIcon').addClass('glyphicon-ok');
						
						pNameFlag = true;
					}
					if(data=='OVERLAPED'){
						$('#pNameHelp').css({ color : 'red' });
						$('#pNameHelp').html('이미 사용중인 프로젝트 이름입니다');
						$('span#pjNameIcon').removeClass('glyphicon-ok');
						$('span#pjNameIcon').removeClass('glyphicon-pencil');
						$('span#pjNameIcon').addClass('glyphicon-pencil');
						pNameFlag = false;
						$('input[name="name"]').focus();
					}
				},
				error : function(error){
					alert('전송 중 에러가 발생했습니다. 자세한 사항은 관리자에게 문의 바랍니다.');
				}
			});
			/* 유효성 ajax.end */
			
			verifyCheck();
		});
		// 프로젝트명 유효성.end
		
		//	프로젝트 시작일, 마감일 유효성 
		var startDate;
		var endDate;
		var startDateNumber;
		var endDateNumber;
		$('input[name=startDate]').on('blur', function(e){
			//	alert($('input[name=startDate]').val());
			// alert(new Date().toISOString('yyyy-MM-dd').substr(0,10));
			if( $(this).val() == null || $(this).val() == '' ){
				$('span#startDate').css({ color : 'red', fontWeight : 'bold' });
				$('span#startDate').html('프로젝트 시작일을 입력해주세요.');
				$('input[name=startDate]').css({ borderColor : 'red'});
				return;
			}
			startDate = $(this).val().split("-");
			startDateNumber = parseInt(startDate[0]+(startDate[1])+startDate[2]);
			startDate = $(this).val();
			
			if( startDate == null || startDate == '' ){
				$(this).css({ borderColor : 'red'});
				$('span#startDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#startDateHelp').html('프로젝트 생성일보다 빠를 수 없습니다');
				startDateFlag = false;
				return;
			}else{
				$(this).css({ borderColor : 'green'});
				$('span#startDateHelp').html('');
				startDateFlag = true;
			}
			verifyCheck();
		});
		$('input[name=endDate]').on('blur', function(e){
			if( startDate == null || startDate=='' ){
				$(this).val('');
				$('span#endDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#endDateHelp').html('프로젝트 시작일을 먼저 입력해주세요');
				$('input[name=startDate]').css({ borderColor : 'red'});
				endDateFlag = false;
				return;
			}
			if( $(this).val() == null || $(this).val() == '' ){
				$('span#endDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#endDateHelp').html('프로젝트 마감일을 입력해주세요.');
				$('input[name=endDate]').css({ borderColor : 'red'});
				endDateFlag = false;
				return;
			}
			endDate = $(this).val().split('-');
			endDateNumber = parseInt(endDate[0]+(endDate[1])+endDate[2]);
			endDate = $(this).val();
			
			if( endDateNumber < startDateNumber ){
				$('span#endDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#endDateHelp').html('프로젝트 마감일이 시작일보다 빠를 수 없습니다.');
				$('input[name=endDate]').css({ borderColor : 'red'});
				endDateFlag = false;
				$(this).val('');
				return;
			} else {
				$('input[name=endDate]').css({ borderColor : 'green'});
				$('span#endDateHelp').html('');
				endDateFlag = true;
			}
			verifyCheck();
		});
		//	프로젝트 시작일, 마감일 유효성.end
		
		/* 버튼 */
		$('#create_btn').on('click', function(e){
			if(!pNameFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#pNameHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#pNameHelp').html('');
				$('input[name=name]').css({ borderColor : 'red'});
				return;
			}
			if(!startDateFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#startDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#startDateHelp').html('');
				$('input[name=startDate]').css({ borderColor : 'red'});
				return;
			}
			if(!endDateFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#endDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#endDateHelp').html('');
				$('input[name=endDate]').css({ borderColor : 'red'});
				return;
			}
			var json = {
					name : $('input[name=name]').val(),
					disc : $('textarea[name=disc]').val(),
					creator : $('input[name=creator]').val(),
					visibility : $('input[name=visibility]:checked').val(),
					startDate : $('input[name=startDate]').val(),
					endDate : $('input[name=endDate]').val()
			}
			
			$.ajax({
				url : '<%=request.getContextPath()%>/main/addProject',
				method : 'POST',
				data : JSON.stringify(json),
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"post"
				},
				success : function(data){
					alert('프로젝트가 생성되었습니다.');
					location.href="<%= request.getContextPath()%>/main/myPartakeList"
				},
				error : function(error){
					alert('서버 내부오류가 발생했습니다. 자세한 사항은 관리자에게 문의바랍니다.');
				}
			});
		});
		$('#cancel_btn').on('click', function(e){
			history.go(-1);
		});
		
		function verifyCheck(){
			if(!pNameFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#pNameHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#pNameHelp').html('');
				$('input[name=name]').css({ borderColor : 'red'});
				return;
			}
			if(!startDateFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#startDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#startDateHelp').html('');
				$('input[name=startDate]').css({ borderColor : 'red'});
				return;
			}
			if(!endDateFlag){
				$('button#create_btn').prop('disabled', true);
				$('span#endDateHelp').css({ color : 'red', fontWeight : 'bold' });
				$('span#endDateHelp').html('');
				$('input[name=endDate]').css({ borderColor : 'red'});
				return;
			}
			$('button#create_btn').prop('disabled', false);
		}
		
	</script>
    

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		$(document).ready(function(){
			
			$('li.div').on('click',function(){
				$('.partakeList').removeAttr('id','bindList');
				$('.bindList').attr('id','bindList');
				$('li.add').removeAttr('id','selected');
				$('li.div').attr('id','selected');
			});
			$('li.add').on('click',function(){
				$('.bindList').removeAttr('id','bindList');
				$('.partakeList').attr('id','bindList');
				$('li.div').removeAttr('id','selected');
				$('li.add').attr('id','selected');
			})
		});
		
		var id = '${loginUser.id}';
		$('.cancel').on('click', function(){
			if(confirm("신청을 취소하시겠습니까?") == true){
					var form = $(this).attr('id');
					$.ajax({
						type:"post",
						url:"<%=request.getContextPath()%>/main/joinCancel",
						data:JSON.stringify({
							"id":id,
							"pjNum":form,
						}),
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"post"
						},
						success:function(data){
							if(data="SUCCESS"){
								alert('신청이 취소되었습니다.');
							}
							
							location.reload();
						},
						error:function(error){
							alert("취소가 실패했습니다. 잠시후 다시 시도해주세요.");
						}
					});
			}else{
				return;
			}
		});
		
	</script>
</body>
</html>










