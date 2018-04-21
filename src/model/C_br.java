package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "c_br")//数据库里的c_br表
public class C_br {
	
	@Id
	private String Cid;//主键
	@Column
	private String BRid;
	
	public String getCid() {
		return Cid;
	}
	public void setCid(String cid) {
		this.Cid = cid;
	}

	public String getBRid() {
		return BRid;
	}
	public void setBRid(String brid) {
		this.BRid = brid;
	}
	
	
	
	
}
