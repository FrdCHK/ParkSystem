package serv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.user;

/**
 * Servlet implementation class loginStatus
 */
@WebServlet("/loginStatus")
public class loginStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Check start!");
		HttpSession sess = request.getSession(true);
		user usr=new user();
		usr.setName((String)sess.getAttribute("userid"));
		System.out.println(usr.getName());
		if(usr.getName()==null)
		{
			System.out.println("Id false!");
			response.sendRedirect("manageLogin.jsp");
		}else {
		System.out.println("Status true!");
		response.sendRedirect("manage.jsp");}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
