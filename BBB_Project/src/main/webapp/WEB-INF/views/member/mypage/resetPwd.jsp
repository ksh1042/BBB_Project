<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

	<div class="container">
      <section class="content-header">
			<h3>패스워드 재설정</h3>
      </section>
      
      <section class="content">
          <form action="/main/mypage/resetPwd" method="post" name="resetPwdFormInLogin">
          <div class="box-body" style="width:900px;">
            <div class="form-group">
              <label for="exampleInputEmail1">현재 패스워드</label>
              <input type="hidden" name="id" value="${loginUser.id }"/>
              <input type="password" class="form-control" placeholder="현재 패스워드 입력" id="currentPwd" name="pwd"><br/>
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">새 패스워드</label>
              <input type="password" class="form-control" placeholder="새 패스워드입력" id="newPwd" name="newPwd"/>
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">새 패스워드 재입력</label>
              <input type="password" class="form-control" placeholder="새 패스워드 확인" id="reNewPwd" name="reNewPwd"/>
            </div>
          </div>
           <!-- /.box-body -->
         <div style="text-align: center;">
           <br>
           <button type="button" class="btn btn-primary" style="background-color:#00c0ef;padding-left:20px;padding-right:20px;border:1px solid #00c0ef;" onclick="projectList_go()">취소</button>
           <button type="button" class="btn btn-primary" style="margin-left:100px;margin-right:200px;padding-left:20px;padding-right:20px;" onclick="resetPwd_go()">확인</button>
         </div>
         <br>
		</form>
	  </section>	
	</div>
	
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript">

	function projectList_go(){
		location.href="<%=request.getContextPath()%>/main/myPartakeList";
	}

	function resetPwd_go(){
		
		var newPwd=$("#newPwd").val();
		var reNewPwd=$("#reNewPwd").val();
		
		var currentPwd=$("#currentPwd").val();
		var pwd='${loginUser.pwd}';
		
		if(newPwd==null || reNewPwd==null){
			alert("패스워드를 입력해주세요.");
		}else{
			if(currentPwd != pwd){
				alert("현재 패스워드가 일치하지 않습니다.");
			}else{
				if(newPwd != reNewPwd){
					alert("새 패스워드가 일치하지 않습니다.");
				}else{
					if(newPwd.length < 8 || newPwd.length > 16) {  
						alert("패스워드는  8~15자를 입력해주세요.");
					}else{
						if (!newPwd.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
							alert("패스워드는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 입력해주세요.");
						}else{
							if(newPwd==reNewPwd){
								alert("패스워드가 변경되었습니다.");
								document.resetPwdFormInLogin.submit();
							}else{
								alert("패스워드가 일치하지 않습니다.");
							}
						}
					}
					
				}
				
			}
			
	
		}
	}
</script>
</body>

