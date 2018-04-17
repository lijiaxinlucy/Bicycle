package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role_user")//数据库里的role_user表
public class Role_User {
	
	@Id
	private String UserID;//主键
	@Column
	private String RoleID;
	
	public String getUserId() {
		return UserID;
	}
	public void setUserId(String userId) {
		this.UserID = userId;
	}

	public String getRoleId() {
		return RoleID;
	}
	public void setRoleId(String roleId) {
		this.RoleID = roleId;
	}
	
	@Override
	public String toString() {
		return "athlete [UserID=" + UserID + ", RoleID=" + RoleID + "]";
	}
	
	
}
