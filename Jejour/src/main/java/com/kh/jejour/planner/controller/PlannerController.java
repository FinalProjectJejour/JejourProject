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
import com.kh.jejour.plannerLike.model.service.PlannerLikeService;
import com.kh.jejour.plannerPart.model.service.PlannerPartService;
import com.kh.jejour.plannerPart.model.vo.CategoryCount;
import com.kh.jejour.plannerPart.model.vo.PlannerPart;

@Controller
public class PlannerController {
	
	@Autowired
	PlannerService plannerService;
	
	@Autowired
	PlannerPartService plannerPartService;
	
	@Autowired
	PlannerLikeService plannerLikeService;
	
	@RequestMapping("/planner/reservationGo.do")
	public String goReservation() {
		
		return "reservation/reservationGo";
	}
	
	@RequestMapping("/planner/maintenanceGo.do")
	public String maintenanceGo(Planner planner, Model model, HttpSession session) {
		
		Planner pl = plannerService.getThisPlanner(planner.getPNo());
		System.out.println(pl);
		
		List<PlannerPart> list = plannerPartService.selectPlanList(planner.getPNo());
		List<CategoryCount> cclist = plannerPartService.countCategory(planner.getPNo());
		System.out.println(list);
		System.out.println(list.size());
		System.out.println(cclist);
		
		int like = plannerLikeService.countLike(planner.getPNo());
		int unlike = plannerLikeService.countUnLike(planner.getPNo());

		
		model.addAttribute("planner", pl);
		model.addAttribute("pNo",pl.getPNo());
		model.addAttribute("startDay",pl.getStartDay());
		model.addAttribute("endDay",pl.getEndDay());
		model.addAttribute("describe",pl.getDescribe());
		model.addAttribute("list", list);
		model.addAttribute("cclist", cclist);
		model.addAttribute("listLength", list.size());
		model.addAttribute("like", like);
		model.addAttribute("unlike", unlike);
		
		return "planner/maintenance";
	}
	
	@RequestMapping("/planner/changeTheme.do")
	public String changeTheme(Planner planner, Model model, HttpSession session) {
		
		plannerService.changePlannerTheme(planner);
		
		Planner pl = plannerService.getThisPlanner(planner.getPNo());
		System.out.println(pl);
		
		List<PlannerPart> list = plannerPartService.selectPlanList(planner.getPNo());
		List<CategoryCount> cclist = plannerPartService.countCategory(planner.getPNo());
		System.out.println(list);
		
		int like = plannerLikeService.countLike(planner.getPNo());
		int unlike = plannerLikeService.countUnLike(planner.getPNo());

		
		model.addAttribute("planner", pl);
		model.addAttribute("pNo",pl.getPNo());
		model.addAttribute("startDay",pl.getStartDay());
		model.addAttribute("endDay",pl.getEndDay());
		model.addAttribute("describe",pl.getDescribe());
		model.addAttribute("list", list);
		model.addAttribute("cclist", cclist);
		model.addAttribute("listLength", list.size());
		model.addAttribute("like", like);
		model.addAttribute("unlike", unlike);
		
		return "planner/maintenance";
	}
	
	@RequestMapping("/planner/plannerSee.do")
	public String seePlanner() {
		
		
		return "planner/planner";
	}
	
	@RequestMapping("/planner/plannerSeeConfirm.do")
	public String seePlannerConfirm(Model model, HttpSession session,
									@RequestParam("pNo") int pNo) {
		
		System.out.println(pNo);
		
		List<PlannerPart> list = plannerPartService.selectPlanList(pNo);
		Planner pl = plannerService.getThisPlanner(pNo);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pNo", pNo);
		model.addAttribute("start", pl.getStartDay());
		
		return "planner/plannerConfirm";
	}
	
	@RequestMapping("/planner/changeDescribe.do")
	public String updateDescribe(Model model, HttpSession session,
									@RequestParam("pNo") int pNo,
									@RequestParam("describe") String describe) {
		
		System.out.println(pNo);
		
		List<PlannerPart> list = plannerPartService.selectPlanList(pNo);
		Planner pl = plannerService.getThisPlanner(pNo);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pNo", pNo);
		model.addAttribute("describe", describe);
		model.addAttribute("start", pl.getStartDay());
		
		return "planner/updateDescribe";
	}
	
	@RequestMapping("/planner/afterChangeDescribe.do")
	public String ReturnMaintenance(Planner planner, Model model, HttpSession session) {
		
		plannerService.setDescribe(planner);
		
		Planner pl = plannerService.getThisPlanner(planner.getPNo());
		System.out.println(pl);
		
		List<PlannerPart> list = plannerPartService.selectPlanList(planner.getPNo());
		List<CategoryCount> cclist = plannerPartService.countCategory(planner.getPNo());
		System.out.println(list);
		System.out.println(list.size());
		System.out.println(cclist);
		
		int like = plannerLikeService.countLike(planner.getPNo());
		int unlike = plannerLikeService.countUnLike(planner.getPNo());

		
		model.addAttribute("planner", pl);
		model.addAttribute("pNo",pl.getPNo());
		model.addAttribute("startDay",pl.getStartDay());
		model.addAttribute("endDay",pl.getEndDay());
		model.addAttribute("describe",pl.getDescribe());
		model.addAttribute("list", list);
		model.addAttribute("cclist", cclist);
		model.addAttribute("listLength", list.size());
		model.addAttribute("like", like);
		model.addAttribute("unlike", unlike);
		
		return "planner/maintenance";
	}
	
