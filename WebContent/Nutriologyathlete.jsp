
<!DOCTYPE html>
<%@page import="Daos.Blood_RoutineDao"%>
<%@page import="Daos.C_brDao"%>
<%@page import="model.C_br"%>
<%@page import="model.Cyclists"%>
<%@page import="java.util.*" %>
<html class="no-js">
    <head>
        <title>运动员营养学科</title>
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
                    <a class="brand" href="#">营养学科教练</a>
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
							<li class="active"><a href="./NutriologyCoach.jsp">运动员管理</a></li>
							<li ><a href="./ShowAnnounce">运动员分析报告</a></li>	
						</ul>
					</div>
				</div>
				    <div class="row-fluid">
                        <!-- block -->
						<div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">运动员信息</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">		
									<div class="btn-group pull-right">
									</div>
									<div class="btn-group pull-right"> 
									<!--  时间输入输出框 -->
									<form class="navbar-form navbar-right" action="./athleteOneDay" method="post">	
                                	<h5><input type="date" id="searchdate"class="form-control" name="date"></h5>
									<button class="btn btn-default" type="submit">查找日期</button>
									</form>
									</div>		<!--  结束时间输入输出框 -->
		
									<div class="btn-group pull-left">                  
                                         <a href="#"><button class="btn btn-success">批量导入 <i class="icon-plus icon-white"></i></button></a>
									</div>
									<div class="btn-group pull-left">   
                                        <a data-toggle="modal" href="#addathlete"><button class="btn btn-success">录入 <i class="icon-plus icon-white"></i></button></a>
									</div>	
  									<table class="table" style=" margin-bottom: 80px;" summary="user infomation table" id="tableSort">
						              <thead bgcolor="#afeeee">
						              <tr class="info"></tr>
						                <tr>
						                  <th onclick="$.sortTable.sort('tableSort',0)" style="cursor: pointer;">训练时间</th>
						                  <th onclick="$.sortTable.sort('tableSort',1)" style="cursor: pointer;">ID</th>						                  
						                  <th onclick="$.sortTable.sort('tableSort',2)" style="cursor: pointer;">姓名</th>
										  <th onclick="$.sortTable.sort('tableSort',3)" style="cursor: pointer;">性别</th>
										  <th onclick="$.sortTable.sort('tableSort',4)" style="cursor: pointer;">身高</th>
										  <th onclick="$.sortTable.sort('tableSort',5)" style="cursor: pointer;">体重</th>
										  <th onclick="$.sortTable.sort('tableSort',6)" style="cursor: pointer;">运动成绩</th>
										  <th onclick="$.sortTable.sort('tableSort',7)" style="cursor: pointer;">白细胞数</th>	
										  <th onclick="$.sortTable.sort('tableSort',8)" style="cursor: pointer;">红细胞数</th>
										  <th onclick="$.sortTable.sort('tableSort',9)" style="cursor: pointer;">血红蛋白</th>	
										  <th onclick="$.sortTable.sort('tableSort',10)" style="cursor: pointer;">红细胞压积</th>	
										  <th onclick="$.sortTable.sort('tableSort',11)" style="cursor: pointer;">红细胞平均体积</th>	
										  <th onclick="$.sortTable.sort('tableSort',12)" style="cursor: pointer;">红细胞平均含量</th>	
										  <th onclick="$.sortTable.sort('tableSort',13)" style="cursor: pointer;">平均红细胞血红蛋白浓度</th>	
										  <th onclick="$.sortTable.sort('tableSort',14)" style="cursor: pointer;">血小板计数</th>	
										  <th></th>
						                </tr>
						              </thead>
						              <tbody>						             
						                <tr >
	                <%
	                	String id=request.getParameter("id");
   	                	System.out.println("该运动员id是"+id);
   	                	String date=request.getParameter("date");
   	                	Cyclists c=new Cyclists();
   	                	C_brDao cBrDao=new C_brDao();
   	                	List<Integer> obj=cBrDao.getbrid(id);
   	                	for(int str:obj){
   	                		System.out.println("brid是"+str);
     	                Blood_RoutineDao blood_RoutineDao=new Blood_RoutineDao();
     	                List<Object[]> o=blood_RoutineDao.getBloodRoutineBybrid(str);
     	                if(o!=null){
     	                for(Object[] list:o)
     	                {
	                %>
			              <td><%=list[0] %></td>
		                  <td ><%=list[1] %></td>
		                  <td><%=list[2] %></td>
		                  <td><%=list[3] %></td>	
						  <td><%=list[4] %></td>	
						  <td><%=list[5] %></td>	
						  <td><%=list[6] %></td>	
						  <td><%=list[7] %></td>	
						  <td><%=list[8] %></td>	
						  <td><%=list[9] %></td>	
						  <td><%=list[10] %></td>	
						  <td><%=list[11] %></td>	
						  <td><%=list[12] %></td>	
						  <td><%=list[13] %></td>	
						  <td><%=list[14] %></td>	
						  <td>
						 
											<div class="btn-group">
												<button type="button" class="btn btn-primary">操作</button>
												<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
													<span class="caret"></span>													
												</button>
												<ul class="dropdown-menu" role="menu">
													<li>
														<a data-toggle="modal" href="#changeathlete">修改</a>
													</li>
													<li class="divider"></li>
													<li><a href="./deleteCyclist?brid=<%=str %>&id=<%=list[1] %>">删除</a></li>												
												</ul>
											</div>	
										  </td>
						                </tr>
						                <%
     	                	} 
     	                }
     	                
     	                else
     	                	response.sendRedirect("./error.jsp");
     	                } %>
						              </tbody>
						            </table>
                                </div>
                            </div>
                        </div>
                    </div>
			</div>
		</div>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="changeathlete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow="auto">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
						<h4 class="modal-title" id="myModalLabel">
					修改运动信息
				</h4>
				<div class="modal-body">
						<form class="form-horizontal">
						<div class="control-group"><label class="control-label" for="input01">身高</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">体重</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">运动成绩</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">白细胞数</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">红细胞数</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">血红蛋白</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">红细胞压积</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">红细胞平均体积</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">红细胞平均含量</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">平均红细胞血红蛋白浓度</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						<div class="control-group"><label class="control-label" for="input01">血小板计数</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge"> </div></div>
						</form>
				</div>
						<!--
                        	表单到此结束。，点击提交把表单上传即可
                        -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
							<button type="button" class="btn btn-primary">
					提交更改
				</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div></div>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="addathlete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" overflow="auto">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
						<h4 class="modal-title" id="myModalLabel">
					增加运动信息
				</h4>
				<form class="form-horizontal" action="./addOneAthMsg?cid=<%=id %>" method="post">
				<div class="modal-body">
					<div class="control-group"><label class="control-label" for="input01">训练时间</label><div class="controls"> <input type="date"  id="searchdate"class="form-control" name="date"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">运动成绩</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge" name="speed"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">白细胞数</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge" name="wbc"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">红细胞数</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge" name="rbc"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">血红蛋白</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge" name="hgb"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">红细胞压积</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge" name="hct"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">红细胞平均体积</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge" name="mcv"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">红细胞平均含量</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge" name="hgb_rbc"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">平均红细胞血红蛋白浓度</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge" name="mchc"> </div></div>
					<div class="control-group"><label class="control-label" for="input01">血小板计数</label><div class="controls"> <input type="text" placeholder="placeholder" class="input-xlarge" name="plt"> </div></div>
				</div>
				<!--表单到此结束。，点击提交把表单上传即可-->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="submit" class="btn btn-primary" value="添加">
				</div>
				</form>
				</div>
				<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div></div>
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
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
    </body>

</html>