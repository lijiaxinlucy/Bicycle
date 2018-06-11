<!DOCTYPE html>
<%@page import="Daos.*"%>
<%@page import="model.*"%>
<%@page import="model.Cyclists"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<html class="no-js">
    <head>
        <title>运动员营养学科</title>
             <meta charset=UTF-8>
        <!-- Bootstrap -->
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script
			  src="https://code.jquery.com/jquery-1.4.3.js"
			  integrity="sha256-DjMDo6DOyV68jDzD4Z/HHJlIf6ooawXQGj64zKTZC8c="
			  crossorigin="anonymous">
		</script>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    <body>
	<div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span></a>
                <a class="brand" href="./NutriologyCoach.jsp">营养学科教练</a>
				<div class="nav-collapse collapse">
                    <ul class="nav pull-right">
                        <li class="dropdown">
                           <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> 
						   <i class="icon-user"></i> Login <i class="caret"></i></a>
                              <ul class="dropdown-menu">
                                  <li><a tabindex="-1" href="./updatePassword.jsp?">修改密码</a></li>
                                  <li><a tabindex="-1" href="./Logout">退出登录</a></li></ul></ul></div><div>
						<ul class="nav navbar-nav">
							<li class="active"><a href="./NutriologyCoach.jsp">运动员管理</a></li>
							<li ><a href="./athleteNReport.jsp">运动员分析报告</a></li></ul></div></div>
				<div class="row-fluid" >
                <!-- block -->
			   <div class="block">
                   <div class="navbar navbar-inner block-header">
                       <div class="muted pull-left">修改运动员信息</div></div></div></div>
				<%int nid;
				String Nid,Sugar,Protein,Fat,Salt,Energy,Speed,Bs,Rbp,id;
				id=request.getParameter("id");
				Nid=request.getParameter("nid");
				Speed=request.getParameter("speed");
				Sugar=request.getParameter("sugar");
				Protein=request.getParameter("protein");
				Fat=request.getParameter("fat");
				Salt=request.getParameter("salt");
				Energy=request.getParameter("energy");
				Bs=request.getParameter("bs");
				Rbp=request.getParameter("rbp");
				nid=Integer.parseInt(Nid);
				%>
		<form class="form-horizontal" action="./updateOneAthMsg?cid=<%=id %>&nid=<%=nid %>" method="post">
			<div class="modal-body">
			<div class="control-group"><label class="control-label" for="input01">速度km/m</label><div class="controls"> 
			<input type="text"  class="input-xlarge" name="speed" placeholder="<%=Speed %>"> </div></div>
			<div class="control-group"><label class="control-label" for="input01">糖类摄入量/g</label><div class="controls"> 
			<input type="text" class="input-xlarge" name="suger" placeholder="<%=Sugar %>"> </div></div>
			<div class="control-group"><label class="control-label" for="input01">蛋白质摄入量/g</label><div class="controls"> 
			<input type="text" class="input-xlarge" name="protein" placeholder="<%=Protein %>"> </div></div>
			<div class="control-group"><label class="control-label" for="input01">脂肪摄入量/g</label><div class="controls"> 
			<input type="text"  class="input-xlarge" name="fat" placeholder="<%=Fat %>"> </div></div>
			<div class="control-group"><label class="control-label" for="input01">矿物盐和水/ml</label><div class="controls"> 
			<input type="text"   class="input-xlarge" name="salt" placeholder="<%=Salt %>"> </div></div>
			<div class="control-group"><label class="control-label" for="input01">血糖含量mmol/L</label><div class="controls"> 
			<input type="text"   class="input-xlarge" name="bs" placeholder="<%=Bs %>"> </div></div>
			<div class="control-group"><label class="control-label" for="input01">视黄醇结合蛋白mg/l</label><div class="controls"> 
			<input type="text"  class="input-xlarge" name="rbp" placeholder="<%=Rbp %>"> </div></div>
			<div class="control-group"><label class="control-label" for="input01">营养日摄入量/千卡</label><div class="controls"> 
			<input type="text"  class="input-xlarge" name="energy" placeholder="<%=Energy %>"> </div></div>
			</div>
			<!--表单到此结束。，点击提交把表单上传即可-->
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" >提交更改</button></div>
		</form>
		</div></div>
    </body>
</html>