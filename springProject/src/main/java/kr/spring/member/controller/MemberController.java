package kr.spring.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import kr.spring.board.service.BoardService;
import kr.spring.board.vo.BoardVO;
import kr.spring.member.service.MemberMovieService;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.reserve.vo.ReserveVO;
import kr.spring.util.AuthCheckException;
import kr.spring.util.PagingUtil;
import oracle.jdbc.proxy.annotation.Post;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//예매 조건 체크를 위해서 날짜 데이터
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd hh:mm");
		String str = format.format(date);
		String movieDate = str.substring(0, 8);
		String movieHour = str.substring(9,11)+"시";
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberMovieService memberMovieService;
	@Autowired
	private BoardService boardService; 

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
					session.setAttribute("user_auth", member.getAuth());
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
		
		//My페이지
		@RequestMapping("/user/myPage.do")
		public String process(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,HttpSession session, Model model) {
			
			Integer user_num = (Integer)session.getAttribute("user_num");
			MemberVO member = memberService.selectMember(user_num);
			
			logger.info("<<회원 상세 정보>> :" + member);
			
			Map<String, Object> map = new HashMap<String, Object>();
			//예매내역처리
			map.put("mem_num",user_num);
			map.put("movieDate", movieDate);
			map.put("movieHour", movieHour);
			int reserveCount = memberMovieService.selectMyReserveMovieCount(map);
			PagingUtil page = new PagingUtil(currentPage, reserveCount, 10, 10, "myPage.do");
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			List<ReserveVO> reserveList = null;
			if (reserveCount > 0) {
				reserveList = memberMovieService.selectMyReserveMovie(map);
			}
			//고객 문의내역
			Map<String,Object> map2 = new HashMap<String,Object>();
			map2.put("mem_num", user_num);
			int myQnACount = boardService.selectRowCount(map2);
			PagingUtil page2 = new PagingUtil(currentPage,myQnACount,20,10,"myPage.do");
			map2.put("start",page.getStartCount());
			map2.put("end", page.getEndCount());
			map2.put("mem_num", user_num);
			List<BoardVO> myQnA = null;
			if(myQnACount > 0) {
				myQnA = boardService.userSelectList(map);
			}
			
			//
			model.addAttribute("member", member);
			model.addAttribute("reserveList",reserveList);
			model.addAttribute("reserveCount",reserveCount);
			model.addAttribute("myQnACount",myQnACount);
			model.addAttribute("myQnA",myQnA);
			
			
			return "myPageView";
		}
		
		//My페이지 수정뷰
		@GetMapping("/user/update.do")
		public String formUpdateView(HttpSession session, Model model) {
			Integer user_num = (Integer)session.getAttribute("user_num");
			
			MemberVO member = memberService.selectMember(user_num);
			
			model.addAttribute("member", member);
			
			return "userModifyView";
		}
		
		//My페이지 수정폼
		@GetMapping("/user/userModify.do")
		public String formUpdate(HttpSession session, Model model) {
			Integer user_num = (Integer) session.getAttribute("user_num");
			
			logger.info("<<유저넘>> : " + user_num);
			
			MemberVO member = memberService.selectMember(user_num);

			model.addAttribute("member", member);

			return "userModifyForm";
		}
		
		//수정폼에서 전송된 데이터 처리
		@PostMapping("/user/update.do")
		public String submitUpdate(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
			logger.info("<<회원 정보 수정>> : " + memberVO);
			
			//유효성 체크 결과 오류가 있으면 폼 호출
			/*if(result.hasErrors()) {
				return "userModifyForm";
			}
			*/
			
			Integer user_num = (Integer)session.getAttribute("user_num");
			
			memberVO.setMem_num(user_num);

			//회원정보수정
			memberService.updateMember(memberVO);
			
			return "redirect:/user/myPage.do";
		}
		
		//비밀번호 변경 폼
		@GetMapping("/user/changePassword.do")
		public String formChangePassword() {
			return "userChangePassword";
		}
		
		//비밀번호 변경 폼에서 전송된 데이터 처리
		@PostMapping("/user/changePassword.do")
		public String submitChangePassword(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
			logger.info("<<비밀번호 변경 처리>>:" + memberVO);
			
			//유효성 체크 결과 오류가 있으면 폼 호출
			if(result.hasFieldErrors("now_mem_pw") || result.hasFieldErrors("mem_pw")) {
				
				return formChangePassword();
			}
			
			Integer user_num = (Integer)session.getAttribute("user_num");
			memberVO.setMem_num(user_num);		
			
			//세션에 저장된 회원번호를 이용해서 DB에 저장된 회원정보를 MemberVO에 담아서 반환
			MemberVO db_member = memberService.selectMember(memberVO.getMem_num());
			
				//DB에서 읽어온 비밀번호 			     사용자가 입력한 비밀번호
			if(!db_member.getMem_pw().equals(memberVO.getNow_mem_pw())) {
				result.rejectValue("now_mem_pw", "invalidPassword");
				return formChangePassword();
			}
			
			//비밀번호가 동일하면 비밀번호 수정
			memberService.updatePassword(memberVO);
			
			return "redirect:/user/myPage.do";
		}
		
		//회원 삭제 폼
		@GetMapping("/user/delete.do")
		public String formDelete() {
			return "userDelete";
		}
		
		//회원데이터 삭제
		@PostMapping("/user/delete.do")
		public String submitDelete(@Valid MemberVO memberVO, BindingResult result, HttpSession session) {
			
			logger.info("<<회원탈퇴>> : " + memberVO);
			
			//유효성 체크 결과 오류
			if(result.hasFieldErrors("id") || result.hasFieldErrors("mem_pw")) {
				return formDelete();
			}
			
			Integer user_num = (Integer)session.getAttribute("user_num");
			memberVO.setMem_num(user_num);
			
			//아이디와 비밀번호 일치 여부
			try {
				//세션에 저장된 회원번호를 이용해서  DB에 저장된 회원 정보를 MemberVO에 담아서 반환
				MemberVO db_member = memberService.selectMember(memberVO.getMem_num());
				boolean check = false;
				
				if(db_member!=null && memberVO.getId().contentEquals(db_member.getId())) {
					//DB비밀번호 일치 여부 체크				//사용자가 입력한 비밀번호
					check = db_member.isCheckPassword(memberVO.getMem_pw());
				}
				if(check) {
					//인증 성공, 회원정보 삭제
					memberService.deleteMember(memberVO.getMem_num());
					//로그아웃
					session.invalidate();
					
					return "redirect:/main/main.do";
				}
				//인증 실패
				throw new AuthCheckException();
			
			}catch(AuthCheckException e) {
				result.reject("invalidIdOrPassword");
				return formDelete();
			}
		}
		
		//DB에 저장되어있는 이미지 출력하는 곳
		@RequestMapping("/user/photoView.do")
		public ModelAndView viewImage(HttpSession session) {
			
			Integer user_num = (Integer)session.getAttribute("user_num");
			MemberVO memberVO = memberService.selectMember(user_num);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("imageView");
			mav.addObject("imageFile",memberVO.getMem_photo());
			mav.addObject("filename",memberVO.getPhoto_name());
			
			return mav;
		}
		
		
	
}













