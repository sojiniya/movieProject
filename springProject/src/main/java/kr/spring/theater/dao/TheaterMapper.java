package kr.spring.theater.dao;

import org.apache.ibatis.annotations.Insert;


import kr.spring.theater.vo.TheaterVO;

public interface TheaterMapper {
	
	//1.관리자 - 극장지역정보 등록
	@Insert("INSERT INTO M_theater (theater_num,theater_addr,theater_name) VALUES (M_theater_seq.nextval,#{theater_addr},#{theater_name})")
	public void insertTheater(TheaterVO theater);
	
}