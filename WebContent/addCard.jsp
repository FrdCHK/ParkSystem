<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="bean.Owner"%>
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
  <%HttpSession sess = request.getSession(true);
    		String userid=(String)sess.getAttribute("userid");
    		if(userid==null)
    		{
    			response.sendRedirect("manageLogin.jsp");
    		}
	String url = "jdbc:mysql://localhost:3306/ParkSystem?useUnicode=true&characterEncoding=utf-8";//连接数据库的url地址
	String user = "root";//登录数据库的用户名
	String password = "Mdzz1234";//登录数据库的用户名的密码
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	ArrayList<Owner> result = new ArrayList<Owner>();
	Iterator<Owner> iter = null;
	String sql="";
	try {
		Class.forName("com.mysql.jdbc.Driver");//加载JDBC驱动程序
		conn = DriverManager.getConnection(url, user, password);//链接数据库
	} catch (ClassNotFoundException e) {
		System.out.println("找不到驱动类");//抛出异常时，提示信息
		response.sendRedirect("index.jsp");
	} catch (SQLException e) {
		System.out.println("SQLException");//处理SQLException异常
		response.sendRedirect("index.jsp");
	}
	try {
		stmt = conn.createStatement();
	} catch (SQLException e1) {
		// TODO 自动生成的 catch 块
		e1.printStackTrace();
		response.sendRedirect("index.jsp");
	}
	try {
		sql="select * from owner";
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			result.add(new Owner(rs.getString(1), rs.getString(2), rs.getString(3)));
		}
		iter = result.iterator();
	} catch (SQLException e1) {
		// TODO 自动生成的 catch 块
		e1.printStackTrace();
		response.sendRedirect("index.jsp");
	}
	try {
		stmt.close();
		conn.close();
	} catch (SQLException e1) {
		// TODO 自动生成的 catch 块
		e1.printStackTrace();
		response.sendRedirect("index.jsp");
	}
  %>
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
			<a class="btn btn-default navbar-btn" href="user.jsp">返回</a>
    		<table class="table table-striped">
						<caption>车主列表</caption>
						<thead>
							<tr>
								<th>身份证号</th>
								<th>姓名</th>
								<th>电话</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<%Owner pl;
							while (iter.hasNext()) {
							pl=iter.next();%>
							<tr>
							<td><%=pl.getId() %></td>
							<td><%=pl.getName() %></td>
							<td><%=pl.getPhone() %></td>
							<td><a href="cardOn.jsp?id=<%=pl.getId() %>">绑定车位</a><a href="cardOff.jsp?id=<%=pl.getId() %>">解绑车位</a></td>
							</tr><%}%>
						</tbody>
					</table>
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
