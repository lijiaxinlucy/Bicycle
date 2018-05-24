<!DOCTYPE html>
<%@page import="Daos.*"%>
<%@page import="model.*"%>
<%@page import="model.Cyclists"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<html class="no-js">
    <head>
        <title>运动员力学学科</title>
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
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <style type="text/css">   
		div{ border-radius:1px;border:1px solidred;padding:1px;}   
		#test{min-height:0px;overflow-y:auto;max-height:500px;}   
		</style> 
    </head>
    <body>
		<div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="./DynamicsCoach.jsp">力学学科教练</a>
					<div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> 
								<i class="icon-user"></i> Login <i class="caret"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="./Logout">退出登录</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
					</div>
					 <div>
						<ul class="nav navbar-nav">
							<li class="active"><a href="./DynamicsCoach.jsp">运动员管理</a></li>
							<li ><a href="./athleteDReport.jsp">运动员分析报告</a></li>	
						</ul>
					</div>
				</div>
				    <div class="row-fluid" >
                        <!-- block -->
						<div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">运动员信息</div>
                                <div  class="muted pull-right" style="color:red">红:高&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<div  class="muted pull-right" style="color:black">黑:普通&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<div  class="muted pull-right" style="color:#28FF28">绿:较低&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<div  class="muted pull-right" style="color:#0000C6">蓝:低&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">		
									<div class="btn-group pull-right">
									</div>
									<div class="btn-group pull-right"> 
									<!--  时间输入输出框 -->
									<%String id=request.getParameter("id");
									System.out.println("id是"+id);
									%>
									<form class="navbar-form navbar-right" action="./athleteDOneDay?id=<%=id %>" method="post">	
                                	<input type="date" id="searchdate"class="form-control" name="date1">
									<button class="btn btn-default" type="submit">查找日期</button>
									</form>
									</div>		<!--  结束时间输入输出框 -->
								
									<div class="btn-group pull-left">   
                                        <a data-toggle="modal" href="#addathlete"><button class="btn btn-success">录入 <i class="icon-plus icon-white"></i></button></a>
									</div>
									                                       &nbsp; &nbsp; &nbsp;
								      <button type="button" class="btn btn-default" data-toggle="modal"  href="#athletegraph1" >日期-速度折线图</button>
								        &nbsp; &nbsp; &nbsp;
								      <button type="button" class="btn btn-default" data-toggle="modal"  href="#athletegraph2" >日期-风阻折线图</button>
								       &nbsp; &nbsp; &nbsp;
								      <button type="button" class="btn btn-default" data-toggle="modal"  href="#athletegraph3" >日期-滚动摩擦力折线图</button>
									</div>
									<div id="test">
  									<table class="table" style=" margin-bottom: 80px;" summary="user infomation table" id="tableSort">
						              <thead bgcolor="#afeeee">
						              <tr class="info"></tr>
						                <tr style="text-align: center">
						                  	<th onclick="$.sortTable.sort('tableSort',0)" style="cursor: pointer;">训练时间</th>
						                  	<th onclick="$.sortTable.sort('tableSort',1)" style="cursor: pointer;">ID</th>						                  
						                  	<th onclick="$.sortTable.sort('tableSort',2)" style="cursor: pointer;">姓名</th>
										  	<th onclick="$.sortTable.sort('tableSort',3)" style="cursor: pointer;">年龄</th>
										  	<th onclick="$.sortTable.sort('tableSort',4)" style="cursor: pointer;">速度km/m</th>
										 	<th onclick="$.sortTable.sort('tableSort',4)" style="cursor: pointer;">质量(kg)</th>
											<th onclick="$.sortTable.sort('tableSort',5)" style="cursor: pointer;">空气密度(kg/m3)</th>
											<th onclick="$.sortTable.sort('tableSort',6)" style="cursor: pointer;">俯身角度(度)</th>
											<th onclick="$.sortTable.sort('tableSort',7)" style="cursor: pointer;">迎风面积(m2)</th>
											<th onclick="$.sortTable.sort('tableSort',8)" style="cursor: pointer;">滚动摩擦力(N)</th>
											<th onclick="$.sortTable.sort('tableSort',9)" style="cursor: pointer;">身高/座高</th>
											<th onclick="$.sortTable.sort('tableSort',10)" style="cursor: pointer;">风阻(N)</th>
										  <th></th>
						                </tr>
						              </thead>
						              <tbody>						             
						              <tr >
	                <%
   	                	System.out.println("该运动员id是"+id);
   	                	//String date=request.getParameter("date");
   	                	Cyclists c=new Cyclists();
   	                	C_dDao c_dDao=new C_dDao();
   	                	List<Integer> obj=c_dDao.getDid(id);
   	                	for(int str:obj){
   	                		//System.out.println("nid是"+str);
     	                DTableDao dTableDao=new DTableDao();
     	               List<Object[]> o=dTableDao.getDTableByDid(str);
     	                if(o!=null)
     	                {
	     	                for(Object[] list:o)
	     	                {
		                %>
				              <td class="date11"><%=list[0] %></td>
			                  <td><%=list[1] %></td>
			                  <td><%=list[2] %></td>
			                  <td><%=list[3] %></td>	
							  <td class="speed11"><%=list[4] %></td>	
							  <td ><%=list[5] %></td>	
							  <td><%=list[6] %></td>	
							  <td><%=list[7] %></td>	
							  <td class="salt11"><%=list[8] %></td>	
							  <td class="suger11"><%=list[9] %></td>	
							  <td><%=list[10] %></td>	
							  <td class="energy11"><%=list[11] %></td>	
							  <td>
									<div class="btn-group">
										<button type="button" class="btn btn-primary">操作</button>
										<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
											<span class="caret"></span>													
										</button>
										<ul class="dropdown-menu" role="menu">
											<li>
												<a data-toggle="modal" href="#changeathlete" onclick="changeCallback">修改</a>
											</li>
											<li class="divider"></li>
											<li><a href="./deleteDCyclist?did=<%=list[12] %>&id=<%=list[1] %>">删除</a></li>												
										</ul>
									</div></td></tr>
							   <%
	     	                	} 
     	                }
     	                else
     	                	response.sendRedirect("./error.jsp");}
   	                  %>
			</tbody></table></div></div> </div></div></div></div>
	       <!-- 模态框（Modal） -->
			<div class="modal fade" id="changeathlete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow="auto" style="display:none">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改运动信息</h4>
				<form class="form-horizontal" action="./updateOneAthMsg?cid=<%=id %>" method="post">
					<div class="modal-body">
					<div class="control-group"><label class="control-label" for="input01">速度km/m</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="speed"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">糖类摄入量/g</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="suger"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">蛋白质摄入量/g</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="protein"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">脂肪摄入量/g</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="fat"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">矿物盐和水/ml</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="salt"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">血糖含量mmol/L</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="bs"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">视黄醇结合蛋白mg/l</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="rbp"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">营养日摄入量/千卡</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="energy"> </div></div>
					</div>
					<!--表单到此结束。，点击提交把表单上传即可-->
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary">提交更改</button></div>
				</form></div>
				<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div></div>
			<% %>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="addathlete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow="auto" style="display:none">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">增加运动信息</h4>
				<form class="form-horizontal" action="./addOneDAthMsg?cid=<%=id %>" method="post">
				<div class="modal-body">
					<div class="control-group"><label class="control-label" for="input01">训练时间</label><div class="controls"> 
					<input type="date"  required="requered" class="form-control" name="date"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">质量(kg)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="weight"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">空气密度(kg/m3)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="air"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">俯身角度(度)</label><div class="controls"> 
					<input type="text" required="requered" class="input-xlarge" name="ang"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">迎风面积(m2)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="are"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">滚动摩擦力(N)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="f1"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">身高/座高</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="high"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">风阻(N)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="f2"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">速度(km/m)</label><div class="controls"> 
					<input type="text" required="requered"  class="input-xlarge" name="speed"> </div></div>
				</div>
				<!--表单到此结束。，点击提交把表单上传即可-->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="submit" class="btn btn-primary" value="添加" ></div>
				</form></div>
				<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div></div>
        <script>
		(function($){
		    $.extend($,{
		        //命名空间
		        sortTable:{
		            sort:function(tableId,Idx){
		                var table = document.getElementById(tableId);
		                var tbody = table.tBodies[0];
		                var tr = tbody.rows;
		         		console.log("a")
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
	<script type="text/javascript">
		var speed11 = document.getElementsByClassName("speed11");
		var suger11 = document.getElementsByClassName("suger11");
		var energy11= document.getElementsByClassName("energy11");
		var salt11= document.getElementsByClassName("salt11");
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
			<!-- 图表 -->
		<div class="modal fade" id="athletegraph1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow="auto" style="display:none">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">运动员图表</h4>
						<div class="modal-body">
						<div id="chartContainer1" style="height: 370px; width: 50%;"></div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 图表到此结束 -->
			<!-- 图表 -->
		<div class="modal fade" id="athletegraph2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow="auto" style="display:none">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">运动员图表</h4>
						<div class="modal-body">
						<div id="chartContainer2" style="height: 370px; width: 50%;"></div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 图表到此结束 -->
			<!-- 图表 -->
		<div class="modal fade" id="athletegraph3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow="auto" style="display:none">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">运动员图表</h4>
						<div class="modal-body">
						<div id="chartContainer3" style="height: 370px; width: 50%;"></div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 图表到此结束 -->
		<script>

		window.onload = function () {
			

			var speed11 =   document.getElementsByClassName("speed11");
			var date11=   document.getElementsByClassName("date11");
			var energy11=   document.getElementsByClassName("energy11");
			var suger11=   document.getElementsByClassName("suger11");
			var chart1arr1= new Array();
			for(j=0;j<speed11.length;j++){
				chart1arr1[j]=speed11[j].innerHTML;
			}
			var chart1arr2= new Array();
			for(j=0;j<date11.length;j++){
				chart1arr2[j]=date11[j].innerHTML;
			}
			var chart1arr3= new Array();
			for(j=0;j<energy11.length;j++){
				chart1arr3[j]=energy11[j].innerHTML;
			}
			var chart1arr4= new Array();
			for(j=0;j<suger11.length;j++){
				chart1arr4[j]=suger11[j].innerHTML;
			}
			
			var chart = new CanvasJS.Chart("chartContainer1", {
				animationEnabled: true,
				theme: "light2", // "light1", "light2", "dark1", "dark2"
				title:{
					text: "日期-速度折线图"
				},
				axisY: {
					title: "速度"
				},
				data: [{        
					type: "line",  
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
						{ y: chart1arr1[9]/1,  label: chart1arr2[9] },
						{ y: chart1arr1[10]/1,  label: chart1arr2[10] },
						{ y: chart1arr1[11]/1,  label: chart1arr2[11] },
						{ y: chart1arr1[12]/1,  label: chart1arr2[12] },
						{ y: chart1arr1[13]/1,  label: chart1arr2[13] },
						{ y: chart1arr1[14]/1,  label: chart1arr2[14] },
						{ y: chart1arr1[15]/1,  label: chart1arr2[15] },
						{ y: chart1arr1[16]/1,  label: chart1arr2[16] },
						{ y: chart1arr1[17]/1,  label: chart1arr2[17] },
						{ y: chart1arr1[18]/1,  label: chart1arr2[18] },
						{ y: chart1arr1[19]/1,  label: chart1arr2[19] },
						{ y: chart1arr1[20]/1,  label: chart1arr2[20] },
						{ y: chart1arr1[21]/1,  label: chart1arr2[21] },
						{ y: chart1arr1[22]/1,  label: chart1arr2[22] },
						{ y: chart1arr1[23]/1,  label: chart1arr2[23] },
						{ y: chart1arr1[24]/1,  label: chart1arr2[24] },
						{ y: chart1arr1[25]/1,  label: chart1arr2[25] },
						{ y: chart1arr1[26]/1,  label: chart1arr2[26] },
						{ y: chart1arr1[27]/1,  label: chart1arr2[27] },
						{ y: chart1arr1[28]/1,  label: chart1arr2[28] },
						{ y: chart1arr1[29]/1,  label: chart1arr2[29] },
						{ y: chart1arr1[30]/1,  label: chart1arr2[30] },
						{ y: chart1arr1[31]/1,  label: chart1arr2[31] },
						{ y: chart1arr1[32]/1,  label: chart1arr2[32] },
						{ y: chart1arr1[33]/1,  label: chart1arr2[33] },
						{ y: chart1arr1[34]/1,  label: chart1arr2[34] },
						{ y: chart1arr1[35]/1,  label: chart1arr2[35] },
						{ y: chart1arr1[36]/1,  label: chart1arr2[36] },
						{ y: chart1arr1[37]/1,  label: chart1arr2[37] },
						{ y: chart1arr1[38]/1,  label: chart1arr2[38] },
						{ y: chart1arr1[39]/1,  label: chart1arr2[39] },
						{ y: chart1arr1[40]/1,  label: chart1arr2[40] },
						{ y: chart1arr1[41]/1,  label: chart1arr2[41] },
						{ y: chart1arr1[42]/1,  label: chart1arr2[42] },
						{ y: chart1arr1[43]/1,  label: chart1arr2[43] },
						{ y: chart1arr1[44]/1,  label: chart1arr2[44] },
						{ y: chart1arr1[45]/1,  label: chart1arr2[45] },
						{ y: chart1arr1[46]/1,  label: chart1arr2[46] },
						{ y: chart1arr1[47]/1,  label: chart1arr2[47] },
						{ y: chart1arr1[48]/1,  label: chart1arr2[48] },
						{ y: chart1arr1[49]/1,  label: chart1arr2[49] },
						{ y: chart1arr1[50]/1,  label: chart1arr2[50] },
						{ y: chart1arr1[51]/1,  label: chart1arr2[51] },
						{ y: chart1arr1[52]/1,  label: chart1arr2[52] },
						{ y: chart1arr1[53]/1,  label: chart1arr2[53] },
						{ y: chart1arr1[54]/1,  label: chart1arr2[54] },
						{ y: chart1arr1[55]/1,  label: chart1arr2[55] },
						{ y: chart1arr1[56]/1,  label: chart1arr2[56] },
						{ y: chart1arr1[57]/1,  label: chart1arr2[57] },
						{ y: chart1arr1[58]/1,  label: chart1arr2[58] },
						{ y: chart1arr1[59]/1,  label: chart1arr2[59] },
						{ y: chart1arr1[60]/1,  label: chart1arr2[60] },
						{ y: chart1arr1[61]/1,  label: chart1arr2[61] },
						{ y: chart1arr1[62]/1,  label: chart1arr2[62] },
						{ y: chart1arr1[63]/1,  label: chart1arr2[63] },
						{ y: chart1arr1[64]/1,  label: chart1arr2[64] },
						{ y: chart1arr1[65]/1,  label: chart1arr2[65] },
						{ y: chart1arr1[66]/1,  label: chart1arr2[66] },
						{ y: chart1arr1[67]/1,  label: chart1arr2[67] },
						{ y: chart1arr1[68]/1,  label: chart1arr2[68] },
						{ y: chart1arr1[69]/1,  label: chart1arr2[69] },
						{ y: chart1arr1[70]/1,  label: chart1arr2[70] },
						{ y: chart1arr1[71]/1,  label: chart1arr2[71] },
						{ y: chart1arr1[72]/1,  label: chart1arr2[72] },
						{ y: chart1arr1[73]/1,  label: chart1arr2[73] },
						{ y: chart1arr1[74]/1,  label: chart1arr2[74] },
						{ y: chart1arr1[75]/1,  label: chart1arr2[75] },
						{ y: chart1arr1[76]/1,  label: chart1arr2[76] },
						{ y: chart1arr1[77]/1,  label: chart1arr2[77] },
						{ y: chart1arr1[78]/1,  label: chart1arr2[78] },
						{ y: chart1arr1[79]/1,  label: chart1arr2[79] },
						{ y: chart1arr1[80]/1,  label: chart1arr2[80] },
						{ y: chart1arr1[81]/1,  label: chart1arr2[81] },
						{ y: chart1arr1[82]/1,  label: chart1arr2[82] },
						{ y: chart1arr1[83]/1,  label: chart1arr2[83] },
						{ y: chart1arr1[84]/1,  label: chart1arr2[84] },
						{ y: chart1arr1[85]/1,  label: chart1arr2[85] },
						{ y: chart1arr1[86]/1,  label: chart1arr2[86] },
						{ y: chart1arr1[87]/1,  label: chart1arr2[87] },
						{ y: chart1arr1[88]/1,  label: chart1arr2[88] },
						{ y: chart1arr1[89]/1,  label: chart1arr2[89] },
						
					]
				}]
			});
			chart.render();
			var chart = new CanvasJS.Chart("chartContainer2", {
				animationEnabled: true,
				theme: "light2", // "light1", "light2", "dark1", "dark2"
				title:{
					text: "日期-风阻折线图"
				},
				axisY: {
					title: "风阻"
				},
				data: [{        
					type: "line",  
					//showInLegend: true, 
					legendMarkerColor: "grey",
					//legendText: "运动员-速度柱状图",
					dataPoints: [      
						{ y: chart1arr3[0]/1,  label: chart1arr2[0] },
						{ y: chart1arr3[1]/1,  label: chart1arr2[1] },
						{ y: chart1arr3[2]/1,  label: chart1arr2[2] },
						{ y: chart1arr3[3]/1,  label: chart1arr2[3] },
						{ y: chart1arr3[4]/1,  label: chart1arr2[4] },
						{ y: chart1arr3[5]/1,  label: chart1arr2[5] },
						{ y: chart1arr3[6]/1,  label: chart1arr2[6] },
						{ y: chart1arr3[7]/1,  label: chart1arr2[7] },
						{ y: chart1arr3[8]/1,  label: chart1arr2[8] },
						{ y: chart1arr3[9]/1,  label: chart1arr2[9] },
						{ y: chart1arr3[10]/1,  label: chart1arr2[10] },
						{ y: chart1arr3[11]/1,  label: chart1arr2[11] },
						{ y: chart1arr3[12]/1,  label: chart1arr2[12] },
						{ y: chart1arr3[13]/1,  label: chart1arr2[13] },
						{ y: chart1arr3[14]/1,  label: chart1arr2[14] },
						{ y: chart1arr3[15]/1,  label: chart1arr2[15] },
						{ y: chart1arr3[16]/1,  label: chart1arr2[16] },
						{ y: chart1arr3[17]/1,  label: chart1arr2[17] },
						{ y: chart1arr3[18]/1,  label: chart1arr2[18] },
						{ y: chart1arr3[19]/1,  label: chart1arr2[19] },
						{ y: chart1arr3[20]/1,  label: chart1arr2[20] },
						{ y: chart1arr3[21]/1,  label: chart1arr2[21] },
						{ y: chart1arr3[22]/1,  label: chart1arr2[22] },
						{ y: chart1arr3[23]/1,  label: chart1arr2[23] },
						{ y: chart1arr3[24]/1,  label: chart1arr2[24] },
						{ y: chart1arr3[25]/1,  label: chart1arr2[25] },
						{ y: chart1arr3[26]/1,  label: chart1arr2[26] },
						{ y: chart1arr3[27]/1,  label: chart1arr2[27] },
						{ y: chart1arr3[28]/1,  label: chart1arr2[28] },
						{ y: chart1arr3[29]/1,  label: chart1arr2[29] },
						{ y: chart1arr3[30]/1,  label: chart1arr2[30] },
						{ y: chart1arr3[31]/1,  label: chart1arr2[31] },
						{ y: chart1arr3[32]/1,  label: chart1arr2[32] },
						{ y: chart1arr3[33]/1,  label: chart1arr2[33] },
						{ y: chart1arr3[34]/1,  label: chart1arr2[34] },
						{ y: chart1arr3[35]/1,  label: chart1arr2[35] },
						{ y: chart1arr3[36]/1,  label: chart1arr2[36] },
						{ y: chart1arr3[37]/1,  label: chart1arr2[37] },
						{ y: chart1arr3[38]/1,  label: chart1arr2[38] },
						{ y: chart1arr3[39]/1,  label: chart1arr2[39] },
						{ y: chart1arr3[40]/1,  label: chart1arr2[40] },
						{ y: chart1arr3[41]/1,  label: chart1arr2[41] },
						{ y: chart1arr3[42]/1,  label: chart1arr2[42] },
						{ y: chart1arr3[43]/1,  label: chart1arr2[43] },
						{ y: chart1arr3[44]/1,  label: chart1arr2[44] },
						{ y: chart1arr3[45]/1,  label: chart1arr2[45] },
						{ y: chart1arr3[46]/1,  label: chart1arr2[46] },
						{ y: chart1arr3[47]/1,  label: chart1arr2[47] },
						{ y: chart1arr3[48]/1,  label: chart1arr2[48] },
						{ y: chart1arr3[49]/1,  label: chart1arr2[49] },
						{ y: chart1arr3[50]/1,  label: chart1arr2[50] },
						{ y: chart1arr3[51]/1,  label: chart1arr2[51] },
						{ y: chart1arr3[52]/1,  label: chart1arr2[52] },
						{ y: chart1arr3[53]/1,  label: chart1arr2[53] },
						{ y: chart1arr3[54]/1,  label: chart1arr2[54] },
						{ y: chart1arr3[55]/1,  label: chart1arr2[55] },
						{ y: chart1arr3[56]/1,  label: chart1arr2[56] },
						{ y: chart1arr3[57]/1,  label: chart1arr2[57] },
						{ y: chart1arr3[58]/1,  label: chart1arr2[58] },
						{ y: chart1arr3[59]/1,  label: chart1arr2[59] },
						{ y: chart1arr3[60]/1,  label: chart1arr2[60] },
						{ y: chart1arr3[61]/1,  label: chart1arr2[61] },
						{ y: chart1arr3[62]/1,  label: chart1arr2[62] },
						{ y: chart1arr3[63]/1,  label: chart1arr2[63] },
						{ y: chart1arr3[64]/1,  label: chart1arr2[64] },
						{ y: chart1arr3[65]/1,  label: chart1arr2[65] },
						{ y: chart1arr3[66]/1,  label: chart1arr2[66] },
						{ y: chart1arr3[67]/1,  label: chart1arr2[67] },
						{ y: chart1arr3[68]/1,  label: chart1arr2[68] },
						{ y: chart1arr3[69]/1,  label: chart1arr2[69] },
						{ y: chart1arr3[70]/1,  label: chart1arr2[70] },
						{ y: chart1arr3[71]/1,  label: chart1arr2[71] },
						{ y: chart1arr3[72]/1,  label: chart1arr2[72] },
						{ y: chart1arr3[73]/1,  label: chart1arr2[73] },
						{ y: chart1arr3[74]/1,  label: chart1arr2[74] },
						{ y: chart1arr3[75]/1,  label: chart1arr2[75] },
						{ y: chart1arr3[76]/1,  label: chart1arr2[76] },
						{ y: chart1arr3[77]/1,  label: chart1arr2[77] },
						{ y: chart1arr3[78]/1,  label: chart1arr2[78] },
						{ y: chart1arr3[79]/1,  label: chart1arr2[79] },
						{ y: chart1arr3[80]/1,  label: chart1arr2[80] },
						{ y: chart1arr3[81]/1,  label: chart1arr2[81] },
						{ y: chart1arr3[82]/1,  label: chart1arr2[82] },
						{ y: chart1arr3[83]/1,  label: chart1arr2[83] },
						{ y: chart1arr3[84]/1,  label: chart1arr2[84] },
						{ y: chart1arr3[85]/1,  label: chart1arr2[85] },
						{ y: chart1arr3[86]/1,  label: chart1arr2[86] },
						{ y: chart1arr3[87]/1,  label: chart1arr2[87] },
						{ y: chart1arr3[88]/1,  label: chart1arr2[88] },
						{ y: chart1arr3[89]/1,  label: chart1arr2[89] },
						
					]
				}]
			});
			chart.render();
			var chart = new CanvasJS.Chart("chartContainer3", {
				animationEnabled: true,
				theme: "light2", // "light1", "light2", "dark1", "dark2"
				title:{
					text: "日期-滚动摩擦力折线图"
				},
				axisY: {
					title: "滚动摩擦力"
				},
				data: [{        
					type: "line",  
					//showInLegend: true, 
					legendMarkerColor: "grey",
					//legendText: "运动员-速度柱状图",
					dataPoints: [      
						{ y: chart1arr4[0]/1,  label: chart1arr2[0] },
						{ y: chart1arr4[1]/1,  label: chart1arr2[1] },
						{ y: chart1arr4[2]/1,  label: chart1arr2[2] },
						{ y: chart1arr4[3]/1,  label: chart1arr2[3] },
						{ y: chart1arr4[4]/1,  label: chart1arr2[4] },
						{ y: chart1arr4[5]/1,  label: chart1arr2[5] },
						{ y: chart1arr4[6]/1,  label: chart1arr2[6] },
						{ y: chart1arr4[7]/1,  label: chart1arr2[7] },
						{ y: chart1arr4[8]/1,  label: chart1arr2[8] },
						{ y: chart1arr4[9]/1,  label: chart1arr2[9] },
						{ y: chart1arr4[10]/1,  label: chart1arr2[10] },
						{ y: chart1arr4[11]/1,  label: chart1arr2[11] },
						{ y: chart1arr4[12]/1,  label: chart1arr2[12] },
						{ y: chart1arr4[13]/1,  label: chart1arr2[13] },
						{ y: chart1arr4[14]/1,  label: chart1arr2[14] },
						{ y: chart1arr4[15]/1,  label: chart1arr2[15] },
						{ y: chart1arr4[16]/1,  label: chart1arr2[16] },
						{ y: chart1arr4[17]/1,  label: chart1arr2[17] },
						{ y: chart1arr4[18]/1,  label: chart1arr2[18] },
						{ y: chart1arr4[19]/1,  label: chart1arr2[19] },
						{ y: chart1arr4[20]/1,  label: chart1arr2[20] },
						{ y: chart1arr4[21]/1,  label: chart1arr2[21] },
						{ y: chart1arr4[22]/1,  label: chart1arr2[22] },
						{ y: chart1arr4[23]/1,  label: chart1arr2[23] },
						{ y: chart1arr4[24]/1,  label: chart1arr2[24] },
						{ y: chart1arr4[25]/1,  label: chart1arr2[25] },
						{ y: chart1arr4[26]/1,  label: chart1arr2[26] },
						{ y: chart1arr4[27]/1,  label: chart1arr2[27] },
						{ y: chart1arr4[28]/1,  label: chart1arr2[28] },
						{ y: chart1arr4[29]/1,  label: chart1arr2[29] },
						{ y: chart1arr4[30]/1,  label: chart1arr2[30] },
						{ y: chart1arr4[31]/1,  label: chart1arr2[31] },
						{ y: chart1arr4[32]/1,  label: chart1arr2[32] },
						{ y: chart1arr4[33]/1,  label: chart1arr2[33] },
						{ y: chart1arr4[34]/1,  label: chart1arr2[34] },
						{ y: chart1arr4[35]/1,  label: chart1arr2[35] },
						{ y: chart1arr4[36]/1,  label: chart1arr2[36] },
						{ y: chart1arr4[37]/1,  label: chart1arr2[37] },
						{ y: chart1arr4[38]/1,  label: chart1arr2[38] },
						{ y: chart1arr4[39]/1,  label: chart1arr2[39] },
						{ y: chart1arr4[40]/1,  label: chart1arr2[40] },
						{ y: chart1arr4[41]/1,  label: chart1arr2[41] },
						{ y: chart1arr4[42]/1,  label: chart1arr2[42] },
						{ y: chart1arr4[43]/1,  label: chart1arr2[43] },
						{ y: chart1arr4[44]/1,  label: chart1arr2[44] },
						{ y: chart1arr4[45]/1,  label: chart1arr2[45] },
						{ y: chart1arr4[46]/1,  label: chart1arr2[46] },
						{ y: chart1arr4[47]/1,  label: chart1arr2[47] },
						{ y: chart1arr4[48]/1,  label: chart1arr2[48] },
						{ y: chart1arr4[49]/1,  label: chart1arr2[49] },
						{ y: chart1arr4[50]/1,  label: chart1arr2[50] },
						{ y: chart1arr4[51]/1,  label: chart1arr2[51] },
						{ y: chart1arr4[52]/1,  label: chart1arr2[52] },
						{ y: chart1arr4[53]/1,  label: chart1arr2[53] },
						{ y: chart1arr4[54]/1,  label: chart1arr2[54] },
						{ y: chart1arr4[55]/1,  label: chart1arr2[55] },
						{ y: chart1arr4[56]/1,  label: chart1arr2[56] },
						{ y: chart1arr4[57]/1,  label: chart1arr2[57] },
						{ y: chart1arr4[58]/1,  label: chart1arr2[58] },
						{ y: chart1arr4[59]/1,  label: chart1arr2[59] },
						{ y: chart1arr4[60]/1,  label: chart1arr2[60] },
						{ y: chart1arr4[61]/1,  label: chart1arr2[61] },
						{ y: chart1arr4[62]/1,  label: chart1arr2[62] },
						{ y: chart1arr4[63]/1,  label: chart1arr2[63] },
						{ y: chart1arr4[64]/1,  label: chart1arr2[64] },
						{ y: chart1arr4[65]/1,  label: chart1arr2[65] },
						{ y: chart1arr4[66]/1,  label: chart1arr2[66] },
						{ y: chart1arr4[67]/1,  label: chart1arr2[67] },
						{ y: chart1arr4[68]/1,  label: chart1arr2[68] },
						{ y: chart1arr4[69]/1,  label: chart1arr2[69] },
						{ y: chart1arr4[70]/1,  label: chart1arr2[70] },
						{ y: chart1arr4[71]/1,  label: chart1arr2[71] },
						{ y: chart1arr4[72]/1,  label: chart1arr2[72] },
						{ y: chart1arr4[73]/1,  label: chart1arr2[73] },
						{ y: chart1arr4[74]/1,  label: chart1arr2[74] },
						{ y: chart1arr4[75]/1,  label: chart1arr2[75] },
						{ y: chart1arr4[76]/1,  label: chart1arr2[76] },
						{ y: chart1arr4[77]/1,  label: chart1arr2[77] },
						{ y: chart1arr4[78]/1,  label: chart1arr2[78] },
						{ y: chart1arr4[79]/1,  label: chart1arr2[79] },
						{ y: chart1arr4[80]/1,  label: chart1arr2[80] },
						{ y: chart1arr4[81]/1,  label: chart1arr2[81] },
						{ y: chart1arr4[82]/1,  label: chart1arr2[82] },
						{ y: chart1arr4[83]/1,  label: chart1arr2[83] },
						{ y: chart1arr4[84]/1,  label: chart1arr2[84] },
						{ y: chart1arr4[85]/1,  label: chart1arr2[85] },
						{ y: chart1arr4[86]/1,  label: chart1arr2[86] },
						{ y: chart1arr4[87]/1,  label: chart1arr2[87] },
						{ y: chart1arr4[88]/1,  label: chart1arr2[88] },
						{ y: chart1arr4[89]/1,  label: chart1arr2[89] },
					
					]
				}]
			});
			chart.render();
		}
		</script>
		
    </body>
</html>