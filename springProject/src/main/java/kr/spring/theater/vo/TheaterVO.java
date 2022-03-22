package kr.spring.theater.vo;

import javax.validation.constraints.NotEmpty;

public class TheaterVO {
	private int theater_num; //영화관 번호
	@NotEmpty
	private String theater_name; //영화관 명
	@NotEmpty
	private String theater_addr; //영화관주소
	private String theater_local; //영화관 카테고리 (동윤 추가)
	
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
	public String getTheater_local() {
		return theater_local;
	}
	public void setTheater_local(String theater_local) {
		this.theater_local = theater_local;
	}

	//투스트링
	@Override
	public String toString() {
		return "TheaterVO [theater_num=" + theater_num + ", theater_name=" + theater_name + ", theater_addr="
				+ theater_addr + ", theater_local=" + theater_local + "]";
	}
	
	
}
