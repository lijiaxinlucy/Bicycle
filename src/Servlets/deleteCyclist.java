package Servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Daos.CyclistsDao;
import Daos.NTableDao;
import model.NTable;

/**
 * Servlet implementation class deleteCyclist
 */
@WebServlet("/deleteCyclist")
public class deleteCyclist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCyclist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int nid=Integer.parseInt(request.getParameter("nid"));
		String id=request.getParameter("id");
		System.out.println(id);
		System.out.println("被删除的nid是"+nid);
		NTableDao ntable=new NTableDao();
		ntable.deleteOneBrMsg(nid);
		System.out.println("删除成功");
		response.sendRedirect("./Nutriologyathlete.jsp?id="+id);//我想在这里把id号也传进这个jsp界面怎么写
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
