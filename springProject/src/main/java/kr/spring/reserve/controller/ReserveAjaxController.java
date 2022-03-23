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
import kr.spring.time.vo.TimeVO;


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
		theater_local_name = reserveService.pickmoviedetail_get_theater_local(movie_num);
		List<Integer> theater_local_count = null;
		theater_local_count = reserveService.pickmoviedetail_get_theater_localcount(movie_num);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("movie", movie);
		mapJson.put("theater_local_name",theater_local_name);
		mapJson.put("theater_local_count",theater_local_count);
		
		return mapJson;
	}
	
	//영화 선택 후 극장 지역(서울/인천...)선택 시 지역별 CGV 목록
	@RequestMapping("/reserve/picklocal.do")
	@ResponseBody
	public Map<String,Object> picklocaldetail(@RequestParam(value="pick_localname") String theater_local,@RequestParam(value="pick_movie_num") Integer movie_num){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		logger.info("<<전달받은 CGV 지역>> theater_local : " + theater_local);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_num",movie_num);
		map.put("theater_local",theater_local);
		
		List<TheaterVO> cgv_list = null;
		cgv_list = reserveService.pickmoviedetail_get_theater_cgv(map);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("cgv_list", cgv_list);
		
		return mapJson;
	}
	
	//cgv 선택
	@RequestMapping("/reserve/pickcgv.do")
	@ResponseBody
	public Map<String,Object> pickcgvdetail(@RequestParam(value="pick_theaternum") Integer theater_num,@RequestParam(value="pick_movie_num") Integer movie_num){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		logger.info("<<전달받은 상영관 번호>> theater_num : " + theater_num);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_num", movie_num);
		map.put("theater_num", theater_num);
				
		List<TimeVO> date_list = null;
		date_list = reserveService.pickmoviedetail_get_date(map);
		System.out.println("상영일자 조회 결과 : " + date_list);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("date_list", date_list);
		
		return mapJson;
	}
	
	//상영시간 선택
	@RequestMapping("/reserve/picktime.do")
	@ResponseBody
	public Map<String,Object> picktimedetail(@RequestParam(value="pick_theaternum") Integer theater_num,
											 @RequestParam(value="pick_movie_num") Integer movie_num,
											 @RequestParam(value="pick_moviedate") String movie_date){
		
		logger.info("<<전달받은 영화 번호>> movie_num : " + movie_num);
		logger.info("<<전달받은 상영관 번호>> theater_num : " + theater_num);
		logger.info("<<전달받은 상영일자>> movie_date : " + movie_date);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("movie_num", movie_num);
		map.put("theater_num", theater_num);
		map.put("movie_date", movie_date);
				
		List<TimeVO> time_list = null;
		time_list = reserveService.pickmoviedetail_get_time(map);
		System.out.println("메서드 실행후(time_list) : " + time_list);
		
		Map<String,Object> mapJson = new HashMap<String,Object>();
		mapJson.put("time_list", time_list);
		
		return mapJson;
	}
}
