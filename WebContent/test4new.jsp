<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="dbutils.FirstJythonScript"%>
<!DOCTYPE html>
<html class="no-js">
	<meta charset=UTF-8>
	<head>
		<title>总教练主页</title>
		<meta charset=UTF-8>
		<!-- Bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
		<link href="assets/styles.css" rel="stylesheet" media="screen">
		<style type="text/css">   
		div{ border-radius:1px;border:1px solidred;padding:1px;}   
		#test{min-height:0px;overflow-y:auto;max-height:500px;}   
		</style> 
		<script>
		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<![if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <[!endif]-->
		<script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
		<style>
			input:focus {
				outline: none;
				border-color: #cfdc00;
				box-shadow: 0 0 5px rgba(207, 220, 0, 0.4);
				border-radius: 5px;
			}
		</style>
		<script>
		console.log("do script")
			function requestPredict(){
				zhiliang = $("#zhiliang").val()
				jiaodu = $("#jiaodu").val()
				midu = $("#midu").val()
				fengzu = $("#fengzu").val()
				data = {"zhiliang":zhiliang,"jiaodu":jiaodu,
					"midu":midu,"fengzu":fengzu}
			  	htmlobj=$.ajax({type:'POST',url:"./predict",data:data,success:function(resp){
				  console.log("return2 :"+resp)
			  		//$("#predict").value =resp;
				  document.getElementById("predict").value =resp;
			  }});
			  console.log("click 预测")
			}
			window.onload = function() {

				var chart = new CanvasJS.Chart("chartContainer", {
					animationEnabled: true,
					exportEnabled: true,
					theme: "light1", // "light1", "light2", "dark1", "dark2"
					title: {
						text: "速度与身高/座高关系图"
					},
					data: [{
						type: "line", //change type to bar, line, area, pie, etc
						//indexLabel: "{y}", //Shows y value on all Data Points
						indexLabelFontColor: "#5A5757",
						indexLabelPlacement: "outside",
						dataPoints: [{
								x: 1.2,
								y: 2.2
							},
							{
								x: 2.3,
								y: 4.0
							},
							{
								x: 3.3,
								y: 5.0
							},
							{
								x: 4.3,
								y: 2.0
							},
						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer2", {
					animationEnabled: true,
					exportEnabled: true,
					theme: "light1", // "light1", "light2", "dark1", "dark2"
					title: {
						text: "Simple Column Chart with Index Labels"
					},
					data: [{
						type: "column", //change type to bar, line, area, pie, etc
						//indexLabel: "{y}", //Shows y value on all Data Points
						indexLabelFontColor: "#5A5757",
						indexLabelPlacement: "outside",
						dataPoints: [{
								x: 10,
								y: 71
							},
							{
								x: 20,
								y: 55
							},
							{
								x: 30,
								y: 50
							},
							{
								x: 40,
								y: 65
							},
							{
								x: 50,
								y: 92,
								indexLabel: "Highest"
							},
							{
								x: 60,
								y: 68
							},
							{
								x: 70,
								y: 38
							},

							{
								x: 80,
								y: 71
							},
							{
								x: 90,
								y: 48
							},
							{
								x: 100,
								y: 58
							},
							{
								x: 110,
								y: 38
							},
							{
								x: 120,
								y: 49
							},
							{
								x: 130,
								y: 21,
								indexLabel: "Lowest"
							}
						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer3", {
					animationEnabled: true,
					exportEnabled: true,
					theme: "light1", // "light1", "light2", "dark1", "dark2"
					title: {
						text: "Simple Column Chart with Index Labels"
					},
					data: [{
						type: "column", //change type to bar, line, area, pie, etc
						//indexLabel: "{y}", //Shows y value on all Data Points
						indexLabelFontColor: "#5A5757",
						indexLabelPlacement: "outside",
						dataPoints: [{
								x: 10,
								y: 71
							},
							{
								x: 20,
								y: 55
							},
							{
								x: 30,
								y: 50
							},
							{
								x: 40,
								y: 65
							},
							{
								x: 50,
								y: 92,
								indexLabel: "Highest"
							},
							{
								x: 60,
								y: 68
							},
							{
								x: 70,
								y: 38
							},
							{
								x: 80,
								y: 71
							},
							{
								x: 90,
								y: 54
							},
							{
								x: 100,
								y: 60
							},
							{
								x: 110,
								y: 36
							},
							{
								x: 120,
								y: 49
							},
							{
								x: 130,
								y: 21,
								indexLabel: "Lowest"
							}
						]
					}]
				});
				chart.render();
			}
		</script>
	</head>
	<body>
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					<a class="brand" href="#">总教练主页</a>
					<div class="nav-collapse collapse">
						<ul class="nav pull-right">
							<li class="dropdown">
								<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
									<i class="icon-user"></i> Login <i class="caret"></i>
								</a>
								<ul class="dropdown-menu">
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
								<a href="./ShowUser">运动员管理</a>
							</li>
							<li>
								<a href="./ShowAnnounce">运动员整体分析报告</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="row-fluid">
					<!-- block -->
					<div id="test">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">运动员信息</div>
						</div>
  						<div style="height:200px;width:100%;overflow:auto;"align="center">
						<table class="table table-striped" >
							<caption>关联规则表单</caption>
							<thead>
								<tr>
									<th>先决条件</th>
									<th>导出结果</th>
									<th>置信度</th>
								</tr>
							</thead>
							 <tbody>
							<%
								FirstJythonScript firstJythonScript = new FirstJythonScript();
								String s = firstJythonScript.getMsg();
								String[] lines = s.split("\r");
								int i =0;
								for (String ss : lines) {//一行数据
									String[] str=ss.split("\\*");//一行被*分开
									String aaaa = str.length+"";
									try{
										System.out.println("befor:"+ss);
										String a = str[0];
										String b = str[1];
										String c = str[2];
									}catch(Exception e){
										System.out.println("error:"+ss+"length is:"+str.length);
								}
									if(str.length!=3)
										continue;
							%>
							
							<tr>
								<td width="300" height="20"><%=str[0]%></td>
								<td width="300" height="20"><%=str[1]%> </td>
								<td width="200" height="20"><%=str[2] %></td>
							</tr>
							
							<%
									}
							%>
							</tbody></table></div>
						<hr />
						<div style="margin-bottom: 20px; height: 367px;">
							<div id="chartContainer" style="height: 370px; width: 30%; float: left; margin-left: 45px;"></div>
							<div id="chartContainer2" style="height: 370px; width: 30%; float: left; margin-left: 30px;"></div>
							<div id="chartContainer3" style="height: 370px; width: 30%; float: left; margin-left: 40px;"></div>
						</div>
						<br />
						<hr />
						<table class="table table-condensed" style="font-size: 15px; width: 70%;" align="center">
							<caption>运动员BP神经网络成绩预测</caption>
							<thead>
								<tr>
									<th>质量</th>
									<th>俯身角度</th>
									<th>空气密度</th>
									<th>风阻</th>
									<th>预测速度</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td><input id="zhiliang" name="zhiliang" placeholder="输入质量的大小" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><input id="jiaodu" name="jiaodu" placeholder="输入俯身角度的大小" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><input id="midu" name="midu" placeholder="输入空气密度的大小" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><input id="fengzu" name="fengzu" placeholder="输入风阻的大小" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><input id="predict" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><button class="btn btn-primary" value="预测" onclick="requestPredict(event)">预测</button></td>
									</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
				<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
				<!--/.fluid-container-->
				<script src="vendors/jquery-1.9.1.min.js"></script>
				<script src="bootstrap/js/bootstrap.min.js"></script>
				<script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
				<script src="assets/scripts.js"></script>
	</body>
</html>