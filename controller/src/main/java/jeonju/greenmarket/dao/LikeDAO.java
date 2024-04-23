package jeonju.greenmarket.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jeonju.greenmarket.vo.LikeVO;

@Repository
public class LikeDAO {

	@Autowired
	SqlSession sqlSession;
	
	 public Boolean checkLiked(LikeVO vo) {
		 Boolean isLiked = sqlSession.selectOne("jeonju.greenmarket.mapper.likeMapper.checkLiked", vo);
   	  return isLiked;
	 }
	 public void insertLike(LikeVO vo) {
		sqlSession.insert("jeonju.greenmarket.mapper.likeMapper.insertLike", vo);
   	  return ;
	 } 
	 

	 public void deleteLike(LikeVO vo) {
			sqlSession.delete("jeonju.greenmarket.mapper.likeMapper.deleteLike", vo);
	   	  return ;
	} 
	 
	
}
