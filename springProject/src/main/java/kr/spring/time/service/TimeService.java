package kr.spring.time.service;

import java.util.List;
import java.util.Map;

import kr.spring.time.vo.TimeVO;

public interface TimeService {
	//목록
	public int getTimeCount();
	public List<TimeVO> getTimeList(Map<String,Object> map);
}
