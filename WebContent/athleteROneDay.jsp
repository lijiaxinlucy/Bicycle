<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Daos.*"%>
<%@page import="model.*"%>
<%@page import="model.Cyclists"%>
<%@page import="java.util.*" %>
<html class="no-js">
    <head>
        <title>运动员康复学科</title>
             <meta charset=UTF-8>
        <!-- Bootstrap -->
        <script
			  src="https://code.jquery.com/jquery-1.4.3.js"
			  integrity="sha256-DjMDo6DOyV68jDzD4Z/HHJlIf6ooawXQGj64zKTZC8c="
			  crossorigin="anonymous">
		</script>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <style type="text/css">   
		div{ border-radius:1px;border:1px solidred;padding:1px;}   
		#test{min-height:0px;overflow-y:auto;max-height:500px;}   
		</style> 
    </head>
    <body>
		<div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">康复学科教练</a>
					<div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> 
								<i class="icon-user"></i> Login <i class="caret"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="./Logout">退出登录</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
					</div>
					 <div>
						<ul class="nav navbar-nav">
							<li class="active"><a href="./RehabilitationCoach.jsp">运动员管理</a></li>
							<li ><a href="./athleteRReport.jsp">运动员分析报告</a></li>	
						</ul>
					</div>
				</div>
				    <div class="row-fluid" >
                        <!-- block -->
						<div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">运动员信息</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">		
									<div class="btn-group pull-right">
									</div>
									<div class="btn-group pull-right"> 
									<!--  时间输入输出框 -->
									<%String id=request.getParameter("id");
									System.out.println("id是"+id);
									%>
									<form class="navbar-form navbar-right" action="./athleteROneDay?id=<%=id %>" method="post">	
                                	<input type="date" id="searchdate"class="form-control" name="date1">
									<button class="btn btn-default" type="submit">查找日期</button>
									</form>
									</div>		<!--  结束时间输入输出框 -->
									<div class="btn-group pull-left">   
                                        <a data-toggle="modal" href="#addathlete"><button class="btn btn-success">录入 <i class="icon-plus icon-white"></i></button></a>
									</div></div>
									<div id="test">
  									<table class="table" style=" margin-bottom: 80px;" summary="user infomation table" id="tableSort">
						              <thead bgcolor="#afeeee">
						              <tr class="info"></tr>
						                <tr style="text-align: center">
						                  <th onclick="$.sortTable.sort('tableSort',0)" style="cursor: pointer;">时间</th>
											<th onclick="$.sortTable.sort('tableSort',1)" style="cursor: pointer;">ID</th>
											<th onclick="$.sortTable.sort('tableSort',2)" style="cursor: pointer;">姓名</th>
											<th onclick="$.sortTable.sort('tableSort',3)" style="cursor: pointer;">年龄</th>
											<th onclick="$.sortTable.sort('tableSort',4)" style="cursor: pointer;">平均速度(Km/min)</th>
											<th onclick="$.sortTable.sort('tableSort',5)" style="cursor: pointer;">血红蛋白(g/dl)</th>
											<th onclick="$.sortTable.sort('tableSort',6)" style="cursor: pointer;">血清睾酮(nmol/L)</th>
											<th onclick="$.sortTable.sort('tableSort',7)" style="cursor: pointer;">血清肌酸激酶(U/L)</th>
											<th onclick="$.sortTable.sort('tableSort',8)" style="cursor: pointer;">精氨酸摄入量(g)</th>
											<th onclick="$.sortTable.sort('tableSort',9)" style="cursor: pointer;">酪氨酸摄入量(g)</th>
											<th onclick="$.sortTable.sort('tableSort',10)" style="cursor: pointer;">训练当天睡眠时间(h)</th>
											<th onclick="$.sortTable.sort('tableSort',11)" style="cursor: pointer;">伤痛关节冰敷时间(min)</th>
											<th onclick="$.sortTable.sort('tableSort',12)" style="cursor: pointer;">肌肉推拿康复时间(min)</th>
										  <th></th>
						                </tr>
						              </thead>
						              <tbody>						             
						                <tr >
	                <%
   	                	System.out.println("该运动员id是"+id);
   	                	String date=request.getParameter("date");
     	                RTableDao rTableDao=new RTableDao();
     	                List<Object[]> o=rTableDao.getRTableByDate(id, date);
     	                if(o!=null){
     	                for(Object[] list:o)
     	                {
	                %>
			              <td><%=list[0] %></td>
		                  <td><%=list[1] %></td>
		                  <td><%=list[2] %></td>
		                  <td><%=list[3] %></td>	
						  <td><%=list[4] %></td>	
						  <td><%=list[5] %></td>	
						  <td><%=list[6] %></td>	
						  <td><%=list[7] %></td>	
						  <td><%=list[8] %></td>	
						  <td><%=list[9] %></td>	
						  <td><%=list[10] %></td>	
						  <td><%=list[11] %></td>	
						  <td><%=list[12] %></td>
						  <td>
						 
											<div class="btn-group">
												<button type="button" class="btn btn-primary">操作</button>
												<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
													<span class="caret"></span>													
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a data-toggle="modal" href="#changeathlete">修改</a>
													</li>
													<li class="divider"></li>
													<li><a href="./deleteRCyclist?rid=<%=list[13] %>&id=<%=list[1] %>">删除</a></li>												
												</ul>
											</div>	
										  </td>
						                </tr>
						                <%
     	                	} 
     	                }
     	                
     	                else
     	                	response.sendRedirect("./error.jsp");
     	                 %>
						              </tbody>
						            </table>
                                </div>
                          </div>
                        </div>
                    </div>
			</div>
	</div>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="changeathlete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow="auto" style="display:none">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
						<h4 class="modal-title" id="myModalLabel">
					修改运动信息
				</h4>
				<div class="modal-body">
						<form class="form-horizontal">
						<div class="control-group"><label class="control-label" for="input01">身高</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">体重</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">运动成绩</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">白细胞数</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">红细胞数</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">血红蛋白</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">红细胞压积</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">红细胞平均体积</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">红细胞平均含量</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">平均红细胞血红蛋白浓度</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">血小板计数</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						</form>
				</div>
						<!--
                        	表单到此结束。，点击提交把表单上传即可
                        -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
							<button type="button" class="btn btn-primary">
					提交更改
				</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div></div>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="addathlete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow="auto" style="display:none">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
						<h4 class="modal-title" id="myModalLabel">
					增加运动信息
				</h4>
				<form class="form-horizontal" action="./addOneRAthMsg?cid=<%=id %>" method="post">
				<div class="modal-body">
					<div class="control-group"><label class="control-label" for="input01">训练时间</label><div class="controls"> 
					<input type="date"  required="requered" class="form-control" name="date"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">血红蛋白(g/dl)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="hgb"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">血清睾酮(nmol/L)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="sttt"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">血清肌酸激酶(U/L)</label><div class="controls"> 
					<input type="text" required="requered" class="input-xlarge" name="ck"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">精氨酸摄入量(g)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="arg"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">酪氨酸摄入量(g)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="tyr"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">训练当天睡眠时间(h)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="sleep"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">伤痛关节冰敷时间(min)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="ice"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">肌肉推拿康复时间(min)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="msg"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">速度(km/m)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="speed"> </div></div>
				</div>
				<!--表单到此结束。，点击提交把表单上传即可-->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="submit" class="btn btn-primary" value="添加">
				</div>
				</form>
				</div>
				<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div></div>
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
        <script>
		(function($){
		    //插件
		    $.extend($,{
		        //命名空间
		        sortTable:{
		            sort:function(tableId,Idx){
		                var table = document.getElementById(tableId);
		                var tbody = table.tBodies[0];
		                var tr = tbody.rows;
		         		console.log("a")
		                var trValue = new Array();
		                for (var i=0; i<tr.length; i++ ) {
		                    trValue[i] = tr[i];  //将表格中各行的信息存储在新建的数组中
		                }
		         
		                if (tbody.sortCol == Idx) {
		                    trValue.reverse(); //如果该列已经进行排序过了，则直接对其反序排列
		                } else {
		                    //trValue.sort(compareTrs(Idx));  //进行排序
		                    trValue.sort(function(tr1, tr2){
		                        var value1 = tr1.cells[Idx].innerHTML;
		                        var value2 = tr2.cells[Idx].innerHTML;
		                        return value1.localeCompare(value2);
		                    });
		                }
		                var fragment = document.createDocumentFragment();  //新建一个代码片段，用于保存排序后的结果
		                for (var i=0; i<trValue.length; i++ ) {
		                    fragment.appendChild(trValue[i]);
		                }
		         
		                tbody.appendChild(fragment); //将排序的结果替换掉之前的值
		                tbody.sortCol = Idx;
		            }
		        }
		    });      
		})(jQuery);
	</script>
    </body>
</html>