package com.kh.jejour.findUser.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jejour.findUser.model.service.FindUserService;
import com.kh.jejour.findUser.model.vo.FindUser;
import com.kh.jejour.member.model.vo.Member;

@Controller
public class MemberFindController {

		private Logger logger = LoggerFactory.getLogger(this.getClass());
	
		@Autowired
		FindUserService FindUserService;
		
		@Autowired
		BCryptPasswordEncoder bcryptPasswordEncoder;
		
		
		// 아이디 찾기 페이지 이동하기
		@RequestMapping("/member/memberfindidForm.do")
		public String FinduserId() {


			return "member/find";
		}
		
		// 아이디찾기
		@RequestMapping("/member/memberFindid.do")
		public String FindId(HttpServletRequest request,
							 HttpServletResponse response,
							 @RequestParam String name,
							 @RequestParam String email,
							 Model model) {
			
		System.out.println(name);
		System.out.println(email);
			
		
		Member m = new Member(name, email);
		
		/*
		 * Map<String,Object> hm = new HashMap<String,Object>(); hm.put("name", name);
		 * hm.put("email", email);
		 * 
		 * System.out.println(hm);
		 */
			
			String userId = (String)FindUserService.findUserId(m);
			

			System.out.println(userId);
			
			int check = 0;
			
			if (userId != null) {
				
				check = 1; // 이름과 이메일을 제대로 입력하여 해당되는 아이디가 있을때
			
			} else {
				
				check = -1; // 이름과 이메일을 다르게 입력했을때
			
			}
			
			System.out.println(check);
			
			model.addAttribute("name", name);
			model.addAttribute("email", email);
			model.addAttribute("userId", userId);
			model.addAttribute("check",check);
			
			return "/member/findId";
					/*"redirect:/member/findId.do";*/
		
		}
		
		
		// 비밀번호 설정하러가기
		@RequestMapping("/member/goPwdSet.do")
		public String goPwdSet(HttpServletRequest request,
				 						   HttpServletResponse response,
				 						   Model model) {
			
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String userId = request.getParameter("userId");
			
			System.out.println("name : " + name);
			System.out.println("email : " + email);
			System.out.println("userId : " + userId);
			
			model.addAttribute("name", name);
			model.addAttribute("email", email);
			model.addAttribute("userId", userId);
	

			return "member/setuserPwd";
		}
		
		
		// 비밀번호 설정하기
		@RequestMapping("/member/setUserPwd.do")
		@ResponseBody
		public Map<String,Object> userPwdset(HttpServletRequest request,
				 							 HttpServletResponse response,
				 							 @RequestParam String userId,
				 							 @RequestParam String userPwd,
				 							 Member m) {

			
		
			Map<String,Object> hm = new HashMap<String,Object>();
			hm.put("userId", userId);
			
			//재설정하는 비밀번호 값 암호화
			String secret = m.getUserPwd();
			m.setUserPwd(bcryptPasswordEncoder.encode(secret));
			hm.put("userPwd", secret);
			
			int result = FindUserService.userPwdset(m);
			
			
		 	if( result == 0 ) {
				
				// 비밀번호 변경되지않음
				hm.put("result", result);
				
				
			} else if( result == 1) {
			
				// 비밀번호 변경됨
				hm.put("result", result);
			
		
			}	

		System.out.println("담긴값 : " + hm);
			
		return hm;
	
		}
		
}
