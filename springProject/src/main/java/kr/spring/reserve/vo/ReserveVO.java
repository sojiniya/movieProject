package kr.spring.reserve.vo;

import java.sql.Date;

public class ReserveVO {
	private int reserve_num; // 예매번호
	private int time_num; // 상영시간 번호 (외래키)
	private int mem_num; // 회원번호 (외래키)
	private int movie_num; // 영화번호 (외래키)
	private int theater_num; // 영화관번호(외래키)
	private String reserve_seat; // 예약완료한 좌석 (2개 이상 시 A1,A2...문자열로 보관)
	private String reserve_people; // 연령대 및 인원 (일반 1명,청소년1명,경로우대 1명 ...문자열로 보관)
	private int reserve_paymethod; // 결제수단 (1:카드 결제 / 2:현금 결제 / 3:카카오페이 결제)
	private int reserve_paytotal; // 결제 금액
	
	
	// ↓ 다른 테이블과 조인해서 가져오는 데이터들
	private String mem_id; //회원 id
	private String movie_name; //영화 제목
	private String theater_name; //영화관명
	private Date movie_date; //상영날짜
	private String movie_time; //상영시간
	
	
	public int getReserve_num() {
		return reserve_num;
	}
	public void setReserve_num(int reserve_num) {
		this.reserve_num = reserve_num;
	}
	public int getTime_num() {
		return time_num;
	}
	public void setTime_num(int time_num) {
		this.time_num = time_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public String getReserve_seat() {
		return reserve_seat;
	}
	public void setReserve_seat(String reserve_seat) {
		this.reserve_seat = reserve_seat;
	}
	public String getReserve_people() {
		return reserve_people;
	}
	public void setReserve_people(String reserve_people) {
		this.reserve_people = reserve_people;
	}
	public int getReserve_paymethod() {
		return reserve_paymethod;
	}
	public void setReserve_paymethod(int reserve_paymethod) {
		this.reserve_paymethod = reserve_paymethod;
	}
	public int getReserve_paytotal() {
		return reserve_paytotal;
	}
	public void setReserve_paytotal(int reserve_paytotal) {
		this.reserve_paytotal = reserve_paytotal;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public Date getMovie_date() {
		return movie_date;
	}
	public void setMovie_date(Date movie_date) {
		this.movie_date = movie_date;
	}
	public String getMovie_time() {
		return movie_time;
	}
	public void setMovie_time(String movie_time) {
		this.movie_time = movie_time;
	}
	
	
	@Override
	public String toString() {
		return "ReserveVO [reserve_num=" + reserve_num + ", time_num=" + time_num + ", mem_num=" + mem_num
				+ ", movie_num=" + movie_num + ", theater_num=" + theater_num + ", reserve_seat=" + reserve_seat
				+ ", reserve_people=" + reserve_people + ", reserve_paymethod=" + reserve_paymethod
				+ ", reserve_paytotal=" + reserve_paytotal + ", mem_id=" + mem_id + ", movie_name=" + movie_name
				+ ", theater_name=" + theater_name + ", movie_date=" + movie_date + ", movie_time=" + movie_time + "]";
	}
}