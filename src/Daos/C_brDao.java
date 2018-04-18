package Daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import dbutils.DBConnection;
import model.Blood_Routine;
import model.C_br;
import model.Cyclists;

public class C_brDao {
	C_br c_br;
	public C_brDao(){
		
	}
	public C_brDao(C_br c_br){
		this.c_br=c_br;
	}
	public String getbrid(String Cid){//由运动员id找到运动员对应的血常规id
		String hql="from C_br"+" where Cid=:cid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql);
		query.setString("cid", Cid);
	    C_br c=(C_br) query.uniqueResult();
		return c.getBRid();
	}
	public float getWbc(String brid){
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setString("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getWBC();
	}
	public float getRbc(String brid){
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setString("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getRBC();
	}
	
}
