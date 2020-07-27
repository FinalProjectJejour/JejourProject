package com.kh.jejour.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.jejour.admin.model.service.AdminService;
import com.kh.jejour.member.model.vo.Member;

@SessionAttributes(value = { "member" })
@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin/admin.do")
	public String adminindex() {
		// 관리자페이지 호출/방문자수 뷰
		
		return "admin/adminindex";   // --> /WEB-INF/views/admin/adminindex.jsp
	}
	
	@RequestMapping("/admin/memberManager.do")
	public String memberManager(Model model) {
		// 멤버관리 호출/멤버 전체리스트
		
		List<Member> list = adminService.selectMemberList();
		System.out.println("list : " + list); // 결과 확인용
		
		
		model.addAttribute("list", list);
		
		
		return "admin/todo_list";   
	}
	
	@RequestMapping("/admin/hotspotManager.do")
	public String hotspotManager(Model model) {
		// 리뷰관리페이지리스트/랭킹 호출
		
		
		return "admin/basic_table";   
	}
	
	@RequestMapping("/admin/flashManager.do")
	public String flashManager(Model model) {
		// 번개페이지리스트/랭킹 호출
		
		return "admin/responsive_table";   
	}
	
	@RequestMapping("/admin/general.do")
	public String general() {
		// UI관리
		return "admin/general";   
	}
	
	@RequestMapping("/admin/buttons.do")
	public String buttons() {
		// UI꽌리
		return "admin/button";   
	}
	@RequestMapping("/admin/panels.do")
	public String panels() {
		// UI꽌리
		return "admin/panels";  
	}
	
	@RequestMapping("/admin/font.do")
	public String font() {
		// UI관리
		return "admin/font_awesome";   
	}
	
	//==========기능====================================
	
	@RequestMapping("/admin/banMember.do")
	public String banMember(Member member,Model model) {
		//멤버 강퇴
		return "";   
	}
	
	@RequestMapping("/board/deleteHotspotBoard.do")
	public String deleteHotspotBoard(@RequestParam int hNo, HttpSession session, Model model) {
		//핫스팟보드삭제
		return ""; 
	}
	
	@RequestMapping("/board/deleteFlashBoard.do")
	public String deleteFlashBoard(@RequestParam int fNo, HttpSession session, Model model) {
		//플래시보드 삭제
		return ""; 
	}
	
	@RequestMapping("/board/hotspotBoardStatusChange.do")
	public String hotspotBoardStatusChange(@RequestParam int hNo, HttpSession session, Model model) {
		//핫스팟보드 활성상태
		return ""; 
	}
	
	@RequestMapping("/board/flashBoardStatusChange.do")
	public String flashBoardStatusChange(@RequestParam int fNo, HttpSession session, Model model) {
		//플래스보드 활성상태
		return ""; 
	}
	
	
	
	
}
