package jeonju.greenmarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping(value="/admin")
@Controller
public class AdminStatisticsController {
	@RequestMapping(value="dailyOrderStatistics.do")
	public String chart() {
		return "admin/statistics/dailyOrderStatistics";
	}
}
