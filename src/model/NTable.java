package model;

import java.sql.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ntable")//数据库里的blood_routine表
public class NTable {
	
	@Id
	
	private int NId;//主键
	@Column
	Date NDate;
	@Column
	private int Suger;
	@Column           
	private int Protein;
	@Column
	private int Fat;
	@Column
	private int Salt;
	@Column
	private double Bs;
	@Column
	private double Rbp;
	@Column
	private int Energy;
	@Column
	private double Speed;
	@Column
	private String Suger_R;
	@Column
	private String Protein_R;
	@Column
	private String Fat_R;
	@Column
	private String Salt_R;
	@Column
	private String Bs_R;
	@Column
	private String Rbp_R;
	@Column
	private String Energy_R;
	@Column
	private String Speed_R;
	
	public int getId() {
		return NId;
	}
	public void setNId(int id) {
		this.NId = id;
	}

	public int getSuger() {
		return Suger;
	}
	public void setSuger(int suger) {
		Suger = suger;
	}
	public int getProtein() {
		return Protein;
	}
	public void setProtein(int protein) {
		Protein = protein;
	}
	public int getFat() {
		return Fat;
	}
	public void setFat(int fat) {
		Fat = fat;
	}
	public int getSalt() {
		return Salt;
	}
	public void setSalt(int salt) {
		Salt = salt;
	}
	public double getBs() {
		return Bs;
	}
	public void setBs(double bs) {
		Bs = bs;
	}
	public double getRbp() {
		return Rbp;
	}
	public void setRbp(double rbp) {
		Rbp = rbp;
	}
	public int getEnergy() {
		return Energy;
	}
	public void setEnergy(int energy) {
		Energy = energy;
	}
	public double getSpeed() {
		return Speed;
	}
	public void setSpeed(double speed) {
		Speed = speed;
	}
	public String getSuger_R() {
		return Suger_R;
	}
	public void setSuger_R(String suger_R) {
		Suger_R = suger_R;
	}
	public String getProtein_R() {
		return Protein_R;
	}
	public void setProtein_R(String protein_R) {
		Protein_R = protein_R;
	}
	public String getFat_R() {
		return Fat_R;
	}
	public void setFat_R(String fat_R) {
		Fat_R = fat_R;
	}
	public String getSalt_R() {
		return Salt_R;
	}
	public void setSalt_R(String salt_R) {
		Salt_R = salt_R;
	}
	public String getBs_R() {
		return Bs_R;
	}
	public void setBs_R(String bs_R) {
		Bs_R = bs_R;
	}
	public String getRbp_R() {
		return Rbp_R;
	}
	public void setRbp_R(String rbp_R) {
		Rbp_R = rbp_R;
	}
	public String getEnergy_R() {
		return Energy_R;
	}
	public void setEnergy_R(String energy_R) {
		Energy_R = energy_R;
	}
	public String getSpeed_R() {
		return Speed_R;
	}
	public void setSpeed_R(String speed_R) {
		Speed_R = speed_R;
	}
	public int getNId() {
		return NId;
	}
	public Date getNDate() {
		
		return NDate;
	}
	public void setNDate(Date date) {
		this.NDate = date;
	}
	@Override
	public String toString() {
		return "NTable [NId=" + NId + ", NDate=" + NDate + ", Suger=" + Suger + ", Protein=" + Protein + ", Fat=" + Fat
				+ ", Salt=" + Salt + ", Bs=" + Bs + ", Rbp=" + Rbp + ", Energy=" + Energy + ", Speed=" + Speed
				+ ", Suger_R=" + Suger_R + ", Protein_R=" + Protein_R + ", Fat_R=" + Fat_R + ", Salt_R=" + Salt_R
				+ ", Bs_R=" + Bs_R + ", Rbp_R=" + Rbp_R + ", Energy_R=" + Energy_R + ", Speed_R=" + Speed_R + "]";
	}
	
	
}
