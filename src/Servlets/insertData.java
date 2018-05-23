package Servlets;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;

import dbutils.ImportUtil;

/**
 * Servlet implementation class insertData
 */
@WebServlet("/insertData")
public class insertData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public insertData() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
			importUtil.ImportMutilDataFromLine(aline);
			stringBuilder.append(aline);
		}		
		System.out.println(stringBuilder.toString());
		System.out.println("导入成功");
		response.sendRedirect("./NutriologyCoach.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
