package Servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.jdbc.ReturningWork;

import Daos.NTableDao;


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
		int suger,protein,fat,salt,energy;
		double bs,rbp,speed;
		String date=request.getParameter("date");
		speed=Double.parseDouble(request.getParameter("speed"));
		suger=Integer.parseInt(request.getParameter("suger"));
		protein=Integer.parseInt(request.getParameter("protein"));
		fat=Integer.parseInt(request.getParameter("fat"));
		salt=Integer.parseInt(request.getParameter("salt"));
		bs=Double.parseDouble(request.getParameter("bs"));
		rbp=Double.parseDouble(request.getParameter("rbp"));
		energy=Integer.parseInt(request.getParameter("energy"));
		String cid=request.getParameter("cid");
		NTableDao nTableDao=new NTableDao();
		try {
			nTableDao.addOneMsg(cid, date, suger, protein, fat, salt, bs, rbp, energy, speed);
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
