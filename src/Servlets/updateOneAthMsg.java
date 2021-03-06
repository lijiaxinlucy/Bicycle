package Servlets;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Daos.NTableDao;

/**
 * Servlet implementation class updateOneAthMsg
 */
@WebServlet("/updateOneAthMsg")
public class updateOneAthMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateOneAthMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int suger,protein,fat,salt,energy,nid;
		double bs,rbp,speed;
		String Nid=request.getParameter("nid");
		speed=Double.parseDouble(request.getParameter("speed"));
		suger=Integer.parseInt(request.getParameter("suger"));
		protein=Integer.parseInt(request.getParameter("protein"));
		fat=Integer.parseInt(request.getParameter("fat"));
		salt=Integer.parseInt(request.getParameter("salt"));
		bs=Double.parseDouble(request.getParameter("bs"));
		rbp=Double.parseDouble(request.getParameter("rbp"));
		energy=Integer.parseInt(request.getParameter("energy"));
		String cid=request.getParameter("cid");
		nid=Integer.parseInt(Nid);
		NTableDao nTableDao=new NTableDao();
		int a;
		try {
			a = nTableDao.updateOneAthMsg(nid, suger, protein, fat, salt, bs, rbp, energy, speed);
			if(a==0){
				response.sendRedirect("./Nutriologyathlete.jsp?id="+cid);
			}
			else response.sendRedirect("./error.jsp");
		} catch (Exception e) {
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
