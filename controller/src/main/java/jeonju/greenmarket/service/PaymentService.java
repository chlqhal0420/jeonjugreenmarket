package jeonju.greenmarket.service;

import jeonju.greenmarket.vo.PaymentVO;

public interface PaymentService {
	
	
	// 결제 정보 DB 저장
	int paymentInsert(PaymentVO vo);
}
