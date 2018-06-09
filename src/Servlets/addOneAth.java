package Servlets;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Daos.CyclistsDao;

/**
 * Servlet implementation class addOneAth
 */
@WebServlet("/addOneAth")
public class addOneAth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOneAth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");//传值编码
		response.setContentType("text/html;charset=UTF-8");//设置传输编码
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String cid=request.getParameter("cid");
		String cname=request.getParameter("cname");
		System.out.println(cname);
		int cage=Integer.parseInt(request.getParameter("cage"));
		CyclistsDao cyclistsDao=new CyclistsDao();
		try {
			cyclistsDao.addOneAth(cid, cname, cage);
			response.sendRedirect("./HeadCoach.jsp");
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
