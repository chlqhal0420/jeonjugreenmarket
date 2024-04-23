package jeonju.greenmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonju.greenmarket.dao.MyPageDAO;
import jeonju.greenmarket.vo.AddressVO;
import jeonju.greenmarket.vo.LikeVO;
import jeonju.greenmarket.vo.OrderDetailVO;

@Service
public class MyPageServiceImpl implements MyPageService {
		
	 @Autowired
	 MyPageDAO mypageDAO;

	@Override
	public List<AddressVO> addrList(int createdBy) {
	
		return mypageDAO.addrList(createdBy);
	}
	
	//기존배송지 한건 가져오기
	@Override
	public AddressVO selectAddressByAddrNo(int addrNo) {
		return mypageDAO.selectAddressByAddrNo(addrNo);
	}
	
	//수정된 배송지 등록
	@Override
	public int modifyAddress(AddressVO vo) {
		
		return mypageDAO.modifyAddress(vo);
	}
	//신규배송지등록 
	@Override
	public int insertAddr(AddressVO vo) {
		return mypageDAO.insertAddr(vo);
	}
	
	//배송지 삭제
	@Override
	public int deleteAddressByAddrNo(int addrNo) {
		return mypageDAO.deleteAddressByAddrNo(addrNo);
		
	}
	
	//회원의 기본주소 가져오기
		@Override
		public AddressVO selectBasicAddr(int createdBy) {
			return mypageDAO.selectBasicAddr(createdBy);
		}

	// 주문내역 목록 조회
	@Override
	public List<OrderDetailVO> orderDetail(int createdBy) {
		return mypageDAO.orderDetail(createdBy);
	}
	
	//찜 목록 조회
	@Override
	public List<LikeVO> LikedItemList(int createdBy) {
		
		return mypageDAO.LikedItemList(createdBy);
	}
	 
	//배송지 삭제
	@Override
	public int deleteLikeByWishNo(int wishNo) {
		return mypageDAO.deleteLikeByWishNo(wishNo);
		
	}
	 
}
