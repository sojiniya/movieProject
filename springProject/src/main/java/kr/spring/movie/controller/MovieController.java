package kr.spring.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import kr.spring.movie.service.MovieService;
import kr.spring.movie.vo.MovieVO;
import kr.spring.util.PagingUtil;
import kr.spring.util.StringUtil;

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
	public String submit(@Valid MovieVO movieVO, BindingResult result, HttpSession session, HttpServletRequest request) {
		logger.info("<<무비차트 영화 저장>> : " + movieVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		//회원 번호 셋팅
		movieVO.setMem_num(user_num);
		
		//글 등록
		movieService.insertMovie(movieVO);
		
		return "redirect:/movie/movieChart.do";
	}
	
	//극장 등록 폼
			@GetMapping("/movie/theaterInsert.do")
			public String form2() {
				return "theaterInsert";
			}

			//극장 등록 폼에서 전송된 데이터 처리
			@PostMapping("/movie/theaterInsert.do")
			public String submit2(@Valid MovieVO movieVO, BindingResult result) {
				logger.info("<<극장 저장>> : " + movieVO);

				//유효성 체크 결과 오류가 있으면 폼 호출
				if(result.hasErrors()) {
					return form2();
				}

				//극장 등록
				movieService.insertTheater(movieVO);

				return "redirect:/movie/movieChart.do";
			}
	
	//무비차트
	@RequestMapping("/movie/movieChart.do")
	public ModelAndView process(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//글의 총갯수 또는 검색된 글의 갯수
		int count = movieService.selectRowCount(map);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,
				                currentPage,count,20,10,"movieChart.do");
		
		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<MovieVO> list = null;
		if(count > 0) {
			list = movieService.selectList(map);
		}
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("movieChart");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		return mav;
	}
	
	//영화 상세 정보
	@RequestMapping("/movie/movieDetail.do")
	public ModelAndView process(@RequestParam int movie_num) {
		logger.info("<<영화 상세 정보 - 영화 번호>> : " + movie_num);
	
		MovieVO movie = movieService.selectMovie(movie_num);
		//타이틀 HTML 불허
		movie.setMovie_name(StringUtil.useNoHtml(movie.getMovie_name()));
		                        //타일스 설정      속성명      속성값
		return new ModelAndView("movieDetail","movie",movie);
	}
	
	//무비차트 글 수정
	@GetMapping("movie/movieUpdate.do")
	public String formUpdate(@RequestParam int movie_num, Model model) {
		MovieVO movieVO = movieService.selectMovie(movie_num);
		model.addAttribute("movieVO", movieVO);
		return "movieUpdate";
	}
	
	//수정 폼에서 전송된 데이터 처리
		@PostMapping("/movie/movieUpdate.do")
		public String submitUpdate(@Valid MovieVO movieVO,
				                   BindingResult result,
				                   HttpServletRequest request,
				                   Model model) {
			
			logger.info("<<영화 상세 정보 수정>> : " + movieVO);

			movieService.updateMovie(movieVO);
			
			//view에 표시할 메시지
			model.addAttribute("message", "영화 정보 수정 완료");
			model.addAttribute("url", request.getContextPath() + "/movie/movieChart.do");
			
			return "common/resultView";
		}
		
		//무비차트 글 삭제
		@RequestMapping("/movie/movieDelete.do")
		public String submitDelete(@RequestParam int movie_num) {
			movieService.deleteMovie(movie_num);
			return "redirect:/movie/movieChart.do";		
	}
}
	


