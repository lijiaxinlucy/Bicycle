package Servlets;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Daos.NTableDao;
import Daos.RTableDao;

/**
 * Servlet implementation class addOneRAthMsg
 */
@WebServlet("/addOneRAthMsg")
public class addOneRAthMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOneRAthMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		double hgb,sttt,ck,arg,tyr,sleep,speed;
		int ice,msg;
		String date=request.getParameter("date");
		speed=Double.parseDouble(request.getParameter("speed"));
		ice=Integer.parseInt(request.getParameter("ice"));
		msg=Integer.parseInt(request.getParameter("msg"));
		hgb=Double.parseDouble(request.getParameter("hgb"));
		sttt=Double.parseDouble(request.getParameter("sttt"));
		ck=Double.parseDouble(request.getParameter("ck"));
		arg=Double.parseDouble(request.getParameter("arg"));
		tyr=Double.parseDouble(request.getParameter("tyr"));
		sleep=Double.parseDouble(request.getParameter("sleep"));
		speed=Double.parseDouble(request.getParameter("speed"));
		String cid=request.getParameter("cid");
		RTableDao rTableDao=new RTableDao();
		try {
			rTableDao.addOneRMsg(cid, date, hgb, sttt, ck, arg, tyr, sleep, ice, msg, speed);
			response.sendRedirect("./Rehabilitationathlete.jsp?id="+cid);
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
