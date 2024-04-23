package jeonju.greenmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.PaymentDAO;
import jeonju.greenmarket.vo.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService{
		
	@Autowired
	PaymentDAO paymentDAO;
	
	
	// 결제 정보 DB 저장
	@Override
	public int paymentInsert(PaymentVO vo) {
		return paymentDAO.paymentInsert(vo);
		
	}
	
}
