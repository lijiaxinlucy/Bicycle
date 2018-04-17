package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cyclists")//数据库里的cyclists表
public class Cyclists {
	
	@Id
	private String CiD;//主键
	@Column
	private String CName;
	@Column
	private String Sex;
	@Column
	private int CHeight;
	@Column
	private int CWeight;
	
	public String getId() {
		return CiD;
	}
	public void setId(String id) {
		this.CiD = id;
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
	
	public int  getCHeight() {
		return CHeight;
	}
	public void setCHeight(int cHeight) {
		this.CHeight = cHeight;
	}
	
	public int  getCWeight() {
		return CWeight;
	}
	public void setCWeight(int cWeight) {
		this.CWeight = cWeight;
	}
	@Override
	public String toString() {
		return "athlete [Cid=" + CiD + ", CName=" + CName + ", Sex=" + Sex +",CHeight="+  CHeight +
				",CWeight="+CWeight+ "]";
	}
	
	
}
