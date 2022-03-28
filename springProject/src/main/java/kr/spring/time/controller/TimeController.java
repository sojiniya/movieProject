package kr.spring.time.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.movie.vo.MovieVO;
import kr.spring.time.service.TimeService;
import kr.spring.time.vo.TimeVO;

@Controller
public class TimeController {
	private static final Logger logger = LoggerFactory.getLogger(TimeController.class);
	
	@Autowired
	private TimeService timeService;
	
	//1. 목록
	@RequestMapping(value = "time/selectList.do", method=RequestMethod.GET)
	public String timeList(TimeVO timeVO, Model model) {
		
		List<TimeVO> list = timeService.getTimeList(timeVO);
		model.addAttribute("list",list);
		
		return "selectList";
	}
	
	//2. 극장등록
	//극장 등록 폼
	@GetMapping("/time/theaterInsert2.do")
	public String form2() {
		return "theaterInsert2";
	}

	//극장 등록 폼에서 전송된 데이터 처리
	@PostMapping("/time/theaterInsert2.do")
	public String submit2(@Valid TimeVO timeVO, BindingResult result, HttpSession session, HttpServletRequest request) {
		logger.info("<<극장 저장>> : " + timeVO);

		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form2();
		}
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		//회원 번호 셋팅
		timeVO.setMem_num(user_num);

		//극장 등록
		timeService.insertTheater2(timeVO);

		return "redirect:/movie/movieChart.do";
	}
}
