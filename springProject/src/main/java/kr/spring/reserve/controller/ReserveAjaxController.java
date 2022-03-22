package kr.spring.reserve.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.reserve.service.ReserveService;
import kr.spring.movie.vo.MovieVO;
import kr.spring.theater.vo.TheaterVO;


@Controller
public class ReserveAjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveAjaxController.class);
	
	@Autowired
	private ReserveService reserveService;
	
	//선택한 영화 목록
	@RequestMapping("/reserve/pickmovie.do")
	@ResponseBody
	public Map<String,Object> pickmoviedetail(@RequestParam(value="movie_num") int movie_num){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		
		MovieVO movie = reserveService.pickmoviedetail(movie_num);
		List<TheaterVO> theater_local_name = null;
		theater_local_name = reserveService.pickmoviedetal_get_theater_local(movie_num);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("movie", movie);
		mapJson.put("theater_local_name",theater_local_name);
		
		
		return mapJson;
	}
	
	
	
}
