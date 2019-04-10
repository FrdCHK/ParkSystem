package serv;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class freeOut
 */
@WebServlet("/freeOut")
public class freeOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public freeOut() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String carNo=request.getParameter("carNo");
		carNo=new String(carNo.getBytes("iso-8859-1"),"utf-8");
		float sum=0;
		int no=0;
		String url = "jdbc:mysql://localhost:3306/ParkSystem?useUnicode=true&characterEncoding=utf-8";//连接数据库的url地址
		String user = "root";//登录数据库的用户名
		String password = "Mdzz1234";//登录数据库的用户名的密码
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");//加载JDBC驱动程序
			conn = DriverManager.getConnection(url,user,password);//链接数据库
		}catch(ClassNotFoundException e){
			System.out.println("找不到驱动类");//抛出异常时，提示信息
			response.sendRedirect("result.jsp?s=0");
		}catch(SQLException e){
			System.out.println("链接失败");//处理SQLException异常
			response.sendRedirect("result.jsp?s=0");
		}
		System.out.println("链接MySQL数据库OK");
		String queryAll="select no from record where carNo='"+carNo+"' and outTime is NULL";
		Statement stmt=null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("莫名其妙的catch一号");
			response.sendRedirect("result.jsp?s=0");
		}
		ResultSet rs;
		try {
			rs = stmt.executeQuery(queryAll);
			while(rs.next()) {
				no=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println("莫名其妙的catch二号");
			response.sendRedirect("result.jsp?s=0");
		}
		int ifCard=0, cardNo=0;
		try {
			queryAll="select no from card where carNo='"+carNo+"'";
			rs = stmt.executeQuery(queryAll);
			while(rs.next()) {
				ifCard=1;
				cardNo=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println("莫名其妙的catch七号");
			response.sendRedirect("result.jsp?s=0");
		}
		String sql="update record set outTime=now() where no="+no;
		System.out.println(sql);
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println("莫名其妙的catch三号");
			response.sendRedirect("result.jsp?s=0");
		}
		queryAll = "SELECT timestampdiff(minute, inTime, outTime), carClass FROM record where no="+no;
		System.out.println(queryAll);
		int min=0, cls=0;
		try {
			rs = stmt.executeQuery(queryAll);
			while(rs.next()) {
				min=rs.getInt(1);
				cls=rs.getInt(2);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println("莫名其妙的catch四号");
			response.sendRedirect("result.jsp?s=0");
		}
		System.out.println(min+cls);
		if(cls==1 && ifCard==0) {
			sum=(float)min*(float)0.1;
		}else if(cls==0 && ifCard==0){
			sum=(float)min*(float)0.15;
		}
		BigDecimal bd= new BigDecimal(sum);
		sum=bd.setScale(1, RoundingMode.HALF_UP).floatValue();
		sql="update record set sum="+sum+" where no="+no;
		System.out.println(sql);
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
			System.out.println("莫名其妙的catch五号");
			response.sendRedirect("result.jsp?s=0");
		}
		if(ifCard==0)
		{
			sql="update free set remain=remain+'1'";
			try {
				stmt.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
				System.out.println("莫名其妙的catch八号");
				response.sendRedirect("result.jsp?s=0");
			}
		}else {
			sql="update place set status=0 where cardNo="+cardNo;
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
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println("莫名其妙的catch六号");
			response.sendRedirect("result.jsp?s=0");
		}
		String redirc="fund.jsp?sum="+sum;
		response.sendRedirect(redirc);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
