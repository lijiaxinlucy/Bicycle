package Daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import dbutils.DBConnection;
import model.Cyclists;

public class CyclistsDao {
	Cyclists cyclists;
	public CyclistsDao() {
		// TODO Auto-generated constructor stub
	}
	public CyclistsDao(Cyclists cyclists){
		this.cyclists=cyclists;
	}
	public static Object listAllCyclists(){//列出所有运动员的信息
		String sql1="from Cyclists";
		Session session=DBConnection.getFactory().openSession();
		Query<Cyclists> query=session.createQuery(sql1);
		List<Cyclists> obj=query.list();
		return obj;
	}
	
}
