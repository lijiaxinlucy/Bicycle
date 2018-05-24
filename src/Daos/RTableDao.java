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
import model.C_r;
import model.Cyclists;

public class RTableDao {//营养学科方法
	Cyclists c=new Cyclists();
	public RTableDao(){
		
	}
	public RTableDao(Cyclists cyclists){
		this.c=cyclists;
	}
	
	public void deleteOneRMsg(int rid){
		String sql1="delete from RTable  "
				+ "where RId=:rid1";
		String sql2="delete from C_r  "
				+ "where RId=:rid2";
		Session session=DBConnection.getFactory().openSession();
		Query query1=session.createQuery(sql1);
		Query query2=session.createQuery(sql2);
		query1.setSerializable("rid1", rid);
		query2.setLong("rid2", rid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query1.executeUpdate();
		query2.executeUpdate();
		transaction.commit();
	}
	public  List<Object[]> getRTable(String date)//通过年月日得到所有的信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select cy.CId,cy.CName,cy.Age,r.RDate,"
				+ "r.HGB,r.STTT,r.CK,r.ARG,"
				+ "r.TYR,r.SLEEP,r.ICE,r.MSG,r.Speed,c.RId "
				+ "from RTable as r,C_r as c,Cyclists as cy"
				+ " where date_format(r.RDate,'%Y-%m-%d')=:date "
				+ "and r.RId=c.RId and cy.CId=c.CId";//14
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
	public  List<Object[]> getRTableByRid(int rid)//通过nid得到所有的血常规信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select r.RDate,cy.CId,cy.CName,cy.Age,r.Speed,"
				+ "r.HGB,r.STTT,r.CK,r.ARG,"
				+ "r.TYR,r.SLEEP,r.ICE,r.MSG,r.RId "
				+ "from RTable as r,C_r as c,Cyclists as cy "
				+ "where c.RId=:rid "
				+ "and r.RId=c.RId and cy.CId=c.CId";//14
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setLong("rid", rid);
		List<Object[]> result = query.list();
		//这里一般还得做一个判断，，万一没有查找到数据，，上层调用的就可能会出错
		if(result!= null&& !result.isEmpty())
			return result;
		else {
			return null;
		}
	}
	public  List<Object[]> getRTableByDate(String cid,String date) throws ParseException//通过cid得到所有的血常规信息
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		java.util.Date tDate;
		tDate = sdf.parse(date);
		java.sql.Date time=new java.sql.Date(tDate.getTime()); 
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select cy.CId,cy.CName,cy.Age,r.RDate,"
				+ "r.Speed, r.HGB,r.STTT,r.CK,r.ARG,"
				+ "r.TYR,r.SLEEP,r.ICE,r.MSG,r.RId "
				+ "from RTable as r,C_r as c,Cyclists as cy "
				+ "where c.CId=:cid and r.RDate=:date "
				+ "and r.RId=c.RId and cy.CId=c.CId";//13
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
	public void addOneRMsg(String cid,final String date,final double hgb,final double sttt,final double ck,final double arg,
			final double tyr,final double sleep,final int ice,final int msg,final double speed) throws ParseException{
		//添加一条记录
		Session session=DBConnection.getFactory().openSession();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		java.util.Date tDate=sdf.parse(date);  		
		final java.sql.Date time=new java.sql.Date(tDate.getTime());
		Transaction ts = session.beginTransaction();
		String result = session.doReturningWork(new ReturningWork<String>() {
			String call_sp="{call sp_insertRTableAndReturnId(?,?,?,?,?,?,?,?,?,?,?)}";
			@Override
			public String execute(Connection conn) throws SQLException {
				CallableStatement callsta = conn.prepareCall(call_sp);
				callsta.registerOutParameter(11, java.sql.Types.INTEGER);
				//////////////////////////////设置存储过程的输入参数
				callsta.setDouble(1,hgb);
				callsta.setDouble(2,sttt);
				callsta.setDouble(3,ck);
				callsta.setDouble(4,arg);
				callsta.setDouble(5,tyr);
				callsta.setDouble(6,sleep);
				callsta.setInt(7,ice);
				callsta.setInt(8,msg);
				callsta.setDouble(9,speed);
				callsta.setDate(10,time);
				//////////执行
				callsta.execute();
				///////end			
				int rid = callsta.getInt(11);
				System.out.println(rid);
				return rid+"";
			}
		});
		int Rid=Integer.parseInt(result);
		C_r c_r=new C_r();
		c_r.setCId(cid);
		c_r.setRId(Rid);
		session.save(c_r);
		ts.commit();
		System.out.println("插入成功：返回id为:"+result);
		session.close();
	}
	
	
}
