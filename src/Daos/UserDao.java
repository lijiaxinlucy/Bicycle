package Daos;


import java.util.List;

import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.query.Query;

import dbutils.DBConnection;
import model.Users;

public class UserDao {
	Users user=new Users();
	public UserDao(){
		
	}
	public UserDao(Users user){
		this.user=user;
	}
	public List<Object[]> getU() {
		String sql="select u.UserID,u.UserName,r.RoleName,u.Password "
				+ "from Users as u,Roles as r,Role_User as ru"
				+ " where u.UserID=ru.UserID and r.RoleID=ru.RoleID";//14
		Session session=DBConnection.getFactory().openSession();
		Query query1=session.createQuery(sql);
		List<Object[]> users=query1.list();
		if(users!=null&& !users.isEmpty())
		 return users;
		else return null;
	}
	public void updateRoleToHaed(String userid) {
		String sql="update ru.RoleID set ru.RoleID='001' from Users as u,"
				+ "Roles as r,Role_User as ru where u.UserID=:userid and"
				+ " u.UserID=ru.UserID and r.RoleID=ru.RoleID";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(sql);
		query.setString("userid", userid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query.executeUpdate();
		transaction.commit();
		session.close();
	}
	public void updateRoleToD(String userid) {
		String sql="update ru.RoleID set ru.RoleID='003' from Users as u,"
				+ "Roles as r,Role_User as ru where u.UserID=:userid and"
				+ " u.UserID=ru.UserID and r.RoleID=ru.RoleID";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(sql);
		query.setString("userid", userid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query.executeUpdate();
		transaction.commit();
		session.close();
	}
	public void updateRoleToN(String userid) {
		String sql="update ru.RoleID set ru.RoleID='004' from Roles as r,Users as u,"
				+ "Role_User as ru where u.UserID=:userid and"
				+ " u.UserID=ru.UserID and r.RoleID=ru.RoleID";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(sql);
		query.setString("userid", userid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query.executeUpdate();
		transaction.commit();
		session.close();
		
	}
	public void updateRoleToR(String userid) {
		String sql="update ru.RoleID set ru.RoleID='002' from Users as u,"
				+ "Roles as r,Role_User as ru where u.UserID=:userid and"
				+ " u.UserID=ru.UserID and r.RoleID=ru.RoleID";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(sql);
		query.setString("userid", userid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query.executeUpdate();
		transaction.commit();
		session.close();
	}
}
