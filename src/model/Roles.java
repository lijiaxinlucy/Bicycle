package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "roles")//数据库里的roles表
public class Roles {
	
	@Id
	private String RoleID;//主键
	@Column
	private String RoleName;
	
	public String getRoleId() {
		return RoleID;
	}
	public void setRoleId(String id) {
		this.RoleID = id;
	}

	public String getRoleName() {
		return RoleName;
	}
	public void setRoleName(String name) {
		this.RoleName = name;
	}
	@Override
	public String toString() {
		return "athlete [RoleID=" + RoleID + ", RoleName=" + RoleName + "]";
	}
	
	
}
