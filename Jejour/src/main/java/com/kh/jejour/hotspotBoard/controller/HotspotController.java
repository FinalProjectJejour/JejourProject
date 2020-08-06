package com.kh.jejour.hotspotBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.jejour.hotspotBoard.model.exception.HotspotBoardException;
import com.kh.jejour.hotspotBoard.model.service.HotspotService;
import com.kh.jejour.hotspotBoard.model.vo.HotspotBoard;
import com.kh.jejour.hotspotComment.model.service.HotspotCService;
import com.kh.jejour.hotspotComment.model.vo.HotspotComment;
import com.kh.jejour.hotspotLike.model.service.HotspotLikeService;
import com.kh.jejour.common.util.HotspotUtils;
import com.kh.jejour.common.util.Utils;
import com.kh.jejour.flashBoard.model.vo.FlashBoard;


@Controller
public class HotspotController {
	
	@Autowired
	HotspotService hotspotService;
	
	@Autowired
	HotspotLikeService hotspotLikeService;
	
	@Autowired
	HotspotCService hotspotCService;
	
	@RequestMapping("/hotspotBoard/hotspotInsert.ho")
	public String goHotspotInsertBoard() {
		return "hotspot/hotspotInsert";
	}
	
	@RequestMapping("/hotspotBoard/hotspotDetail.ho")
	public String hospotBoardSelectOne(@RequestParam int no, Model model) {
		System.out.println("no : "+  no);
		HotspotBoard h = hotspotService.hotspotSelectOne(no);
		System.out.println("h : " + h);
		
		List<HotspotComment> clist = new ArrayList<HotspotComment>();
		clist = hotspotCService.hotspotCSelectDetail(no);
		System.out.println("c : " + clist);
		
		model.addAttribute("hotspotBoard", h);
		model.addAttribute("like" , hotspotLikeService.hotspotLikeCountSelect(no));
		model.addAttribute("unlike", hotspotLikeService.hotspotUnLikeCountSelect(no));
		model.addAttribute("clist", clist);
		
		return "hotspot/hotspotDetail";
	}

	
	@RequestMapping("/hotspotBoard/boardInsert.ho")
	public String hotspotInsertBoard(HotspotBoard hotspotboard, Model model) {
		
		System.out.println("hotspotboard 객체 오나요? : " + hotspotboard);
		
		// 위즈윅 첫 번째 이미지을 hPreveiw에 넣기위한 작업
		String first = hotspotboard.getHContent();
		String complete = first.substring(first.indexOf("desc/")+5,first.indexOf(".",first.indexOf("<img"))+4);
		// hPreview객체에 담기
		hotspotboard.setHPreview(complete);
		// 변경된 객체 확인
		System.out.println("hotspotboard 변경 : " + hotspotboard);
		
		// SERVICE DAO CHECK
		int result;	
		try {
		result = hotspotService.hotspotInsert(hotspotboard);
		} catch(Exception e) {
			throw new HotspotBoardException("게시물 등록 오류!");
		}
		
		
		// List 갱신 및 알람창 설정
	      String loc = "/hotspotBoard/hotspotList.ho";
	      String msg = "";
	      
	      if(result > 0) {
	         msg = "게시글 등록 성공!";
	         loc = "/hotspotBoard/hotspotList.ho";
	        		 //hotspotboard.getHNo();
	         
	      } else {
	         msg = "게시글 등록 실패!";
	      }
	      
	      model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/hotmsg";
	}
	
	
	@RequestMapping("/hotspotBoard/summernote.ho")
	@ResponseBody
	public String hotspotSommernote(HttpSession session,
	         @RequestParam(value="file", required = false) MultipartFile[] file) {
		
		System.out.println("ㄲ_ㄲ");
		System.out.println( file + "은 받나요?");
		
		// 경로를 설정합니다.
		String savePath = session.getServletContext().getRealPath("/resources/images/hotspotimg/desc");
		System.out.println("SavePath : " + savePath);
		
		//폴더의 유무를 확인하겠습니다. 존재하나요?
		File fileAlive = new File(savePath);
		System.out.println("폴더가 있나요?" + fileAlive.exists());
		
		// 만약 존재하지 않다면 폴더를만들어주세요
		if(fileAlive.exists() == false) fileAlive.mkdirs();
		
		String renamedName = "";
		// MultiartFile 사용하여 파일 업로드를 하겠습니다.
		for(MultipartFile f : file) {
			System.out.println("MuitpartFile : " + f);
			if(!f.isEmpty()) {
				// 원본이름 가져오기
				String originName = f.getOriginalFilename();
				System.out.println("원본 파일 : "+ originName);
				String ext = originName.substring(originName.lastIndexOf(".")+1);
				System.out.println("짜른 파일 : "+ ext);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				System.out.println("sdf : "+ sdf);
				
				int rndNum = (int)(Math.random() * 1000);
				
				// 서버에서 저장 후 관리할 파일명
				renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
				System.out.println("renamedName : " + renamedName);
				
				// 실제 파일을 지정한 파일명으로 변환하여 데이터를 저장한다.
				try {
					f.transferTo(new File(savePath + "/" + renamedName));
					System.out.println("f :" + f);
					System.out.println("savePath :" + savePath);
					System.out.println("f :" + f);
				} catch (IllegalStateException | IOException e) {
		               e.printStackTrace();
		        }
			}	
		}
		
		return "http://localhost:8088/jejour/resources/images/hotspotimg/desc/"+renamedName;
	}	
	
