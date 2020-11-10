/*
 * 
 * 	2020. 11. 02
 * 
 * 	DTO class
 * 
 * 	Java Resource - mvc02 
 * 	WebContent - mvc02
 * 
 * 	member_tbl_mvc02 table
 * 	
 * 
 */

package dto;


// member_tbl_mvc02 table bean
public class MemberVo {
	private int custno;
	private String custname;
	private String phone;
	private String address;
	private String joindate;
	private String grade;
	private String city;
	
	public MemberVo() {}

	public MemberVo(int custno, String custname, String phone, String address, String joindate, String grade,
			String city) {
		this.custno = custno;
		this.custname = custname;
		this.phone = phone;
		this.address = address;
		this.joindate = joindate;
		this.grade = grade;
		this.city = city;
	}


	public String getCh1() {
		return ch1;
	}


	public void setCh1(String ch1) {
		this.ch1 = ch1;
	}


	public String getCh2() {
		return ch2;
	}


	public void setCh2(String ch2) {
		this.ch2 = ch2;
	}


	private String ch1;
	private String ch2;
	
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


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getJoindate() {
		return joindate;
	}


	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	@Override
	public String toString() {
		return "MemberVo [custno=" + custno + ", custname=" + custname + ", phone=" + phone + ", address=" + address
				+ ", joindate=" + joindate + ", grade=" + grade + ", city=" + city + "]";
	}
	
	
	
	
}
