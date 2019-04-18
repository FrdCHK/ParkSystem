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
  <%HttpSession sess = request.getSession(true);
    		String userid=(String)sess.getAttribute("userid");
    		if(userid==null)
    		{
    			response.sendRedirect("manageLogin.jsp");
    		}
    		String id=request.getParameter("id");%>
    		<sql:setDataSource var="contents" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/ParkSystem?useUnicode=true&characterEncoding=utf-8"
	user="root" password="Mdzz1234" />
<sql:query dataSource="${contents}" var="result">
SELECT no from place where class=1 and cardNo is null;
</sql:query>
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
<script type="text/javascript">
	function check(formsub){
		document.getElementById("b1").style.visibility="hidden";
		document.getElementById("b2").style.visibility="hidden";
		console.log("onsubmit  "+formsub.elements[1].value);
		if(formsub.elements[1].value==""){
			document.getElementById("b1").style.visibility="visible";
			return false;
		}
		var ckbox=document.getElementsByName("placeNo");
		var flag=false;
		for(var i=0;i<ckbox.length;i++){
			console.log(ckbox[i].checked);
			if(ckbox[i].checked==true){
				flag=true;
				break;
			}
		}
		console.log(flag);
		if(!flag){
			document.getElementById("b2").style.visibility="visible";
			return false;
		}
	}
</script>
<!-- main -->
<div class="container">
  <div class="row">
      <div class="col-md-6 col-md-offset-3">
    <div class="input-group center-block">
			<a class="btn btn-default" href="addCard.jsp">返回</a>
    		<form action="newCard" method="post" onsubmit="return check(this);">
         		<input type="text" name="ownerId" value="<%=id %>" style="display:none" /><br>
					<input type="text" class="form-control" name="carNo" value="" placeholder="车牌号" />
					<br><b id="b1" style="visibility:hidden">车牌号不能为空！</b><br>
					<table class="table table-striped">
						<caption>可选车位</caption>
						<thead>
							<tr>
								<th>车位号</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${result.rows}">
								<tr>
									<td><c:out value="${row.no}" /></td>
									<td><input type="radio" name="placeNo" value="${row.no}">选择<br></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<b id="b2" style="visibility:hidden">请选择车位！</b><br>
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
  </body>
</html>
