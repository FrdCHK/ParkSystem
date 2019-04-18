package serv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/sqlfilter")
public class sqlfilter  extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user=request.getParameter("username"), pass=request.getParameter("passwd");
		  String text=user+pass;
		  if(sqlValidate(text)){
		  response.sendRedirect("error.jsp?s=2");
		  }
		  else{
		  String temp = "login?username="+user+"&passwd="+pass;
		  System.out.println(temp); 
		  response.sendRedirect(temp);
		  }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	//校验
    protected static boolean sqlValidate(String str) {  
        str = str.toLowerCase();//统一转为小写
        String badStr = "'|and|exec|execute|insert|select|delete|update|count|drop|chr|mid|master|truncate|char|declare|sitename|net user|xp_cmdshell|or|like";  
        //过滤掉的sql关键字，可以手动添加  
        String[] badStrs = badStr.split("\\|");  
        for (int i = 0; i < badStrs.length; i++) {
            if (str.indexOf(badStrs[i]) !=-1) { 
                System.out.println("匹配到："+badStrs[i]);
                return true;  
            }  
        }  
        return false;  
    }  
}
