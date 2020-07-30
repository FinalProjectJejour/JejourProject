package com.kh.jejour.plannerPart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.jejour.planner.model.service.PlannerService;
import com.kh.jejour.plannerPart.model.service.PlannerPartService;
import com.kh.jejour.plannerPart.model.vo.PlannerPart;

@Controller
public class PlannerPartController {
	
	@Autowired
	PlannerPartService plannerPartService;
	
	@Autowired
	PlannerService plannerService;
	
	@RequestMapping("/plannerPart/plannerPartMake.do")
	public String makePlanner(PlannerPart plannerPart, Model model, HttpSession session,
							@RequestParam("pNo") String pNo,
							@RequestParam("start_date") String start_date,
							@RequestParam("return_date") String return_date) {
		
		System.out.println(plannerPart);
		plannerPartService.settingPlanner(plannerPart);
		
		List<PlannerPart> list = plannerPartService.selectPlanList(plannerPart.getPNo());
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pNo", pNo);
		model.addAttribute("start_date", start_date);
		model.addAttribute("return_date", return_date);
		//model.addAttribute("pNo", pNo);
		
		return "planner/planner";
		
	}
	
	/*
	@RequestMapping("/planner/AttachmentInsert.do")
	public String insertAttachment(Planner planner, Model model, HttpSession session,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFile,
			@RequestParam("start_date") String start_date,
			@RequestParam("return_date") String return_date) {

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
			
			model.addAttribute("planner", planner);
			

		} catch (Exception e) {

			throw new PlannerException("planner 등록 오류!");

		}
		
		System.out.println(plannerService.selectOnePlanner(planner.getPNo()));
		
		Planner pn = plannerService.selectOnePlanner(planner.getPNo());
		
		System.out.println(pn.getPNo());
		
		

		String loc = "/planner/plannerSee.do";
		String msg = "";

		if (result > 0) {
			msg = "플래너 등록 성공!";
			loc = "/planner/plannerSee.do?no=" + pn.getPNo()+"&title="+pn.getTitle()+"&theme="+pn.getTheme()+"&start_date="+start_date+"&return_date="+return_date;

		} else {
			msg = "게시글 등록 실패!";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		
		return "common/msg";
	}
	
	
	@RequestMapping("/planner/LatestPno.do")
	public int LatestPno(Planner planner, Model model, HttpSession session) {
		
		int pNo = planner.getPNo();
		
		Planner pl = plannerService.selectPlanner(pNo);
		
		return pl.getPNo();
	}
	*/
	
}
