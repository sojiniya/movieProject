package kr.spring.movie.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieVO;

@Controller
public class MovieController {
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Autowired
	private MovieService movieService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public MovieVO initCommand() {
		return new MovieVO();
	}
	
	//무비 등록 폼
	@GetMapping("/movie/movieWrite.do")
	public String form() {
		return "movieWrite";
	}
	
	//무비 등록 폼에서 전송된 데이터 처리
	@PostMapping("/movie/movieWrite.do")
	public String submit(@Valid MovieVO movieVO, BindingResult result) {
		logger.info("<<무비차트 영화 저장>> : " + movieVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		//글 등록
		movieService.insertMovie(movieVO);
		
		return "redirect:/movie/movieChart.do";
	}
	
	//무비차트
	@RequestMapping("/movie/movieChart.do")
	public ModelAndView process() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("movieChart");
		return mav;
	}
}

