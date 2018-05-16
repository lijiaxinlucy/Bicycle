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
	public static List<Cyclists> selectCyclistsByCName(String CName){//通过cname找到所有的运动员（可能重名）
		String hql="from Cyclists where Cname=:cname";
		Session session=DBConnection.getFactory().openSession();
		Query<Cyclists> query=session.createQuery(hql);
		query.setString("cname", CName);
		List<Cyclists> obj=query.list();
		return obj;
		
	}
	
	
	
}
