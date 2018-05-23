package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Daos.DTableDao;

/**
 * Servlet implementation class deleteDCyclist
 */
@WebServlet("/deleteDCyclist")
public class deleteDCyclist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteDCyclist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int did=Integer.parseInt(request.getParameter("did"));
		String id=request.getParameter("id");
		System.out.println(id);
		System.out.println("被删除的did是"+did);
		DTableDao dTableDao=new DTableDao();
		dTableDao.deleteOneDMsg(did);
		System.out.println("删除成功");
		response.sendRedirect("./Dynamicsathlete.jsp?id="+id);//
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
