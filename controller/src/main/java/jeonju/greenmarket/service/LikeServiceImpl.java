package jeonju.greenmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jeonju.greenmarket.dao.LikeDAO;
import jeonju.greenmarket.vo.LikeVO;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired	
	LikeDAO likeDAO;
	
	@Override
    @Transactional
    public boolean toggleLike(LikeVO vo) {
        Boolean isLiked = likeDAO.checkLiked(vo);
        if (isLiked != null && isLiked) {
        	likeDAO.deleteLike(vo);
            return false;
        } else {
        	likeDAO.insertLike(vo);
            return true;
        }
    }

	@Override
	public boolean checkLiked(LikeVO vo) {
		return likeDAO.checkLiked(vo) != null && likeDAO.checkLiked(vo);
	}
}
