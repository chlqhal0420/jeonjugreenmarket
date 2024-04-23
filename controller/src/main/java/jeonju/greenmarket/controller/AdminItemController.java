package jeonju.greenmarket.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jeonju.greenmarket.service.AdminItemService;
import jeonju.greenmarket.service.CategoryService;
import jeonju.greenmarket.vo.ItemVO;
import jeonju.greenmarket.vo.SearchVO;
import jeonju.greenmarket.vo.ShippingCostVO;
@RequestMapping(value="/admin")
@Controller
public class AdminItemController {
    
    @Autowired
    AdminItemService itemService;
    
    @Autowired
    CategoryService categoryService;
    
    @RequestMapping(value="register.do", method=RequestMethod.GET)
    public String register() {
    	
        return "admin/item/register";
    }
    
    // 지역별 추가 배송비 등록
    @RequestMapping(value="shippingcost.do", method=RequestMethod.GET)
    public String shippingcost() {
    	return "admin/item/shippingcost";
    }
    
    @RequestMapping(value="shippingcost.do", method=RequestMethod.POST)
    public void shippingcost(ShippingCostVO vo, HttpServletResponse res) throws IOException {
    	
    	int test1 = itemService.shippingcost(vo);
    	System.out.println("shippingcost: " + test1);
    	
    	res.setContentType("text/html; charset=utf-8");
		res.setCharacterEncoding("UTF-8");
		
		if (test1 > 0) {
			res.getWriter().append("<script>alert('등록되었습니다.');location.href='shippingcost.do'</script>");
		} else {
			res.getWriter().append("<script>alert('등록되지 않았습니다.');location.href='shippingcost.do'</script>");
		}
		res.getWriter().flush();
    }
   
    
    
    
	// 상품 등록 및 이미지 첨부
	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public String register(MultipartFile uploadFile, HttpServletResponse res, HttpServletRequest request, ItemVO vo, @RequestParam("categoryNo") int categoryNo)
			throws Exception, IllegalStateException, IOException {
		
		// 이미지 등록
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");

		
		/*
		 * path =
		 * "C:\\Users\\MYCOM\\git\\jeonjugreenmarket\\jeonjuGreenMarket\\src\\main\\webapp\\resources\\upload";
		 */
		 
		System.out.println(path);

		// upload 폴더가 없다면 생성해 주세요
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs(); // 존재하지 않는 모든 상위 폴더 생성
		}

		System.out.println("uploadFile: "+uploadFile);
		
		if (!uploadFile.getOriginalFilename().isEmpty()) { // 파일이 존재하는 경우
			String fileNM = uploadFile.getOriginalFilename(); // 원본 파일명

			String[] fileNMArr = fileNM.split("\\.");
			String ext = fileNMArr[fileNMArr.length - 1];

			String realFileNM = fileNMArr[0] + "001." + ext; // 실제 파일명

			uploadFile.transferTo(new File(path, realFileNM));
		}
		
		// 상품등록
		vo.setCategoryNo(categoryNo); // 최신 카테고리의 기본키 값을 상품 정보에 설정
		int result = itemService.insert(vo);
		res.setContentType("text/html; charset=utf-8");
		res.setCharacterEncoding("UTF-8");

		if (result > 0) {
			res.getWriter().append("<script>alert('상품이 등록되었습니다.');location.href='item.do'</script>");
		} else {
			res.getWriter().append("<script>alert('상품이 등록되지 않았습니다.');location.href='item.do'</script>");
		}
		res.getWriter().flush();
		return null;

	}
    

    
    // 상품관리 검색기능, 상품조회
    @RequestMapping(value="item.do", method=RequestMethod.GET)
     public String list(Model model, SearchVO searchVO) {
    	
    	List<ItemVO> list = itemService.list(searchVO);
    	model.addAttribute("list", list);
    	return "admin/item/item";
    }
    
    // 상품코드 중복 확인
    @RequestMapping(value="checkDuplicate.do", method=RequestMethod.POST)
    @ResponseBody
    public int checkDuplicate(@RequestParam("productCode") String productCode) {
        int result = itemService.checkDuplicate(productCode); // 중복 체크 메서드 호출
        System.out.println("checkDuplicate: " + result);
        return result;
    }
    
    // 수정할 해당 상품정보 불러오기
    @RequestMapping(value="itemModify.do", method = RequestMethod.GET)
    public String itemmodify(String itemNo, Model model) {
    	
    	ItemVO vo = itemService.selectOneByItemNo(itemNo);
    	
    	model.addAttribute("vo", vo);
    	
    	return "admin/item/itemModify";
    }
    
    // 상품 정보 수정하기
    @RequestMapping(value="itemModify.do", method = RequestMethod.POST)
    public String itemmodify(ItemVO vo) {
    	
    	int result1 = itemService.updateItem(vo);
    	System.out.println("updateItem: " + result1);

    	return "redirect:item.do";
    }
    
    // 상품 삭제하기
    @RequestMapping(value="deleteItems.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteItems(@RequestParam("itemNo") String itemNo){
    	
    	int result2 = itemService.deleteItems(itemNo);
    	System.out.println("deleteItems: "+result2);
    	
    	return result2;
    
    
    }
}










    
   
