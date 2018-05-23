<%@page import="dbutils.FirstJythonScript"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <style> 
    .table-b table td{border:1px solid green} 
    /* css注释：只对table td标签设置红色边框样式 */ 
    </style> 
</head>
<body>
	<div class="table-b"> 
	<table width="800" border="0" cellspacing="0" cellpadding="0">
	<%
		FirstJythonScript firstJythonScript = new FirstJythonScript();
		String s = firstJythonScript.getMsg();
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
	</table>
	</div>
</body>
</html>