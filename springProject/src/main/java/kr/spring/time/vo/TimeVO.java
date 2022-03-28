package kr.spring.time.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonFormat;

public class TimeVO {
	private int time_num; //상영시간 번호
	private int theater_num; //영화관 번호
	private int movie_num; //영화번호
	@NotEmpty
	private String movie_name; //영화제목
	@NotEmpty
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "YY/MM/dd", timezone = "GMT+9") // 예매페이지에서 상영일을 뿌리기 위한 어노테이션 (동윤 작성)
	private Date movie_date; //상영일
	@NotEmpty
	private String movie_time; //상영시간
	
	//극장정보 등록을 위해 movie테이블에서 가져온 데이터
	@NotEmpty
	private String moive_genre; //장르
	@NotEmpty
	private int movie_pg; //관람연령(12/15/19)
	@NotEmpty
	private int moive_auth; //영화 상영정보 0:상영중/1:상영예정/2:상영종료
	
	public int getTime_num() {
		return time_num;
	}
	public void setTime_num(int time_num) {
		this.time_num = time_num;
	}
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
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
	public String getMoive_genre() {
		return moive_genre;
	}
	public void setMoive_genre(String moive_genre) {
		this.moive_genre = moive_genre;
	}
	public int getMovie_pg() {
		return movie_pg;
	}
	public void setMovie_pg(int movie_pg) {
		this.movie_pg = movie_pg;
	}
	public int getMoive_auth() {
		return moive_auth;
	}
	public void setMoive_auth(int moive_auth) {
		this.moive_auth = moive_auth;
	}
	
	//투스트링
	@Override
	public String toString() {
		return "TimeVO [time_num=" + time_num + ", theater_num=" + theater_num + ", movie_num=" + movie_num
				+ ", movie_name=" + movie_name + ", movie_date=" + movie_date + ", movie_time=" + movie_time
				+ ", moive_genre=" + moive_genre + ", movie_pg=" + movie_pg + ", moive_auth=" + moive_auth + "]";
	}
}
