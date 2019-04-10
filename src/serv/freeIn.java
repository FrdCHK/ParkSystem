package serv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 * Servlet implementation class freeIn
 */
@WebServlet("/freeIn")
public class freeIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public freeIn() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String carNo=request.getParameter("carNo");
		carNo=new String(carNo.getBytes("iso-8859-1"),"utf-8");
		int carClass=Integer.parseInt(request.getParameter("carClass"));
		System.out.println(carNo+carClass);
		String url = "jdbc:mysql://localhost:3306/ParkSystem?useUnicode=true&characterEncoding=utf-8";//连接数据库的url地址
		String user = "root";//登录数据库的用户名
		String password = "Mdzz1234";//登录数据库的用户名的密码
		Connection conn = null;
		Statement stmt=null;
		String sql="";
		String queryAll="";
		try{
			Class.forName("com.mysql.jdbc.Driver");//加载JDBC驱动程序
			conn = DriverManager.getConnection(url,user,password);//链接数据库
		}catch(ClassNotFoundException e){
			System.out.println("找不到驱动类");//抛出异常时，提示信息
			response.sendRedirect("result.jsp?s=0");
		}catch(SQLException e){
			System.out.println("插入失败");//处理SQLException异常
			response.sendRedirect("result.jsp?s=0");
		}
		System.out.println("链接MySQL数据库OK");
		//String sql="insert into record(carNo, carClass, inTime) values(?, ?, now())";
		//PreparedStatement prest=null;
		//prest=conn.prepareStatement(sql);
		//prest.setString(1, carNo);
		//prest.setInt(2, carClass);
		//prest.executeUpdate(sql);
		//prest.close();
		sql="insert into record(carNo, carClass, inTime) values('"+carNo+"','"+carClass+"',"+"now())";
		System.out.println(sql);
		try {
			stmt=conn.createStatement();
		} catch (SQLException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
			response.sendRedirect("result.jsp?s=0");
		}
		int ifFree=0;
		try {
			queryAll="select remain from free";
			ResultSet rs = stmt.executeQuery(queryAll);
			while(rs.next()) {
				if(rs.getInt(1)>0)
					ifFree=1;
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println("莫名其妙的catch三号");
			response.sendRedirect("result.jsp?s=0");
		}
		//车位已满
		if(ifFree==0) {
			System.out.println("车位满");
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e1) {
				// TODO 自动生成的 catch 块
				e1.printStackTrace();
				response.sendRedirect("result.jsp?s=0");
			}
			response.sendRedirect("result.jsp?s=2");
		}else {
			try {
				stmt.executeUpdate(sql);
			} catch (SQLException e1) {
				// TODO 自动生成的 catch 块
				e1.printStackTrace();
			}
			int ifCard=0;
			int cardNo=0;
			try {
				queryAll="select no from card where carNo='"+carNo+"'";
				ResultSet rs = stmt.executeQuery(queryAll);
				while(rs.next()) {
					ifCard=1;
					cardNo=rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
				System.out.println("莫名其妙的catch一号");
				response.sendRedirect("result.jsp?s=0");
			}
			if(ifCard==0)
			{
				sql="update free set remain=remain-'1'";
				try {
					stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
					System.out.println("莫名其妙的catch二号");
					response.sendRedirect("result.jsp?s=0");
				}
			}else {
				sql="update place set status=1 where cardNo="+cardNo;
				try {
					stmt.executeUpdate(sql);
				} catch (SQLException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
					System.out.println("莫名其妙的catch四号");
					response.sendRedirect("result.jsp?s=0");
				}
			}
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e1) {
				// TODO 自动生成的 catch 块
				e1.printStackTrace();
				response.sendRedirect("result.jsp?s=0");
			}
			response.sendRedirect("result.jsp?s=1");}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
