package Daos;


import java.util.List;

import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.query.Query;

import dbutils.DBConnection;
import model.C_n;
import model.Cyclists;
import model.Role_User;
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
		String sql="update Role_User set RoleID ='1' where UserID=:userid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(sql);
		query.setString("userid", userid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query.executeUpdate();
		transaction.commit();
		session.close();
	}
	public void updateRoleToD(String userid) {
		String sql="update Role_User set RoleID ='3' where UserID=:userid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(sql);
		query.setString("userid", userid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query.executeUpdate();
		transaction.commit();
		session.close();
	}
	public void updateRoleToN(String userid) {
		String sql="update Role_User set RoleID ='4' where UserID=:userid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(sql);
		query.setString("userid", userid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query.executeUpdate();
		transaction.commit();
		session.close();
		
	}
	public void updateRoleToR(String userid) {
		String sql="update Role_User set RoleID ='2' where UserID=:userid";
		Session session=DBConnection.getFactory().openSession();
		Query query=session.createQuery(sql);
		query.setString("userid", userid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query.executeUpdate();
		transaction.commit();
		session.close();
	}
	public void addRole(String userid,String userName,String password,String role) {
		Session session=DBConnection.getFactory().openSession();
		org.hibernate.Transaction ts = session.beginTransaction();
		Users users=new Users();
		users.setUserId(userid);
		users.setUserName(userName);
		users.setPassword(password);
		Role_User role_User=new Role_User();
		role_User.setRoleId(role);
		role_User.setUserId(userid);
		session.save(users);
		session.save(role_User);
		ts.commit();
		session.close();
	}
	public void deleteUser(String userid) {
		String sql1="delete from Users  "
				+ "where UserID=:userid1";
		String sql2="delete from Role_User  "
				+ "where UserID=:userid2";
		Session session=DBConnection.getFactory().openSession();
		Query query1=session.createQuery(sql1);
		Query query2=session.createQuery(sql2);
		query1.setString("userid1", userid);
		query2.setString("userid2", userid);
		org.hibernate.Transaction transaction=session.beginTransaction();
		query1.executeUpdate();
		query2.executeUpdate();
		transaction.commit();
	}
	public List<Object[]> selectUserByUserid(String userid){//
		String hql="select u.UserID,u.UserName,r.RoleName,u.Password "
				+ "from Users as u,Roles as r,Role_User as ru where u.UserID=:userid "
				+ "and u.UserID=ru.UserID and r.RoleID=ru.RoleID";//13
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setString("userid", userid);
		List<Object[]> obj=query.list();
		if(obj!=null && !obj.isEmpty())
			return obj;
		else return null;
		
	}
	public List<Object[]> selectUserByUserName(String realParam) {
		// TODO Auto-generated method stub
		String hql="select u.UserID,u.UserName,r.RoleName,u.Password "
				+ "from Users as u,Roles as r,Role_User as ru where u.UserName=:username "
				+ "and u.UserID=ru.UserID and r.RoleID=ru.RoleID";//13
		Session session=DBConnection.getFactory().openSession();
		Query<Object[]> query=session.createQuery(hql);
		query.setString("username", realParam);
		List<Object[]> obj=query.list();
		if(obj!=null && !obj.isEmpty())
			return obj;
		else return null;
	}
	public void updatePassword(String password, String newPassword, String userid) {
		// TODO Auto-generated method stub
		String sql1="select Password from Users where UserID=:userid";
		String sql="update Users set Password =:password where UserID=:userid";
		Session session=DBConnection.getFactory().openSession();
		Query<String> query1=session.createQuery(sql1);
		query1.setString("userid", userid);
		List<String> string=query1.list();
		for(String s:string){
			if(s.equals(password)){
				Query query=session.createQuery(sql);
				query.setString("password", newPassword);
				query.setString("userid", userid);
				org.hibernate.Transaction transaction=session.beginTransaction();
				query.executeUpdate();
				transaction.commit();
			}
		}
		session.close();
	}
}
