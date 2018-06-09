/**
 * 
 */


function userLogin(){
	var flag =true;
	var postData={};
	
	$("#form-signin").find("input").each(function(){
		var $obj=$(this);
		var message=$obj.attr("message");
		if(isBlank($obj.val()) && $obj.attr("required") == "required"){
			floatNotify.simple(message+'不能为空');
			flag=false;
			return false;
		}
	})
		
	if(flag){
		var userid = $("#id")[0].value;
		var pwd = $("#pwd")[0].value;
		
		console.log(userid);
		console.log(pwd);
		
		
		$.post("./loginServlet?id=" + userid + "&password=" + pwd, function(arg) {
			if(arg == "-1")//id不存在
				alert("账户名不存在，请重新输入");
			else if(arg == "-2")//密码错误
				alert("密码错误，请重新输入");
			else window.location = arg;
		});	
	}
}

//方法，判断是否为空
function isBlank(_value){
	if(_value==null || _value=="" || _value==undefined){
		return true;
	}
	return false;
}