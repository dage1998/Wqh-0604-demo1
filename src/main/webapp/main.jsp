
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%
	/*获取工程路径*/
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!-- 引入样式文件和动态控制 -->
	<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
	<!--主要样式控制-->
	<link href="<%=path %>/css/main.css" rel="stylesheet">

	<title>房产信息查询系统</title>

	<script type="text/javascript">


        function LoginOut() {
            alert("loginout")
            $.ajax({
                type:"get",
                url:"Login/loginOut",
                dataType:"json",
                success:function (data) {
                    if (data.code == 1){
                        if(confirm("确定退出系统吗")){
                            window.location.href="login.jsp";
                        }
                    }else{
                        alert(data.info);
                    }
                }
            })


        }


	</script>
</head>
<body>
<!--顶部导航栏部分-->
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" title="logoTitle" href="<%=path %>/jsp/welcome.jsp" target="mainFrame">房产信息查询系统</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li role="presentation">
					<%--<a href="#">当前用户：<span class="badge">${name}</span></a>--%>
					<a>当前用户：<span class="badge">${name}</span></a>
				</li>
				<li>
					<a><button onclick="LoginOut()">退出登录</button></a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<!-- 中间主体内容部分 -->
<div class="pageContainer">
	<!-- 左侧导航栏 -->
	<div class="pageSidebar">
		<ul class="nav nav-stacked nav-pills">
			<li role="presentation">
				<a href="jsp/list.jsp" target="mainFrame" >房产信息查询</a>
			</li>


		</ul>
	</div>

	<!-- 左侧导航和正文内容的分隔线 -->
	<div class="splitter"></div>
	<!-- 正文内容部分 -->
	<div class="pageContent">
		<iframe src="<%=path %>/jsp/welcome.jsp" id="mainFrame" name="mainFrame"
				frameborder="0" width="100%"  height="100%" frameBorder="0">
		</iframe>
	</div>

</div>
<!-- 底部页脚部分 -->
<div class="footer">
	<p class="text-center">
		2019 &copy; 千峰教育
	</p>
</div>

<script type="text/javascript">
	$(".nav li").click(function() {
		$(".active").removeClass('active');
		$(this).addClass("active");
	});


</script>
</body>
</html>
