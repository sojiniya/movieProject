package kr.spring.time.service;

import java.util.List;

import kr.spring.time.vo.TimeVO;

public interface TimeService {
	//목록
	public List<TimeVO> getTimeList(TimeVO timeVO);
}
