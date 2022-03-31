package kr.spring.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kr.spring.admin.dao.AdminMapper;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.util.AuthCheckException;
import kr.spring.util.PagingUtil;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class AdminController{

		private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
		
		@Autowired
		private AdminMapper adminMapper;
		
		//관리자 메인페이지 호출
		//My페이지
		@RequestMapping("/admin/adminPage.do")
		public ModelAndView adminViewMemberList(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage, HttpSession session) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int count = adminMapper.adminMemberRowCount(map);
			logger.info("<count>> : " + count);
			
			//페이지 처리
			PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "adminPage.do");
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			List<MemberVO> list = null;
			if (count > 0) {
				list = adminMapper.adminSelectList(map);
			}
			
			logger.info("<list>> : " + list);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adminPage");
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("pagingHtml", page.getPagingHtml());
			
			return mav;
		}
		
		//관리자 회원관리 페이지
		//관리자 회원정보 업데이트 페이지
		//예매내역 확인 페이지
		//예매내역 취소 페이지
		
			
			
		
	}



