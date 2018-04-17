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
	private int PCO2;
	@Column
	private int PO2;
	@Column
	private int BE;
	@Column
	private int HCO3;
	@Column
	private int TCO2;
	@Column
	private int SO2;
	@Column
	private int K;
	
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
	
	public int getPCO2() {
		return PCO2;
	}
	public void setPCO2(int pCO2) {
		this.PCO2 = pCO2;
	}
	
	public int getPO2() {
		return PCO2;
	}
	public void setPO2(int pO2) {
		this.PCO2 = pO2;
	}
	
	public int getBE() {
		return BE;
	}
	public void setBE(int be) {
		this.BE = be;
	}
	
	public int getHCO3() {
		return HCO3;
	}
	public void setHCO3(int hCO3) {
		this.HCO3 = hCO3;
	}
	
	public int getSO2() {
		return SO2;
	}
	public void setSO2(int SO2) {
		this.SO2 = SO2;
	}
	
	public int getK() {
		return K;
	}
	public void setK(int k) {
		this.K = k;
	}
	@Override
	public String toString() {
		return "athlete [PHid=" + PHid + ", PhTestTime="+PhTestTime+",PCO2="+ PCO2 +",PO2 ="+
				PO2 +",BE = "+ BE + ",HCO3 ="+ HCO3 +",TCO2="+ TCO2+ ",SO2="+ SO2 +",K="+ K + "]";
	}
	
	
}
