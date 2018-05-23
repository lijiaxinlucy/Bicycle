package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import Daos.CyclistsDao;
import model.Cyclists;

/**
 * Servlet implementation class searchCyclist
 */
@WebServlet("/searchCyclist")
public class searchCyclist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchCyclist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String flagParam,realParam,type,date;
		flagParam=request.getParameter("flagParam");//选项
		realParam=request.getParameter("realParam");//搜索
		type=(String) request.getParameter("type");
		date=request.getParameter("date");
		System.out.println("date="+date);
		System.out.println("type:"+type);
		System.out.println("flagParam:"+flagParam);
		System.out.println("realParam:"+realParam);
		if(flagParam.equals("areaID")){
			CyclistsDao cyclistsDao=new CyclistsDao();
			Cyclists cyclist=new Cyclists();
			cyclist=cyclistsDao.selectCyclistByCid(realParam);
			System.out.println(cyclist.getCName());
			response.sendRedirect("./selectById.jsp?id="+flagParam);
		}
		else if(flagParam.equals("name")){
			CyclistsDao cyclistsDao=new CyclistsDao();
			List<Cyclists> c=cyclistsDao.selectCyclistsByCName(realParam);
			//System.out.println(cyclist.getCName());
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
