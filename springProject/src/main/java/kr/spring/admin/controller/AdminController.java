package kr.spring.admin.controller;

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
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.AuthCheckException;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class AdminController{

		private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
		
		@Autowired
		private MemberService AdminService;
		
		//관리자 메인페이지 호출
		//관리자 회원관리 페이지
		//관리자 회원정보 업데이트 페이지
		//예매내역 확인 페이지
		//예매내역 취소 페이지
		
			
			
		
	}



