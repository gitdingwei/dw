
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="biaoqian.jsp" flush="true" ></jsp:include>
</head>
<body>


<input type="button" href="#modal-container-508750" data-toggle='modal' class="btn btn-info" value="新增"/>
  <table id="as"></table>

<form class="form-login" id="adddw" >
    <div class="modal fade" id="modal-container-508750" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                    <h4 class="modal-title" id="myModalLabel">新增</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="dwname" placeholder="名称">
                        </div>
                    </div>
                    <br>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">年龄</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="dwage" placeholder="年龄">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
                        <button class="btn btn-primary" type="button" onclick="adddw()">保存</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>


<div class="modal fade" id="modal-container-123456" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
    <form class="form-login" id="hui" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                    <h4 class="modal-title">修改</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="dwid"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="dwname" placeholder="流程名称">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="dwage" placeholder="年龄">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary" type="button" onclick="updatedw()">保存</button>
                </div>
            </div>

        </div>
    </form>
</div>


  <script>

      $(function(){
          $('#as').bootstrapTable({
              url:'<%=request.getContextPath()%>/dw/querydw',
              striped: true,//隔行变色
              showPaginationSwitch:true,//是否显示 数据条数选择框
              minimumCountColumns:1,//最小留下一个
              showRefresh:true,//显示刷新按钮
              showToggle:true,//显示切换视图
              search:true,//是否显示搜索框
              searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方
              //bootstrap默认是客户端分页client 若写服务端则出不来结果server
              sidePagination:"",//
              pagination:true,//开启分页
              paginationLoop:true,//开启分页无限循环
              pageNumber:1,//当前页数
              pageSize:3,//每页条数
              pageList:[1,3,5],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
              method:'post',//发送请求的方式
              contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
              columns:[[
                  {field:'dwid',title:'id',width:100},
                  {field:'dwname',title:'姓名',width:100},
                  {field:'dwage',title:'年龄',width:100},
                  {field:'caozuo',title:'操作',width:100,
                      formatter:function(value,row,index){
                          return '<button type="button" class="btn btn-default" onclick="deletedw('+row.dwid+')">删除</button>&nbsp;&nbsp;'+
                                  '<button href="#modal-container-123456"   data-toggle="modal" type="button" class="btn btn-primary" onclick="queryhui('+row.dwid+')">修改</button>';
                      }}
              ]]
          })
      })

  function adddw() {
       $.ajax({
           url:"<%=request.getContextPath()%>/dw/adddw",
           type:"post",
           data:$("#adddw").serialize(),
           dataType:"text",
           success:function(){
               location.reload();
           },error:function () {
               alert("dw")
           }
       })
  }

      function deletedw(dwid) {
          $.ajax({
              url:"<%=request.getContextPath()%>/dw/deletedw",
              type:"post",
              data:{"dwid":dwid},
              dataType:"text",
              success:function(){
                  location.reload();
              },error:function(){
                  alert("dw")
              }
          })
      }

      function queryhui(dwid) {
          $.ajax({
              url:"<%=request.getContextPath()%>/dw/queryhui",
              type:"post",
              data:{"dwid":dwid},
              dataType:"json",
              success:function (s) {
                  $("[name='dwid']").val(s.dwid);
                  $("[name='dwname']").val(s.dwname);
                  $("[name='dwage']").val(s.dwage);
              },error:function(){
                  alert(dw)
              }
          })
      }

      function updatedw() {
          $.ajax({
              url:"<%=request.getContextPath()%>/dw/updatedw",
              type:"post",
              data:$("#hui").serialize(),
              dataType:"text",
              success:function () {
                  location.reload();
              },error:function () {
                  alert("dw")
              }
          })

      }
  </script>
</body>
</html>
