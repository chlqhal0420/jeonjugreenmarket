package jeonju.greenmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import jeonju.greenmarket.service.BasketPaymentService;
import jeonju.greenmarket.vo.PaymentVO;

@Controller
public class BasketPaymentController {
	@Autowired
	BasketPaymentService basketPaymentService;
	
	  // 장바구니 결제 정보 DB 저장 
    @RequestMapping(value="paymentInsert1.do", method=RequestMethod.POST)
    @ResponseBody
    public void paymentInsert1 (PaymentVO vo) {
    	int result1 = basketPaymentService.paymentInsert1(vo);
    	System.out.println("결제: "+result1);
    }
}
