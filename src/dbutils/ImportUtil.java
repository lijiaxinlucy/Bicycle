package dbutils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.LineNumberInputStream;
import java.io.UnsupportedEncodingException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.stream.Stream;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.jdbc.ReturningWork;
import org.hibernate.jdbc.Work;

import model.C_n;


public class ImportUtil {
	public ImportUtil() {
	}

	/**
	 * 
	 * @param filepath
	 *            文件的绝对路径，带盘符的那种，这个文件应该是一个.cvs文件，并且以,作为分割符，
	 * @param tablename
	 *            数据库中的表名
	 */
	public void ImportDataFromFile(final String filepath, final String tablename) {
		Session session = DBConnection.getFactory().openSession();
		Transaction ts = session.beginTransaction();
		session.doWork(new Work() {// 这个doWork是用来进行事务操作的
			@Override
			public void execute(Connection conn) throws SQLException {
				// 把文件路径改一下，
				// String tablename = "tablename";//所要导入的表名
				// String filepath = "filepath";//文件的路径
				String asql = "load data infile '" + filepath + "' replace into table " + tablename
						+ " fields terminated by ',' ";
				PreparedStatement pstmt = conn.prepareStatement(asql);
				pstmt.execute();
				System.out.println("导入完成");
			}
		});
		ts.commit();
	}

