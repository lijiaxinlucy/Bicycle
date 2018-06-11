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
					//exportEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title: {
						text: "糖摄入量与血糖含量折线图"
					},
					data: [{
						type: "line", //change type to bar, line, area, pie, etc
						//indexLabel: "{y}", //Shows y value on all Data Points
						indexLabelFontColor: "#5A5757",
						indexLabelPlacement: "outside",
						dataPoints: [
							{x:	620 	,y:	8.935 	},
							{x:	640 	,y:	8.92 	},
							{x:	660 	,y:	9.23 	},
							{x:	680 	,y:	9.31 	},
							{x:	700 	,y:	9.53 	},
							{x:	720 	,y:	9.76 	},
							{x:	740 	,y:	9.88 	},
							{x:	760 	,y:	10.33 	},
							{x:	780 	,y:	10.53 	},
							{x:	800 	,y:	10.69 	},




						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer2", {
					animationEnabled: true,
					//exportEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title: {
						text: "蛋白质与视黄醇结合蛋白折线图"
					},
					data: [{
						type: "line", //change type to bar, line, area, pie, etc
						//indexLabel: "{y}", //Shows y value on all Data Points
						indexLabelFontColor: "#5A5757",
						indexLabelPlacement: "outside",
						dataPoints: [
							{x:	65 	,y:	48.25 	},
							{x:	80 	,y:	50.55 	},
							{x:	95 	,y:	53.12 	},
							{x:	110 ,y:	53.51 	},
							{x:	125 ,y:	53.44 	},
							{x:	140 ,y:	49.78 	},
							{x:	155 ,y:	49.63 	},
							{x:	170 ,y:	51.62 	},
							{x:	185 ,y:	51.48 	},
							{x:	200 ,y:	50.32 	},



						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer3", {
					animationEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title:{
						text: "脂肪摄入量-营养柱状图"
					},
					axisY: {
						title: "平均营养"
					},
					data: [{        
						type: "column",  
						//showInLegend: true, 
						legendMarkerColor: "grey",
						dataPoints: [      
							{x:	110 	,y:	4445.00 	},
							{x:	120 	,y:	4550.00 	},
							{x:	130 	,y:	4583.00 	},
							{x:	140 	,y:	4671.00 	},
							{x:	150 	,y:	5032.00 	},
							{x:	160 	,y:	4871.00 	},
							{x:	170 	,y:	4956.00 	},
							{x:	180 	,y:	5135.00 	},
							{x:	190 	,y:	4962.00 	},
							{x:	200 	,y:	5247.00 	},

							
							
						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer4", {
					animationEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title:{
						text: "营养日摄入量-速度柱状图"
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
							{x:	4350 	,y:	0.740 	},
							{x:	4500 	,y:	0.746 	},
							{x:	4650 	,y:	0.762 	},
							{x:	4800 	,y:	0.752 	},
							{x:	4950 	,y:	0.768 	},
							{x:	5100 	,y:	0.766 	},
							{x:	5250 	,y:	0.793 	},
							{x:	5400 	,y:	0.797 	},
							{x:	5550 	,y:	0.807 	},
							{x:	5700 	,y:	0.800 	},

							
							
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
					<a class="brand" href="./NutriologyCoach.jsp">营养学科教练</a>
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
							<li ><a href="./NutriologyCoach.jsp">运动员管理</a></li>
							<li class="active"><a>运动员营养学分析报告</a></li>
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
									<th>糖类摄入量</th>
									<th>蛋白质摄入量</th>
									<th>脂肪摄入量</th>
									<th>无机盐摄入量</th>
									<th>预测速度</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td><input id="zhiliang" name="zhiliang" placeholder="输入糖类摄入量" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><input id="jiaodu" name="jiaodu" placeholder="输入蛋白质摄入量" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><input id="midu" name="midu" placeholder="输入脂肪摄入量" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><input id="fengzu" name="fengzu" placeholder="输入无机盐摄入量" style="border:0px;border-bottom:#000000 1px solid;" /></td>
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