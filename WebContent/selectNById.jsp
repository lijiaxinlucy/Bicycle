<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<html class="no-js">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="Daos.*" %>
<%@ page import="java.util.*" %>
	<head>
		<title>营养学科教练主页</title>
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
	</head>

	<body>
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					<a class="brand" href="#">营养学科教练</a>
					<div class="nav-collapse collapse">
						<ul class="nav pull-right">
							<li class="dropdown">
								<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
									<i class="icon-user"></i> Login <i class="caret"></i>
								</a>
								<ul class="dropdown-menu">
								<li>
										<a tabindex="-1" href="./updatePassword.jsp?">修改密码</a>
									</li>
									<li>
										<a tabindex="-1" href="./hello.jsp">退出登录</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					<div>
						<ul class="nav navbar-nav">
							<li class="active">
								<a href="./NutriologyCoach.jsp" id="gardCyclist">运动员管理</a>
							</li>
							<li>
								<a href="./showReports">运动员分析报告</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="row-fluid" id="showCyclist">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">运动员信息</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<div class="btn-group pull-right">
									<form class="navbar-form navbar-right" action="./searchCyclist" method="post" role="search">
										<div class="input-group">
											<select name="flagParam">
												<option value="areaID">按运动员ID查找</option>
												<option value="name">按运动员姓名查找</option>
											</select>
											<input type="text" name="realParam" class="form-control" placeholder="请输入关键字">
											<span class="input-group-btn">
													<button class="btn btn-default" type="submit">查找</button>
											</span>
										</div>
										<!-- /input-group -->
									</form>
								</div>
								<div class="btn-group pull-left">
									<a href="./Nutriologyadd.jsp"><button class="btn btn-success">批量添加运动员记录 <i class="icon-plus icon-white"></i></button></a>
								</div>
								<div class="btn-group pull-left">
									<h5>最近一天训练数据</h5>
								</div>
								<div class="btn-group pull-left"> 
									<!--  时间输入输出框 -->
									<form class="navbar-form navbar-right" action="./showOneDay" method="post" role="search">
										<div class="input-group">
											<input type="date" id="startdate" class="form-control" width=2px name="date">
											<button class="btn btn-default" type="submit">查找日期</button>
										</div>
									</form>
								</div>
								<table class="table" style=" margin-bottom: 80px;"  summary="user infomation table" id="tableSort">
									<thead>
										<tr>
											<th onclick="$.sortTable.sort('tableSort',0)" style="cursor: pointer;">ID</th>
											<th onclick="$.sortTable.sort('tableSort',1)" style="cursor: pointer;">姓名</th>
											<th onclick="$.sortTable.sort('tableSort',2)" style="cursor: pointer;">性别</th>
											<th onclick="$.sortTable.sort('tableSort',3)" style="cursor: pointer;">身高</th>
											<th onclick="$.sortTable.sort('tableSort',4)" style="cursor: pointer;">体重</th>
											<th onclick="$.sortTable.sort('tableSort',5)" style="cursor: pointer;">运动成绩</th>
											<th onclick="$.sortTable.sort('tableSort',6)" style="cursor: pointer;">白细胞数</th>
											<th onclick="$.sortTable.sort('tableSort',7)" style="cursor: pointer;">红细胞数</th>
											<th onclick="$.sortTable.sort('tableSort',8)" style="cursor: pointer;">血红蛋白</th>
											<th onclick="$.sortTable.sort('tableSort',9)" style="cursor: pointer;">红细胞压积</th>
											<th onclick="$.sortTable.sort('tableSort',10)" style="cursor: pointer;">红细胞平均体积</th>
											<th onclick="$.sortTable.sort('tableSort',11)" style="cursor: pointer;">红细胞平均含量</th>
											<th onclick="$.sortTable.sort('tableSort',12)" style="cursor: pointer;">平均红细胞血红蛋白浓度</th>
											<th onclick="$.sortTable.sort('tableSort',13)" style="cursor: pointer;">血小板计数</th>
										</tr>
									</thead>
									<tbody>
										<tr >
					<% 
					Date date=new Date();
					DateFormat simDateFormat=new SimpleDateFormat("yyyy-MM-dd");
					String punString=simDateFormat.format(date);
					NTableDao nTableDao=new NTableDao();
					List<Object[]> result=nTableDao.getNTable(punString);
					if(result!=null){
					for(Object[] obj: result ){
					%>
											<td><a href="./Nutriologyathlete.jsp?id=<%=obj[0] %>"><%=obj[0] %></a></td>
											<td ><a href="./Nutriologyathlete.jsp?id=<%=obj[0] %>"><%=obj[1] %></a></td>
											<td><%=obj[2] %></td>
											<td><%=obj[3] %></td>
											<td><%=obj[4] %></td>
											<td><%=obj[5] %></td>
											<td><%=obj[6] %></td>
											<td><%=obj[7] %></td>
											<td><%=obj[8] %></td>
											<td><%=obj[9] %></td>
											<td><%=obj[10] %></td>
											<td><%=obj[11] %></td>
											<td><%=obj[12] %></td>
											<td><%=obj[13] %></td>
										</tr>
										<%} 
										}%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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