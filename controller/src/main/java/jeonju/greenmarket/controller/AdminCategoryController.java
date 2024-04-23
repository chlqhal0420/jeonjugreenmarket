package jeonju.greenmarket.controller;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jeonju.greenmarket.service.CategoryService;
import jeonju.greenmarket.vo.CategoryVO;

@RequestMapping(value="/admin")
@Controller
public class AdminCategoryController {
	
	  @Autowired
	  CategoryService categoryService;
	    
	    // 카테고리 등록 (카테고리 중복확인)
		/*
		 * @RequestMapping(value="registerCategory.do", method=RequestMethod.POST)
		 * public void registerCategory(CategoryVO vo, HttpServletResponse res) throws
		 * Exception{
		 * 
		 * int result1 = categoryService.checkDuplicateCategory(vo); // 중복 체크 메서드 호출
		 * System.out.println("result1: "+result1);
		 * res.setContentType("text/html; charset=utf-8");
		 * res.setCharacterEncoding("UTF-8");
		 * 
		 * if(result1 > 0) { res.getWriter().
		 * append("<script>alert('이미 존재하는 카테고리입니다.');location.href='register.do'</script>"
		 * ); } else { int result = categoryService.categoryinsert(vo); // 중복이 없으면 카테고리
		 * 등록 if(result > 0) { res.getWriter().
		 * append("<script>alert('카테고리가 등록되었습니다.');location.href='register.do'</script>"
		 * ); } else { res.getWriter().
		 * append("<script>alert('카테고리가 등록되지 않았습니다.);location.href='register.do'</script>"
		 * ); } } res.getWriter().flush(); }
		 */
	    
	  // 카테고리 등록  
	  @RequestMapping(value="registerCategory.do", method=RequestMethod.POST)
	  public String registerCategory(CategoryVO vo, HttpServletResponse res, RedirectAttributes redirectAttributes) throws Exception {
	      int result = categoryService.categoryinsert(vo); // 카테고리 등록
	      System.out.println("카테고리등록완료: " + result);

	      int recentCategoryNo = categoryService.recentCategoryNo();
	      System.out.println("최신카테고리기본키: " + recentCategoryNo);

	      if (result > 0) {
	          redirectAttributes.addAttribute("recentCategoryNo", recentCategoryNo); // 최신 카테고리의 기본키를 URL 파라미터로 추가
	          return "redirect:/admin/register.do"; // 상품 등록 페이지로 리다이렉트
	      } else {
	          // 카테고리 등록 실패 시 처리
	          return "redirect:/admin/register.do"; // 실패 시 상품 등록 페이지로 리다이렉트
	      }
	  }
	    
	    // 카테고리 목록 조회
	    @RequestMapping(value="category.do", method=RequestMethod.GET)
	    public String categoryList(Model model) throws Exception{
	    	
	    	List<CategoryVO> categoryList = categoryService.categoryList();
	    	model.addAttribute("categoryList", categoryList);
	    	
	    	return "admin/category/category";
	    }
	    
	    // 카테고리 삭제
	    @RequestMapping(value = "categoryDelete.do", method = RequestMethod.POST)
	    @ResponseBody
	    public int deleteCategory(@RequestParam("categoryName") String categoryName) {
	    	
	    	int test1 = categoryService.deleteCategory(categoryName);
	    	System.out.println("deleteCategory: "+test1);    	

	        return test1; 
	    }
	    
}




















