package dto;

public class MemberMoneyVo {
	private int custno;
	private String custname;
	private String grade;
	private int pricesum;
	
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getPricesum() {
		return pricesum;
	}
	public void setPricesum(int pricesum) {
		this.pricesum = pricesum;
	}
	@Override
	public String toString() {
		return "MemberMoneyVo [custno=" + custno + ", custname=" + custname + ", grade=" + grade + ", pricesum="
				+ pricesum + "]";
	}
	
	
}
