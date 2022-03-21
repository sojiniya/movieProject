package kr.spring.time.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.time.vo.TimeVO;

public interface TimeMapper {
	//1.목록 : 총 레코드 수
	@Select("SELECT COUNT(*) FROM M_time")
	public int getTimeCount();
	//1-1.목록 : 리스트
	public List<TimeVO> selectList(Map<String,Object> map);
}
