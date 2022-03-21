package kr.spring.time.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.time.dao.TimeMapper;
import kr.spring.time.vo.TimeVO;

@Service
public class TimeServiceImpl implements TimeService{
	
	@Autowired
	private TimeMapper timeMapper;

	@Override
	public int getTimeCount() {
		
		return timeMapper.getTimeCount();
	}

	@Override
	public List<TimeVO> getTimeList(Map<String, Object> map) {
		
		return timeMapper.selectList(map);
	}
	
}
