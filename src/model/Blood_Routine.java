package model;

import java.util.IllegalFormatCodePointException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "blood_routine")//数据库里的blood_routine表
public class Blood_Routine {
	
	@Id
	private String BRid;//主键
	@Column
	private String BloodTestTime;
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
	
	public String getId() {
		return BRid;
	}
	public void setId(String id) {
		this.BRid = id;
	}

	public String getBloodTestTime() {
		return BloodTestTime;
	}
	public void setBloodTestTime(String time) {
		this.BloodTestTime = time;
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
	@Override
	public String toString() {
		return "athlete [BRid=" + BRid+",BloodTestTime="+BloodTestTime+",WBC="+WBC+",RBC="+RBC+
				",HGB="+HGB+",HCT="+HCT+",MCV="+MCV+",HGB_RBC="+HGB_RBC+",MCHC="+MCHC+",PLT="+PLT+ "]";
	}
	
	
}
