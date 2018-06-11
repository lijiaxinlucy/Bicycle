<!DOCTYPE html>
<%@page import="Daos.*"%>
<%@page import="model.*"%>
<%@page import="model.Cyclists"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<html class="no-js">
    <head>
        <title>修改密码</title>
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
                <a class="brand" href="./updatePassword.jsp">修改密码</a>
				</div>
				<div class="row-fluid" >
                <!-- block -->
			   <div class="block">
                   <div class="navbar navbar-inner block-header">
                       </div></div></div>
				<%String userid=request.getParameter("userid");
				
				%>
		<form class="form-horizontal" action="./updatePassword?userid=<%= userid%>" method="post">
			<div class="modal-body">
			<div class="control-group"><label class="control-label" for="input01">原密码</label><div class="controls"> 
			<input type="password" required="requered" class="input-xlarge" name="password" > </div></div>
			<div class="control-group"><label class="control-label" for="input01">新密码</label><div class="controls"> 
			<input type="password" required="requered" class="input-xlarge" name="newPassword" > </div></div>
			<div class="control-group"><label class="control-label" for="input01">确认密码</label><div class="controls"> 
			<input type="password" required="requered" class="input-xlarge"  > </div></div>
			</div>
			<!--表单到此结束。，点击提交把表单上传即可-->
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" >提交更改</button></div>
		</form>
		</div></div>
    </body>
</html>