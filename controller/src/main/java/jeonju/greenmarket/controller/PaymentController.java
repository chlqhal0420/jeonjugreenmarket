package jeonju.greenmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jeonju.greenmarket.service.PaymentService;
import jeonju.greenmarket.vo.PaymentVO;

@Controller
public class PaymentController {

    @Autowired
    PaymentService paymentService;
    
    
 // 결제 정보 DB 저장 
    @RequestMapping(value="paymentInsert.do", method=RequestMethod.POST)
    @ResponseBody
    public void paymentInsert (PaymentVO vo) {
        int result = paymentService.paymentInsert(vo);
        System.out.println("결제정보저장완료: " + result);
        
     
    }
}
