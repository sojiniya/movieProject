package kr.spring.time.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.time.service.TimeService;
import kr.spring.time.vo.TimeVO;
import kr.spring.util.PagingUtil;

@Controller
public class TimeController {
	private static final Logger logger = LoggerFactory.getLogger(TimeController.class);
	
	@Autowired
	private TimeService timeService;
	
	//1. 목록
	@RequestMapping("/list.do")
	public ModelAndView getList(
			@RequestParam(value="pageNum",defaultValue="1") int currentPage) {

		//총 레코드 수
		int count = timeService.getTimeCount();

		//페이지 처리
		PagingUtil page = 
				new PagingUtil(currentPage,count,10,10,"list.do");

		//목록호출
		List<TimeVO> list = null;
		if(count > 0) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			list = timeService.getTimeList(map);
		}

		ModelAndView mav = new ModelAndView();
		//뷰 이름 지정
		mav.setViewName("selectList");
		//데이터 저장
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());

		return mav;
	}

	//자바빈(VO) 초기화
	@ModelAttribute
	public TimeVO initCommand() {
		return new TimeVO();
	}
}
