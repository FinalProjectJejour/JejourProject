package com.kh.jejour.plannerLike.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jejour.planner.model.service.PlannerService;
import com.kh.jejour.planner.model.vo.Planner;
import com.kh.jejour.plannerLike.model.service.PlannerLikeService;
import com.kh.jejour.plannerLike.model.vo.PlannerLike;
import com.kh.jejour.plannerPart.model.service.PlannerPartService;
import com.kh.jejour.plannerPart.model.vo.CategoryCount;
import com.kh.jejour.plannerPart.model.vo.PlannerPart;

@Controller
public class PlannerLikeController {
	
	@Autowired
	PlannerService plannerService;
	
	@Autowired
	PlannerPartService plannerPartService;
	
	@Autowired
	PlannerLikeService plannerLikeService;
	
	@RequestMapping("/plannerLike/recommend.do")
	public String changeTheme(PlannerLike plannerLike, Model model, HttpSession session) {
		
		System.out.println(plannerLike.getPNo());
		System.out.println(plannerLike.getUserId());
		System.out.println(plannerLike.getGood());
		
		System.out.println("here1");
		PlannerLike pll = plannerLikeService.selectPlannerLike(plannerLike);
		System.out.println(pll);
		
		if(pll == null) {
			plannerLikeService.insertPlannerLike(plannerLike);
		}else {
			plannerLikeService.updateGood(plannerLike);
		}
		
		int like = plannerLikeService.countLike(plannerLike.getPNo());
		int unlike = plannerLikeService.countUnLike(plannerLike.getPNo());
		
		
		Planner pl = plannerService.getThisPlanner(plannerLike.getPNo());
		System.out.println(pl);
		
		List<PlannerPart> list = plannerPartService.selectPlanList(plannerLike.getPNo());
		List<CategoryCount> cclist = plannerPartService.countCategory(plannerLike.getPNo());
		System.out.println(list);
		
		model.addAttribute("planner", pl);
		model.addAttribute("pNo",pl.getPNo());
		model.addAttribute("startDay",pl.getStartDay());
		model.addAttribute("endDay",pl.getEndDay());
		model.addAttribute("describe",pl.getDescribe());
		model.addAttribute("list", list);
		model.addAttribute("cclist", cclist);
		model.addAttribute("like", like);
		model.addAttribute("listLength", list.size());
		model.addAttribute("unlike", unlike);
		
		return "planner/maintenance";
	}
	
	
}
