package kr.spring.time.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.spring.time.vo.TimeVO;

public interface TimeMapper {
	//1.목록 : 리스트
	@Select("SELECT * FROM M_time")
	public List<TimeVO> selectList(TimeVO timeVO);
}
