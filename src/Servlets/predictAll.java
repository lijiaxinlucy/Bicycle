package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbutils.testPython;

/**
 * Servlet implementation class predictAll
 */
@WebServlet("/predictAll")
public class predictAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public predictAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub，这个是servlert
		
		String aString =request.getParameter("zhiliang");
		String bString =request.getParameter("jiaodu");
		String cString = request.getParameter("midu");
		String dString = request.getParameter("fengzu");
		String eString = request.getParameter("tang");
		String fString = request.getParameter("danbaizhi");
		String gString = request.getParameter("zhifang");
		String hString = request.getParameter("yan");
		String iString = request.getParameter("jingansuan");
		String jString = request.getParameter("laoansuan");
		String kString = request.getParameter("shuimian");
		String lString = request.getParameter("bingfu");
		String mString = request.getParameter("anmo");
		System.out.println(aString+":"+bString+":"+cString+":"+dString);
		double a,b,c,d,e,f,g,h,i,j,k,l,m;
		a = Double.parseDouble(aString);
		b = Double.parseDouble(bString);
		c = Double.parseDouble(cString);
		d = Double.parseDouble(dString);
		e = Double.parseDouble(eString);
		f = Double.parseDouble(fString);
		g = Double.parseDouble(gString);
		h = Double.parseDouble(hString);
		i = Double.parseDouble(iString);
		j = Double.parseDouble(jString);
		k = Double.parseDouble(kString);
		l = Double.parseDouble(lString);
		m = Double.parseDouble(mString);
		testPython testPython=new testPython();
    	String result  = testPython.testAll(a, b, c, d, e, f, g, h, i, j, k, l, m);
		//String result = "123";
    	
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
