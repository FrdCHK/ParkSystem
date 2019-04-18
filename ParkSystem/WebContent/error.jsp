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

  </head>

  <body>
      <!-- header -->
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
              <a class="btn btn-default navbar-btn" href="manageLogin.jsp" role="button">登录</a>
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
    		<%request.setCharacterEncoding("UTF-8");
    		int succ=Integer.parseInt(request.getParameter("s"));
    		if(succ==1){
    			%><p>密码错误！</p><%
    		}else if(succ==0){%>
    		<p>找不到用户名！</p><%
    		}%>
    </div><!-- /input-group -->
  		</div>
  </div><!-- /.col-lg-6 -->
</div>
<!-- main end -->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
  </body>
</html>
