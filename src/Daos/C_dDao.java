package Daos;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.criteria.From;

import org.hibernate.Session;
import org.hibernate.query.Query;

import dbutils.DBConnection;
import model.C_d;
import model.C_r;
import model.Cyclists;

public class C_dDao {//康复学科
	C_d c_d;
	public C_dDao(){
		
	}
	public C_dDao(C_d c_d){
		this.c_d=c_d;
	}
	public List<Integer> getDid(String Cid){//由cid找到运动员对应的所有时间的血did
		String hql="select DId from C_d"+" where CId=:cid";
		Session session=DBConnection.getFactory().openSession();
		Query<Integer> query=session.createQuery(hql);
		query.setString("cid", Cid);
	    List<Integer> list=query.list();
	    System.out.println(list);
		return list;
	}
	public String getcid(int did){//通过did找到唯一的cid
		String hql="from C_d"+" where DId=:did";
		Session session=DBConnection.getFactory().openSession();
		Query<C_d> query=session.createQuery(hql);
		query.setLong("did", did);
		List<C_d> str = query.list();
		if(str !=null && !str.isEmpty())
			return str.get(0).getCId();
		else return null;
	}
	
	
}
