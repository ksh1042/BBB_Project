<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<script>
	var qaNum=${qna.qaNum};

	$('#replyAddBtn').on('click',function(e){
		var writer=$('#newReplyWriter').val();
		var rContent=$('#newReplyContent').val();
		
		if(writer==""){
			alert('답변 작성자는 필수입니다.');
			$('#newReplyWriter').focus();
			return;
		}
		if(rContent==""){
			alert('답변 내용은 필수입니다.');
			$('#newReplyContent').focus();
			return;
		}
		
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/replies",
			data:JSON.stringify({
				"qaNum":qaNum,
				"writer":writer,
				"rContent":rContent
			}),
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"post"
			},
			success:function(data){
				if(data="SUCCESS"){
					alert('등록되었습니다.');
				}		
				
				getPage("<%=request.getContextPath()%>/replies/"+qaNum+"/1");
			
				$('#newReplyContent').val("");
			},
			error:function(error){
				alert("답글 등록에 실패했습니다.");
			}
		});
	});
</script>



<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-qarnum={{qarNum}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate indate}}
	 <a class="btn btn-primary btn-xs" id="modifyReplyBtn"
	    data-toggle="modal" data-target="#modifyModal">Modify</a>
  </span>
  <h3 class="timeline-header"><strong>{{qarNum}}</strong> -{{writer}}</h3>
  <div class="timeline-body">{{rContent}} </div>
</li>
{{/each}}
</script>

<script>
Handlebars.registerHelper("prettifyDate",function(timeValue){
	var dateObj=new Date(timeValue);
	var year=dateObj.getFullYear();
	var month=dateObj.getMonth();
	var date=dateObj.getDate();
	return year+"/"+month+"/"+date;
});

var printData=function(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html=template(replyArr);
	$('.replyLi').remove();
	target.after(html);
};

var replyPage=1;

getPage("<%=request.getContextPath()%>/replies/"+qaNum+"/"+replyPage);

function getPage(pageInfo){	
	$.getJSON(pageInfo,function(data){
		printData(data.list,$('#repliesDiv'),$('#template'));
		printPaging(data.pageMaker,$('.pagination'));
	});
}

var printPaging=function(pageMaker,target){
	var str="";
	if(pageMaker.prev){
		str+="<li><a href='"+(pageMaker.startPage-1)
				+"'> << </a></li>";
	}
	for(var i=pageMaker.startPage,len=pageMaker.endPage;i<=len;i++){
		var strClass = pageMaker.cri.page==i?'class=active':'';
		str+="<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
	}
	if(pageMaker.next){
		str+="<li><a href='"+(pageMaker.endPage+1)
			+"'> >> </a></li>";
	}
	target.html(str);
}


$('.pagination').on('click','li a',function(event){		
	event.preventDefault();		
	replyPage=$(this).attr("href");
	getPage("<%=request.getContextPath()%>/replies/"+qaNum+"/"+replyPage);
});

$('.timeline').on('click','.replyLi',function(event){
	var reply=$(this);
	$('#replytext').val(reply.find('.timeline-body').text());
	$('.modal-title').html(reply.attr('data-qarnum'));
});

$('#replyModBtn').on('click',function(event){
	var qarNum=$('.modal-title').html();
	var rContent=$('#rContent').val();
	
	$.ajax({
		method:'put',
		url:"<%=request.getContextPath()%>/replies/"+qarNum,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"PUT"
		},
		data:JSON.stringify({rContent:rContent}),
		dataType:'text',
		success:function(result){
			if(result=="SUCCESS"){
				alert("수정되었습니다.");			
				getPage("<%=request.getContextPath()%>/replies/"+qarNum+"/"+replyPage);
			}
		},
		error:function(error){
			alert("답변 수정에 실패했습니다.");
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
});

$('#replyDelBtn').on('click',function(event){
	var qarNum=$('.modal-title').html();
	
	$.ajax({
		method:'delete',
		url:"<%=request.getContextPath()%>/replies/"+qarNum,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Override":"delete"
		},
		dataType:'text',
		success:function(result){
			if(result="SUCCESS"){
				alert("삭제되었습니다.");				
				getPage("<%=request.getContextPath()%>/replies/"+qaNum+"/"+replyPage);
			}
		},
		error:function(error){
			alert('삭제 실패했습니다.');			
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
});
</script>