package model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "rtable")//数据库里的rtable表
public class RTable {
	
	@Id
	private int RId;//主键
	@Column
	private Date RDate;
	@Column
	private double Weight;
	@Column
	private double Air;
	@Column
	private int Ang;
	@Column
	private double Are;
	@Column
	private double F1;
	@Column
	private double High;
	@Column
	private int F2;
	@Column
	private double Speed;
	@Column
	private String Weight_R;
	@Column
	private String Air_R;
	@Column
	private String Ang_R;
	@Column
	private String Are_R;
	@Column
	private String F1_R;
	@Column
	private String High_R;
	@Column
	private String F2_R;
	@Column
	private String Speed_R;
	public int getRId() {
		return RId;
	}
	public void setRId(int rId) {
		RId = rId;
	}
	public Date getRDate() {
		return RDate;
	}
	public void setRDate(Date rDate) {
		RDate = rDate;
	}
	public double getWeight() {
		return Weight;
	}
	public void setWeight(double weight) {
		Weight = weight;
	}
	public double getAir() {
		return Air;
	}
	public void setAir(double air) {
		Air = air;
	}
	public int getAng() {
		return Ang;
	}
	public void setAng(int ang) {
		Ang = ang;
	}
	public double getAre() {
		return Are;
	}
	public void setAre(double are) {
		Are = are;
	}
	public double getF1() {
		return F1;
	}
	public void setF1(double f1) {
		F1 = f1;
	}
	public double getHigh() {
		return High;
	}
	public void setHigh(double high) {
		High = high;
	}
	public int getF2() {
		return F2;
	}
	public void setF2(int f2) {
		F2 = f2;
	}
	public double getSpeed() {
		return Speed;
	}
	public void setSpeed(double speed) {
		Speed = speed;
	}
	public String getWeight_R() {
		return Weight_R;
	}
	public void setWeight_R(String weight_R) {
		Weight_R = weight_R;
	}
	public String getAir_R() {
		return Air_R;
	}
	public void setAir_R(String air_R) {
		Air_R = air_R;
	}
	public String getAng_R() {
		return Ang_R;
	}
	public void setAng_R(String ang_R) {
		Ang_R = ang_R;
	}
	public String getAre_R() {
		return Are_R;
	}
	public void setAre_R(String are_R) {
		Are_R = are_R;
	}
	public String getF1_R() {
		return F1_R;
	}
	public void setF1_R(String f1_R) {
		F1_R = f1_R;
	}
	public String getHigh_R() {
		return High_R;
	}
	public void setHigh_R(String high_R) {
		High_R = high_R;
	}
	public String getF2_R() {
		return F2_R;
	}
	public void setF2_R(String f2_R) {
		F2_R = f2_R;
	}
	public String getSpeed_R() {
		return Speed_R;
	}
	public void setSpeed_R(String speed_R) {
		Speed_R = speed_R;
	}
	@Override
	public String toString() {
		return "RTable [RId=" + RId + ", RDate=" + RDate + ", Weight=" + Weight + ", Air=" + Air + ", Ang=" + Ang
				+ ", Are=" + Are + ", F1=" + F1 + ", High=" + High + ", F2=" + F2 + ", Speed=" + Speed + ", Weight_R="
				+ Weight_R + ", Air_R=" + Air_R + ", Ang_R=" + Ang_R + ", Are_R=" + Are_R + ", F1_R=" + F1_R
				+ ", High_R=" + High_R + ", F2_R=" + F2_R + ", Speed_R=" + Speed_R + "]";
	}
	
}
