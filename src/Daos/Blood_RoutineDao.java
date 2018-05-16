package Daos;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.query.Query;

import dbutils.DBConnection;
import model.Blood_Routine;
import model.C_br;
import model.Cyclists;

public class Blood_RoutineDao {
	Cyclists c=new Cyclists();
	public Blood_RoutineDao(){
		
	}
	public Blood_RoutineDao(Cyclists cyclists){
		this.c=cyclists;
	}
	public List<Date> geDates(){//获得所有的时间戳
		String hql="select BloodTestTime from Blood_Routine";
		Session session=DBConnection.getFactory().openSession();
		Query<Date> query=session.createQuery(hql);
		List<Date> list=query.list();
		for(Date t:list){
			System.out.println(t);
		}
		return list;
	}
	public void deleteOneBrMsg(int brid){
		String sql1="delete from Blood_Routine  "
				+ "where BRid=:brid1";
		String sql2="delete from C_br  "
				+ "where BRid=:brid2";
		Session session=DBConnection.getFactory().openSession();
		Query query1=session.createQuery(sql1);
		Query query2=session.createQuery(sql2);
		query1.setSerializable("brid1", brid);
		query2.setLong("brid2", brid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query1.executeUpdate();
		query2.executeUpdate();
		transaction.commit();
	}
	public  List<Object[]> getBloodRoutine(String date)//通过年月日得到所有的血常规信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select cy.Cid,cy.CName,cy.Sex, cy.CHeight,cy.CWeight,cy.Age,b.BloodTestTime,"
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
	public  List<Object[]> getBloodRoutineBybrid(int brid)//通过brid得到所有的血常规信息
	{
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select b.BloodTestTime,cy.Cid,cy.CName,cy.Sex,cy.CHeight,cy.CWeight,"
				+ "b.Speed,b.WBC,b.RBC,b.HGB,b.HCT, "
				+ "b.MCV,b.HGB_RBC,b.MCHC,b.PLT "
				+ "from Blood_Routine as b,C_br as c,Cyclists as cy "
				+ "where c.BRid=:brid "
				+ "and b.BRid=c.BRid and cy.Cid=c.Cid";
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setLong("brid", brid);
		List<Object[]> result = query.list();
		//这里一般还得做一个判断，，万一没有查找到数据，，上层调用的就可能会出错
		if(result!= null&& !result.isEmpty())
			return result;
		else {
			return null;
		}
	}
	public Date getDate(int brid){//通过brid找到brid对应的时间
		String hql2="from Blood_Routine "+"where BRid=:brid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(hql2);
		query.setLong("brid", brid);
		Blood_Routine br=(Blood_Routine) query.uniqueResult();
		return br.getBloodTestTime();
	}
	//方法
	public void addOneMsg(String cid,String date,float speed,float wbc,float rbc,float hgb,
			float hct,float mcv,float hgb_rbc,float mchc,float plt) throws ParseException{
		//添加一条记录
		Session session=DBConnection.getFactory().openSession();
		org.hibernate.Transaction transaction=session.beginTransaction();
		Blood_Routine blood_Routine=new Blood_Routine();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		java.util.Date tDate=sdf.parse(date);  		
		java.sql.Date time=new java.sql.Date(tDate.getTime()); 
		blood_Routine.setBloodTestTime(time);
		blood_Routine.setHCT(hct);
		blood_Routine.setHGB(hgb);
		blood_Routine.setHGB_RBC(hgb_rbc);
		blood_Routine.setMCHC(mchc);
		blood_Routine.setMCV(mcv);
		blood_Routine.setPLT(plt);
		blood_Routine.setRBC(rbc);
		blood_Routine.setSpeed(speed);
		blood_Routine.setWBC(wbc);
		session.save(blood_Routine);//
		System.out.println("brid="+blood_Routine.getId());//获取自增主键的id
		transaction.commit();
		session.close();
		System.out.println("插入数据成功");
		String sql="";
	
		
	}

	
	
}
