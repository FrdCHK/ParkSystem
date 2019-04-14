package serv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession(true);
		user usr=new user();
		String username=request.getParameter("username"), passwd=request.getParameter("passwd");
		  String url = "jdbc:mysql://localhost:3306/parksystem?useUnicode=true&characterEncoding=utf-8";//连接数据库的url地址
		String user = "root";//登录数据库的用户名
		String password = "Mdzz1234";//登录数据库的用户名的密码
		Connection conn = null;
		try{
		  Class.forName("com.mysql.jdbc.Driver");//加载JDBC驱动程序
		  conn = DriverManager.getConnection(url,user,password);//链接数据库
		}catch(ClassNotFoundException e){
		  System.out.println("找不到驱动类");//抛出异常时，提示信息
		}catch(SQLException e){
			System.out.println("链接MySQL数据库失败");//处理SQLException异常
		}
		try{
		  Statement stmt = conn.createStatement();//创建语句对象Statement
		  String queryAll = "SELECT * FROM admin where name=\'"+username+"\'";
		  ResultSet rs = stmt.executeQuery(queryAll);
		  if(rs.next()){
		    String pswd=rs.getString(4);
			System.out.println(password+" "+pswd);
		    if(pswd.equals(passwd)){
		    	System.out.println("password equal");
		    	sess.setAttribute("userid", username);
		    	usr.setName(username);
		    	usr.setPasswd(pswd);
				response.sendRedirect("index.jsp");
		    }else{
		    	response.sendRedirect("manageLogin.jsp");
		     }
		    }
		}catch(SQLException e){
			System.out.println("查询用户信息失败");
	    	response.sendRedirect("manageLogin.jsp");}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
