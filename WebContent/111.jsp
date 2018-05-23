<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<script type="text/javascript">
	window.onload = function() {
		var oTab = document.getElementById("tab");
		var oBt = document.getElementsByTagName("input");
		oBt[1].onclick = function() {
			for (var i = 0; i < oTab.tBodies[0].rows.length; i++) {
				var str1 = oTab.tBodies[0].rows[i].cells[1].innerHTML
						.toUpperCase();
				var str2 = oBt[0].value.toUpperCase();
				//使用string.toUpperCase()(将字符串中的字符全部转换成大写)或string.toLowerCase()(将字符串中的字符全部转换成小写)
				//所谓忽略大小写的搜索就是将用户输入的字符串全部转换大写或小写，然后把信息表中的字符串的全部转换成大写或小写，最后再去比较两者转换后的字符就行了
				/*******************************JS实现表格忽略大小写搜索*********************************/
				if (str1 == str2) {
					oTab.tBodies[0].rows[i].style.background = 'red';
				} else {
					oTab.tBodies[0].rows[i].style.background = '';
				}
				/***********************************JS实现表格的模糊搜索*************************************/
				//表格的模糊搜索的就是通过JS中的一个search()方法，使用格式，string1.search(string2);如果
				//用户输入的字符串是其一个子串，就会返回该子串在主串的位置，不匹配则会返回-1，故操作如下
				if (str1.search(str2) != -1) {
					oTab.tBodies[0].rows[i].style.background = 'red';
				} else {
					oTab.tBodies[0].rows[i].style.background = '';
				}
				/***********************************JS实现表格的多关键字搜索********************************/
				//表格的多关键字搜索，加入用户所输入的多个关键字之间用空格隔开，就用split方法把一个长字符串以空格为标准，分成一个字符串数组，
				//然后以一个循环将切成的数组的子字符串与信息表中的字符串比较
				var arr = str2.split(' ');
				for (var j = 0; j < arr.length; j++) {
					if (str1.search(arr[j]) != -1) {
						oTab.tBodies[0].rows[i].style.background = 'red';
					}
				}
			}
		}
	}
</script>
</head>
<body>
	姓名:
	<input type="text" />
	<input type="button" value="搜索" />
	<table border="1" bordercolor="blue" id="tab">
		<thead>
			<td><h2>ID</h2></td>
			<td><h2>Name</h2></td>
			<td><h2>Age</h2></td>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>Blue</td>
				<td>15</td>
			</tr>
			<tr>
				<td>2</td>
				<td>Mikyou</td>
				<td>26</td>
			</tr>
			<tr>
				<td>3</td>
				<td>weak</td>
				<td>24</td>
			</tr>
			<tr>
				<td>4</td>
				<td>sky</td>
				<td>35</td>
			</tr>
			<tr>
				<td>5</td>
				<td>李四</td>
				<td>18</td>
			</tr>
		</tbody>
	</table>
</body>
</html>