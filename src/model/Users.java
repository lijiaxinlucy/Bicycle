package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")//数据库里的users表
public class Users {
	
	@Id
	private String UserID;//主键
	@Column
	private String UserName;
	@Column
	private String Password;
	
	public String getUserId() {
		return UserID;
	}
	public void setUserId(String id) {
		this.UserID = id;
	}

	public String getUserName() {
		return UserName;
	}
	public void setUserName(String name) {
		this.UserName = name;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		this.Password = password;
	}
	@Override
	public String toString() {
		return "athlete [UserID=" + UserID + ", UserName=" + UserName + ", Password=" + Password + "]";
	}
	
	
}
