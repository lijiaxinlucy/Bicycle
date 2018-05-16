package Servlets;

import java.io.IOException;
import java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Daos.Blood_RoutineDao;

/**
 * Servlet implementation class addOneAthMsg
 */
@WebServlet("/addOneAthMsg")
public class addOneAthMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOneAthMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		float speed,wbc,rbc,hgb,hct,mcv,hgb_rbc,mchc,plt;
		String date=request.getParameter("date");
		speed=Float.parseFloat(request.getParameter("speed"));
		wbc=Float.parseFloat(request.getParameter("wbc"));
		rbc=Float.parseFloat(request.getParameter("rbc"));
		hgb=Float.parseFloat(request.getParameter("hgb"));
		hct=Float.parseFloat(request.getParameter("hct"));
		mcv=Float.parseFloat(request.getParameter("mcv"));
		hgb_rbc=Float.parseFloat(request.getParameter("hgb_rbc"));
		mchc=Float.parseFloat(request.getParameter("mchc"));
		plt=Float.parseFloat(request.getParameter("plt"));
		String cid=request.getParameter("cid");
		Blood_RoutineDao blood_RoutineDao=new Blood_RoutineDao();
		try {
			blood_RoutineDao.addOneMsg(cid,date, speed, wbc, rbc, hgb, hct, mcv, hgb_rbc, mchc, plt);
			response.sendRedirect("./Nutriologyathlete.jsp?id="+cid);
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
//
