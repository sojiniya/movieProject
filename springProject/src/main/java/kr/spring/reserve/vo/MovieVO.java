package kr.spring.reserve.vo;

public class MovieVO {
	private int movie_num;
	private String movie_name;
	private String movie_content;
	private String movie_genre;
	private int movie_pg;
	private int movie_auth;
	private int movie_rate;
	
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
	public String getMovie_content() {
		return movie_content;
	}
	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public int getMovie_pg() {
		return movie_pg;
	}
	public void setMovie_pg(int movie_pg) {
		this.movie_pg = movie_pg;
	}
	public int getMovie_auth() {
		return movie_auth;
	}
	public void setMovie_auth(int movie_auth) {
		this.movie_auth = movie_auth;
	}
	public int getMovie_rate() {
		return movie_rate;
	}
	public void setMovie_rate(int movie_rate) {
		this.movie_rate = movie_rate;
	}
	@Override
	public String toString() {
		return "MovieVO [movie_num=" + movie_num + ", movie_name=" + movie_name + ", movie_content=" + movie_content
				+ ", movie_genre=" + movie_genre + ", movie_pg=" + movie_pg + ", movie_auth=" + movie_auth
				+ ", movie_rate=" + movie_rate + "]";
	}
}