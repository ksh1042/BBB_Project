<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

	<div class="container">
      <section class="content-header">
			<h3>이메일 재설정</h3>
      </section>
      
      <section class="content">
          <form action="/main/mypage/resetEmail" method="post" name="resetEmailForm">
          <div class="box-body" style="width:900px;">
           
     		<div class="form-group">
              <label for="exampleInputPassword1">새 이메일</label>
              <input type="hidden" name="id" value="${loginUser.id }"/>
              <input type="hidden" name="email" id="currentEmail" value="${loginUser.email }"/>
              <input type="email" class="form-control" placeholder="이메일" id="newEmail" name="newEmail"><br>
              <button type="button" onclick="getEmailCode()">인증코드받기</button><br>
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">인증코드</label>
              <input type="text" class="form-control" placeholder="인증코드 입력" name="emailCode" id="emailCode" disabled="disabled">
            </div>
            
           <!-- /.box-body -->
         <div style="text-align: center;">
           <br>
           <button type="button" class="btn btn-primary" style="background-color:#00c0ef;padding-left:20px;padding-right:20px;border:1px solid #00c0ef;" onclick="projectList_go()">취소</button>
           <button type="button" class="btn btn-primary" style="margin-left:100px;margin-right:120px;padding-left:20px;padding-right:20px;" onclick="resetEmail_go()" id="okBtn" disabled="disabled">확인</button>
         </div>
         
         <br>
		</form>
	  </section>	
	</div>
	
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script>

	function getEmailCode() {
	
	 	var currentEmail=$("#currentEmail").val();
	 	var newEmail=$("#newEmail").val();
	
		 $.ajax({
	            async: true,
	            type : 'POST',
	            url:'/main/getEmailCode',
	            data : newEmail,
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	            	 if(currentEmail == newEmail){
	        			 alert("현재 사용중인 이메일주소와 동일합니다.");
	        		 }else{
		            	 $("#emailCode").attr("disabled",false);
		        		 $("#okBtn").attr("disabled",false);
		        		 tempKey = data.tempKey
		        		 alert("해당 이메일로 인증코드가 발송되었습니다.");
	        		 }
	            },
	            error : function(error) {
	                alert("인증코드 발송을 실패했습니다.\n이메일 주소를 확인 후 다시 시도해주세요.");
	            }
	        });
	}
	
	 function projectList_go(){
			location.href="<%=request.getContextPath()%>/main/myPartakeList";
		}
	 
	 function resetEmail_go(){
		 
		 var emailCode = $("#emailCode").val();
		
			 if(emailCode == tempKey){
					document.resetEmailForm.submit();
					alert("이메일이 변경되었습니다.");
				}else{
					alert("인증코드가 올바르지 않습니다.");
				}
		 
	 }
	

</script>
</body>
