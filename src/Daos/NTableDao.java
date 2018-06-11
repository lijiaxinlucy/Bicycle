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
import model.C_n;
import model.Cyclists;
import model.NTable;

public class NTableDao {//营养学科方法
	Cyclists c=new Cyclists();
	public NTableDao(){
		
	}
	public NTableDao(Cyclists cyclists){
		this.c=cyclists;
	}
	public List<Date> geDates(){//获得所有的时间戳
		String hql="select NDate from NTable";
		Session session=DBConnection.getFactory().openSession();
		Query<Date> query=session.createQuery(hql);
		List<Date> list=query.list();
		for(Date t:list){
			System.out.println(t);
		}
		return list;
	}
	public void deleteOneBrMsg(int nid){
		String sql1="delete from NTable  "
				+ "where NId=:nid1";
		String sql2="delete from C_n  "
				+ "where NId=:nid2";
		Session session=DBConnection.getFactory().openSession();
		Query query1=session.createQuery(sql1);
		Query query2=session.createQuery(sql2);
		query1.setSerializable("nid1", nid);
		query2.setLong("nid2", nid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query1.executeUpdate();
		query2.executeUpdate();
		transaction.commit();
	}
	public  List<Object[]> getNTable(String date)//通过年月日得到所有的信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select cy.CId,cy.CName,cy.Age,n.NDate,"
				+ "n.Suger,n.Protein,n.Fat,n.Salt,"
				+ "n.Bs,n.Rbp,n.Energy,n.Speed,c.NId "
				+ "from NTable as n,C_n as c,Cyclists as cy"
				+ " where date_format(n.NDate,'%Y-%m-%d')=:date "
				+ "and n.NId=c.NId and cy.CId=c.CId";//13
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
	public  List<Object[]> getNTableByNid(int nid)//通过nid得到所有的血常规信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select n.NDate,cy.CId,cy.CName,cy.Age,"
				+ "n.Speed,n.Suger,n.Protein,n.Fat,n.Salt,"
				+ "n.Bs,n.Rbp,n.Energy,n.NId "
				+ "from NTable as n,C_n as c,Cyclists as cy "
				+ "where c.NId=:nid "
				+ "and n.NId=c.NId and cy.CId=c.CId";//12
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setLong("nid", nid);
		List<Object[]> result = query.list();
		//这里一般还得做一个判断，，万一没有查找到数据，，上层调用的就可能会出错
		if(result!= null&& !result.isEmpty())
			return result;
		else {
			return null;
		}
	}
	public  List<Object[]> getNTableByDate(String cid,String date) throws ParseException//通过cid得到所有的血常规信息
	{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		java.util.Date tDate;
		
		tDate = sdf.parse(date);
		java.sql.Date time=new java.sql.Date(tDate.getTime()); 
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select n.NDate,cy.CId,cy.CName,cy.Age,"
				+ "n.Speed,n.Suger,n.Protein,n.Fat,n.Salt,"
				+ "n.Bs,n.Rbp,n.Energy,n.NId "
				+ "from NTable as n,C_n as c,Cyclists as cy "
				+ "where c.CId=:cid and n.NDate=:date "
				+ "and n.NId=c.NId and cy.CId=c.CId";//12
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
	public void addOneMsg(String cid,final String date,final int suger,final int protein,final int fat,final int salt,
			final double bs,final double rbp,final int energy,final double speed) throws ParseException{
		//添加一条记录
		Session session=DBConnection.getFactory().openSession();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		java.util.Date tDate=sdf.parse(date);  		
		final java.sql.Date time=new java.sql.Date(tDate.getTime());
		Transaction ts = session.beginTransaction();
		String result = session.doReturningWork(new ReturningWork<String>() {
			String call_sp="{call sp_insertNTableAndReturnId(?,?,?,?,?,?,?,?,?,?)}";
			@Override
			public String execute(Connection conn) throws SQLException {
				CallableStatement callsta = conn.prepareCall(call_sp);
				callsta.registerOutParameter(10, java.sql.Types.INTEGER);
				//////////////////////////////设置存储过程的输入参数
				callsta.setDouble(1, bs);
				callsta.setInt(2, energy);//int
				callsta.setInt(3, fat);//int
				callsta.setDate(4, time);//date
				callsta.setInt(5, protein);//int
				callsta.setDouble(6, rbp);//double
				callsta.setInt(7, salt);//v45
				callsta.setDouble(8, speed);//double
				callsta.setInt(9, suger);//v45
				//////////执行
				callsta.execute();
				///////end			
				int nid = callsta.getInt(10);
				System.out.println(nid);
				return nid+"";
			}
		});
		int Nid=Integer.parseInt(result);
		C_n c_n=new C_n();
		c_n.setCId(cid);
		c_n.setNId(Nid);
		session.save(c_n);
		ts.commit();
		System.out.println("插入成功：返回id为:"+result);
		session.close();
	}
	
	public int updateOneAthMsg(int nid, int sugar, int protein, int fat, int salt,
			 double bs, double rbp, int energy, double speed){
		Session session=DBConnection.getFactory().openSession();
		String sql="update NTable set Speed=:speed,Suger=:sugar,Protein=:protein,Fat=:fat,Salt=:salt,"
				+ "Bs=:bs,Rbp=:rbp,Energy=:energy where NId=:nid";
		Query query=session.createQuery(sql);
		query.setInteger("nid", nid);
		query.setInteger("sugar", sugar);
		query.setInteger("protein", protein);
		query.setInteger("fat", fat);
		query.setInteger("salt", salt);
		query.setDouble("bs", bs);
		query.setDouble("rbp", rbp);
		query.setDouble("speed", speed);
		query.setInteger("energy", energy);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query.executeUpdate();
		transaction.commit();
		session.close();
		return 0;
	}
}

