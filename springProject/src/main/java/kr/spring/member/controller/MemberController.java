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
	
		//로그인 폼
		@GetMapping("/user/login.do")
		public String formLogin() {
			return "memberLogin";
		}
		
		//로그인 폼에서 전송된 데이터 처리
		@PostMapping("/user/login.do")
		public String submitLogin(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
			logger.info("<<회원 로그인>> : " + memberVO);
			
			//유효성 체크 결과 오류가 있으면 폼 호출
			//id와 passwd 필드만 체크
			if(result.hasFieldErrors("id") || result.hasFieldErrors("passwd")) {
				return formLogin();
			}
			
			//로그인 체크(id,비밀번호 일치 여부 체크)
			try {
				MemberVO member = memberService.selectCheckMember(memberVO.getId());
				
				boolean check = false;
				
				if(member != null) {
					//비밀번호 일치 여부 체크				사용자가 입력한 비밀번호
					check = member.isCheckPassword(memberVO.getMem_pw());
				}
				if(check) {
					//인증성공, 로그인 처리
					session.setAttribute("user_num", member.getMem_num());
					session.setAttribute("user_id", member.getId());
					session.setAttribute("user_auth", member.getMem_auth());
					session.setAttribute("user_photo", member.getMem_photo());
					
					return "redirect:/main/main.do";
				}
				
				//인증실패
				throw new AuthCheckException();
			
			}catch(AuthCheckException e) {
				//폼에서 보여질 메시지 생성
				result.reject("invalidIdOrPassword");
				//인증 실패로 로그인 폼을 호출
				return formLogin();
			}
			
		}
		
		//회원 로그아웃
		@RequestMapping("/user/logout.do")
		public String processLogout(HttpSession session) {
			
			//로그아웃
			session.invalidate();
			
			return "redirect:/main/main.do";
		}
		
	
}













