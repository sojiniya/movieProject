package kr.spring.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReserveController {
	
	@RequestMapping("/reserve/reserveStep1.do")
	public ModelAndView reserveStep1() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserveStep1");
		
		
		
		return mav;
	}
	
}
