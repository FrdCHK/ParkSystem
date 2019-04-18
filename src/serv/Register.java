package serv;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession(true);
		String userid = (String) sess.getAttribute("userid");
		if (userid == null) {
			response.sendRedirect("manageLogin.jsp");
		}
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		name=new String(name.getBytes("iso-8859-1"),"utf-8");
		String phone=request.getParameter("phone");
		
		//校验手机号及身份证合法性
		final String regexPhone="^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
		final String regexId="^[1-9]\\d{5}(18|19|(2\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$";
		if(!id.matches(regexId)){response.sendRedirect("result.jsp?s=3");}
		else if(!phone.matches(regexPhone)){response.sendRedirect("result.jsp?s=4");}
		else{
		
		String url = "jdbc:mysql://localhost:3306/ParkSystem?useUnicode=true&characterEncoding=utf-8";//连接数据库的url地址
		String user = "root";//登录数据库的用户名
		String password = "Mdzz1234";//登录数据库的用户名的密码
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
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
			sql="select * from owner where id='"+id+"'";
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				response.sendRedirect("result.jsp?s=0");
			}else {
				try {
					sql="insert into owner(id, name, phone) values('"+id+"', '"+name+"', '"+phone+"')";
					stmt.executeUpdate(sql);
					response.sendRedirect("result.jsp?s=1");
				} catch (SQLException e1) {
					// TODO 自动生成的 catch 块
					e1.printStackTrace();
					response.sendRedirect("result.jsp?s=0");
				}
			}
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
			response.sendRedirect("result.jsp?s=0");
		}
	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
