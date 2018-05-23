package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "c_d")//数据库里的c_ph表
public class C_d {
	
	@Id
	private String CId;//主键
	@Column
	private int DId;
	public String getCId() {
		return CId;
	}
	public void setCId(String cId) {
		CId = cId;
	}
	public int getDId() {
		return DId;
	}
	public void setDId(int dId) {
		DId = dId;
	}
	@Override
	public String toString() {
		return "C_d [CId=" + CId + ", DId=" + DId + "]";
	}
	
	
	
	
}
