package Daos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.jdbc.ReturningWork;
import org.hibernate.query.Query;

import dbutils.DBConnection;
import model.C_d;
import model.Cyclists;

public class DTableDao {//力学学科方法
	Cyclists c=new Cyclists();
	public DTableDao(){
		
	}
	public DTableDao(Cyclists cyclists){
		this.c=cyclists;
	}
	
	public void deleteOneDMsg(int did){
		String sql1="delete from DTable  "
				+ "where DId=:did1";
		String sql2="delete from C_d  "
				+ "where DId=:did2";
		Session session=DBConnection.getFactory().openSession();
		Query query1=session.createQuery(sql1);
		Query query2=session.createQuery(sql2);
		query1.setSerializable("did1", did);
		query2.setLong("did2", did);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query1.executeUpdate();
		query2.executeUpdate();
		transaction.commit();
	}
	public  List<Object[]> getDTable(String date)//通过年月日得到所有的信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select cy.CId,cy.CName,cy.Age,d.DDate,"
				+ "d.Weight,d.Air,d.Ang,d.Are,"
				+ "d.F1,d.High,d.F2,d.Speed "
				+ "from DTable as d,C_d as c,Cyclists as cy"
				+ " where date_format(d.DDate,'%Y-%m-%d')=:date "
				+ "and d.DId=c.DId and cy.CId=c.CId";//13
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setString("date", date);
		List<Object[]> result = query.list();
		//这里一般还得做一个判断，，万一没有查找到数据，，上层调用的就可能会出错
		if(result!= null&& !result.isEmpty())
			return result;
		else {
			return null;
		}
	}
	public  List<Object[]> getDTableByDid(int did)//通过did得到所有的血常规信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select d.DDate,cy.CId,cy.CName,cy.Age,"
				+ "d.Speed,d.Weight,d.Air,d.Ang,d.Are,d.F1,"
				+ "d.High,d.F2,d.DId "
				+ "from DTable as d,C_d as c,Cyclists as cy "
				+ "where c.DId=:did "
				+ "and d.DId=c.DId and cy.CId=c.CId";//13
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setLong("did", did);
		List<Object[]> result = query.list();
		//这里一般还得做一个判断，，万一没有查找到数据，，上层调用的就可能会出错
		if(result!= null&& !result.isEmpty())
			return result;
		else {
			return null;
		}
	}
	public  List<Object[]> getDTableByDate(String cid,String date) throws ParseException//通过cid得到所有的血常规信息
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		java.util.Date tDate;
		tDate = sdf.parse(date);
		java.sql.Date time=new java.sql.Date(tDate.getTime()); 
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select d.DDate,cy.CId,cy.CName,cy.Age,"
				+ "d.Speed,d.Weight,d.Air,d.Ang,d.Are,d.F1,"
				+ "d.High,d.F2,d.DId "
				+ "from DTable as d,C_d as c,Cyclists as cy "
				+ "where c.CId=:cid and d.DDate=:date "
				+ "and d.DId=c.DId and cy.CId=c.CId";//12
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setString("cid", cid);
		query.setDate("date", time);
		List<Object[]> result = query.list();
		//这里一般还得做一个判断，，万一没有查找到数据，，上层调用的就可能会出错
		if(result!= null&& !result.isEmpty())
			return result;
		else {
			return null;
		}
	}
	//方法
	public void addOneMsg(String cid, final String date, final int ang, final double air,final double weight, final double are, final double f1, final double f2,
			final double high, final double speed) throws ParseException {
		// TODO Auto-generated method stub
		Session session=DBConnection.getFactory().openSession();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		java.util.Date tDate=sdf.parse(date);  		
		final java.sql.Date time=new java.sql.Date(tDate.getTime());
		Transaction ts = session.beginTransaction();
		String result = session.doReturningWork(new ReturningWork<String>() {
			String call_sp="{call sp_insertDTableAndReturnId(?,?,?,?,?,?,?,?,?,?)}";
			@Override
			public String execute(Connection conn) throws SQLException {
				CallableStatement callsta = conn.prepareCall(call_sp);
				callsta.registerOutParameter(10, java.sql.Types.INTEGER);
				//////////////////////////////设置存储过程的输入参数
				callsta.setDouble(1, weight);
				callsta.setDouble(2, air);//int
				callsta.setInt(3, ang);//int
				callsta.setDouble(4, are);//date
				callsta.setDouble(5, f1);//int
				callsta.setDouble(6, high);//double
				callsta.setDouble(7, f2);//v45
				callsta.setDouble(8, speed);//double
				callsta.setDate(9, time);//v45
				//////////执行
				callsta.execute();
				///////end			
				int nid = callsta.getInt(10);
				System.out.println(nid);
				return nid+"";
			}
		});
		int Nid=Integer.parseInt(result);
		C_d c_d=new C_d();
		c_d.setCId(cid);
		c_d.setDId(Nid);
		session.save(c_d);
		ts.commit();
		System.out.println("插入成功：返回id为:"+result);
		session.close();
	}

	
	
}
