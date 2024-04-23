package jeonju.greenmarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping(value="/admin")
@Controller
public class AdminCalculateController {

	@RequestMapping(value="calculate.do")
	public String chart() {
		return "admin/calculate/calculate";
	}
}
