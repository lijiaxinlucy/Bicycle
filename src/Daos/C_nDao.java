package Daos;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.criteria.From;

import org.hibernate.Session;
import org.hibernate.query.Query;

import dbutils.DBConnection;
import model.C_n;

public class C_nDao {//营养学科
	C_n c_n;
	public C_nDao(){
		
	}
	public C_nDao(C_n c_n){
		this.c_n=c_n;
	}
	public List<Integer> getNid(String Cid){//由cid找到运动员对应的所有时间的nid
		String hql="select NId from C_n"+" where CId=:cid";
		Session session=DBConnection.getFactory().openSession();
		Query<Integer> query=session.createQuery(hql);
		query.setString("cid", Cid);
	    List<Integer> list=query.list();
	    System.out.println(list);
		return list;
	}
	public String getcid(int nid){//通过nid找到唯一的cid
		String hql="from C_n"+" where RId=:nid";
		Session session=DBConnection.getFactory().openSession();
		Query<C_n> query=session.createQuery(hql);
		query.setLong("RId", nid);
		List<C_n> str = query.list();
		if(str !=null && !str.isEmpty())
			return str.get(0).getCId();
		else return null;
	}
	
	
}
