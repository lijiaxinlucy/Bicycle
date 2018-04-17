package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role_permission")//数据库里的role_permission表
public class Role_Permission {
	
	@Id
	private String RoleID;//主键
	@Column
	private String PermissionID;
	
	public String getRoleId() {
		return RoleID;
	}
	public void setRoleId(String id) {
		this.RoleID = id;
	}

	public String getPermissionId() {
		return PermissionID;
	}
	public void setPermissionId(String permissionId) {
		this.PermissionID =permissionId;
	}
	
	@Override
	public String toString() {
		return "athlete [RoleID=" + RoleID + ", PermissionID=" + PermissionID + "]";
	}
	
	
}
