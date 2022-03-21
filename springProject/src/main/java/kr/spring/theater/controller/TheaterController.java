package kr.spring.theater.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.spring.theater.service.TheaterService;
import kr.spring.theater.vo.TheaterVO;

@Controller
public class TheaterController {
	private static final Logger logger = LoggerFactory.getLogger(TheaterController.class);
	
	@Autowired
	private TheaterService theaterService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public TheaterVO initCommand() {
		return new TheaterVO();
	}
	
	//1.관리자 - 극장지역등록 폼
	@GetMapping("/theater/write.do")
	public String form() {
		return "theaterWrite"; //타일스설정
	}
	
	//1-1. 극장지역등록 폼에서 전송된 데이터 처리
	@PostMapping("/theater/write.do")
	public String submit(@Valid TheaterVO theaterVO, BindingResult result, HttpSession session, HttpServletRequest request) {

		//로그
		logger.info("<<극장지역등록>> : " + theaterVO);

		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		//관리자로 로그인할 경우 체크
		//Integer user_auth = (Integer)session.getAttribute("user_auth");
		
		//관리자번호세팅
		//theaterVO.setMem_num(user_num);
		
		//극장정보 등록 완료
		theaterService.insertTheater(theaterVO);

		return "redirect:/views/main/main.do";
	}
}
