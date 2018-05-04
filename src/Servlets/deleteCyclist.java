package Servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Daos.Blood_RoutineDao;
import Daos.CyclistsDao;
import model.Blood_Routine;

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
		String brid=request.getParameter("brid");
		String id=request.getParameter("id");
		System.out.println("被删除的brid是"+brid);
		Blood_RoutineDao blood_RoutineDao=new Blood_RoutineDao();
		blood_RoutineDao.deleteOneBrMsg(brid);
		System.out.println("删除成功");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
