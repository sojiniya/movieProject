package kr.spring.time.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.time.dao.TimeMapper;
import kr.spring.time.vo.TimeVO;

@Service
public class TimeServiceImpl implements TimeService{
	
	@Autowired
	private TimeMapper timeMapper;

	@Override
	public List<TimeVO> getTimeList(TimeVO timeVO) {
		
		return timeMapper.selectList(timeVO);
	}

	@Override
	public void insertTheater2(TimeVO timeVO) {
		timeMapper.insertTheater2(timeVO);
	}
}
