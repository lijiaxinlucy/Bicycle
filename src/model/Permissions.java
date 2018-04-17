package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "permissions")//数据库里的permissions表
public class Permissions {
	
	@Id
	private String PermissionID;//主键
	@Column
	private String PermissionName;
	
	public String getId() {
		return PermissionID;
	}
	public void setId(String id) {
		this.PermissionID = id;
	}

	public String getName() {
		return PermissionName;
	}
	public void setName(String name) {
		this.PermissionName = name;
	}
	
	@Override
	public String toString() {
		return "athlete [PermissionID=" + PermissionID + ", RoleID=" + PermissionName + "]";
	}
	
	
}
