package Daos;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.xml.soap.SAAJMetaFactory;

import org.hibernate.Session;
import org.hibernate.query.Query;

import dbutils.DBConnection;
import model.Blood_Routine;
import model.Cyclists;

public class Blood_RoutineDao {
	Cyclists c=new Cyclists();
	public Blood_RoutineDao(){
		
	}
	public Blood_RoutineDao(Cyclists cyclists){
		this.c=cyclists;
	}
	public String getYMD(Timestamp timestamp){//通过时间戳得到年月日
		String hql="select date_format(BloodTestTime,'%Y-%m-%d') from Blood_Routine "
				+ "where BloodTestTime=:timestamp";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql);
		query.setTimestamp("timestamp", timestamp);
		String time=(String) query.uniqueResult();
		
		return time;
		
	}
	public List<Timestamp> geTimestamps(){//获得所有的时间戳
		String hql="select BloodTestTime from Blood_Routine";
		Session session=DBConnection.getFactory().openSession();
		Query<Timestamp> query=session.createQuery(hql);
		List<Timestamp> list=query.list();
		for(Timestamp t:list){
			System.out.println(t);
		}
		return list;
	}
	public void deleteOneBrMsg(String brid){
		String sql1="delete from Blood_Routine  "
				+ "where BRid=:brid1";
		String sql2="delete from C_br  "
				+ "where BRid=:brid2";
		Session session=DBConnection.getFactory().openSession();
		Query query1=session.createQuery(sql1);
		Query query2=session.createQuery(sql2);
		query1.setSerializable("brid1", brid);
		query2.setString("brid2", brid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query1.executeUpdate();
		query2.executeUpdate();
		transaction.commit();
	}
	public  List<Object[]> getBloodRoutine(String date)//通过年月日得到所有的血常规信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select cy.Cid,cy.CName,cy.Sex, cy.CHeight,cy.CWeight,b.BloodTestTime,"
				+ "b.WBC,b.RBC,b.HGB,b.HCT,"
				+ "b.MCV,b.HGB_RBC,b.MCHC,b.PLT,c.BRid "
				+ "from Blood_Routine as b,C_br as c,Cyclists as cy"
				+ " where date_format(b.BloodTestTime,'%Y-%m-%d')=:date "
				+ "and b.BRid=c.BRid and cy.Cid=c.Cid";
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
	public  List<Object[]> getBloodRoutineBybrid(String brid)//通过brid得到所有的血常规信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select cy.Cid,cy.CName,cy.Sex, cy.CHeight,cy.CWeight,b.BloodTestTime,"
				+ "b.WBC,b.RBC,b.HGB,b.HCT,"
				+ "b.MCV,b.HGB_RBC,b.MCHC,b.PLT "
				+ "from Blood_Routine as b,C_br as c,Cyclists as cy "
				+ "where c.BRid=:brid "
				+ "and b.BRid=c.BRid and cy.Cid=c.Cid";
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setString("brid", brid);
		List<Object[]> result = query.list();
		//这里一般还得做一个判断，，万一没有查找到数据，，上层调用的就可能会出错
		if(result!= null&& !result.isEmpty())
			return result;
		else {
			return null;
		}
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
	
	//方法
	

	public static void findMax(){//找到最大值
	
	}
	public static void findMin(){//找到最小值
		
	}
	
}
