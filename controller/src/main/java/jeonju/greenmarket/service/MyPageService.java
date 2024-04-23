package jeonju.greenmarket.service;

import java.util.List;

import jeonju.greenmarket.vo.AddressVO;
import jeonju.greenmarket.vo.LikeVO;
import jeonju.greenmarket.vo.OrderDetailVO;

public interface MyPageService {

	List<AddressVO> addrList(int createdBy);
	AddressVO selectAddressByAddrNo(int addrNo);
	int modifyAddress(AddressVO vo);
	int insertAddr(AddressVO vo);
	int deleteAddressByAddrNo(int addrNo);
	
	//회원의 기본주소 가져오기
	AddressVO selectBasicAddr(int createdBy);
	
	// 주문내역 목록 조회
	List<OrderDetailVO> orderDetail(int createdBy);
	

	//찜 목록조회
	List<LikeVO> LikedItemList(int createdBy);
	
	//찜 목록 삭제
	int deleteLikeByWishNo(int wishNo);
}
