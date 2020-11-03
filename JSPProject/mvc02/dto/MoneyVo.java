/*
 * 
 * 	2020. 11. 02
 * 
 * 	DTO class
 * 
 * 	Java Resource - mvc02 
 * 	WebContent - mvc02
 * 
 * 	money_tbl_mvc02 table
 * 	
 * 
 */

package dto;

import java.sql.Timestamp;

// money_tbl_mvc02 table
public class MoneyVo {
	private int custno;
	private int salenol;
	private int pcost;
	private int amount;
	private int price;
	private String pcode;
	private Timestamp sdate;
	
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public int getSalenol() {
		return salenol;
	}
	public void setSalenol(int salenol) {
		this.salenol = salenol;
	}
	public int getPcost() {
		return pcost;
	}
	public void setPcost(int pcost) {
		this.pcost = pcost;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public Timestamp getSdate() {
		return sdate;
	}
	public void setSdate(Timestamp sdate) {
		this.sdate = sdate;
	}
	@Override
	public String toString() {
		return "MoneyVo [custno=" + custno + ", salenol=" + salenol + ", pcost=" + pcost + ", amount=" + amount
				+ ", price=" + price + ", pcode=" + pcode + ", sdate=" + sdate + "]";
	}
	
	
}
