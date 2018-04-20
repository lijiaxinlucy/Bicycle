
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen">
<link href="assets/styles.css" rel="stylesheet" media="screen">
<script src="vendors/jquery-1.9.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body id="login" style="background-color:rgb(217, 237, 247);">
<br><br><br><br>
	<div class="container">

		<form class="form-signin"  action="./loginServlet" method="post"
			id="loginForm" style=" background-color: rgba(245, 245, 245, 0.62);
    			border: 1px solid rgba(119, 125, 199, 0.97);">
			<h3 class="form-signin-heading">欢迎登录</h3>
			<h3 class="form-signin-heading">——自行车训练数据平台</h3>
			<input type="text" class="input-block-level" name="id"  placeholder="请输入id"> 
			<input type="password" class="input-block-level" placeholder="请输入密码"
				name="password" > <label class="input-block-level"> 
			<input class="btn btn-large btn-primary"  type="submit"  value="登陆">
		    <button class="btn btn-large " style="margin-left: 120px;"
				type="reset">重置</button>
		</form>
	</div>
</body>
</html>

