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
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 * Servlet implementation class Add
 */
@WebServlet("/add")
public class Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add() {
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
		int placeNo=Integer.parseInt(request.getParameter("pNo"));
		int placeClass=Integer.parseInt(request.getParameter("pClass"));
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
			sql="select * from place where no="+placeNo;
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				response.sendRedirect("result.jsp?s=0");
			}else {
				if(placeClass==0) {
					try {
						sql="update free set total=total+1, remain=remain+1";
						stmt.executeUpdate(sql);
					} catch (SQLException e1) {
						// TODO 自动生成的 catch 块
						e1.printStackTrace();
						response.sendRedirect("index.jsp");
					}
				}
				try {
					sql="insert into place(no, class) values("+placeNo+", "+placeClass+")";
					stmt.executeUpdate(sql);
					response.sendRedirect("managePlace.jsp");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
