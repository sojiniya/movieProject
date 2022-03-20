package kr.spring.member.controller;

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
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;

	//자바빈(VO)초기화
		@ModelAttribute
		public MemberVO initCommand() {
			return new MemberVO();
		}
		
		//회원 등록 폼 호출
		@GetMapping("/user/memberRegister.do")
		public String form() {
			
			//타일스 설정
			return "memberRegister";
		}
		
		//회원 등록 처리
		@PostMapping("/user/registerUser.do")
		public String submit(@Valid MemberVO memberVO, BindingResult result) {
			
			logger.info("<<회원가입>> :" + memberVO);
			
			//유효성 체크 결과 오류가 있으면 폼 호출
			if(result.hasErrors()) {
				return form();
			}
			
			//회원가입
			memberService.insertMember(memberVO);
			
			
			return "redirect:/main/main.do";
		}
	
	
}













