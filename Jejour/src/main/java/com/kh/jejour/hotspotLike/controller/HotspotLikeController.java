package com.kh.jejour.hotspotLike.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.jejour.hotspotBoard.model.exception.HotspotBoardException;
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

		int check = hotspotLikeService.hotspotCheckSelect(hotspotLike);
		System.out.println(check);
		// check = 0 이면 좋아요 싫어요 한적이 없음
		// check = 1 이면 좋아요 싫어요 한적이 있음
		
		if(check == 0) {
			hotspotLikeService.hotspotLikeInsert(hotspotLike);
			System.out.println("hotspotLike = " + hotspotLike);
			int count = hotspotLikeService.hotspotLikeCountSelect(hNo);
			System.out.println("count = " + count);
			
			return count;
			
		} else {
			
			return 0;
		}
	}
	
	@RequestMapping("/hotspotLike/likeCheck.ho")
	@ResponseBody
	public Map<String, Integer> HotspotlikeCheck(HotspotLike hotspotLike, @RequestParam int hNo) {
		
		System.out.println(hotspotLike);
		int result = hotspotLikeService.likeCheck(hotspotLike);
		System.out.println("likeCheck Result= " +result);
		// result = 0 싫어요를 눌렀음
		// result = 1 좋아요를 또 눌렀음
		
		
		Map<String, Integer> count = new HashMap<>();
		if(result == 0) {
			hotspotLikeService.likeUpdate(hotspotLike);
			System.out.println("hotspotLike = " + hotspotLike);
			int likeCount = hotspotLikeService.hotspotLikeCountSelect(hNo);
			int unlikeCount = hotspotLikeService.hotspotUnLikeCountSelect(hNo);
			count.put("likeCount", likeCount);
			count.put("unlikeCount", unlikeCount);
			count.put("non", 1);
			return count;
		} else {
			count.put("non", 0);
			return count;
		}
		
		
	}
	
	
	@RequestMapping("/hotspotLike/hotspotUnlike.ho")
	@ResponseBody
	public int HotspotUnlike(@RequestParam String userId, @RequestParam int hNo, HotspotLike hotspotLike) {
		
		System.out.println(hNo);
		System.out.println(userId);
		System.out.println(hotspotLike);
		
		int check = hotspotLikeService.hotspotCheckSelect(hotspotLike);
		System.out.println(check);
		
		if(check == 0) {
			hotspotLikeService.hotspotUnlikeInsert(hotspotLike);
			System.out.println("hotspotLike = " + hotspotLike);
			int count = hotspotLikeService.hotspotUnLikeCountSelect(hNo);
			System.out.println("count = " + count);
			
			return count;
		
		} else {
			
			return 0;
		}
		
	}
	
	@RequestMapping("/hotspotLike/unlikeCheck.ho")
	@ResponseBody
	public Map<String, Integer> HotspotunlikeCheck(HotspotLike hotspotLike, @RequestParam int hNo) {
		
		System.out.println(hotspotLike);
		int result = hotspotLikeService.unlikeCheck(hotspotLike);
		System.out.println("likeCheck Result= " +result);
		// result = 0 싫어요 중복
		// result = 1 새로 싫어요를 눌렀음
		
		
		Map<String, Integer> count1 = new HashMap<>();
		if(result == 0) {
			hotspotLikeService.unlikeUpdate(hotspotLike);
			System.out.println("hotspotLike = " + hotspotLike);
			int likeCount = hotspotLikeService.hotspotLikeCountSelect(hNo);
			int unlikeCount = hotspotLikeService.hotspotUnLikeCountSelect(hNo);
			count1.put("likeCount", likeCount);
			count1.put("unlikeCount", unlikeCount);
			count1.put("non", 1);
			return count1;
		} else {
			count1.put("non", 0);
			return count1;
		}
		
		
	}
	
	
}

