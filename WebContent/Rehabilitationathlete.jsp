
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>运动员康复学科</title>
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
                    <a class="brand" href="#">康复学科教练</a>
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
							<li class="active"><a href="./showAllAtheletes">运动员管理</a></li>
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

									<!--
               
                                  	<form class="navbar-form navbar-right" action="./showPlace" method="post" role="search">
											<div class="input-group">												
												<select name="flagParam">
												  <option value ="areaID">按运动员ID查找</option>
												  <option value ="name">按运动员姓名查找</option>	
												  
												</select>
												<input type="text" name="realParam" class="form-control" placeholder="请输入关键字">
												<span class="input-group-btn">
													<button class="btn btn-default" type="submit">查找</button>
												</span>
											</div><!-- /input-group -->
											
										</form>
									</div>
									<div class="btn-group pull-right">                  <!--  时间输入输出框 -->
									<form class="navbar-form navbar-right" action="./search" method="post">	
                                	<h5>查看日期成绩:<input type="date" id="searchdate"class="form-control"></h5>
									
										</form>
										</div>		<!--  结束时间输入输出框 -->
		
									<div class="btn-group pull-left">                  
										
                                	<h5>以下为最近一个月训练数据</h5>
									</div>	
											
  									<table class="table" style=" margin-bottom: 80px;">
						              <thead>
						                <tr>
						                <th>训练时间</th>
						                  <th>ID</th>						                  
						                  <th>姓名</th>
										  <th>性别</th>
										  <th>身高</th>
										  <th>体重</th>
										   <th>运动成绩</th>
										  <th>白细胞数</th>	
										  <th>红细胞数</th>
										    <th>血红蛋白</th>	
										  <th>红细胞压积</th>	
										    <th>红细胞平均体积</th>	
										  <th>红细胞平均含量</th>	
										    <th>平均红细胞血红蛋白浓度</th>	
										  <th>血小板计数</th>	
						                </tr>
						              </thead>
						              <tbody>						             
						                <tr class="info">
						                	 <td>3</td>
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