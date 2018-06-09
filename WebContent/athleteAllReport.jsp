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
				tang=$("#tang").val()
				danbaizhi=$("#danbaizhi").val()
				zhifang=$("#zhifang").val()
				yan=$("#yan").val()
				jingansuan=$("#jingansuan").val()
				laoansuan=$("#laoansuan").val()
				shuimian=$("#shuimian").val()
				bingfu=$("#bingfu").val()
				anmo=$("#anmo").val()
				data = {"zhiliang":zhiliang,"jiaodu":jiaodu,
					"midu":midu,"fengzu":fengzu,"tang":tang,"danbaizhi":danbaizhi,"zhifang":zhifang
					,"yan":yan,"jingansuan":jingansuan,"laoansuan":laoansuan,"shuimian":shuimian,
					"bingfu":bingfu,"anmo":anmo}
			  	htmlobj=$.ajax({type:'POST',url:"./predictAll",data:data,success:function(resp){
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
						text: "糖摄入量与速度折线图"
					},
					 axisY:{
						   minimum: 0.72,
						 },
					data: [{
						type: "line", //change type to bar, line, area, pie, etc
						indexLabel: "{y}", //Shows y value on all Data Points
						indexLabelFontColor: "#5A5757",
						indexLabelPlacement: "outside",
						dataPoints: [
							{x:	620	,y:	0.738	},
							{x:	640	,y:	0.742	},
							{x:	660	,y:	0.759	},
							{x:	680	,y:	0.762	},
							{x:	700	,y:	0.774	},
							{x:	720	,y:	0.784	},
							{x:	740	,y:	0.79	},
							{x:	760	,y:	0.809	},
							{x:	780	,y:	0.815	},
							{x:	800	,y:	0.83	},
						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer2", {
					animationEnabled: true,
					//exportEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title: {
						text: "睡眠时间与速度折线图"
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
							{x:	6.5	,y:	0.745 	},
							{x:	7	,y:	0.772 	},
							{x:	7.5	,y:	0.799 	},
							{x:	8	,y:	0.820 	},
							{x:	8.5	,y:	0.816 	},
							{x:	9	,y:	0.808 	},
							{x:	9.5	,y:	0.790 	},
							{x:	10	,y:	0.770 	},
						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer3", {
					animationEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title:{
						text: "盐摄入量与速度柱状图"
					},
					axisY: {
						title: ""
					},
					axisY:{
						   minimum: 0.75,
					},
					data: [{        
						type: "line",  
						//showInLegend: true, 
						legendMarkerColor: "grey",
						//legendText: "运动员-速度柱状图",
						dataPoints: [      
							{x:	260	,y:	0.780 	},
							{x:	320	,y:	0.815 	},
							{x:	380	,y:	0.800 	},
							{x:	440	,y:	0.797 	},
							{x:	500	,y:	0.795 	},
							{x:	560	,y:	0.797 	},
							{x:	620	,y:	0.813 	},
							{x:	680	,y:	0.790 	},
							{x:	740	,y:	0.796 	},
							{x:	800	,y:	0.790 	},
														
						]
					}]
				});
				chart.render();
				var chart = new CanvasJS.Chart("chartContainer4", {
					animationEnabled: true,
					theme: "light2", // "light1", "light2", "dark1", "dark2"
					title:{
						text: "脂肪摄入量与糖柱状图"
					},
					axisY: {
						title: ""
					},
					axisY:{
						   minimum: 700,
					},
					data: [{        
						type: "column",  
						//showInLegend: true, 
						legendMarkerColor: "grey",
						dataPoints: [      
							{x:	110 	,y:	738.5	},
							{x:	120 	,y:	738.8	},
							{x:	130 	,y:	748	},
							{x:	140 	,y:	734.2	},
							{x:	150 	,y:	750.6	},
							{x:	160 	,y:	738.9	},
							{x:	170 	,y:	703.8	},
							{x:	180 	,y:	734.6	},
							{x:	190 	,y:	709.3	},
							{x:	200 	,y:	739.8	},


							
							
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
					<a class="brand" href="./HeadCoach.jsp">总教练主页</a>
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
							<li >
								<a href="./HeadCoach.jsp">运动员管理</a>
							</li>
							<li >
								<a href="./User.jsp">用户管理</a>
							</li>
							<li class="active">
								<a href="./athleteAllReport.jsp">运动员整体分析报告</a>
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
								String s = firstJythonScript.getAllMsg();
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
						
						<table class="table table-condensed" style="font-size: 14px; width: 80%;" align="center">
							<caption style="margin-bottom:20px;font-size: 25px">运动员BP神经网络成绩预测</caption>
							<thead>
								<tr>
									<th>质量</th>
									<th>俯身角度</th>
									<th>空气密度</th>
									<th>风阻</th>								
									<th>糖摄入量</th>
									<th>蛋白质摄入</th>
									<th>脂肪摄入量</th>
									<th>盐摄入量</th>
									<th>精氨酸</th>
									<th>酪氨酸</th>
									<th>睡眠时间</th>
									<th>冰敷时间</th>
									<th>按摩时间</th>
									<th>预测速度</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td><input id="zhiliang" name="zhiliang" placeholder="输入质量" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="jiaodu" name="jiaodu" placeholder="输入俯身角度" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="midu" name="midu" placeholder="输入空气密度" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="fengzu" name="fengzu" placeholder="输入风阻" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="tang" name="tang" placeholder="输入糖摄入量" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="danbaizhi" name="danbaizhi" placeholder="输入蛋白质摄入量" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="zhifang" name="zhifang" placeholder="输入脂肪摄入量" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="yan" name="yan" placeholder="输入盐摄入量" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="jingansuan" name="jingansuan" placeholder="输入精氨酸摄入量" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="laoansuan" name="laoansuan" placeholder="输入酪氨酸摄入量" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="shuimian" name="shuimian" placeholder="输入睡眠时间" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="bingfu" name="bingfu" placeholder="输入冰敷时间" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="anmo" name="anmo" placeholder="输入按摩时间" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><input id="predict" style="border:0px;border-bottom:#000000 1px solid;width:80px;font-size:10px" /></td>
										<td><button  type="button" class="btn btn-primary btn-xs" value="预测" onclick="requestPredict(event)">预测</button></td>
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