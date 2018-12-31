<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">글 수정
                
              </h3>
              <!-- tools box -->
              
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
                
            <div class="box-body pad">
          
                  <label>제목</label>
                  <input type="text" class="form-control" placeholder="제목을 입력하세요">
              
                  <label>작성자</label>
                  <input type="text" class="form-control" readonly>
               </div>
            <div class="box-body pad">
              <form>
              		<label>내용</label>
                    <textarea id="editor1" class="form-control" name="editor1" rows="10" cols="80">
                   
                    </textarea>
              </form>
              <div style ="position: absolute; right:80px; width:60px; height:50px;  float:left">
            <button type="button" style="width:60px; height:30px"class="btn btn-block btn-info btn-sm" >수정</button>
            </div>
             <div style ="position: absolute; right:0; width:80px; height:50px;  float:left">
            <button type="button" style="width:60px; height:30px"class="btn btn-block btn-warning btn-sm">취소</button>
       		</div>
            </div>
          </div>
</body>
</html>