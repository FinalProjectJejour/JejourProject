package com.kh.jejour.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jejour.common.util.Utils;
import com.kh.jejour.member.model.exception.MemberException;
import com.kh.jejour.member.model.service.MemberService;
import com.kh.jejour.member.model.vo.Member;

@SessionAttributes(value = { "member" })
@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

		
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
		// 회원 가입 기능 실행하기
		@RequestMapping("/member/memberinsert.do")
		public String memberEnrollEnd(Member member,
									@RequestParam String zipCode,
									@RequestParam String address1,
									@RequestParam String address2, Model model) {
			
			// 주소명 합치기
			String address = zipCode + "-" +address1 + "-" + address2;
			member.setAddress(address);			
			
			System.out.println(member);
			logger.debug("회원 가입 처리 메소드");
			String plainPassword = member.getUserPwd();
			System.out.println("비밀번호 암호화 전 : " + plainPassword);

			// ------------ 암호화 Start --------------//
			String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		

			// ------------- 암호화 End ---------------//
			System.out.println("비밀번호 암호화 후 : " + encryptPassword);

			member.setUserPwd(encryptPassword);
			
			// 서비스 로직을 수행
			int result = memberService.insertMember(member);

			String loc = "/";
			String msg = "";

			// 수행한 결과에 따라 화면 분기 처리
			if (result > 0)
				msg = "회원가입 성공!";
			else
				msg = "회원 가입 실패!";

			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);

			return "common/msg";
		}
		
		@RequestMapping("/itro/ourSite.do")
		public String moveOutStie() {
			
			
			return "member/ourSite";
			
		}
		
		// 나의 일정페이지 이동
		@RequestMapping("/member/memberPlan.do")
		public String moveMyplan(
					@RequestParam(value="cPage", required=false, defaultValue="1")int cPage,
					String userId,
					Model model) {
			
			int numPerPage = 8;
					
			List<Map<String, String>> list = memberService.selectMyPlanList(userId, cPage, numPerPage);
			
			System.out.println("list 정보 : " + list);
			System.out.println("userId : " + userId);
			
			int totalContents = memberService.selectMyPlanTotalContents(userId);
			
			String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "memberPlan.do");
			
			model.addAttribute("list", list)
			 .addAttribute("totalContents",totalContents)
		     .addAttribute("numPerPage", numPerPage)
		     .addAttribute("pageBar", pageBar)
			 .addAttribute("userId", userId);
			
			
		
			return "planner/myPlan";
		}
		
	
	
		// 예약홈페이지 이동
		@RequestMapping("/planner/goReservation.do")
		public String moveReservation() {

			
			
			
			return "reservation/reservationGo";
		}
		
		
		// 로그인,회원가입 페이지 이동
		@RequestMapping("/member/memberLoginFormView.do")
		public String memberLoginFormView() {
			logger.debug("로그인화면 접근!");


			return "member/MemberLoginForm";
		}
		
		
		@RequestMapping("/member/memberLogincheck.do")
		@ResponseBody
		public Map<String, Object> loginCheckProcess(@RequestParam String userId,
		                                             @RequestParam String userPwd){
		      
		Map<String, Object> map = new HashMap<String, Object>();
		      
		Member m = memberService.selectOne(userId);
		ModelAndView mav = new ModelAndView();
		
		String msg = "";
		String loc = "/";
		
		int result = 0;

		if(m == null) {
		   //아이디가 없음
		   result = 1;
		   map.put("result", result);
		} else {
			if(bcryptPasswordEncoder.matches(userPwd, m.getUserPwd())) {
			   	 // 성공했을 때
			   	 result = 2;
		         map.put("result", result);
		       
		         
		    } else {
		    	 
		    	 //비밀번호 틀림
		    	 result = 3;
		         map.put("result", result);
		   }
		}
	
		      
	return map;
 }
		
	//로그인하기
	@RequestMapping(value = "/member/memberLogin.do", method = RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam String userId,
									@RequestParam String userPwd) {

			ModelAndView mav = new ModelAndView();

		
				Member m = memberService.selectOne(userId);

			
				
				String msg = "";
				String loc = "/";

			if (bcryptPasswordEncoder.matches(userPwd, m.getUserPwd())) {

		    msg = "로그인 성공!";

			mav.addObject("member", m); 
					
			}

			
				mav.addObject("loc", loc);
				mav.addObject("msg", msg);

				mav.setViewName("common/msg");

			

			return mav;
		}	
		
		
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus status) {
		// SessionStatus 는 현재 사용자가 접속한 웹 브라우저와
		// 서버 사이의 세션의 설정을 가지는 객체

		// 세션이 아직 완료되지 않았다면 세션을 종료시켜라!
		if (!status.isComplete())
			status.setComplete();

		return "redirect:/";
	}
	

		// 로그인,회원가입 페이지 이동
		@RequestMapping("/member/memberUpdateFormView.do")
		public String memberUpdateFormView() {
		
				
			
			return "member/MemberUpdateForm";
			
		}
	
	
	
	
		// 회원 정보 수정 기능 메소드
		@RequestMapping("/member/memberUpdate.do")
		public String memberUpdate(Member member,
								  @RequestParam String zipCode,
								  @RequestParam String address1,
								  @RequestParam String address2, Model model) {

			logger.debug("회원 정보 수정 발생!");

			String address = zipCode + "-" +address1 + "-" + address2;
			member.setAddress(address);
			// 1. 서비스 로직 수행! (비즈니스 로직)
			int result = memberService.updateMember(member);

			// 2. 처리결과에 따라 화면 분기 처리하기
			String loc = "/";
			String msg = "";

			if (result > 0) {
				msg = "회원 정보 수정 성공!";
			} else {
				msg = "회원 정보 수정 실패!";
			}

			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);

			return "common/msg";

		}
		
		//아이디 중복체크
		@RequestMapping("/member/checkIdDuplicate.do")
		@ResponseBody
		public Map<String, Object> responseBodyProcess(@RequestParam("userId") String userId) {

			Map<String, Object> map = new HashMap<String, Object>();
			boolean isUsable = memberService.checkIdDuplicate(userId) == 0 ? true : false;

			map.put("isUsable", isUsable);

			// @ResponseBody는 결과가 viewResolver로 가지 않고
			// 직접 그 결과 자체를 화면으로 전달한다.
			return map;
		}
		
		//이메일 중복체크
		@RequestMapping("/member/checkEmailDup.do")
		@ResponseBody
		public Map<String, Object> checkEmailDup(@RequestParam("email") String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean isUsable = memberService.checkEmailDup(email) == 0 ? true : false;

		map.put("isUsable", isUsable);
		
		return map;
		
	}
		
	
	// 회원 탈퇴 기능 메소드
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(SessionStatus status, Model model, Member member) {
			logger.debug("회원 탈퇴 기능 확인!");

			try {
				int result = memberService.deleteMember(member.getUserId());

				String loc = "/";
				String msg = "";

				if (result > 0) {

					msg = "회원 탈퇴 성공!";
					status.setComplete(); // 세션 완료(만료) 처리

				} else
					msg = "회원 탈퇴 실패!";

				model.addAttribute("loc", loc);
				model.addAttribute("msg", msg);

			} catch (Exception e) {
				logger.error("회원 탈퇴 에러 : " + e.getMessage());

				// 받은 에러를 서버 개발자가 의도한 형식으로 보내기
				throw new MemberException(e.getMessage());
			}

			return "common/msg";

		}
		
}

