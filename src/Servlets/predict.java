package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbutils.testPython;

/**
 * Servlet implementation class predict
 */
@WebServlet("/predict")
public class predict extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public predict() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String aString =request.getParameter("zhiliang");
		String bString =request.getParameter("jiaodu");
		String cString = request.getParameter("midu");
		String dString = request.getParameter("fengzu");
		System.out.println(aString+":"+bString+":"+cString+":"+dString);
		double a,b,c,d;
		a = Double.parseDouble(aString);
		b = Double.parseDouble(bString);
		c = Double.parseDouble(cString);
		d = Double.parseDouble(dString);
		
		testPython testPython=new testPython();
    	String result  = testPython.test(a,b,c,d);
		//String result = "123";
    	
    	System.out.println(result.substring(1,result.length()-2));
    	response.getWriter().write(result);
    	response.getWriter().flush();  	
		//
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
