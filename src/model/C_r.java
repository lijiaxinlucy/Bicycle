package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "c_r")//数据库里的c_r表
public class C_r {
	
	@Id
	private String CId;//主键
	@Column
	private int RId;
	public String getCId() {
		return CId;
	}
	public void setCId(String cId) {
		CId = cId;
	}
	public int getRId() {
		return RId;
	}
	public void setRId(int dId) {
		RId = dId;
	}
	@Override
	public String toString() {
		return "C_r [CId=" + CId + ", RId=" + RId + "]";
	}
	
}
