package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.swing.text.FlowView.FlowStrategy;

@Entity
@Table(name = "cyclists")//数据库里的cyclists表
public class Cyclists {
	
	@Id
	private String Cid;//主键
	@Column
	private String CName;
	@Column
	private String Sex;
	@Column
	private float CHeight;
	@Column
	private float CWeight;
	
	
	public String getCid() {
		return Cid;
	}
	public void setCid(String cid) {
		Cid = cid;
	}
	public String getCName() {
		return CName;
	}
	public void setCName(String cName) {
		CName = cName;
	}
	public String getName() {
		return CName;
	}
	public void setName(String name) {
		this.CName = name;
	}
	
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		this.Sex= sex;
	}
	
	public float  getCHeight() {
		return CHeight;
	}
	public void setCHeight(int cHeight) {
		this.CHeight = cHeight;
	}
	
	public float  getCWeight() {
		return CWeight;
	}
	public void setCWeight(int cWeight) {
		this.CWeight = cWeight;
	}
	@Override
	public String toString() {
		return "Cyclists [Cid=" + Cid + ", CName=" + CName + ", Sex=" + Sex + ", CHeight=" + CHeight + ", CWeight="
				+ CWeight + "]";
	}
	
	
	
}
