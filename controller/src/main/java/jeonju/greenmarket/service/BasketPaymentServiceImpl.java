package jeonju.greenmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.BasketPaymentDAO;
import jeonju.greenmarket.vo.PaymentVO;


@Service
public class BasketPaymentServiceImpl implements BasketPaymentService {
	@Autowired
	BasketPaymentDAO basketPaymentDAO;
	
	@Override
	public int paymentInsert1(PaymentVO vo) {
		return basketPaymentDAO.paymentInsert1(vo);
	}

}
