package model;

public class T1110_StudentVo {
	private int sno;
	private String sname;
	private String deptname;
	private int eng;
	private int math;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
	@Override
	public String toString() {
		return "T1110_StudentVo [sno=" + sno + ", sname=" + sname + ", deptname=" + deptname + ", eng=" + eng
				+ ", math=" + math + ", getSno()=" + getSno() + ", getSname()=" + getSname() + ", getDeptname()="
				+ getDeptname() + ", getEng()=" + getEng() + ", getMath()=" + getMath() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
