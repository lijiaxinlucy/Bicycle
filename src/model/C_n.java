package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "c_n")//数据库里的c_n表
public class C_n {
	
	@Id
	private String CId;//主键
	@Column
	private int NId;
	public String getCId() {
		return CId;
	}
	public void setCId(String cId) {
		CId = cId;
	}
	public int getNId() {
		return NId;
	}
	public void setNId(int nId) {
		NId = nId;
	}
	@Override
	public String toString() {
		return "C_n [CId=" + CId + ", NId=" + NId + "]";
	}
	
	
	
	
}
