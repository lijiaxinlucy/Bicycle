package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Daos.RTableDao;

/**
 * Servlet implementation class deleteRCyclist
 */
@WebServlet("/deleteRCyclist")
public class deleteRCyclist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteRCyclist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int rid=Integer.parseInt(request.getParameter("rid"));
		String id=request.getParameter("id");
		System.out.println(id);
		System.out.println("被删除的rid是"+rid);
		RTableDao rTableDao=new RTableDao();
		rTableDao.deleteOneRMsg(rid);
		System.out.println("删除成功");
		response.sendRedirect("./Rehabilitationathlete.jsp?id="+id);//我想在这里把id号也传进这个jsp界面怎么写
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
