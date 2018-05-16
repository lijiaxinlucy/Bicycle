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
	public List<Integer> getbrid(String Cid){//由cid找到运动员对应的所有时间的血常规id
		String hql="select BRid from C_br"+" where Cid=:cid";
		Session session=DBConnection.getFactory().openSession();
		Query<Integer> query=session.createQuery(hql);
		query.setString("cid", Cid);
	    List<Integer> list=query.list();
	    System.out.println(list);
		return list;
	}
	public String getcid(int brid){//通过brid找到唯一的cid
		String hql="from C_br"+" where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query<C_br> query=session.createQuery(hql);
		query.setLong("brid", brid);
		List<C_br> str = query.list();
		if(str !=null && !str.isEmpty())
			return str.get(0).getCid();
		else return null;
	}
	
	
}
