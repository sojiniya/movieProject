package kr.spring.time.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

public class TimeVO {
	private int time_num; //상영시간 번호
	private int theater_num; //영화관 번호
	private int movie_num; //영화번호
	@NotEmpty
	private String movie_name; //영화제목
	@NotEmpty
	private Date movie_date; //상영일
	@NotEmpty
	private String movie_time; //상영시간
	
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
	
	//투스트링
	@Override
	public String toString() {
		return "TimeVO [time_num=" + time_num + ", theater_num=" + theater_num + ", movie_num=" + movie_num
				+ ", movie_name=" + movie_name + ", movie_date=" + movie_date + ", movie_time=" + movie_time + "]";
	}
	
}
