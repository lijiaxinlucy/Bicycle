package Servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbutils.ImportUtil;

/**
 * Servlet implementation class insertDData
 */
@WebServlet("/insertDData")
public class insertDData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertDData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		InputStream inputStream = request.getInputStream();
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "utf-8"));
		char[] chars = new char[1024];
		int len ;
		StringBuilder stringBuilder = new StringBuilder();
		String  boundary = "";
		String aline = "";
		boundary = bufferedReader.readLine();
		while((aline=bufferedReader.readLine()).length()!=0){
			System.out.println("drop:"+aline);
			continue;		
		}
		System.out.println("---------------------");

		ImportUtil importUtil = new ImportUtil();
		while(!((aline=bufferedReader.readLine()).equals(boundary))&&aline.length()>0){
			System.out.println("aline:"+aline);
			importUtil.ImportDMutilDataFromLine(aline);
			stringBuilder.append(aline);
		}		
		System.out.println(stringBuilder.toString());
		System.out.println("导入成功");
		response.sendRedirect("./DynamicsCoach.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
