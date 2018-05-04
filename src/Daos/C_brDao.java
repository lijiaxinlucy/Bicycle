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
	public List<String> getbrid(String Cid){//由cid找到运动员对应的所有时间的血常规id
		String hql="select BRid from C_br"+" where Cid=:cid";
		Session session=DBConnection.getFactory().openSession();
		Query<String> query=session.createQuery(hql);
		query.setString("cid", Cid);
	    List<String> list=query.list();
	    System.out.println(list);
		return list;
	}
	public String getcid(String brid){//通过brid找到唯一的cid
		String hql="from C_br"+" where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query<C_br> query=session.createQuery(hql);
		query.setString("brid", brid);
		List<C_br> str = query.list();
		if(str !=null && !str.isEmpty())
			return str.get(0).getCid();
		else return null;
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
	
}