	@RequestMapping("/planner/planConfirm.do")
	public String PlannerConfirm(Planner planner, Model model, HttpSession session) {
		
		plannerService.setStatus(planner);
		
		return "redirect:/";
	}
	
	@RequestMapping("/planner/changeStatus.do")
	public String changeStatus(Planner planner, Model model, HttpSession session) {
		
		plannerService.setOneStatus(planner);
		
		Planner pl = plannerService.getThisPlanner(planner.getPNo());
		System.out.println(pl);
		
		List<PlannerPart> list = plannerPartService.selectPlanList(planner.getPNo());
		List<CategoryCount> cclist = plannerPartService.countCategory(planner.getPNo());
		System.out.println(list);
		System.out.println(list.size());
		System.out.println(cclist);
		
		int like = plannerLikeService.countLike(planner.getPNo());
		int unlike = plannerLikeService.countUnLike(planner.getPNo());

		
		model.addAttribute("planner", pl);
		model.addAttribute("pNo",pl.getPNo());
		model.addAttribute("startDay",pl.getStartDay());
		model.addAttribute("endDay",pl.getEndDay());
		model.addAttribute("describe",pl.getDescribe());
		model.addAttribute("list", list);
		model.addAttribute("cclist", cclist);
		model.addAttribute("listLength", list.size());
		model.addAttribute("like", like);
		model.addAttribute("unlike", unlike);
		
		return "planner/maintenance";
	}
	
	
	/*
	@RequestMapping("/planner/plannerSeePlan.do")
	public String seeSetPlanner(@RequestParam("list") List<PlannerPart> list, Model model) {
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "planner/planner";
	}
	*/
	@RequestMapping("/planner/plannerMake.do")
	public String makePlanner(Planner planner, Model model, HttpSession session) {
		
		plannerService.settingPlanner(planner);
		
		return "planner/planner";
	}
	
	
	@RequestMapping("/planner/AttachmentInsert.do")
	public String insertAttachment(Planner planner, Model model, HttpSession session,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFile,
			@RequestParam("start_date") String start_date,
			@RequestParam("return_date") String return_date) {

		planner.setStartDay(start_date);
		planner.setEndDay(return_date);
		
		start_date += "T00:00";
		return_date += "T23:00";
		
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
		

		model.addAttribute("pNo", pn.getPNo());
		model.addAttribute("start_date", start_date);
		model.addAttribute("return_date", return_date);
		
		

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
	
	
	@RequestMapping("/planner/instanceMakePlan.do")
	public String instanceMakePlan(Planner planner, Model model, HttpSession session) {
		
		Planner pl = plannerService.getThisPlanner(planner.getPNo());
		
		String start=pl.getStartDay()+"T00:00";
		String end=pl.getEndDay()+"T23:00";
		
		model.addAttribute("planner", pl);
		model.addAttribute("pNo",pl.getPNo());
		model.addAttribute("startDay",start);
		model.addAttribute("endDay",end);
		
		return "planner/instanceMakePlan";
	}
	
	@RequestMapping("/planner/instanceUpdatePlan.do")
	public String instanceUpdatePlan(Planner planner, Model model, HttpSession session,
			@RequestParam("ppNo") int ppNo,
			@RequestParam("pNo") String pNo) {
		
		Planner pl = plannerService.getThisPlanner(planner.getPNo());
		System.out.println(pl);
		System.out.println(pl.getStartDay());
		System.out.println(pl.getEndDay());
		
		PlannerPart plpart = plannerPartService.getThisPlannerPart(ppNo);
		
		System.out.println(plpart);
		
		String start=pl.getStartDay()+"T00:00";
		String end=pl.getEndDay()+"T23:00";
		
		model.addAttribute("planner", pl);
		model.addAttribute("plannerPart", plpart);
		model.addAttribute("pNo",pl.getPNo());
		model.addAttribute("ppNo",ppNo);
		model.addAttribute("startDay",start);
		model.addAttribute("endDay",end);

		model.addAttribute("start_date",pl.getStartDay());
		model.addAttribute("return_date",pl.getEndDay());
		
		return "planner/instanceUpdatePlan";
	}
	
	@RequestMapping("/planner/deletePlan.do")
	public String deletePlan(Planner planner, Model model, HttpSession session) {
		
		plannerService.deleteThisPlanner(planner.getPNo());
		
		return "redirect:/";
	}
	
	
	/*
	@RequestMapping("/planner/LatestPno.do")
	public int LatestPno(Planner planner, Model model, HttpSession session) {
		
		int pNo = planner.getPNo();
		
		Planner pl = plannerService.selectPlanner(pNo);
		
		return pl.getPNo();
	}
	*/
	
}
