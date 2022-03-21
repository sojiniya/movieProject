package kr.spring.time.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
