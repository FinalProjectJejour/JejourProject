package com.kh.jejour.topN.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.jejour.topN.model.service.TopNService;
import com.kh.jejour.topN.model.vo.TopN;

@Controller
public class TopNController {
	
	@Autowired
	TopNService topNService;
		
		@RequestMapping("/topN/topN.do")
		public String mainDataView(@RequestParam String category, Model model) {
			
			System.out.println(category);
			
			List<TopN> list = new ArrayList<TopN>(); 
			
			list = topNService.topNSelect(category);
			
			System.out.println(list);
			int total = 0;
			
			for(int i=0; i< list.size(); i++) {

				total += list.get(i).getCount();

			}
			
			System.out.println(total);
			model.addAttribute("total", total);
			model.addAttribute("list", list);
			model.addAttribute("category", category);
			
			return "topN/hotelDataView";
	
		}
		
		@RequestMapping("/topN/restaurantData.do")
		public String restaurantDataView() {
			return "topN/restaurantDataView";
		}
	
}
