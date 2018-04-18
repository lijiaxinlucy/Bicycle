package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Daos.C_brDao;
import Daos.CyclistsDao;
import model.Cyclists;

/**
 * Servlet implementation class showAllCyclists
 */
@WebServlet("/showAllCyclists")
public class showAllCyclists extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showAllCyclists() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String string = request.getParameter("test");
		CyclistsDao cd = new CyclistsDao();
		List<Cyclists> o=(List<Cyclists>) cd.listAllCyclists();
		for(Cyclists c:o){
			System.out.println(c.getCName()+" "+c.getSex()+" "+c.getCid()+" "+c.getCHeight()+
					" "+c.getCWeight());
			//System.out.println(c.getSex());
			String id=c.getCid();
			C_brDao c_brDao=new C_brDao();
			String brid=c_brDao.getbrid(id);
			float wbc=c_brDao.getWbc(brid);
			float rbc=c_brDao.getRbc(brid);
			System.out.println(brid+" "+wbc+" "+rbc);
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
