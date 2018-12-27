<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/project/registRepository.jsp" %>

<script>
	var form = $('form[role="form"]');
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		/* alert("submit"); */
		$(".uploadedList .delbtn").each(function(i, obj){
			var fullName=$(this).attr('href');
			var uuid="";
			var fileName="";
			if(checkImageType(fullName)){
				uuid=fullName.substring(14).split('$$')[0];
				fileName=fullName.substring(14).split('$$')[1];
				fileType="1";
			}else{
				uuid=fullName.substring(12).split('$$')[0];
				fileName=fullName.substring(12).split('$$')[1];
				fileType="0";
			}
			
			var uploadPath=fullName.substring(0,12).replace(/\//g,"\\");
					
			var input1=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].uuid').val(uuid);
			var input2=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].fileName').val(fileName);
			var input3=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].fileType').val(fileType);
			var input4=$('<input>').attr('type','hidden').attr('name','attachList['+i+'].uploadPath').val(uploadPath);
			
			form.append(input1).append(input2).append(input3).append(input4);
		});
		
		form.submit();
		
	});
	
	$('.uploadedList').on('click','.delbtn',function(event){
		event.preventDefault();
		var that=$(this);
		
		$.ajax({
			url:'<%=request.getContextPath()%>/deleteFile',
			type:'post',
			data:{fileName:$(this).attr('href')},
			success:function(result){
				if(result=='deleted'){
					that.parent('li').remove();
				}
			}
		});
	});

</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/SE2/js/HuskyEZCreator.js"></script>

</body>






