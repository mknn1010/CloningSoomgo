package dto;

public class CommuServiceDto {
	String t1;  // 대주제
	String t2;	// 소주제    이름바꾸기
	
	public CommuServiceDto(String t1, String t2) {
		this.t1 = t1;
		this.t2 = t2;
	}
	
	public String getT1() {
		return t1;
	}
	public void setT1(String t1) {
		this.t1 = t1;
	}
	public String getT2() {
		return t2;
	}
	public void setT2(String t2) {
		this.t2 = t2;
	}

	
	public String toString() {
		return " 대주제: " + t1 + ", 소주제: " + t2 + "]";
	}
	
	

}
