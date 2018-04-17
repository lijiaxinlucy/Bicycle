package model;

import java.util.IllegalFormatCodePointException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ph_table")//数据库里的ph_table表
public class Ph_Table {
	
	@Id
	private String PHid;//主键
	@Column
	private String PhTestTime;
	@Column
	private float PCO2;
	@Column
	private float PO2;
	@Column
	private float BE;
	@Column
	private float HCO3;
	@Column
	private float TCO2;
	@Column
	private float SO2;
	@Column
	private float K;
	
	public String getId() {
		return PHid;
	}
	public void setId(String id) {
		this.PHid = id;
	}

	public String getPhTestTime() {
		return PhTestTime;
	}
	public void setPhTestTime(String time) {
		this.PhTestTime = time;
	}
	
	public float getPCO2() {
		return PCO2;
	}
	public void setPCO2(float pCO2) {
		this.PCO2 = pCO2;
	}
	
	public float getPO2() {
		return PCO2;
	}
	public void setPO2(float pO2) {
		this.PCO2 = pO2;
	}
	
	public float getBE() {
		return BE;
	}
	public void setBE(float be) {
		this.BE = be;
	}
	
	public float getHCO3() {
		return HCO3;
	}
	public void setHCO3(float hCO3) {
		this.HCO3 = hCO3;
	}
	
	public float getSO2() {
		return SO2;
	}
	public void setSO2(float SO2) {
		this.SO2 = SO2;
	}
	
	public float getK() {
		return K;
	}
	public void setK(float k) {
		this.K = k;
	}
	@Override
	public String toString() {
		return "athlete [PHid=" + PHid + ", PhTestTime="+PhTestTime+",PCO2="+ PCO2 +",PO2 ="+
				PO2 +",BE = "+ BE + ",HCO3 ="+ HCO3 +",TCO2="+ TCO2+ ",SO2="+ SO2 +",K="+ K + "]";
	}
	
	
}