	/**
	 * 
	 * @param filepath
	 * @param tablename
	 * @param ch
	 *            用法同只有两个参数的函数，只不过可以改变分隔符
	 */
	public void ImportDataFromFile(final String filepath, final String tablename, final char ch) {
		if (ch == ',') {
			ImportDataFromFile(filepath, tablename);
			return;
		}
		Session session = DBConnection.getFactory().openSession();
		Transaction ts = session.beginTransaction();
		session.doWork(new Work() {// 这个doWork是用来进行事务操作的
			@Override
			public void execute(Connection conn) throws SQLException {
				// 把文件路径改一下，
				// String tablename = "tablename";//所要导入的表名
				// String filepath = "filepath";//文件的路径
				String asql = "load data infile '" + filepath + "' replace into table " + tablename
						+ " fields terminated by '" + ch + "' ";
				PreparedStatement pstmt = conn.prepareStatement(asql);
				pstmt.execute();
				System.out.println("导入完成");
			}
		});
		ts.commit();
	}

//	 * 假装sql语句的样子是：
//	 * insert xxx into xxx value(%x,%x,%x) where xxxxxxx
//	 * 总之，，用%x代表占位符，占位符使用cvs文件中的每一行进行填充
//	 * @param filepath
//	 * @param sql
//	 */
//	public void ImportSqlFromFile(final String filepath,String sql) {
//		File file = new File(filepath);
//		InputStream in;
//		try {
//			in = new FileInputStream(file);
//			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(in, "utf-8"));
//			
//			ArrayList<String> lines = new ArrayList<>();
//			String aline = "";
//			while((aline = bufferedReader.readLine()) != null){
//				lines.add(aline);
//			}
//			
//			
//					
//			Session session = DBConnection.getFactory().openSession();
//			Transaction ts = session.beginTransaction();
//			session.doWork(new Work() {// 这个doWork是用来进行事务操作的
//				@Override
//				public void execute(Connection conn) throws SQLException {
//					// 你只用把文件路径改一下，
//					// String tablename = "tablename";//所要导入的表名
//					// String filepath = "filepath";//文件的路径
//					String asql = "load data infile '" + filepath + "' replace into table " + tablename
//							+ " fields terminated by '" + ch + "' ";
//					PreparedStatement pstmt = conn.prepareStatement(asql);
//					pstmt.execute();
//					System.out.println("导入完成");
//				}
//			});
//			ts.commit();
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}

	public void ImportMutilData(String filepath){

		File file = new File(filepath);
		InputStream in;
		Session session=DBConnection.getFactory().openSession();
		Transaction ts = session.beginTransaction();
		try {
			in = new FileInputStream(file);
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(in, "utf-8"));
			
			ArrayList<String> lines = new ArrayList<>();
			String aline = "";
			while((aline = bufferedReader.readLine()) != null){
				lines.add(aline);
				System.out.println(aline);
			}
			
			final String call_sp="{call sp_inserMutilData(?,?,?,?)}";
			for(String line:lines){//对每一行的数据执行一次存储过程，进行插入
				final String[] feilds = line.split(",");
				session.doWork(new Work() {
						@Override
						public void execute(Connection conn) throws SQLException {
							
							CallableStatement callsta = conn.prepareCall(call_sp);
							//////////////////////////////设置存储过程的输入参数
							callsta.setString(1, feilds[0]);
							callsta.setDate(2, java.sql.Date.valueOf(feilds[1]));						
							callsta.setDouble(3, Double.parseDouble(feilds[2]));
							callsta.setDouble(4, Double.parseDouble(feilds[3]));
							//////////执行
							callsta.execute();
							System.out.println("执行了一条插入");
							///////end			
					}
				});
			}
			
		}catch(Exception e){
			e.printStackTrace();
			ts.rollback();//出错则进行回滚
		}
		finally {
			ts.commit();
			session.close();
		}
		//添加一条记录
		
	
	}

	public void ImportMutilDataFromLine(String aline) {
		Session session = DBConnection.getFactory().openSession();
		Transaction ts = session.beginTransaction();
		try {
			final String call_sp = "{call sp_inserMutilData(?,?,?,?)}";
			System.out.println(aline);
			final String[] feilds = aline.split(",");
			session.doWork(new Work() {
				@Override
				public void execute(Connection conn) throws SQLException {
					CallableStatement callsta = conn.prepareCall(call_sp);
					////////////////////////////// 设置存储过程的输入参数
					callsta.setString(1, feilds[0]);

					SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
					java.util.Date d = null;
					try {
						d = format.parse(feilds[1]);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					java.sql.Date date = new java.sql.Date(d.getTime());
					callsta.setDate(2, date);
					callsta.setDouble(3, Double.parseDouble(feilds[2]));
					callsta.setDouble(4, Double.parseDouble(feilds[3]));
					////////// 执行
					System.out.println("执行了一条插入");
					callsta.execute();
					/////// end
				}
			});
			

		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();// 出错则进行回滚
		} finally {
			ts.commit();
			session.close();
		}
		// 添加一条记录

	}
	public void ImportDMutilDataFromLine(String aline) {
		Session session = DBConnection.getFactory().openSession();
		Transaction ts = session.beginTransaction();
		try {
			final String call_sp = "{call sp_inserDMutilData(?,?,?,?)}";
			System.out.println(aline);
			final String[] feilds = aline.split(",");
			session.doWork(new Work() {
				@Override
				public void execute(Connection conn) throws SQLException {
					CallableStatement callsta = conn.prepareCall(call_sp);
					////////////////////////////// 设置存储过程的输入参数
					callsta.setString(1, feilds[0]);

					SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
					java.util.Date d = null;
					try {
						d = format.parse(feilds[1]);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					java.sql.Date date = new java.sql.Date(d.getTime());
					callsta.setDate(2, date);
					callsta.setDouble(3, Double.parseDouble(feilds[2]));
					callsta.setDouble(4, Double.parseDouble(feilds[3]));
					////////// 执行
					System.out.println("执行了一条插入");
					callsta.execute();
					/////// end
				}
			});
			

		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();// 出错则进行回滚
		} finally {
			ts.commit();
			session.close();
		}
		// 添加一条记录

	}	
	public void ImportRMutilDataFromLine(String aline) {
		Session session = DBConnection.getFactory().openSession();
		Transaction ts = session.beginTransaction();
		try {
			final String call_sp = "{call sp_inserRMutilData(?,?,?,?)}";
			System.out.println(aline);
			final String[] feilds = aline.split(",");
			session.doWork(new Work() {
				@Override
				public void execute(Connection conn) throws SQLException {
					CallableStatement callsta = conn.prepareCall(call_sp);
					////////////////////////////// 设置存储过程的输入参数
					callsta.setString(1, feilds[0]);

					SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
					java.util.Date d = null;
					try {
						d = format.parse(feilds[1]);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					java.sql.Date date = new java.sql.Date(d.getTime());
					callsta.setDate(2, date);
					callsta.setDouble(3, Double.parseDouble(feilds[2]));
					callsta.setDouble(4, Double.parseDouble(feilds[3]));
					////////// 执行
					System.out.println("执行了一条插入");
					callsta.execute();
					/////// end
				}
			});
			

		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();// 出错则进行回滚
		} finally {
			ts.commit();
			session.close();
		}
		// 添加一条记录

	}
}
