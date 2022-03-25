package kr.spring.theater.service;

import java.util.List;

import kr.spring.theater.vo.TheaterVO;

public interface TheaterService {
	//극장지역정보 등록
	public void insertTheater(TheaterVO theater);
	
	//극장지역정보 목록
	public List<TheaterVO> listLocal(String local);
	
	//
	public TheaterVO selectTheater(Integer theater_num);
}
