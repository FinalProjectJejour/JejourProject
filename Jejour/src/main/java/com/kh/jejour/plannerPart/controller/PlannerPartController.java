package com.kh.jejour.plannerPart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.jejour.planner.model.service.PlannerService;
import com.kh.jejour.planner.model.vo.Planner;
import com.kh.jejour.plannerLike.model.service.PlannerLikeService;
import com.kh.jejour.plannerPart.model.service.PlannerPartService;
import com.kh.jejour.plannerPart.model.vo.CategoryCount;
import com.kh.jejour.plannerPart.model.vo.PlannerPart;

@Controller
public class PlannerPartController {
	
	@Autowired
	PlannerPartService plannerPartService;
	
	@Autowired
	PlannerService plannerService;
	
	@Autowired
	PlannerLikeService plannerLikeService;
	
	@RequestMapping("/plannerPart/plannerPartMake.do")
	public String makePlanner(PlannerPart plannerPart, Model model, HttpSession session,
							@RequestParam("pNo") String pNo,
							@RequestParam("start_date") String start_date,
							@RequestParam("return_date") String return_date) {
		
		plannerPartService.settingPlanner(plannerPart);
		
		List<PlannerPart> list = plannerPartService.selectPlanList(plannerPart.getPNo());
		Planner pl = plannerService.getThisPlanner(plannerPart.getPNo());
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pNo", pNo);
		model.addAttribute("start", pl.getStartDay());
		model.addAttribute("start_date", start_date);
		model.addAttribute("return_date", return_date);
		//model.addAttribute("pNo", pNo);
		
		return "planner/planner";
		
	}
	
		
	@RequestMapping("/plannerPart/plannerPartDelete.do")
	public String deletePlanner(PlannerPart plannerPart, Model model, HttpSession session,
							@RequestParam("pNo") String pNo,
							@RequestParam("start_date") String start_date,
							@RequestParam("return_date") String return_date) {
		
		System.out.println("plannerPart");
		plannerPartService.deletePlanner(plannerPart.getPpNo());
		
		List<PlannerPart> list = plannerPartService.selectPlanList(plannerPart.getPNo());
		Planner pl = plannerService.getThisPlanner(plannerPart.getPNo());
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pNo", pNo);
		model.addAttribute("start", pl.getStartDay());
		model.addAttribute("start_date", start_date);
		model.addAttribute("return_date", return_date);
		//model.addAttribute("pNo", pNo);
		
		return "planner/planner";
		
	}
	
	
	@RequestMapping("/plannerPart/instanceMakePlan.do")
	public String instanceMakePlan(PlannerPart plannerPart, Model model, HttpSession session,
							@RequestParam("pNo") String pNo,
							@RequestParam("start_date") String start_date,
							@RequestParam("return_date") String return_date) {
		
		plannerPartService.settingPlanner(plannerPart);
		
		Planner pl = plannerService.getThisPlanner(plannerPart.getPNo());
		
		List<PlannerPart> list = plannerPartService.selectPlanList(plannerPart.getPNo());
		List<CategoryCount> cclist = plannerPartService.countCategory(plannerPart.getPNo());
		
		int like = plannerLikeService.countLike(plannerPart.getPNo());
		int unlike = plannerLikeService.countUnLike(plannerPart.getPNo());

		
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("cclist", cclist);
		model.addAttribute("listLength", list.size());
		model.addAttribute("planner", pl);
		model.addAttribute("pNo", pNo);
		model.addAttribute("startDay",pl.getStartDay());
		model.addAttribute("endDay",pl.getEndDay());
		model.addAttribute("describe",pl.getDescribe());
		model.addAttribute("like", like);
		model.addAttribute("unlike", unlike);
		
		return "planner/maintenance";
		
	}
	
	@RequestMapping("/plannerPart/instanceDeletePlan.do")
	public String plannerPartDelete(PlannerPart plannerPart, Model model, HttpSession session,
							@RequestParam("pNo") String pNo) {
		
		System.out.println("plannerPart");
		plannerPartService.deletePlanner(plannerPart.getPpNo());
		
		List<PlannerPart> list = plannerPartService.selectPlanList(plannerPart.getPNo());
		List<CategoryCount> cclist = plannerPartService.countCategory(plannerPart.getPNo());
		Planner pl = plannerService.getThisPlanner(plannerPart.getPNo());
		
		int like = plannerLikeService.countLike(plannerPart.getPNo());
		int unlike = plannerLikeService.countUnLike(plannerPart.getPNo());

		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("cclist", cclist);
		model.addAttribute("listLength", list.size());
		model.addAttribute("planner", pl);
		model.addAttribute("pNo", pNo);
		model.addAttribute("startDay", pl.getStartDay());
		model.addAttribute("endDay", pl.getEndDay());
		model.addAttribute("describe",pl.getDescribe());
		model.addAttribute("like", like);
		model.addAttribute("unlike", unlike);
		
		return "planner/maintenance";
		
	}
	
	@RequestMapping("/plannerPart/instanceUpdatePlan.do")
	public String instanceUpdatePlan(PlannerPart plannerPart, Model model, HttpSession session,
							@RequestParam("pNo") String pNo,
							@RequestParam("start_date") String start_date,
							@RequestParam("return_date") String return_date) {
		
		System.out.println(plannerPart);
		
		plannerPartService.updatePlanner(plannerPart);
		
		Planner pl = plannerService.getThisPlanner(plannerPart.getPNo());
		
		List<PlannerPart> list = plannerPartService.selectPlanList(plannerPart.getPNo());
		List<CategoryCount> cclist = plannerPartService.countCategory(plannerPart.getPNo());
		
		int like = plannerLikeService.countLike(plannerPart.getPNo());
		int unlike = plannerLikeService.countUnLike(plannerPart.getPNo());

		
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("cclist", cclist);
		model.addAttribute("listLength", list.size());
		model.addAttribute("planner", pl);
		model.addAttribute("pNo", pNo);
		model.addAttribute("startDay",pl.getStartDay());
		model.addAttribute("endDay",pl.getEndDay());
		model.addAttribute("describe",pl.getDescribe());
		model.addAttribute("like", like);
		model.addAttribute("unlike", unlike);
		
		return "planner/maintenance";
		
	}
	

	
}
