package Servlets;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Daos.DTableDao;
import Daos.NTableDao;

/**
 * Servlet implementation class addOneDAthMsg
 */
@WebServlet("/addOneDAthMsg")
public class addOneDAthMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOneDAthMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int ang;
		double air,weight,are,f1,f2,high,speed;
		String date=request.getParameter("date");
		speed=Double.parseDouble(request.getParameter("speed"));
		ang=Integer.parseInt(request.getParameter("ang"));
		weight=Double.parseDouble(request.getParameter("weight"));
		are=Double.parseDouble(request.getParameter("are"));
		f1=Double.parseDouble(request.getParameter("f1"));
		f2=Double.parseDouble(request.getParameter("f2"));
		high=Double.parseDouble(request.getParameter("high"));
		air=Double.parseDouble(request.getParameter("air"));
		String cid=request.getParameter("cid");
		DTableDao dTableDao=new DTableDao();
		try {
			dTableDao.addOneMsg(cid,date,ang,air,weight,are,f1,f2,high,speed);
			response.sendRedirect("./Dynamicsathlete.jsp?id="+cid);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
