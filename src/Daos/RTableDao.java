package Daos;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.query.Query;

import dbutils.DBConnection;
import model.Cyclists;
import model.NTable;

public class RTableDao {//营养学科方法
	Cyclists c=new Cyclists();
	public RTableDao(){
		
	}
	public RTableDao(Cyclists cyclists){
		this.c=cyclists;
	}
	public List<Date> geDates(){//获得所有的时间戳
		String hql="select NDate from NTable";
		Session session=DBConnection.getFactory().openSession();
		Query<Date> query=session.createQuery(hql);
		List<Date> list=query.list();
		for(Date t:list){
			System.out.println(t);
		}
		return list;
	}
	public void deleteOneRMsg(int rid){
		String sql1="delete from RTable  "
				+ "where RId=:rid1";
		String sql2="delete from C_r  "
				+ "where RId=:rid2";
		Session session=DBConnection.getFactory().openSession();
		Query query1=session.createQuery(sql1);
		Query query2=session.createQuery(sql2);
		query1.setSerializable("rid1", rid);
		query2.setLong("rid2", rid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query1.executeUpdate();
		query2.executeUpdate();
		transaction.commit();
	}
	public  List<Object[]> getRTable(String date)//通过年月日得到所有的信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select cy.CId,cy.CName,cy.Age,r.RDate,"
				+ "n.Suger,n.Protein,n.Fat,n.Salt,"
				+ "n.Bs,n.Rbp,n.Energy,n.Speed,c.NId "
				+ "from RTable as r,C_r as c,Cyclists as cy"
				+ " where date_format(r.RDate,'%Y-%m-%d')=:date "
				+ "and r.RId=c.RId and cy.CId=c.CId";//13
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setString("date", date);
		List<Object[]> result = query.list();
		//这里一般还得做一个判断，，万一没有查找到数据，，上层调用的就可能会出错
		if(result!= null&& !result.isEmpty())
			return result;
		else {
			return null;
		}
	}
	public  List<Object[]> getRTableByRid(int rid)//通过nid得到所有的血常规信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select r.RDate,cy.CId,cy.CName,cy.Age,"
				+ "n.Speed,n.Suger,n.Protein,n.Fat,n.Salt,"
				+ "n.Bs,n.Rbp,n.Energy "
				+ "from RTable as r,C_r as c,Cyclists as cy "
				+ "where c.RId=:rid "
				+ "and r.RId=c.RId and cy.CId=c.CId";//12
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setLong("rid", rid);
		List<Object[]> result = query.list();
		//这里一般还得做一个判断，，万一没有查找到数据，，上层调用的就可能会出错
		if(result!= null&& !result.isEmpty())
			return result;
		else {
			return null;
		}
	}
	
	//方法
	public void addOneMsg(String cid,String date,float speed,float wbc,float rbc,float hgb,
			float hct,float mcv,float hgb_rbc,float mchc,float plt) throws ParseException{
		//添加一条记录
		Session session=DBConnection.getFactory().openSession();
		org.hibernate.Transaction transaction=session.beginTransaction();
		NTable nTable=new NTable();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		java.util.Date tDate=sdf.parse(date);  		
		java.sql.Date time=new java.sql.Date(tDate.getTime()); 
		
		session.save(nTable);//
		//System.out.println("brid="+blood_Routine.getId());//获取自增主键的id
		transaction.commit();
		session.close();
		System.out.println("插入数据成功");
		String sql="";
		
	}

	
	
}
