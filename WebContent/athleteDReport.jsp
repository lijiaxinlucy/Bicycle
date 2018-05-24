<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="dbutils.FirstJythonScript"%>
<!DOCTYPE html>
<html class="no-js">
	<meta charset=UTF-8>
	<head>
		<title>运动员分析报告</title>
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
			  	htmlobj=$.ajax({type:'POST',url:"./predictD",data:data,success:function(resp){
				  console.log("return2 :"+resp)
			  		//$("#predict").value =resp;
				  document.getElementById("predict").value =resp;
			  }});
			  console.log("click 预测")
			}
			window.onload = function() {

				var chart = new CanvasJS.Chart("chartContainer", {
					animationEnabled: true,
					//exportEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title: {
						text: "质量与滚动摩擦力折线图"
					},
					 axisY:{
						   minimum: 8,
						 },
					data: [{
						type: "line", //change type to bar, line, area, pie, etc
						indexLabel: "{y}", //Shows y value on all Data Points
						indexLabelFontColor: "#5A5757",
						indexLabelPlacement: "outside",
						dataPoints: [
							{x:	71	,y:	10.62 	},
							{x:	72	,y:	10.747	},
							{x:	73	,y:	10.897	},
							{x:	74	,y:	11.04	},
							{x:	75	,y:	11.14	},
							{x:	76	,y:	11.345	},
							{x:	77	,y:	11.5	},
							{x:	78	,y:	11.63	},
							{x:	79	,y:	11.81	},
							{x:	80	,y:	11.94	},




						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer2", {
					animationEnabled: true,
					//exportEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title: {
						text: "滚动摩擦力与速度折线图"
					},
					axisY:{
						   minimum: 0.5,
					},
					data: [{
						type: "line", //change type to bar, line, area, pie, etc
						//indexLabel: "{y}", //Shows y value on all Data Points
						indexLabelFontColor: "#5A5757",
						indexLabelPlacement: "outside",
						dataPoints: [
							{x:	10.65	,y:	0.820 	},
							{x:	10.80 	,y:	0.810 	},
							{x:	10.95	,y:	0.790 	},
							{x:	11.1	,y:	0.784 	},
							{x:	11.25	,y:	0.786 	},
							{x:	11.4	,y:	0.768 	},
							{x:	11.55	,y:	0.755 	},
							{x:	11.7	,y:	0.749 	},
							{x:	11.85	,y:	0.742 	},
							{x:	12		,y:	0.730 	},



						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer3", {
					animationEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title:{
						text: "迎风面积-风阻柱状图"
					},
					axisY: {
						title: "平均速度"
					},
					data: [{        
						type: "column",  
						//showInLegend: true, 
						legendMarkerColor: "grey",
						//legendText: "运动员-速度柱状图",
						dataPoints: [      
							{ y: 7.94,  label: "迎风面积0.45" },
							{ y: 10.13,  label: "迎风面积0.55" },
							{ y: 11.76,  label: "迎风面积0.65" },														
						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer4", {
					animationEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title:{
						text: "速度-风阻柱状图"
					},
					axisY: {
						title: "平均风阻"
					},
					data: [{        
						type: "column",  
						//showInLegend: true, 
						legendMarkerColor: "grey",
						dataPoints: [      
							{x:	0.730 	,y:	9.69 	},
							{x:	0.750 	,y:	9.417	},
							{x:	0.770 	,y:	10		},
							{x:	0.790 	,y:	10.77	},
							{x:	0.810 	,y:	11.27	},
							{x:	0.830 	,y:	11.9	},
							{x:	0.850 	,y:	13.863	},

							
							
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
					<a class="brand" href="./DynamicsCoach.jsp">力学学科教练主页</a>
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
								<a href="./DynamicsCoach.jsp">运动员管理</a>
							</li>
							<li>
								<a>运动员力学分析报告</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="row-fluid">
					<!-- block -->
					<div class="block" style="height:600px;overflow:auto;">
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
								String s = firstJythonScript.getDMsg();
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
							<div id="chartContainer" style="height: 370px; width: 30%; float: left; margin-left: 200px;"></div>
							<div id="chartContainer2" style="height: 370px; width: 30%; float: left; margin-left: 150px;"></div>
							
						</div>
						<div style="margin-bottom: 20px; height: 367px;">
							<div id="chartContainer3" style="height: 370px; width: 30%; float: left; margin-left: 200px;"></div>
							<div id="chartContainer4" style="height: 370px; width: 30%; float: left; margin-left: 150px;"></div>
						</div>
						<br />
						<hr />
						<br />
						
						<table class="table table-condensed" style="font-size: 15px; width: 90%;" align="center">
							<caption style="margin-bottom:20px;font-size: 25px">运动员BP神经网络成绩预测</caption>
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