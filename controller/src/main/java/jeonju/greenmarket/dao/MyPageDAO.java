package jeonju.greenmarket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.AddressVO;
import jeonju.greenmarket.vo.LikeVO;
import jeonju.greenmarket.vo.OrderDetailVO;

@Repository
public class MyPageDAO {
    @Autowired
    SqlSession sqlSession; 
    
    //배송지 목록 가져오기
    public List<AddressVO> addrList(int createdBy) {
       List<AddressVO> list = sqlSession.selectList("jeonju.greenmarket.mapper.mypageMapper.selectAllAddr", createdBy);
         return list;
    }
    //배송지 번호로 배송지 한건 상세보기
    public AddressVO selectAddressByAddrNo(int addrNo) {
        return sqlSession.selectOne("jeonju.greenmarket.mapper.mypageMapper.selectOneAddressByAddrNo", addrNo);
    }
    
    //배송지 수정 
    public int modifyAddress(AddressVO vo) {
       System.out.println(vo.getDef());
       if(vo.getDef().equals("Y"))
       {
          sqlSession.update("jeonju.greenmarket.mapper.mypageMapper.resetDef", vo);
       }
         return sqlSession.update("jeonju.greenmarket.mapper.mypageMapper.upadateAddress", vo);
   }
    
    
  //배송지 추가  
    public int insertAddr(AddressVO vo) {
       if(vo.getDef().equals("Y"))
       {
          sqlSession.update("jeonju.greenmarket.mapper.mypageMapper.resetDef", vo);
       }
       return sqlSession.insert("jeonju.greenmarket.mapper.mypageMapper.newAddrInsert", vo);
   }
    //배송지삭제
    public int deleteAddressByAddrNo(int addrNo) {
       return sqlSession.delete("jeonju.greenmarket.mapper.mypageMapper.deleteAddressByAddrNo", addrNo);
    }
    
    
  //회원의 기본주소 가져오기
    public AddressVO selectBasicAddr(int createdBy) {
        return sqlSession.selectOne("jeonju.greenmarket.mapper.mypageMapper.selectBasicAddr", createdBy);
    }
  //주문내역 목록 조회
     public List<OrderDetailVO> orderDetail (int createdBy) {
        List<OrderDetailVO> orderDetail = sqlSession.selectList("jeonju.greenmarket.mapper.orderMapper.orderDetail", createdBy);
        return orderDetail;
     }
     
  // 찜목록 조회
   	public List<LikeVO> LikedItemList(int createdBy) {
     	List<LikeVO> list = sqlSession.selectList("jeonju.greenmarket.mapper.mypageMapper.selectLikedList", createdBy);
     	  return list;
   	}
   	
   //찜 삭제
     public int deleteLikeByWishNo(int wishNo) {
     	return sqlSession.delete("jeonju.greenmarket.mapper.mypageMapper.deleteLikeByWishNo", wishNo);
     }
}