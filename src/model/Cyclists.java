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
	private String CId;//主键
	@Column
	private String CName;
	@Column
	private int Age;
	@Column
	private double AvgSpeed;
	public String getCId() {
		return CId;
	}
	public void setCId(String cId) {
		CId = cId;
	}
	public String getCName() {
		return CName;
	}
	public void setCName(String cName) {
		CName = cName;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public double getAvgSpeed() {
		return AvgSpeed;
	}
	public void setAvgSpeed(double avgSpeed) {
		AvgSpeed = avgSpeed;
	}
	@Override
	public String toString() {
		return "Cyclists [CId=" + CId + ", CName=" + CName + ", Age=" + Age + ", AvgSpeed=" + AvgSpeed + "]";
	}
	
	
}
