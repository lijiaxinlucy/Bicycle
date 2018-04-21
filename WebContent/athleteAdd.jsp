<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>总教练添加运动员</title>
             <meta charset=UTF-8>
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
                    <a class="brand" href="#">总教练</a>
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
							<li class="active"><a href="./showAllAtheletes">运动员管理</a></li>
							<li ><a href="./ShowAnnounce">运动员分析报告</a></li>	
						</ul>
					</div>
				</div>
				
				    <div class="row-fluid">
                        <!-- block -->
						<div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">添加运动员信息</div>
                                
                            </div>
							
                            <div class="block-content collapse in">
                                <div class="span12">							
  									<table class="table" style=" margin-bottom: 80px;">
						              <thead>
						                <tr>
						                  <th>&nbsp;&nbsp;&nbsp;ID</th>						                  
						                  <th>&nbsp;&nbsp;&nbsp;姓名</th>
										  <th>&nbsp;&nbsp;&nbsp;性别</th>
										  <th>&nbsp;&nbsp;&nbsp;身高</th>
										  <th>&nbsp;&nbsp;&nbsp;x体重</th>	
										  <th>&nbsp;&nbsp;&nbsp;xx</th>	
										  <th>&nbsp;&nbsp;&nbsp;xx</th>	
										  <th>&nbsp;&nbsp;&nbsp;xx</th>	
						                </tr>
						              </thead>
						              <tbody>						             
						                <tr class="info">
						                  <td><input type="text" class="" style="width: 140px;height: 30px;margin: 10px;"></td>
						                  <td><input type="text" class="" style="width: 140px;height: 30px;margin: 10px;"></td>
						                  <td><input type="text" class="" style="width: 140px;height: 30px;margin: 10px;"></td>
						                  <td><input type="text" class="" style="width: 140px;height: 30px;margin: 10px;"></td>
						                  <td><input type="text" class="" style="width: 140px;height: 30px;margin: 10px;"></td>
						                  <td><input type="text" class="" style="width: 140px;height: 30px;margin: 10px;"></td>
						                  <td><input type="text" class="" style="width: 140px;height: 30px;margin: 10px;"></td>
						                  <td><input type="text" class="" style="width: 140px;height: 30px;margin: 10px;"></td>
	
										  <td>
											<div class="btn-group">
												<button type="button" class="btn btn-primary" style="margin: 7px;">保存</button>												
												</button>
											</div>	
										  </td>
						                </tr>
						              </tbody>
						            </table>
                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                    </div>
			</div>
			
		<div>
        <!--/.fluid-container-->
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
    </body>

</html>