package kr.spring.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MovieController {
	
		@RequestMapping("/movie/movieChart.do")
		public String movieChart() {
			return "movieChart";
		}
	}