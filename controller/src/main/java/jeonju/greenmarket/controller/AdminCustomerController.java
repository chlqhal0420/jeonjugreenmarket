package jeonju.greenmarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping(value="/admin")
@Controller
public class AdminCustomerController {
	@RequestMapping(value="customer.do")
	public String customer() {
		return "admin/customer/customer";
	}
}
