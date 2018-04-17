package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.query.Query;

import model.*;
import dbutils.DBConnection;

/**
 * Servlet implementation class loginServlert
 */
@WebServlet("/loginServlet")//这里的servlet要跟jsp里的action里的一致
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		//System.out.println(request.getSession().getAttribute("id"));
//		System.out.println(id);
//		System.out.println(password);
		Session session = DBConnection.getFactory().openSession();
		String hql = "from User where UserID=:ids and Password=:password";//User为model里的模型
		Query<User> query = session.createQuery(hql);
		query.setString("ids", id);
		query.setString("password", password);
		List<User> obj = query.list();
		if(!obj.isEmpty())
			response.sendRedirect("./perCoachhome.jsp");
		else  response.sendRedirect("./error.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
