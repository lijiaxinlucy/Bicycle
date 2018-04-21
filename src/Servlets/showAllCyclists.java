package Servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.query.Query;

import Daos.Blood_RoutineDao;
import Daos.C_brDao;
import Daos.CyclistsDao;
import dbutils.DBConnection;
import model.Blood_Routine;
import model.C_br;
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
//	protected void doGet2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub 你继续
//		String test = request.getParameter("test");
//		String date=request.getParameter("date");//年月日格式
//		Blood_RoutineDao blood_RoutineDao=new Blood_RoutineDao();
//		List<Blood_Routine> blood_Routines1=blood_RoutineDao.getBloodRoutine(date);//通过年月日获得了所有br
//		
//		for(Blood_Routine b:blood_Routines1){
//			System.out.println("do get:"+b);
//			C_brDao c_brDao=new C_brDao();
//			String cid=c_brDao.getcid(b.getId());//通过brid得到唯一的cid
//			System.out.println("doget :"+cid);
//			CyclistsDao cyclistsDao=new CyclistsDao();
//			Cyclists cyclists=cyclistsDao.selectCyclistByCid(cid);//通过cid找到运动员
//			System.out.println(cyclists.getCName()+" "+cyclists.getCid()+" "+cyclists.getSex()+" "
//					+b.getId());
//		}
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method 
		response.setCharacterEncoding("utf-8");
		String test = request.getParameter("test");
		String date=request.getParameter("date");//年月日格式
		Blood_RoutineDao blood_RoutineDao=new Blood_RoutineDao();
		List<Object[]> result=blood_RoutineDao.getBloodRoutine(date);
		for(Object[] obj: result ){
			System.out.println(obj[0]+":"+ obj[1]+":"+obj[2]+":"+obj[3]+":"
					+obj[4]+":"+obj[5]+":"+obj[6]+":"+obj[7]+":"+obj[8]+":"+obj[9]+":"+obj[10]+
					":"+obj[11]+":"+obj[12]+":"+obj[13]+":"+obj[14]);
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
