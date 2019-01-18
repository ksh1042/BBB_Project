<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 response.setHeader("Content-Disposition","attachment;filename=requirementList.xls");
 response.setHeader("Content-Description", "JSP Generated Data");
%>
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
	</style>
</head>
<body>
	<section class="content-header">
		<h1 style="cursor: pointer;">요구사항 정의서</h1>
	</section>
   <section class="content">
      <div>
         <div class="box">
            <div class="box-header">
               <div class="col-sm-6">
                  <h3 class="box-title"></h3>
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
                                 <td class="hidden-xs">${ require.manager }</td>
                                 
                              </tr>
                           </c:forEach>
                        </table>
                     </div>
                  </div>
                 
                     
                  </div>
               </div>
            </div>
            <!-- /.box-body -->
         </div>
         <!-- /.box -->
   </section>
   
</body>