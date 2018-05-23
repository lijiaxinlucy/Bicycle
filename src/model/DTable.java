package model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "dtable")//数据库里的ph_table表
public class DTable {
	
	@Id
	private int DId;//主键
	@Column
	private Date DDate;
	@Column
	private double HGB;
	@Column
	private double STTT;
	@Column
	private double CK;
	@Column
	private double ARG;
	@Column
	private double TRY;
	@Column
	private double SLEEP;
	@Column
	private int ICE;
	@Column
	private int MSG;
	@Column
	private double Speed;
	@Column
	private String HGB_R;
	@Column
	private String STTT_R;
	@Column
	private String CK_R;
	@Column
	private String ARG_R;
	@Column
	private String TRY_R;
	@Column
	private String SLEEP_R;
	@Column
	private String ICE_R;
	@Column
	private String MSG_R;
	@Column
	private String Speed_R;
	public int getDId() {
		return DId;
	}
	public void setDId(int dId) {
		DId = dId;
	}
	public Date getDDate() {
		return DDate;
	}
	public void setDDate(Date dDate) {
		DDate = dDate;
	}
	public double getHGB() {
		return HGB;
	}
	public void setHGB(double hGB) {
		HGB = hGB;
	}
	public double getSTTT() {
		return STTT;
	}
	public void setSTTT(double sTTT) {
		STTT = sTTT;
	}
	public double getCK() {
		return CK;
	}
	public void setCK(double cK) {
		CK = cK;
	}
	public double getARG() {
		return ARG;
	}
	public void setARG(double aRG) {
		ARG = aRG;
	}
	public double getTRY() {
		return TRY;
	}
	public void setTRY(double tRY) {
		TRY = tRY;
	}
	public double getSLEEP() {
		return SLEEP;
	}
	public void setSLEEP(double sLEEP) {
		SLEEP = sLEEP;
	}
	public int getICE() {
		return ICE;
	}
	public void setICE(int iCE) {
		ICE = iCE;
	}
	public int getMSG() {
		return MSG;
	}
	public void setMSG(int mSG) {
		MSG = mSG;
	}
	public double getSpeed() {
		return Speed;
	}
	public void setSpeed(double speed) {
		Speed = speed;
	}
	public String getHGB_R() {
		return HGB_R;
	}
	public void setHGB_R(String hGB_R) {
		HGB_R = hGB_R;
	}
	public String getSTTT_R() {
		return STTT_R;
	}
	public void setSTTT_R(String sTTT_R) {
		STTT_R = sTTT_R;
	}
	public String getCK_R() {
		return CK_R;
	}
	public void setCK_R(String cK_R) {
		CK_R = cK_R;
	}
	public String getARG_R() {
		return ARG_R;
	}
	public void setARG_R(String aRG_R) {
		ARG_R = aRG_R;
	}
	public String getTRY_R() {
		return TRY_R;
	}
	public void setTRY_R(String tRY_R) {
		TRY_R = tRY_R;
	}
	public String getSLEEP_R() {
		return SLEEP_R;
	}
	public void setSLEEP_R(String sLEEP_R) {
		SLEEP_R = sLEEP_R;
	}
	public String getICE_R() {
		return ICE_R;
	}
	public void setICE_R(String iCE_R) {
		ICE_R = iCE_R;
	}
	public String getMSG_R() {
		return MSG_R;
	}
	public void setMSG_R(String mSG_R) {
		MSG_R = mSG_R;
	}
	public String getSpeed_R() {
		return Speed_R;
	}
	public void setSpeed_R(String speed_R) {
		Speed_R = speed_R;
	}
	@Override
	public String toString() {
		return "DTable [DId=" + DId + ", DDate=" + DDate + ", HGB=" + HGB + ", STTT=" + STTT + ", CK=" + CK + ", ARG="
				+ ARG + ", TRY=" + TRY + ", SLEEP=" + SLEEP + ", ICE=" + ICE + ", MSG=" + MSG + ", Speed=" + Speed
				+ ", HGB_R=" + HGB_R + ", STTT_R=" + STTT_R + ", CK_R=" + CK_R + ", ARG_R=" + ARG_R + ", TRY_R=" + TRY_R
				+ ", SLEEP_R=" + SLEEP_R + ", ICE_R=" + ICE_R + ", MSG_R=" + MSG_R + ", Speed_R=" + Speed_R + "]";
	}
	
	
	
}
