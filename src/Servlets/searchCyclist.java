package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

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
		String flagParam,realParam,type;
		PrintWriter out = response.getWriter();
		String id;
		flagParam=request.getParameter("flagParam");//选项
		realParam=request.getParameter("realParam");//搜索
		type=(String) request.getParameter("type");
		System.out.println("type:"+type);
		System.out.println("flagParam:"+flagParam);
		System.out.println("realParam:"+realParam);
		CyclistsDao cyclistsDao=new CyclistsDao();		
		Cyclists cyclists = null;
		model.Cyclists place = null;
		if(type != null &&type.equals("modify")){  //修改地点触发,需要先显示一个详细地点
			
//			System.out.println("id= "+id);
//			 place = p.selectCyclistByCid(id);  //展示一个地点	
			 System.out.println(place.toString());
			 request.setAttribute("place", place);
			 request.getRequestDispatcher("./.jsp").forward(request, response);
		}
		else{
			if(realParam==null||realParam.equals(""))
			{
				//places =p.selectCyclistsByCName(realParam);  //				
			}
			else
			{
				
//				if(flagParam.equals("name"))
//				{
//					places=p.selectCyclistsByCName(realParam);
//				}
			}
//			JSONArray jaPlace = new JSONArray();
//			JSONObject jbplace = new JSONObject();
//			for(int i = 0;i < places.size();i++){
//				jbplace = new JSONObject();
//				jbplace.put("id", places.get(i).getId());
//				jbplace.put("name", places.get(i).getName());
//				jbplace.put("photo", places.get(i).getPhoto());
//				jbplace.put("description", places.get(i).getDescription());
//				jbplace.put("latitudeBd09ll", places.get(i).getLatitudeBd09ll());
//				jbplace.put("longitudeBd09ll", places.get(i).getLongitudeBd09ll());
//				jbplace.put("latitudeGcj02", places.get(i).getLatitudeGcj02());
//				jbplace.put("longitudeGcj02", places.get(i).getLongitudeGcj02());
//				jaPlace.add(jbplace);
//			}
//			jbplace.put("places", jaPlace);			
//			out.print(jaPlace.toJSONString());			
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
