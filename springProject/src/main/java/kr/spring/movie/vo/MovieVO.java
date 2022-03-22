package kr.spring.movie.vo;

import java.io.IOException;
import java.util.Arrays;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class MovieVO {
	private int movie_num; //영화번호
	@NotEmpty
	private String movie_name; //영화제목
	@NotEmpty
	private String movie_content; //영화 상세정보
	private String movie_genre;//영화 장르
	private MultipartFile upload;
	private byte[] uploadfile;//파일
	private String filename;//파일명
	private int movie_PG;//영화 관람연령
	private int movie_auth;//영화 상영정보
	private int movie_rate; //영화 평점
	
	//업로드 파일 처리
	public void setUpload(MultipartFile upload)throws IOException{
		this.upload = upload;
		//MultipartFile -> byte[] 변환
		setUploadfile(upload.getBytes());
		//파일명 구하기
		setFilename(upload.getOriginalFilename());
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

	public byte[] getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(byte[] uploadfile) {
		this.uploadfile = uploadfile;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getMovie_PG() {
		return movie_PG;
	}

	public void setMovie_PG(int movie_PG) {
		this.movie_PG = movie_PG;
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

	public MultipartFile getUpload() {
		return upload;
	}

	@Override
	public String toString() {
		return "MovieVO [movie_num=" + movie_num + ", movie_name=" + movie_name + ", movie_content=" + movie_content
				+ ", movie_genre=" + movie_genre + ", upload=" + upload + ", filename=" + filename + ", movie_PG="
				+ movie_PG + ", movie_auth=" + movie_auth + ", movie_rate=" + movie_rate + "]";
	}
}