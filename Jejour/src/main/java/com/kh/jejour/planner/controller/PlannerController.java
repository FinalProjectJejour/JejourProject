package com.kh.jejour.planner.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.jejour.planner.model.exception.PlannerException;
import com.kh.jejour.planner.model.service.PlannerService;
import com.kh.jejour.planner.model.vo.Attachment;
import com.kh.jejour.planner.model.vo.Planner;

@Controller
public class PlannerController {
	
	@Autowired
	PlannerService plannerService;
	
	@RequestMapping("/planner/plannerSee.do")
	public String seePlanner() {
		
		return "planner/planner";
	}
	
	@RequestMapping("/planner/plannerMake.do")
	public String makePlanner(Planner planner, Model model, HttpSession session) {
		
		plannerService.settingPlanner(planner);
		
		return "planner/planner";
	}
	
	
	@RequestMapping("/planner/AttachmentInsert.do")
	public String insertAttachment(Planner planner, Model model, HttpSession session,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFile) {

		String saveDir = session.getServletContext().getRealPath("/resources/upload/planner");
		
		List<Attachment> attachList = new ArrayList<Attachment>();
		
		File dir = new File(saveDir);

		System.out.println("폴더가 있나요? " + dir.exists());
		
		if (dir.exists() == false)
			dir.mkdirs();

		for (MultipartFile f : upFile) {
			System.out.println("good");
			
			if (!f.isEmpty()) {
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".") + 1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

				int rndNum = (int) (Math.random() * 1000);

				String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;

				try {
					f.transferTo(new File(saveDir + "/" + renamedName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}

				Attachment at = new Attachment();
				at.setOriginalFileName(originName);
				at.setRenamedFileName(renamedName);

				attachList.add(at);
			}
		}

		int result;

		try {
			
			System.out.println("planner : "+planner);
			System.out.println("attachList : "+attachList);
			
			System.out.println("good2");
			result = plannerService.insertAttachment(planner, attachList);

		} catch (Exception e) {

			throw new PlannerException("planner 등록 오류!");

		}

		String loc = "/planner/plannerSee.do";
		String msg = "";

		if (result > 0) {
			msg = "플래너 등록 성공!";
			loc = "/planner/plannerSee.do?no=" + planner.getPNo();

		} else {
			msg = "게시글 등록 실패!";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		
		return "common/msg";
	}
	
	
}
