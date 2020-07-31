package com.kh.jejour.sharePlan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.jejour.common.util.Utils;
import com.kh.jejour.planner.model.vo.Planner;
import com.kh.jejour.sharePlan.model.service.SharePlanService;

@Controller
public class SharePlanController {
	
	@Autowired
	SharePlanService sharePlanService;
	
	@RequestMapping("/planner/plannerShare.do")
	public String plannerShare(
				@RequestParam(value="cPage", required=false, defaultValue="1")
				int cPage, Model model) {
		
		int numPerPage = 8;
				
		List<Map<String, String>> list = sharePlanService.selectSharePlanList(cPage, numPerPage);
		
		System.out.println("list 정보 : " + list);
		
		int totalContents = sharePlanService.selectSharePlanTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "plannerShare.do");
		
		model.addAttribute("list", list)
		 .addAttribute("totalContents",totalContents)
	     .addAttribute("numPerPage", numPerPage)
	     .addAttribute("pageBar", pageBar);
		
		return "planner/sharePlan";
	}
	
	@RequestMapping("/planner/searchShare.do")
	@ResponseBody
	public HashMap<String, Object> searchShare(@RequestParam String searchCondition, @RequestParam String keyword, @RequestParam int cPage){
		int numPerPage = 8;
		
		List<Planner> list = new ArrayList<Planner>();
		
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("searchCondition", searchCondition);
		hmap.put("keyword", keyword);
		
		list = sharePlanService.searchShare(hmap, cPage, numPerPage);
		
		System.out.println("list : " + list);
		
		int totalContents = sharePlanService.selectSearchShareContents(hmap);
		System.out.println("총페이지 갯수 : " + totalContents);
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "plannerShare.do");
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("list", list);
		map.put("pageBar", pageBar);

		return map;
	}
	
	
}