	@RequestMapping("/hotspotBoard/hotspotList.ho")
	public String selectBoardList(
				@RequestParam(value="cPage", required=false, defaultValue="1")
				int cPage, Model model) {
		
		// 한 페이지 당 게시글 수
		int numPerPage=8; // limit 역할
		
		// 1. 현재 페이지 게시글 목록 가져오기
		// VO를 안쓰는 방법
		// board객체를 통채로 받을수 없다.
		List<Map<String, String>> holist
			= hotspotService.hotspotPageList(cPage, numPerPage);
		
		// 2. 페이지 계산을 위한 총 페이지 갯수
		int totalContents = hotspotService.selectBoardTotalContents();
		
		// 3.페이지 HTML 생성
		String pageBar = HotspotUtils.getPageBar(totalContents, cPage, numPerPage, "hotspotList.ho");
		
		model.addAttribute("holist", holist);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		System.out.println("holist : " + holist);
		
		return "hotspot/hotspotList"; 
	}
	
	@RequestMapping("/hotspotBoard/hotspotUpdateView.ho")
	public String boardUpdateView(@RequestParam int no, Model model) {
		
		model.addAttribute("HotspotBoard", hotspotService.hotspotSelectOne(no));
		
		return "hotspot/hotspotUpdateView";
	}
	
	@RequestMapping("/hotspotBoard/hotspotUpdate.ho")
	public String hotspotUpdateBoard(HotspotBoard hotspotboard, Model model) {
		
		System.out.println("hotspotboard 객체 오나요? : " + hotspotboard);
		
		// 위즈윅 첫 번째 이미지을 hPreveiw에 넣기위한 작업
		String first = hotspotboard.getHContent();
		String complete = first.substring(first.indexOf("desc/")+5,first.indexOf(".",first.indexOf("<img"))+4);
		// hPreview객체에 담기
		hotspotboard.setHPreview(complete);
		// 변경된 객체 확인
		System.out.println("hotspotboard 변경 : " + hotspotboard);
		
		// SERVICE DAO CHECK
		int result;	
		try {
		result = hotspotService.hotspotUpdate(hotspotboard);
		} catch(Exception e) {
			throw new HotspotBoardException("게시물 수정 오류!");
		}
		System.out.println("update 결과 :" +  result);
		
		// List 갱신 및 알람창 설정
	      String loc = "/hotspotBoard/hotspotList.ho";
	      String msg = "";
	      
	      if(result > 0) {
	         msg = "게시글 수정 성공!";
	         loc = "/hotspotBoard/hotspotList.ho";
	        		 //hotspotboard.getHNo();
	         
	      } else {
	         msg = "게시글 수정 실패!";
	      }
	      
	      model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/hotmsg";
	}
	
	@RequestMapping("/hotspotBoard/hotspotDelete.ho")
	public String hotspotboardDelete(HotspotBoard hotspotboard, Model model, @RequestParam int hNo) {
		
		hotspotboard.setHNo(hNo);
		System.out.println("Service");
		System.out.println("hotspotboard 변경 : " + hotspotboard);
		
		int result;	
		
		try {
			
		result = hotspotService.hotspotDelete(hotspotboard);
		
		} catch(Exception e) {
			
			throw new HotspotBoardException("게시물 수정 오류!");
			
		}
		System.out.println("update 결과 :" +  result);
		
		// List 갱신 및 알람창 설정
	      String loc = "/hotspotBoard/hotspotList.ho";
	      String msg = "";
	      
	      if(result > 0) {
	         msg = "게시글 삭제 성공!";
	         loc = "/hotspotBoard/hotspotList.ho";
	        		 //hotspotboard.getHNo();
	         
	      } else {
	         msg = "게시글 삭제 실패!";
	      }
	      
	      model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/hotmsg";
	}
	
	@RequestMapping("/hotspotBoard/search.ho")
	@ResponseBody
	public HashMap<String,Object> search(@RequestParam String searchCondition, @RequestParam String keyword, @RequestParam int cPage){
		
		// 한 페이지 당 게시글 수
		int numPerPage = 8; // Limit 역할
				
		List<HotspotBoard> list = new ArrayList<HotspotBoard>();
		System.out.println("1   :" + searchCondition);
		System.out.println("2   :" +keyword);
		
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("searchCondition", searchCondition);
		hmap.put("keyword", keyword);
		
		list = hotspotService.search(hmap, cPage, numPerPage);
		
		System.out.println("list : " + list);
		
		// 2. 페이지 계산을 위한 총 페이지 갯수
		int totalContents = hotspotService.selectHotspotBoardSearchContents(hmap);
		System.out.println("총페이지 갯수 : " + totalContents);
		
		// 3. 페이지 HTML 생성
		String pageBar = HotspotUtils.getPageBar(totalContents, cPage, numPerPage, "hotspotList.ho");
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("list", list);
		map.put("pageBar", pageBar);
		
		return map;
	}
	
	@RequestMapping("/HotspotBoard/myHotspot.ho")
	public String myHotspot(
				@RequestParam(value="cPage", required=false, defaultValue="1")
				int cPage, String userId, Model model) {
		System.out.println("userId = " + userId);
		// 한 페이지 당 게시글 수
		int numPerPage=8; // limit 역할
		
		// 1. 현재 페이지 게시글 목록 가져오기
		// VO를 안쓰는 방법
		// board객체를 통채로 받을수 없다.
		List<Map<String, String>> holist
			= hotspotService.hotspotMyPageList(cPage, numPerPage, userId);
		
		
		// 2. 페이지 계산을 위한 총 페이지 갯수
		int totalContents = hotspotService.selectBoardMyTotalContents(userId);
		
		// 3.페이지 HTML 생성
		String pageBar = HotspotUtils.getPageBar(totalContents, cPage, numPerPage, "hotspotList.ho");
		
		model.addAttribute("holist", holist);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		System.out.println("holist : " + holist);
		
		return "member/myHotspot"; 
	}

	
}

