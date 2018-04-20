package Daos;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.criteria.From;

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
	public List<C_br> getbrid(String Cid){//由cid找到运动员对应的所有时间的血常规id
		String hql="from C_br"+" where Cid=:cid";
		Session session=DBConnection.getFactory().openSession();
		Query<C_br> query=session.createQuery(hql);
		query.setString("cid", Cid);
	    List<C_br> list=query.list();
	    for(C_br c:list){
	    	System.out.println(c.getBRid());
	    }
		return list;
	}
	
	public String getbrid(String cid, Timestamp date) {//通过cid和date找唯一的brid
		// TODO Auto-generated method stub
		String hql="from C_br"+" where Cid=:cid";
		Session session=DBConnection.getFactory().openSession();
		Query<C_br> query=session.createQuery(hql);
		query.setString("cid", cid);
		List<C_br> list=query.list();//先用cid找到cid对应的所有的brid
	    for(C_br c:list){
	    	String brid=c.getBRid();//通过cid找到了brid，然后再从blood Routne里找到date；
	    	String hql2="from Blood_Routine where BRid=:brid";//
	    	Session session2=DBConnection.getFactory().openSession();
	    	Query query2=session2.createQuery(hql2);
	    	query2.setString("brid", brid);
	    	Blood_Routine blood_Routine=(Blood_Routine) query2.uniqueResult();
	    	if(blood_Routine.getBloodTestTime().equals(date)){//如果日期一致，返回该brid
	    		System.out.println("找到了唯一的brid了");
	    		return brid;
	    	}
	    }
		return null;
	    
	}
	public Timestamp getDate(String brid){//通过brid找到brid对应的时间
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setString("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getBloodTestTime();
	}
	public float getWbc(String brid){//通过brid找到对应的WBC
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setString("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getWBC();
	}
	public float getRbc(String brid){//通过brid找到对应的RBC
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setString("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getRBC();
	}
	public float getHgb(String brid){
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setString("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getHGB();
	}
	public float getHct(String brid){
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setString("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getHCT();
	}
	public float getMcv(String brid){
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setString("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getMCV();
	}
	public float getHgb_Rbc(String brid){
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setString("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getHGB_RBC();
	}
	public float getMchc(String brid){
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setString("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getMCHC();
	}
	public float getPlt(String brid){
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setString("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getPLT();
	}
	
}
