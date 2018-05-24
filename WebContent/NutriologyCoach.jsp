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
					<a class="brand">营养学科教练</a>
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
								<a href="./NutriologyCoach.jsp" id="gardCyclist">运动员管理</a>
							</li>
							<li>
								<a>运动员分析报告</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="row-fluid" id="showCyclist">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">运动员信息</div>
							<div  class="muted pull-right" style="color:red">红:高&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<div  class="muted pull-right" style="color:black">黑:普通&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<div  class="muted pull-right" style="color:#28FF28">绿:较低&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<div  class="muted pull-right" style="color:#0000C6">蓝:低&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							
						</div>
						<%Date date=new Date(); %>
						<div class="block-content collapse in">
							<div class="span12">
								<div class="btn-group pull-right">
									<form class="navbar-form navbar-right" action="./searchCyclist?date=<%=date %>" method="post" role="search">
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
								<form  action="./insertData" method="post" enctype="multipart/form-data">
									<input  class="form-control" type="file" id="id1" name="name1" value="选择文件">
									 <input  type="submit" class="btn btn-default">批量添加 
									<i class="icon-plus icon-white"></i>
									
								</form>
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
								&nbsp; &nbsp; &nbsp;
								<button type="button" class="btn btn-default" data-toggle="modal"  href="#athletegraph1" >运动员-速度柱状图</button>
								<table class="table" style="  margin-bottom: 80px;"  summary="user infomation table" id="tableSort">
								<thead bgcolor="#afeeee">
								<tr>
								<th onclick="$.sortTable.sort('tableSort',0)" style="cursor: pointer;">ID</th>
								<th onclick="$.sortTable.sort('tableSort',1)" style="cursor: pointer;">姓名</th>
								<th onclick="$.sortTable.sort('tableSort',2)" style="cursor: pointer;">年龄</th>
								<th onclick="$.sortTable.sort('tableSort',3)" style="cursor: pointer;">时间</th>
								<th onclick="$.sortTable.sort('tableSort',4)" style="cursor: pointer;">糖类摄入量/g</th>
								<th onclick="$.sortTable.sort('tableSort',5)" style="cursor: pointer;">蛋白质摄入量/g</th>
								<th onclick="$.sortTable.sort('tableSort',6)" style="cursor: pointer;">脂肪摄入量/g</th>
								<th onclick="$.sortTable.sort('tableSort',7)" style="cursor: pointer;">矿物盐和水/ml</th>
								<th onclick="$.sortTable.sort('tableSort',8)" style="cursor: pointer;">血糖含量mmol/L</th>
								<th onclick="$.sortTable.sort('tableSort',9)" style="cursor: pointer;">视黄醇结合蛋白mg/l</th>
								<th onclick="$.sortTable.sort('tableSort',10)" style="cursor: pointer;">营养日摄入量/千卡</th>
								<th onclick="$.sortTable.sort('tableSort',11)" style="cursor: pointer;">速度km/m</th>
								</tr>
								</thead>
									<tbody>
										<tr >
					<% 
					DateFormat simDateFormat=new SimpleDateFormat("yyyy-MM-dd");
					String punString=simDateFormat.format(date);
					System.out.println(punString);
					NTableDao nTableDao=new NTableDao();
					List<Object[]> result=nTableDao.getNTable(punString);
					//System.out.println(result.size());
					if(result!=null){
					for(Object[] obj: result ){
					%>
											<td><a href="./Nutriologyathlete.jsp?id=<%=obj[0] %>"><%=obj[0] %></a></td>
											<td ><a class="name11" href="./Nutriologyathlete.jsp?id=<%=obj[0] %>"><%=obj[1] %></a></td>
											<td><%=obj[2] %></td>
											<td><%=obj[3] %></td>
											<td class="suger11"><%=obj[4] %></td>
											<td><%=obj[5] %></td>
											<td><%=obj[6] %></td>
											<td class="salt11"><%=obj[7] %></td>
											<td><%=obj[8] %></td>
											<td><%=obj[9] %></td>
											<td class="energy11"><%=obj[10] %></td>
											<td class="speed11"><%=obj[11] %></td>
										</tr>
										<%}
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
		<script type="text/javascript">
		var speed11 =   document.getElementsByClassName("speed11");
		var suger11 =   document.getElementsByClassName("suger11");
		var energy11=   document.getElementsByClassName("energy11");
		var salt11=   document.getElementsByClassName("salt11");
		for(i=0;i<speed11.length;i++){
			if(speed11[i].innerHTML<0.64){
				speed11[i].style.color='#0000C6';
			}
			else
				if(speed11[i].innerHTML<0.72){
					speed11[i].style.color='#28FF28';
					
				}
				else
					if(speed11[i].innerHTML>0.79){
						speed11[i].style.color='red';
						
					}
			
		}
		for(i=0;i<energy11.length;i++){
			if(energy11[i].innerHTML<3375){
				energy11[i].style.color='#0000C6';
			}
			else
				if(energy11[i].innerHTML<4450){
					energy11[i].style.color='#28FF28';
					
				}
				else
					if(energy11[i].innerHTML>5125){
						energy11[i].style.color='red';
						
					}
			
		}
		for(i=0;i<suger11.length;i++){
			if(suger11[i].innerHTML<566){
				suger11[i].style.color='#0000C6';
			}
			else
				if(suger11[i].innerHTML>682){
					suger11[i].style.color='red';
					
				}
			
		}
		for(i=0;i<salt11.length;i++){
			if(salt11[i].innerHTML<400){
				salt11[i].style.color='#0000C6';
			}
			else
				if(salt11[i].innerHTML>600){
					salt11[i].style.color='red';
					
				}
			
		}
		</script>
				<script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
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
	<!-- 图表 -->
		<div class="modal fade" id="athletegraph1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow="auto" style="display:none">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">运动员图表</h4>
						<div class="modal-body">
						<div id="chartContainer1" style="height: 370px;"></div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 图表到此结束 -->
		<script>

		window.onload = function () {
			

			var speed11 =   document.getElementsByClassName("speed11");
			var name11=   document.getElementsByClassName("name11");
			var chart1arr1= new Array();
			for(j=0;j<speed11.length;j++){
				chart1arr1[j]=speed11[j].innerHTML;
			}
			var chart1arr2= new Array();
			for(j=0;j<name11.length;j++){
				chart1arr2[j]=name11[j].innerHTML;
			}
			var chart = new CanvasJS.Chart("chartContainer1", {
				animationEnabled: true,
				theme: "light2", // "light1", "light2", "dark1", "dark2"
				title:{
					text: "运动员-速度柱状图"
				},
				axisY: {
					title: "速度"
				},
				data: [{        
					type: "column",  
					//showInLegend: true, 
					legendMarkerColor: "grey",
					//legendText: "运动员-速度柱状图",
					dataPoints: [      
						{ y: chart1arr1[0]/1,  label: chart1arr2[0] },
						{ y: chart1arr1[1]/1,  label: chart1arr2[1] },
						{ y: chart1arr1[2]/1,  label: chart1arr2[2] },
						{ y: chart1arr1[3]/1,  label: chart1arr2[3] },
						{ y: chart1arr1[4]/1,  label: chart1arr2[4] },
						{ y: chart1arr1[5]/1,  label: chart1arr2[5] },
						{ y: chart1arr1[6]/1,  label: chart1arr2[6] },
						{ y: chart1arr1[7]/1,  label: chart1arr2[7] },
						{ y: chart1arr1[8]/1,  label: chart1arr2[8] },
						{ y: chart1arr1[9]/1,  label: chart1arr2[9] }
						
						
					]
				}]
			});
			chart.render();
		}
		</script>
	</body>
</html>