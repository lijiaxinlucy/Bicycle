package Daos;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.junit.experimental.theories.Theories;

import dbutils.DBConnection;
import model.Blood_Routine;
import model.C_br;
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
	
	public static Object deleteCyclistOneBr(String cid,Timestamp date){//通过cid和时间删除运动员的一条信息
		C_brDao c_brDao=new C_brDao();
		String brid=c_brDao.getbrid(cid,date);//通过cid和时间找到brid
		String sql2="delete from Cyclists where Cid=:cid";
		String sql3="delete from Blood_Routine where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query1=session.createQuery(sql2);
		Query query2=session.createQuery(sql3);
		query1.setString("cid", cid);
		query2.setString("brid", brid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query1.executeUpdate();
		query2.executeUpdate();
		transaction.commit();
		return null;
	}
	public static Object deleteCyclistAllBr(String cid,Timestamp timestamp){//通过cid和时间删除运动员的所有信息
		C_brDao c_brDao=new C_brDao();
		List<C_br> brid=c_brDao.getbrid(cid);//通过cid和时间找到所有brid
		String sql2="delete from Cyclists where Cid=:cid";
		String sql3="delete from Blood_Routine where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query1=session.createQuery(sql2);
		Query query2=session.createQuery(sql3);
		query1.setString("cid", cid);
		for(C_br cBr:brid){
			query2.setString("brid", cBr.getBRid());
			org.hibernate.Transaction transaction=session.beginTransaction();
			query2.executeUpdate();
		}
		org.hibernate.Transaction transaction=session.beginTransaction();
		query1.executeUpdate();
		transaction.commit();
		return null;
	}
	public static Cyclists selectCyclistByCid(String Cid){//通过cid找到唯一的那个运动员
		String hql="from Cyclists where Cid=:cid";
		Session session=DBConnection.getFactory().openSession();
		Query<Cyclists> query=session.createQuery(hql);
		query.setString("cid", Cid);
		List<Cyclists> obj=query.list();
		//return (Cyclists) obj;
		if(obj!=null && !obj.isEmpty())
			return obj.get(0);
		else return null;
		
	}
	public static Object selectCyclistsByCName(String CName){//通过cname找到所有的运动员（可能重名）
		String hql="from Cyclists where Cname=:cname";
		Session session=DBConnection.getFactory().openSession();
		Query<Cyclists> query=session.createQuery(hql);
		query.setString("cname", CName);
		List<Cyclists> obj=query.list();
		return obj;
		
	}
	public static void updateCyclist(String Cid,Timestamp timestamp){//通过cid和时间找到运动员，
			C_brDao c_brDao=new C_brDao();							//修改该运动员该天的数据
			c_brDao.getbrid(Cid,timestamp);//找到了该运动员该天的信息
			String hql="";
	}
	public void addOneCyclistBr(String cid,Timestamp timestamp){//增加一条一个运动员一天的数据
		
	}
	
}
