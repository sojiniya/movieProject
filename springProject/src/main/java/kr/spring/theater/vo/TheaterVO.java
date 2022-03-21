package kr.spring.theater.vo;

import javax.validation.constraints.NotEmpty;

public class TheaterVO {
	private int theater_num; //영화관 번호
	@NotEmpty
	private String theater_name; //영화관 명
	@NotEmpty
	private String theater_addr; //영화관주소
	
	//게터세터
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getTheater_addr() {
		return theater_addr;
	}
	public void setTheater_addr(String theater_addr) {
		this.theater_addr = theater_addr;
	}
	
	//투스트링
	@Override
	public String toString() {
		return "TheaterVO [theater_num=" + theater_num + ", theater_name=" + theater_name + ", theater_addr="
				+ theater_addr + "]";
	}
}
