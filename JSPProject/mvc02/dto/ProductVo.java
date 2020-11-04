package dto;

public class ProductVo {
	private String pcode;
	private String pname;
	private String pimg;
	private String petc;
	private String pdate;
	
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getPetc() {
		return petc;
	}
	public void setPetc(String petc) {
		this.petc = petc;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	
	@Override
	public String toString() {
		return "ProductVo [pcode=" + pcode + ", pname=" + pname + ", pimg=" + pimg + ", petc=" + petc + ", pdate="
				+ pdate + "]";
	}
	
	
}
