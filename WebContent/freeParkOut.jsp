<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../favicon.ico">
    <title>小区停车管理系统</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/navbar-fixed-top.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
  </head>
  <%HttpSession sess = request.getSession(true);
    		String userid=(String)sess.getAttribute("userid");
    		if(userid==null)
    		{
    			response.sendRedirect("manageLogin.jsp");
    		}%>
  <body>
      <!-- header -->
      <nav class="navbar" role="navigation">
 		<div style="width:200px">
					<ul class="nav nav-pills nav-stacked">
						<li class="dropdown">
							<a href="manage.jsp" class="dropdown-toggle disabled">停车场业务 
							<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li class="dropdown-submenu">  
									<a href="freePark.jsp">车辆进出</a>
									<ul class="dropdown-menu">  
										<li><a href="freeParkIn.jsp">入场</a></li>  
                        				<li><a href="freeParkOut.jsp">出场</a></li>  
                    				</ul>  
								</li>
								<li class="dropdown-submenu">  
									<a href="managePlace.jsp">车位管理</a>
									<ul class="dropdown-menu">  
										<li><a href="addPlace.jsp">增加车位</a></li>  
                    				</ul>  
								</li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="user.jsp" class="dropdown-toggle disabled" data-toggle="dropdown">车卡业务 
							<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">  
										<li><a href="cardManage.jsp">车卡管理</a></li>  
                        				<li><a href="ownerRegister.jsp">车主登记</a></li>
                        				<li><a href="addCard.jsp">车卡登记</a></li>   
							</ul>
						</li>
					</ul>
					</div>
</nav>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp">小区停车管理系统</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="index.jsp">首页</a></li>
              <li><a href="status.jsp">车位状态</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
			<b>登录成功！欢迎，<%=userid %></b>
              <a class="btn btn-default navbar-btn" href="quit" role="button">退出登录</a>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </nav>
<!-- header  end-->
<!-- main -->
<div class="container">
  <div class="row">
      <div class="col-md-6 col-md-offset-3">
    <div class="input-group center-block">
			<a class="btn btn-default navbar-btn" href="freePark.jsp">返回</a>
    		<form action="freeOut" method="post">
					<input type="text" class="form-control" name="carNo" value="" placeholder="车牌号" />
				<span class="input-group-btn">
					<input type="submit"  class="btn btn-default" value="提交" />
				</span>
         </form>
    </div><!-- /input-group -->
  		</div>
  </div><!-- /.col-lg-6 -->
</div>
<!-- main end -->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
        <script>/*下拉菜单*/
$(document).ready(function(){
dropdownOpen();
});
function dropdownOpen() {
var $dropdownLi = $('li.dropdown');
$dropdownLi.mouseover(function() {
$(this).addClass('open');
}).mouseout(function() {
$(this).removeClass('open');
});
}</script>
  </body>
</html>
