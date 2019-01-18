<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
   <style>
			th {
				text-align: center;
				background-color : #F1F1F1;
			}
			td {
				white-space: nowrap;
			}
			tbody tr:NTH-CHILD(2n+1)>td {
				background-color : #F1F1F1;
			}
		div.scrollable {
			overflow:scroll;
			overflow-x:auto;
			overflow-y:hidden;
		}
		table {
			width : 930px;
			table-layout: fixed;
		}
		table td{
	      overflow: hidden;
	      white-space: nowrap;
	      text-overflow: ellipsis;
	    }
	    table th{
	      overflow: hidden;
	      white-space: nowrap;
	      text-overflow: ellipsis;
	    }
	    table tr>td:nth-child(1), table tr>th:nth-child(1) {
	      width : 50px;
	    }
	    table tr>td:nth-child(2), table tr>th:nth-child(2) {
	      width : 100px;
	    }
	    table tr>td:nth-child(3), table tr>th:nth-child(3) {
	      width : 100px;
	    }
	    table tr>td:nth-child(4), table tr>th:nth-child(4) {
	      width : 40%;
	    }
	    table tr>td:nth-child(5), table tr>th:nth-child(5) {
	      width : 70px;
	    }
	    table tr>td:nth-child(6), table tr>th:nth-child(6) {
	      width : 85px;
	    }
	    table tr>td:nth-child(7), table tr>th:nth-child(7) {
	      width : 85px;
	    }
	    table tr>td:nth-child(8), table tr>th:nth-child(8) {
	      width : 85px;
	    }
	    table tr>td:nth-child(9), table tr>th:nth-child(9) {
	      width : 85px;
	    }
	    table tr>td:nth-child(10), table tr>th:nth-child(10) {
	      width : 30px;
	    }
	    select{
	    	width:80px; height:30px;
	    }
	    .rdcontent{
	    	width:100%;
	    	height:50px;
	    	resize:none;
	    }
	    
	</style>
