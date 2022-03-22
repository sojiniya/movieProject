package kr.spring.movie.vo;

import java.io.IOException;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class MovieVO {
	private int movie_num; //영화번호
	@NotEmpty
	private String movie_name; //영화제목
	@NotEmpty
	private String movie_content; //영화 상세정보
	private String movie_genre;//영화 장르
	private MultipartFile upload1;
	private byte[] upload1file;//파일
	private String filename1;//파일명
	private MultipartFile upload2;
	private byte[] upload2file;
	private String filename2;//파일명
	private MultipartFile upload3;
	private byte[] upload3file;
	private String filename3;//파일명
	private MultipartFile upload4;
	private byte[] upload4file;
	private String filename4;//파일명
	private MultipartFile upload5;
	private byte[] upload5file;
	private String filename5;//파일명
	private int movie_pg;//영화 관람연령
	private int movie_auth;//영화 상영정보
	private int movie_rate; //영화 평점
	
	//업로드 파일 처리
	public void setUpload1(MultipartFile upload1)throws IOException{
		this.upload1 = upload1;
		//MultipartFile -> byte[] 변환
		setupload1file(upload1.getBytes());
		//파일명 구하기
		setFilename1(upload1.getOriginalFilename());
	}
	//업로드 파일 처리
	public void setUpload2(MultipartFile upload2)throws IOException{
		this.upload2 = upload2;
		//MultipartFile -> byte[] 변환
		setupload2file(upload2.getBytes());
		//파일명 구하기
		setFilename2(upload2.getOriginalFilename());
	}
	//업로드 파일 처리
	public void setUpload3(MultipartFile upload3)throws IOException{
		this.upload3 = upload3;
		//MultipartFile -> byte[] 변환
		setupload3file(upload3.getBytes());
		//파일명 구하기
		setFilename3(upload3.getOriginalFilename());		
	}
	//업로드 파일 처리
	public void setUpload4(MultipartFile upload4)throws IOException{
		this.upload4 = upload4;
		//MultipartFile -> byte[] 변환
		setupload4file(upload4.getBytes());
		//파일명 구하기
		setFilename4(upload4.getOriginalFilename());		
	}
	//업로드 파일 처리
	public void setUpload5(MultipartFile upload5)throws IOException{
		this.upload5 = upload5;
		//MultipartFile -> byte[] 변환
		setupload5file(upload5.getBytes());
		//파일명 구하기
		setFilename5(upload5.getOriginalFilename());		
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

	public MultipartFile getupload1() {
		return upload1;
	}

	public byte[] getupload1file() {
		return upload1file;
	}

	public void setupload1file(byte[] upload1file) {
		this.upload1file = upload1file;
	}

	public String getFilename1() {
		return filename1;
	}

	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}

	public MultipartFile getupload2() {
		return upload2;
	}

	public byte[] getupload2file() {
		return upload2file;
	}

	public void setupload2file(byte[] upload2file) {
		this.upload2file = upload2file;
	}

	public String getFilename2() {
		return filename2;
	}

	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}

	public MultipartFile getupload3() {
		return upload3;
	}

	public byte[] getupload3file() {
		return upload3file;
	}

	public void setupload3file(byte[] upload3file) {
		this.upload3file = upload3file;
	}

	public String getFilename3() {
		return filename3;
	}

	public void setFilename3(String filename3) {
		this.filename3 = filename3;
	}

	public MultipartFile getupload4() {
		return upload4;
	}

	public byte[] getupload4file() {
		return upload4file;
	}

	public void setupload4file(byte[] upload4file) {
		this.upload4file = upload4file;
	}

	public String getFilename4() {
		return filename4;
	}

	public void setFilename4(String filename4) {
		this.filename4 = filename4;
	}

	public MultipartFile getupload5() {
		return upload5;
	}

	public byte[] getupload5file() {
		return upload5file;
	}

	public void setupload5file(byte[] upload5file) {
		this.upload5file = upload5file;
	}

	public String getFilename5() {
		return filename5;
	}

	public void setFilename5(String filename5) {
		this.filename5 = filename5;
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
				+ ", movie_genre=" + movie_genre + ", upload1=" + upload1 + ", filename1=" + filename1 + ", upload2="
				+ upload2 + ", filename2=" + filename2 + ", upload3=" + upload3 + ", filename3=" + filename3
				+ ", upload4=" + upload4 + ", filename4=" + filename4 + ", upload5=" + upload5 + ", filename5="
				+ filename5 + ", movie_pg=" + movie_pg + ", movie_auth=" + movie_auth + ", movie_rate=" + movie_rate
				+ "]";
	}
	
	
}