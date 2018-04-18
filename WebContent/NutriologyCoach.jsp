<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>营养学科教练主页</title>
        <!-- Bootstrap -->
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
                    <a class="brand" href="#">Welcome！</a>
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
							<li class="active"><a href="./showAllCyclists?test=test">运动员管理</a></li>
							<li ><a href="./ShowAnnounce">xxx</a></li>	
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
									<div class="btn-group">
                                         <a href="./addAthelete.jsp"><button class="btn btn-success">Add New <i class="icon-plus icon-white"></i></button></a>
                                     </div>
									<div class="btn-group pull-right">
										<form class="navbar-form navbar-right" action="./showPlace" method="post" role="search">
											<div class="input-group">												
												<select name="flagParam">
												  <option value ="areaID">按运动员ID查找</option>
												  <option value ="name">按运动员姓名查找</option>												 
												</select>
												<input type="text" name="realParam" class="form-control" placeholder="请输入关键字">
												<span class="input-group-btn">
													<button class="btn btn-default" type="submit">search</button>
												</span>
											</div><!-- /input-group -->
										</form>
									</div>
  									<table class="table" style=" margin-bottom: 80px;">
						              <thead>
						                <tr>
						                  <th>ID</th>						                  
						                  <th>姓名</th>
										  <th>性别</th>
										  <th>身高(cm)</th>
										  <th>体重(kg)</th>	
										  <th>WBC(10^9/L)</th>	
										  <th>RBC(10^12/L)</th>
										  <th>HGB(g/L)</th>
										  <th>HCT(%)</th>
										  <th>MCV(FL)</th>
										  <th>HGB/RBC(pg)</th>
										  <th>MCHC(g/L)</th>
										  <th>PLT(10^9/L)</th>
						                </tr>
						              </thead>
						              <tbody>						             
						                <tr class="info">
						                  <td>3</td>
						                  <td>Larry</td>
						                  <td>the Bird</td>	
										  <td>the Bird</td>	
										  <td>the Bird</td>	
										  <td>the Bird</td>	
										  <td>the Bird</td>	
										  <td>the Bird</td>	
										  <td>the Bird</td>
										  <td>the Bird</td>
										  <td>the Bird</td>
										  <td>the Bird</td>
										  <td>the Bird</td>
										  <td>
											<div class="btn-group">
												<button type="button" class="btn btn-primary">操作</button>
												<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
													<span class="caret"></span>													
												</button>
												<ul class="dropdown-menu" role="menu">
													<li><a href="./ShowPlace?id=1">修改</a></li>
													<li class="divider"></li>
													<li><a href="./DeletePlace?id=2">删除</a></li>												
												</ul>
											</div>	
										  </td>
						                </tr>
						              </tbody>
						            </table>
                                </div>
                            </div>
                        </div>
                    </div>
			</div>
		</div>
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
    </body>

</html>