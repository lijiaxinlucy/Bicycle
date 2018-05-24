package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbutils.testPython;

/**
 * Servlet implementation class predictR
 */
@WebServlet("/predictR")
public class predictR extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public predictR() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String aString =request.getParameter("zhiliang");
		String bString =request.getParameter("jiaodu");
		String cString = request.getParameter("midu");
		String dString = request.getParameter("fengzu");
		String eString = request.getParameter("tuina");	
		System.out.println(aString+":"+bString+":"+cString+":"+dString+":"+eString);
		double a,b,c,d,e;
		a = Double.parseDouble(aString);
		b = Double.parseDouble(bString);
		c = Double.parseDouble(cString);
		d = Double.parseDouble(dString);
		e = Double.parseDouble(eString);
		testPython testPython=new testPython();
    	String result  = testPython.testR(a,b,c,d,e);
		//String result = "123";
    	
    	System.out.println("result:"+result);
    	System.out.println(result.substring(1,result.length()-2));
    	response.getWriter().write(result);
    	response.getWriter().flush();  	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
