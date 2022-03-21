package kr.spring.seat.vo;

import javax.validation.constraints.NotEmpty;

public class SeatVO {
	private int seat_num; //좌석식별
	private int theater_num; //영화관 번호
	@NotEmpty
	private String seate_name; //좌석이름(1~50)
	
	//게터세터
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getSeate_name() {
		return seate_name;
	}
	public void setSeate_name(String seate_name) {
		this.seate_name = seate_name;
	}
	
	//투스트링
	@Override
	public String toString() {
		return "SeatVO [seat_num=" + seat_num + ", theater_num=" + theater_num + ", seate_name=" + seate_name + "]";
	}
}
