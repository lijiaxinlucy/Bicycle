
<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<html class="no-js">
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="Daos.*"%>
<%@ page import="java.util.*"%>
<head>
<title>总教练主页</title>
<meta charset=UTF-8>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen">
<link href="vendors/easypiechart/jquery.easy-pie-chart.css"
	rel="stylesheet" media="screen">
<link href="assets/styles.css" rel="stylesheet" media="screen">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<style type="text/css">
div {
	border-radius: 1px;
	border: 1px solidred;
	padding: 1px;
}

#test {
	min-height: 0px;
	overflow-y: auto;
	max-height: 500px;
}
</style>
</head>

<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="./HeadCoach.jsp">总教练主页</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> Login <i class="caret"></i>
						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="./hello.jsp">退出登录</a></li>
							</ul></li>
					</ul>
				</div>
				<div>
					<ul class="nav navbar-nav">
						<li ><a href="./HeadCoach.jsp">运动员管理</a></li>
						<li class="active"><a href="./User.jsp">用户管理</a></li>
						<li><a href="./athleteAllReport.jsp">运动员整体分析报告</a></li>
					</ul>
				</div>
			</div>

			<div class="row-fluid">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">用户信息</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">

							<div class="btn-group pull-right">
								<form class="navbar-form navbar-right" action="./searchCyclist"
									method="post" role="search">
									<div class="input-group">
										<select name="flagParam">
											<option value="areaID">按用户ID查找</option>
											<option value="name">按用户姓名查找</option>
										</select> <input type="text" name="realParam" class="form-control"
											placeholder="请输入关键字"> <span class="input-group-btn">
											<button class="btn btn-default" type="submit">查找</button>
										</span>
									</div>
									<!-- /input-group -->
								</form>
							</div>
							<div class="btn-group pull-left">
							</div>
							<div style="height:500px;width:100%;overflow:auto;"align="center">
							<table class="table" style="margin-bottom: 80px;">
								<thead bgcolor="#afeeee">
									<tr>
										<th>ID</th>
										<th>姓名</th>
										<th>角色</th>
										<th>密码</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
					<% 
					UserDao userDao=new UserDao();
					List<Object[]> list=userDao.getU();
					for(Object[] o:list){
					%>
										<td><%=o[0] %></td>
										<td><%=o[1] %></td>
										<td><%=o[2] %></td>
										<td><%=o[3] %></td>
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-primary">更改角色</button>
												<button type="button"
													class="btn btn-primary dropdown-toggle"
													data-toggle="dropdown">
													<span class="caret"></span>
												</button>
												<ul class="dropdown-menu" role="menu">
													<li><a href="./changeToHead?userid=<%=o[0]%>">总教练</a></li>
													<li class="divider"></li>
													<li><a href="./changeToN?userid=<%=o[0]%>">营养学科教练</a></li>
													<li class="divider"></li>
													<li><a href="./changeToD?userid=<%=o[0]%>">力学学科教练</a></li>
													<li class="divider"></li>
													<li><a href="./changeToR?userid=<%=o[0]%>">康复学科教练</a></li>
												</ul>
											</div>
										</td>
									</tr>
									<%
					}%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /block -->
			</div>
		</div>
	</div>
</div>
	<!--/.fluid-container-->
	<script src="vendors/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
	<script src="assets/scripts.js"></script>
</body>

</html>