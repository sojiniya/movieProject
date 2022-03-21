package kr.spring.reserve.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.reserve.dao.ReserveMapper;
import kr.spring.reserve.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;

@Service
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	private ReserveMapper reserveMapper;
	
	@Override
	public List<MovieVO> selectMovieList() {
		return reserveMapper.selectMovieList();
	}

	@Override
	public List<TheaterVO> selectTheaterList() {
		return reserveMapper.selectTheaterList();
	}

}