</head>
<body>
	<section class="content-header">
		<h1 style="cursor: pointer;"onclick="javascript:location.href='<%=request.getContextPath()%>/project/requirement/list';">요구사항 정의서</h1>
		<ol class="breadcrumb">
			<li><a href="<%=request.getContextPath()%>/project/main?pjNum=${logonProject.pjNum}">
			<i class="fa fa-dashboard"></i>${logonProject.name }</a></li>
			<li class="active"><a href="<%=request.getContextPath()%>/project/requirement/list">요구사항 정의서</a></li>
		</ol>
	</section>

  
   <section class="content">
      <div>
         <div class="box">
            <div class="box-header">
               <div class="col-sm-6">
                  <h3 class="box-title"></h3>
               </div>
               <div class="col-sm-6 searchDiv">
                  <div class="input-group input-group-sm">
                     <span class="input-group-btn">                        
                        <select class="form-control" name="searchType" style="height:30px; width: 105px; font-size:11px;">
                           <option value="all" selected>전체</option>
                           <option value="ri">요구사항ID</option>
                           <option value="rn">요구사항명</option>
                           <option value="rc">요구사항내용</option>
                           <option value="in">인터페이스</option>
                           <option value="ry">수용여부</option>
                        </select>   
                     </span>
                     <input id="keyword" type="text" class="form-control" value="${ pageMaker.cri.keyword }"> 
                     <span class="input-group-btn">
                        <button type="button" class="btn btn-default btn-flat" onclick="search_go();">검색</button>
                     </span>
                  </div>
               </div>

               <form id="frm" method="post"></form>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
               <div id="example2_wrapper"
                  class="dataTables_wrapper form-inline dt-bootstrap">
                  <div class="row">
                     <div class="col-sm-6"></div>
                     <div class="col-sm-6"></div>
                  </div>
                  <div class="row">
                     <div class="col-sm-12 scrollable" id="dvData">
                        <table id="example2 "
                           class="table table-bordered table-hover dataTable" role="grid"
                           aria-describedby="example2_info">
                           <tr role="row">
                              <th class="sorting" tabindex="0" aria-controls="example2"
                                 rowspan="1" colspan="1"
                                 aria-label="Rendering engine: activate to sort column ascending">#</th>
                              <th class="sorting_desc" tabindex="0" aria-controls="example2"
                                 rowspan="1" colspan="1"
                                 aria-label="Browser: activate to sort column ascending"
                                 aria-sort="descending">요구 ID</th>
                              <th class="sorting" tabindex="0" aria-controls="example2"
                                 rowspan="1" colspan="1" style="text-overflow: ellipsis;"
                                 aria-label="Platform(s): activate to sort column ascending">명칭</th>
                              <th class="sorting hidden-xs" tabindex="0" aria-controls="example2"
                                 rowspan="1" colspan="1"
                                 aria-label="CSS grade: activate to sort column ascending">내용</th>
                              <th class="sorting hidden-xs" tabindex="0" aria-controls="example2"
                                 rowspan="1" colspan="1"
                                 aria-label="CSS grade: activate to sort column ascending">인터페이스</th>
                                 <th class="sorting hidden-xs" tabindex="0" aria-controls="example2"
                                 rowspan="1" colspan="1"
                                 aria-label="CSS grade: activate to sort column ascending">제한사항<br>(규정/법률)</th>
                                 <th class="sorting hidden-xs" tabindex="0" aria-controls="example2"
                                 rowspan="1" colspan="1"
                                 aria-label="CSS grade: activate to sort column ascending">수용여부</th>
                                 <th class="sorting hidden-xs" tabindex="0" aria-controls="example2"
                                 rowspan="1" colspan="1"
                                 aria-label="CSS grade: activate to sort column ascending">담당자</th>
                           </tr>
                           <c:if test="${ empty requireList }">
                              <tr role="row" class="odd"><td colspan="11" style="text-align:center;">표시할 내용이 없습니다</td></tr>
                           </c:if>
                           <c:forEach var="require" items="${ requireList }" varStatus="stat">
                              <tr role="row" class="${ (stat.count mod 2)==0 ? 'even':'odd' }">
                                 <td>${ stat.count }</td>
                                 <td>${ require.rdId }</td>
                                 <td>${ require.rdName }</td>
                                 <td class="hidden-xs">${ require.rdContent }</td>
                                 <td class="hidden-xs">${ require.limit }</td>
                                 <td class="hidden-xs">${ require.interf }</td>
                                 <td class="hidden-xs">${ require.acceptyn }</td>
                                 <td class="hidden-xs"><a class="postboxLink" href="${ require.manager }">${ require.manager }</a></td>
                                 
                              </tr>
                           </c:forEach>
                        </table>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-sm-4">
                        <div class="dataTables_info" id="example2_info" role="status"
                           aria-live="polite">Showing <b>${ f:length(requireList) }</b> entries
                        </div>
                     </div>
                     <div class="col-sm-4 text-center">
                        <ul class="pagination link pagination-sm no-margin">
                           <c:if test="${pageMaker.prev}">
                                 <li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
                           </c:if>
         
                           <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                              <li
                                 <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
                                 <a href="${idx}">${idx}</a>
                              </li>
                           </c:forEach>
         
                           <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                              <li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
                           </c:if>
                        </ul>
                     </div>
                     <div class="col-sm-4">
                     	<c:if test="${loginUser.id eq logonProject.creator }">
                        	<button type="button" class="btn btn-warning" onclick="modify_go();" style="margin-left:20px; float:right;">수정</button>
                        </c:if>      
                        <button type="button" class="btn btn-primary" onclick="hist_go();" style="margin-left:20px;float:right;">수정 이력</button>
                        <button type="button" class="btn btn-success" id="btnExport" style="margin-left:20px; float:right;">Excel 출력</button>
                        <!-- <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-createRequire" style="margin-left:20px; float:right;">작성</button> -->
                     </div>
                  </div>
               </div>
            </div>
            <!-- /.box-body -->
         </div>
         <!-- /.box -->
      </div>
      
      <div class="modal fade" id="modal-createRequire"> 
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">요구사항 작성</h4>
				</div>
				<div class="modal-body">
				<form action="insertRequire" method="post" name="findIDForm">
	                <div class="form-group">
	                  <label for="exampleInputEmail1">요구사항 ID</label>
	                  <input type="text" class="form-control" id="exampleInputEmail1" placeholder="요구사항 ID"  name="rdid" required>
	                </div>
	                <div class="form-group" style="margin:0;">
	                  <label for="exampleInputPassword1">요구사항 명</label>
	                  <input type="email" class="form-control"  placeholder="요구사항 명칭" id="email" name="rdName" required><br/>
	                </div>
	                <div class="form-group">
	                  <label for="exampleInputPassword1">요구사항 내용</label>
	                  <textarea class="form-control rdcontent"  placeholder="내용을 입력하세요." name="rdContent" id="rdContent"></textarea>
              		</div>
              		<div class="form-group">
	                  <label for="exampleInputPassword1">인터페이스</label>
	                  <input type="text" class="form-control"  placeholder="인터페이스" name="interf" id="interf">
              		</div>
              		<div class="form-group">
	                  <label for="exampleInputPassword1">제한사항(규정/법률)</label>
	                  <input type="text" class="form-control"  placeholder="제한사항" name="limit" id="limit">
              		</div>
              		<div class="form-group">
	                	<label for="exampleInputPassword1">수용여부</label>
	                	<select class="inputPhone" name="acceptyn" id="acceptyn">
	                		<option value="" selected>---</option>
							<option value="1">1(y)</option>
					    	<option value="0">0(n)</option>
						</select>
              		</div>
              		<div class="form-group">
	                  <label for="exampleInputPassword1">담당자</label>
	                  	<select class="inputPhone" name="acceptyn" id="acceptyn">
	                  		<option value="" selected>---</option>
							<c:forEach items="${bindMember }" var="bindMember">
								<option value="${bindMember.id }">${bindMember.id }</option>
							</c:forEach>
						</select>
              		</div>
              <!-- /.box-body -->

	              <div class="modal-footer" style="text-align:center;">
	                <button type="button" class="btn btn-primary" onclick="back_go();" style="margin-left:18px;padding-left:20px;padding-right:20px;">취소</button>
	                <button type="button" class="btn btn-primary"  style="margin-left:63px;" id="findButton" disabled="disabled" onclick="findID();">아이디 찾기</button>
	              </div>
              
            	</form>
				</div>
			</div>
		</div>
	</div>
      <form id="jobForm">
        <input type='hidden' name="page" value="${pageMaker.cri.page}"/>
        <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
        <input type='hidden' name="searchType" value="${pageMaker.cri.searchType}"/>
        <input type='hidden' name="keyword" value="${pageMaker.cri.keyword}"/>
      </form>
   </section>
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <script>
   $("#btnExport").click(function (e) {
	   	window.open('<%=request.getContextPath()%>/project/requirement/toExcel?rdNum=${logonProject.rdNum}');
	    e.preventDefault();
	});
      // ---------------------------------------------------------------------------------
      // page-nav.start
      $(".link li a").on("click", function(event){
         event.preventDefault(); 
         var targetPage = $(this).attr("href");
         
         var jobForm = $("#jobForm");
          jobForm.find("[name='page']").val(targetPage);
         jobForm.attr("action","").attr("method", "get");      
         jobForm.submit();
      });
      // page-nav.end
      // ---------------------------------------------------------------------------------
      // open-postbox.satrt
      $('a.postboxLink').on('click', function(e) {
         e.preventDefault();
         var url = "<%=request.getContextPath()%>/postbox/list?id="+$(this).attr('href');
         window.open(url,"_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=900, height=800, top=300, left=300, ");
      });
      // open-postbox.end
      // ---------------------------------------------------------------------------------
      // location-href.start
      function modify_go() {
         frm.submit();
      }
      function hist_go() {
         location.href = '<%= request.getContextPath()%>/project/requirement/history';
      }
      // location-href.end
      // ---------------------------------------------------------------------------------
      // search.start
      function search_go() {
    	  location.href = 'list?page=1&searchType='+$('select[name=searchType]').val()+'&keyword='+$('input#keyword').val();
      }
      // search.end
      // ---------------------------------------------------------------------------------
   </script>
</body>