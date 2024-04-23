package jeonju.greenmarket.service;

import jeonju.greenmarket.vo.PaymentVO;

public interface BasketPaymentService {

	// 장바구니 결제정보 서버 저장
		int paymentInsert1(PaymentVO vo);
	
}
