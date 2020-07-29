package com.kh.jejour.hotspotLike.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.jejour.hotspotLike.model.service.HotspotLikeService;
import com.kh.jejour.hotspotLike.model.vo.HotspotLike;



@Controller
public class HotspotLikeController {
	
	
	@Autowired 
	HotspotLikeService hotspotLikeService;

	
	@RequestMapping("/hotspotLike/hotspotLike.ho")
	@ResponseBody
	public int HotspotLike(@RequestParam String userId, @RequestParam int hNo, HotspotLike hotspotLike) {
		
		System.out.println(hNo);
		System.out.println(userId);
		System.out.println(hotspotLike);
		
		hotspotLikeService.hotspotLikeInsert(hotspotLike);
		System.out.println("hotspotLike = " + hotspotLike);
		int count = hotspotLikeService.hotspotLikeCountSelect(hNo);
		System.out.println("count = " + count);
		
		return count;
		
	}
	
	@RequestMapping("/hotspotLike/hotspotUnlike.ho")
	@ResponseBody
	public int HotspotUnlike(@RequestParam String userId, @RequestParam int hNo, HotspotLike hotspotLike) {
		
		System.out.println(hNo);
		System.out.println(userId);
		System.out.println(hotspotLike);
		
		hotspotLikeService.hotspotUnlikeInsert(hotspotLike);
		System.out.println("hotspotLike = " + hotspotLike);
		int count = hotspotLikeService.hotspotUnLikeCountSelect(hNo);
		System.out.println("count = " + count);
		
		return count;
		
	}
	
}

