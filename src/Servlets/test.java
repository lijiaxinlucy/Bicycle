package Servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.jdbc.Work;

import Daos.CyclistsDao;
import dbutils.DBConnection;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		SmartUpload smartUpload = new SmartUpload();
        // 初始化
        ServletConfig config = this.getServletConfig();
        smartUpload.initialize(config, request, response);
        String saveRoot  ="d:/Develop/uploaddata/";
        String saveFilePath = "";
        try {
            // 上传文件
            smartUpload.upload();
            // 得到上传的文件对象
            
            com.jspsmart.upload.File smartFile = smartUpload.getFiles().getFile(0);
            // 保存文件
            saveFilePath = saveRoot+smartFile.getFileName();
            
            
            System.out.println("保存文件到："+saveFilePath);
            smartFile.saveAs(saveFilePath,smartUpload.SAVE_PHYSICAL);// 保存文件到d盘根目录
            //拿小本本记下来
           /**
            * The MySQL server is running with the --secure-file-priv option so it cannot execute this statement
            * 这个错误，，是MySQL配置的问题，
            */
            String tableName = "cyclists";
            final String sql ="load data infile '"+saveFilePath
									+ "' replace  into table "+tableName+" fields terminated by ',' lines terminated by '\\n' ";
            System.out.println(sql);
            Session session = DBConnection.getFactory().openSession();
			Transaction ts = session.beginTransaction();
			try {
				session.doWork(new Work() {//这个doWork是用来进行事务操作的
					@Override
					public void execute(Connection conn) throws SQLException {
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.execute();
						System.out.println("导入完成");
					}
				});
				ts.commit();
				System.out.println("导入数据成功");
			}catch(Exception e){
				e.printStackTrace();
				ts.rollback();
				System.out.println("导入数据出现错误");
			}
            System.out.println("保存成功");
        } catch (SmartUploadException e) {
            e.printStackTrace();
        }
        String msg = "Upload Success!";
        request.setAttribute("msg", msg);
        
	}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
