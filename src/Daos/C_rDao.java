package Daos;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.criteria.From;

import org.hibernate.Session;
import org.hibernate.query.Query;

import dbutils.DBConnection;
import model.C_r;
import model.Cyclists;

public class C_rDao {//力学学科
	C_r c_r;
	public C_rDao(){
		
	}
	public C_rDao(C_r c_r){
		this.c_r=c_r;
	}
	public List<Integer> getRid(String Cid){//由cid找到运动员对应的所有时间的血rid
		String hql="select RId from C_r"+" where CId=:cid";
		Session session=DBConnection.getFactory().openSession();
		Query<Integer> query=session.createQuery(hql);
		query.setString("cid", Cid);
	    List<Integer> list=query.list();
	    System.out.println(list);
		return list;
	}
	public String getcid(int rid){//通过rid找到唯一的cid
		String hql="from C_r"+" where RId=:rid";
		Session session=DBConnection.getFactory().openSession();
		Query<C_r> query=session.createQuery(hql);
		query.setLong("rid", rid);
		List<C_r> str = query.list();
		if(str !=null && !str.isEmpty())
			return str.get(0).getCId();
		else return null;
	}
	
	
}
