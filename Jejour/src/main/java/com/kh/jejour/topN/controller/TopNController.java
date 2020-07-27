package com.kh.jejour.topN.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TopNController {

		
		@RequestMapping("/topN/topN.do")
		public String HotelData() {
			return "topN/hotelDataView";
		}
		
		@RequestMapping("/topN/restaurantData.do")
		public String RestaurantData() {
			return "topN/restaurantDataView";
		}
		
	

}
