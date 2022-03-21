package kr.spring.theater.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.theater.dao.TheaterMapper;
import kr.spring.theater.vo.TheaterVO;

@Service
public class TheaterServiceImpl implements TheaterService{
	
	@Autowired
	private TheaterMapper theaterMapper;
	
	@Override
	public void insertTheater(TheaterVO theater) {
		theaterMapper.insertTheater(theater);
	}

}
