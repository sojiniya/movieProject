package kr.spring.theater.service;

import java.util.List;
import java.util.Map;

import kr.spring.theater.vo.TheaterVO;
import kr.spring.time.vo.TimeVO;

public interface TheaterService {
	//목록
	public List<TheaterVO> selectList(Map<String,String> map);
	public int selectRowCount(Map<String,String> map);
	
	public void insertTheater(TheaterVO theater);
}
