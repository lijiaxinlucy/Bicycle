package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "c_ph")//数据库里的c_ph表
public class C_ph {
	
	@Id
	private String Cid;//主键
	@Column
	private String PHid;
	
	public String getCid() {
		return Cid;
	}
	public void setCid(String cid) {
		this.Cid = cid;
	}

	public String getPHid() {
		return PHid;
	}
	public void setPHid(String phid) {
		this.PHid = phid;
	}
	
	@Override
	public String toString() {
		return "athlete [Cid=" + Cid + ", PHid=" + PHid + "]";
	}
	
	
}
