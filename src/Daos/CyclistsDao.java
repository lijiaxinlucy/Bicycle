package Daos;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.junit.experimental.theories.Theories;

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
	public static Object listAllCyclists(){//列出所有运动员(不包括血常规仅基本信息)
		String sql1="from Cyclists";
		Session session=DBConnection.getFactory().openSession();
		Query<Cyclists> query=session.createQuery(sql1);
		List<Cyclists> obj=query.list();
		return obj;
	}
	
	public List<Object[]> selectCyclistByCid(String cid,String date){//通过cid找到唯一的那个运动员
		String hql="select cy.CId,cy.CName,cy.Age,n.NDate,"
				+ "n.Suger,n.Protein,n.Fat,n.Salt,"
				+ "n.Bs,n.Rbp,n.Energy,n.Speed,c.NId "
				+ "from NTable as n,C_n as c,Cyclists as cy"
				+ " where c.CId=:cid and date_format(n.NDate,'%Y-%m-%d')=:date "
				+ "and n.NId=c.NId and cy.CId=c.CId";//13
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setString("cid", cid);
		query.setString("date", date);
		List<Object[]> obj=query.list();
		if(obj!=null && !obj.isEmpty())
			return obj;
		else return null;
		
	}
	public List<Object[]> selectCyclistsByCName(String CName,String date){//通过cname找到所有的运动员（可能重名）
		String hql="select cy.CId,cy.CName,cy.Age,n.NDate,"
				+ "n.Suger,n.Protein,n.Fat,n.Salt,"
				+ "n.Bs,n.Rbp,n.Energy,n.Speed,c.NId "
				+ "from NTable as n,C_n as c,Cyclists as cy"
				+ " where cy.CName=:cname and date_format(n.NDate,'%Y-%m-%d')=:date "
				+ "and n.NId=c.NId and cy.CId=c.CId";//13
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setString("cname", CName);
		query.setString("date", date);
		List<Object[]> obj=query.list();
		if(obj!=null && !obj.isEmpty())
			return obj;
		else return null;
	}
	
	
	
}
