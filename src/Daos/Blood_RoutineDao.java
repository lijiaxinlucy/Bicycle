package Daos;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

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
//	public List<Blood_Routine> getBloodRoutine(String date){//通过年月日得到所有的血常规信息
//		Blood_RoutineDao blood_Routine=new Blood_RoutineDao();
//		List<Timestamp> list=blood_Routine.geTimestamps();//获得所有的时间戳
//		for(Timestamp t:list){
//			System.out.println("getBloodRoutine:"+t);
//		}
//		for(Timestamp t:list){//这里的逻辑不对
//			System.out.println(t);
//			if(blood_Routine.getYMD(t).equals(date)){
//				String hql="from Blood_Routine where BloodTestTime=:t";
//				Session session=DBConnection.getFactory().openSession();
//				Query<Blood_Routine> query=session.createQuery(hql);
//				query.setTimestamp("t", t);
//				List<Blood_Routine> blood_Routines=query.list();
//				return blood_Routines;//这，，，找到一个后就返回了
//			}
//		}
//		return null;
//	}
	public  List<Object[]> getBloodRoutine(String date)//通过年月日得到所有的血常规信息
	{
		String[] dates = date.split("-");
		////////////////////////如果功能用的不频繁 ，可以写这个一个长长的sql语句，，，，不用到处写子函数了
		String hql="select cy.Cid,cy.CName,cy.Sex, b.BRid,cy.CHeight,cy.CWeight,b.BloodTestTime,b.WBC,b.RBC,b.HGB,b.HCT,"
				+ "b.MCV,b.HGB_RBC,b.MCHC,b.PLT "
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
	public static void sortFromHighToLow(){//从大到小排序
		
	}
	public static void sortFromLowToHigh(){//从小到大排序
		
	}

	public static void findMax(){//找到最大值
	
	}
	public static void findMin(){//找到最小值
		
	}
	public static void findAverage(){//找到平均值
		
	}
}
