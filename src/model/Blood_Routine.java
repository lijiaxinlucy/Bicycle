package model;

import java.sql.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "blood_routine")//数据库里的blood_routine表
public class Blood_Routine {
	
	@Id
	
	private int BRid;//主键
	@Column
	Date BloodTestTime;
	@Column
	private float WBC;
	@Column           
	private float RBC;
	@Column
	private float HGB;
	@Column
	private float HCT;
	@Column
	private float MCV;
	@Column
	private float HGB_RBC;
	@Column
	private float MCHC;
	@Column
	private float PLT;
	@Column
	private float Speed;
	
	public int getId() {
		return BRid;
	}
	public void setId(int id) {
		this.BRid = id;
	}

	public Date getBloodTestTime() {
		
		return BloodTestTime;
	}
	public void setBloodTestTime(Date date) {
		this.BloodTestTime = date;
	}
	
	public float getWBC() {
		return WBC;
	}
	public void setWBC(float wbc) {
		this.WBC = wbc;
	}
	
	public float getRBC() {
		return RBC;
	}
	public void setRBC(float rbc) {
		this.RBC = rbc;
	}
	
	public float getHGB() {
		return HGB;
	}
	public void setHGB(float hge) {
		this.HGB = hge;
	}
	
	public float getHCT() {
		return HCT;
	}
	public void setHCT(float hct) {
		this.HCT = hct;
	}
	
	public float getMCV() {
		return MCV;
	}
	public void setMCV(float mcv) {
		this.MCV = mcv;
	}
	
	public float getHGB_RBC() {
		return HGB_RBC;
	}
	public void setHGB_RBC(float hgb_rbc) {
		this.HGB_RBC = hgb_rbc;
	}
	
	public float getMCHC() {
		return MCHC;
	}
	public void setMCHC(float mchc) {
		this.MCHC = mchc;
	}
	
	public float getPLT() {
		return PLT;
	}
	public void setPLT(float plt) {
		this.PLT = plt;
	}
	public float getSpeed() {
		return Speed;
	}
	public void setSpeed(float speed) {
		this.Speed = speed;
	}
	@Override
	public String toString() {
		return "athlete [BRid=" + BRid+",BloodTestTime="+BloodTestTime+",WBC="+WBC+",RBC="+RBC+
				",HGB="+HGB+",HCT="+HCT+",MCV="+MCV+",HGB_RBC="+HGB_RBC+",MCHC="+MCHC+",PLT="+PLT+",Speed="+Speed+ "]";
	}
	
	
}
