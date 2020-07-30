package com.kh.jejour.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jejour.admin.model.exception.adminException;
import com.kh.jejour.admin.model.service.AdminService;
import com.kh.jejour.flashBoard.model.vo.FlashBoard;
import com.kh.jejour.hotspotBoard.model.vo.HotspotBoard;
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
		
		//핫스팟 게시글출력
		List<HotspotBoard> list = adminService.selectHotspotBoardList();
		System.out.println("list : " + list); 
		
		//게시글 랭킹
		List<HotspotBoard> hrang = adminService.hBoardRanking();
		
		model.addAttribute("list", list)
			.addAttribute("hrang",hrang);
		
		return "admin/basic_table";   
	}
	
	@RequestMapping("/admin/flashManager.do")
	public String flashManager(Model model) {
		// 번개페이지리스트/랭킹 호출

		List<FlashBoard> list = adminService.selectFlashBoardLsit();
		System.out.println("list : " + list); // 결과 확인용
		
		//게시글 랭킹
				List<FlashBoard> frang = adminService.fBoardRanking(); 
		
		model.addAttribute("list", list)
			.addAttribute("frang",frang);
			
		
		return "admin/responsive_table";   
	}
	
	//===========UI관리페이지===============================
	
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
	
	//==========강퇴===================================
	
	@RequestMapping("/admin/banMember.do")
	public String banMember(@RequestParam String userId) {
		//멤버 강퇴
		System.out.println("멤버강퇴실행");
		try {
			
		adminService.banMember(userId);
		
		}catch(Exception e) {
			
			throw new adminException("멤버강퇴중 오류발생");
			
		}
		
		
		return "redirect:/admin/memberManager.do";   
	}
	
	//============삭제===============================
	
	@RequestMapping("/admin/deleteHotspotBoard.do")
	public String deleteHotspotBoard(@RequestParam int hNo) {
		/* 보류
		 * 
		System.out.println("핫스팟보드삭제실행");
		try {
			
		adminService.deleteHotspotBoard(hNo);
		
		}catch(Exception e) {
			
			throw new adminException("게시글 삭제중 오류발생");
			
		}
		*/
		
		return "redirect:/admin/hotspotManager.do"; 
	}
	
	@RequestMapping("/admin/deleteFlashBoard.do")
	public String deleteFlashBoard(@RequestParam int fNo) {
		//플래시보드 삭제
		System.out.println("플래시보드삭제실행");
		try {
			
		adminService.deleteFlashBoard(fNo);
		
		}catch(Exception e) {
			
			throw new adminException("게시글 삭제중 오류발생");
			
		}
		
		return "redirect:/admin/flashManager.do"; 
	}
	
	//========================스테이터스==========================
	
	@RequestMapping("/admin/hotspotBoardStatusChange.do")
	@ResponseBody
	public List<HotspotBoard> hotspotBoardStatusChange(@RequestParam int hNo, @RequestParam char hStatus) {
		//핫스팟보드 활성상태
		System.out.println("게시글활성/비활성");
		System.out.println(hNo);
		System.out.println(hStatus);
		HotspotBoard hb = new HotspotBoard();
		
		hb.setHNo(hNo);
		
		if(hStatus=='Y') {
			hb.setHStatus('N');
		}
		if(hStatus=='N') {
			hb.setHStatus('Y');
		}
		
		
			List<HotspotBoard> hotspot = adminService.hotspotBoardStatusChange(hb);
			System.out.println("리턴");
			System.out.println(hotspot);
		
		
		return hotspot; 
	}
	
	@RequestMapping("/admin/flashBoardStatusChange.do")
	@ResponseBody
	public List<FlashBoard> flashBoardStatusChange(@RequestParam int fNo,@RequestParam char fStatus) {
		//플래스보드 활성상태
		System.out.println("게시글활성/비활성");
		System.out.println(fNo);
		System.out.println(fStatus);
		FlashBoard fb = new FlashBoard();
		
		fb.setFNo(fNo);
		
		if(fStatus=='Y') {
			fb.setFStatus('N');
		}
		if(fStatus=='N') {
			fb.setFStatus('Y');
		}
		
		
			List<FlashBoard> flash = adminService.flashBoardStatusChange(fb);
			System.out.println("리턴");
			System.out.println(flash);
			
			
		return flash; 
	}
	
	
	
	
}
