package adm.vo;

//리뷰 게시판VO
public class ReviewVO {

	private int rev_code;
	private int pbl_code;
	private String rev_date;
	private String rev_content;
	private String mem_id;
	private String rev_title;
	private int rev_cnt;
	private int rev_score;
	private String pbl_nm;
	
	
	public String getPbl_nm() {
		return pbl_nm;
	}
	public void setPbl_nm(String pbl_nm) {
		this.pbl_nm = pbl_nm;
	}
	public int getRev_code() {
		return rev_code;
	}
	public void setRev_code(int rev_code) {
		this.rev_code = rev_code;
	}
	public int getPbl_code() {
		return pbl_code;
	}
	public void setPbl_code(int pbl_code) {
		this.pbl_code = pbl_code;
	}
	public String getRev_date() {
		return rev_date;
	}
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRev_title() {
		return rev_title;
	}
	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}
	public int getRev_cnt() {
		return rev_cnt;
	}
	public void setRev_cnt(int rev_cnt) {
		this.rev_cnt = rev_cnt;
	}
	public int getRev_score() {
		return rev_score;
	}
	public void setRev_score(int rev_score) {
		this.rev_score = rev_score;
	}
	@Override
	public String toString() {
		return "ReviewVO [rev_code=" + rev_code + ", pbl_code=" + pbl_code + ", rev_date=" + rev_date + ", rev_content="
				+ rev_content + ", mem_id=" + mem_id + ", rev_title=" + rev_title + ", rev_cnt=" + rev_cnt
				+ ", rev_score=" + rev_score + ", pbl_nm=" + pbl_nm + "]";
	}
	
	
}
