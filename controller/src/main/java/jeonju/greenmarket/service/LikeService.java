package jeonju.greenmarket.service;

import jeonju.greenmarket.vo.LikeVO;

public interface LikeService {
	 boolean toggleLike(LikeVO vo);
	 boolean checkLiked(LikeVO vo);
}
