package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		request.setCharacterEncoding("UTF-8");//传值编码
		response.setContentType("text/html;charset=UTF-8");//设置传输编码
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String flagParam,realParam;
		Date date=new Date();
		DateFormat simDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String punString=simDateFormat.format(date);
		flagParam=request.getParameter("flagParam");//选项
		realParam=request.getParameter("realParam");//搜索
		System.out.println("date="+punString);
		System.out.println("flagParam:"+flagParam);
		System.out.println("realParam:"+realParam);
		if(flagParam.equals("areaID")){
			List<Object[]> cyclist;
			CyclistsDao cyclistsDao=new CyclistsDao();
			cyclist=cyclistsDao.selectCyclistByCid(realParam,punString);
			if(cyclist!=null){
				for(Object[] o:cyclist){
					System.out.println(o[0]);
					System.out.println(o[1]);
					System.out.println(o[2]);
					System.out.println(o[3]);
					System.out.println(o[4]);
					System.out.println(o[5]);
					System.out.println(o[7]);
					System.out.println(o[8]);
					System.out.println(o[9]);
					
				}
			}
			else System.out.println("cant find");
		}
		else if(flagParam.equals("name")){
			List<Object[]> c;
			CyclistsDao cyclistsDao1=new CyclistsDao();
			c=cyclistsDao1.selectCyclistsByCName(realParam,punString);
			if(c!=null){
				for(Object[] o:c){
					System.out.println(o[0]);
					System.out.println(o[1]);
					System.out.println(o[2]);
					System.out.println(o[3]);
					System.out.println(o[4]);
					System.out.println(o[5]);
					System.out.println(o[7]);
					System.out.println(o[8]);
					System.out.println(o[9]);
			}
		}
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
