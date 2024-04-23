package jeonju.greenmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import jeonju.greenmarket.service.LikeService;
import jeonju.greenmarket.vo.LikeVO;
import jeonju.greenmarket.vo.SecurityUserVO;

@Controller
public class LikeController {

	@Autowired
	LikeService likeService;
	
	@RequestMapping(value="/toggleLike.do", method=RequestMethod.POST)
	@ResponseBody 
	    public ResponseEntity<?> toggleLike(@ModelAttribute LikeVO vo, Authentication auth) {
		 if (auth == null || auth.getPrincipal() == null) {
		        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(new LikeResponse(false, "로그인이 필요합니다."));
		    }
		SecurityUserVO login =(SecurityUserVO)auth.getPrincipal();
		vo.setCreatedBy(login.getCreatedBy());
		
	        boolean liked = likeService.toggleLike(vo);
	        return ResponseEntity.ok(new LikeResponse(liked, liked ? "찜하기 설정됨" : "찜하기 해제됨"));
	    }

	    private static class LikeResponse {
	        private boolean liked;
	        private String message;

	        public LikeResponse(boolean liked, String message) {
	            this.liked = liked;
	            this.message = message;
	        }

	        public boolean isLiked() {
	            return liked;
	        }

	        public String getMessage() {
	            return message;
	        }
	    }
}
