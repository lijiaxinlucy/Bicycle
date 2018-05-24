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
				tuina= $("#tuina").val()
				
				data = {"zhiliang":zhiliang,"jiaodu":jiaodu,
					"midu":midu,"fengzu":fengzu,"tuina":tuina}
				
			  	htmlobj=$.ajax({type:'POST',url:"./predictR",data:data,success:function(resp){
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
						text: "睡眠时间与血清睾酮折线图"
					},
					data: [{
						type: "line", //change type to bar, line, area, pie, etc
						//indexLabel: "{y}", //Shows y value on all Data Points
						indexLabelFontColor: "#5A5757",
						indexLabelPlacement: "outside",
						dataPoints: [
							{x:	6.5 	,y:	15.61 	},
							{x:	7.0 	,y:	20.11 	},
							{x:	7.5 	,y:	22.79 	},
							{x:	8.0 	,y:	24.73 	},
							{x:	8.5 	,y:	25.22 	},
							{x:	9.0 	,y:	24.67 	},
							{x:	9.5 	,y:	22.64 	},
							{x:	10.0 	,y:	20.16 	},



						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer2", {
					animationEnabled: true,
					//exportEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title: {
						text: "血清睾酮与速度折线图"
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
							{x:	14 	,y:	0.714 	},
							{x:	15 	,y:	0.721 	},
							{x:	17 	,y:	0.732 	},
							{x:	18 	,y:	0.740 	},
							{x:	19 	,y:	0.736 	},
							{x:	20 	,y:	0.740 	},
							{x:	21 	,y:	0.760 	},
							{x:	22 	,y:	0.768 	},
							{x:	23 	,y:	0.770 	},
							{x:	24 	,y:	0.793 	},
							{x:	25 	,y:	0.795 	},


						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer3", {
					animationEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title:{
						text: "冰敷时间-速度柱状图"
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
							{ y: 0.754,  label: "冰敷时间<=10" },
							{ y: 0.771,  label: "冰敷时间11-15" },
							{ y: 0.786,  label: "冰敷时间16-20" },
							{ y: 0.757,  label: "冰敷时间>20" },
							
							
						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer4", {
					animationEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title:{
						text: "肌肉推拿时间-速度柱状图"
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
							{ y: 0.745,  label: "肌肉推拿时间<=10" },
							{ y: 0.752,  label: "肌肉推拿时间11-15" },
							{ y: 0.779,  label: "肌肉推拿时间16-20" },
							{ y: 0.782,  label: "肌肉推拿时间21-25" },
							
							
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
					<a class="brand" href="./RehabilitationCoach.jsp">康复学科教练主页</a>
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
								<a href="./RehabilitationCoach.jsp">运动员管理</a>
							</li>
							<li>
								<a>运动员康复学分析报告</a>
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
								String s = firstJythonScript.getRMsg();
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
									<th>精氨酸摄入量</th>
									<th>酪氨酸摄入量</th>
									<th>睡眠时间</th>
									<th>冰敷时间</th>
									<th>肌肉推拿康复时间</th>
									<th>预测速度</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td><input id="zhiliang" name="zhiliang" placeholder="输入精氨酸摄入量" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><input id="jiaodu" name="jiaodu" placeholder="输入酪氨酸摄入量" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><input id="midu" name="midu" placeholder="输入睡眠时间" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><input id="fengzu" name="fengzu" placeholder="输入冰敷时间" style="border:0px;border-bottom:#000000 1px solid;" /></td>
										<td><input id="tuina" name="tuina" placeholder="输入肌肉推拿康复时间" style="border:0px;border-bottom:#000000 1px solid;" /></td>
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