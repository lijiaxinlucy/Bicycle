package Daos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.jdbc.ReturningWork;
import org.hibernate.query.Query;
import org.junit.experimental.theories.Theories;

import dbutils.DBConnection;
import model.C_n;
import model.Cyclists;

public class CyclistsDao {
	Cyclists cyclists;
	public CyclistsDao() {
		// TODO Auto-generated constructor stub
	}
	public CyclistsDao(Cyclists cyclists){
		this.cyclists=cyclists;
	}
	public static Object listAllCyclists(){//列出所有运动员(不包括血常规仅基本信息)
		String sql1="from Cyclists";
		Session session=DBConnection.getFactory().openSession();
		Query<Cyclists> query=session.createQuery(sql1);
		List<Cyclists> obj=query.list();
		return obj;
	}
	
	public List<Object[]> selectCyclistByCid(String cid,String date){//通过cid找到唯一的那个运动员
		String hql="select cy.CId,cy.CName,cy.Age,n.NDate,"
				+ "n.Suger,n.Protein,n.Fat,n.Salt,"
				+ "n.Bs,n.Rbp,n.Energy,n.Speed,c.NId "
				+ "from NTable as n,C_n as c,Cyclists as cy"
				+ " where c.CId=:cid and date_format(n.NDate,'%Y-%m-%d')=:date "
				+ "and n.NId=c.NId and cy.CId=c.CId";//13
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setString("cid", cid);
		query.setString("date", date);
		List<Object[]> obj=query.list();
		if(obj!=null && !obj.isEmpty())
			return obj;
		else return null;
		
	}
	public List<Object[]> selectCyclistsByCName(String CName,String date){//通过cname找到所有的运动员（可能重名）
		String hql="select cy.CId,cy.CName,cy.Age,n.NDate,"
				+ "n.Suger,n.Protein,n.Fat,n.Salt,"
				+ "n.Bs,n.Rbp,n.Energy,n.Speed,c.NId "
				+ "from NTable as n,C_n as c,Cyclists as cy"
				+ " where cy.CName=:cname and date_format(n.NDate,'%Y-%m-%d')=:date "
				+ "and n.NId=c.NId and cy.CId=c.CId";//13
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setString("cname", CName);
		query.setString("date", date);
		List<Object[]> obj=query.list();
		if(obj!=null && !obj.isEmpty())
			return obj;
		else return null;
	}
	
	public void addOneAth(final String cid,final String cname,final int cage) throws ParseException{
		//添加一条记录
		Session session=DBConnection.getFactory().openSession();
		org.hibernate.Transaction ts = session.beginTransaction();
		Cyclists cyclists=new Cyclists();
		cyclists.setCId(cid);
		cyclists.setCName(cname);
		cyclists.setAge(cage);
		
		session.save(cyclists);
		ts.commit();
		session.close();
	}
	public  List<Object[]> getNTable()//
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select CId,CName,Age from Cyclists";
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		List<Object[]> result = query.list();
		//这里一般还得做一个判断，，万一没有查找到数据，，上层调用的就可能会出错
		if(result!= null&& !result.isEmpty())
			return result;
		else {
			return null;
		}
	}
	public void deleteCy(String id) {
		// TODO Auto-generated method stub
		String sql1="delete from Cyclists  "
				+ "where CId=:cid1";
		String sql2="delete from C_r "
				+ "where CId=:cid2";
		String sql3="delete from C_n "
				+ "where CId=:cid3";
		String sql4="delete from C_d "
				+ "where CId=:cid4";
		Session session=DBConnection.getFactory().openSession();
		Query query1=session.createQuery(sql1);
		Query query2=session.createQuery(sql2);
		Query query3=session.createQuery(sql3);
		Query query4=session.createQuery(sql4);
		query1.setString("cid1", id);
		query2.setString("cid2", id);
		query3.setString("cid3", id);
		query4.setString("cid4", id);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query1.executeUpdate();
		query2.executeUpdate();
		transaction.commit();
	}
}
