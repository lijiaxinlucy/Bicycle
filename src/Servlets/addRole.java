package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Daos.UserDao;

/**
 * Servlet implementation class addRole
 */
@WebServlet("/addRole")
public class addRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addRole() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");//传值编码
		response.setContentType("text/html;charset=UTF-8");//设置传输编码
		String userid=request.getParameter("userid");
		String userName=request.getParameter("userName");
		String role=request.getParameter("role");
		System.out.println("role="+role);
		String roleid = null;
		if(role.equals("head")){
			roleid="1";
		}
		else if(role.equals("nutrition")){
			roleid="4";
		}
		else if(role.equals("Rehabilitation")){
			roleid="2";
		}
		else if(role.equals("Dynamics")){
			roleid="3";
		}
		System.out.println("roleid="+roleid);
		String password=request.getParameter("password");
		UserDao userDao=new UserDao();
		userDao.addRole(userid, userName, password, roleid);
		response.sendRedirect("./User.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
