package jeonju.greenmarket.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jeonju.greenmarket.service.AdminOrderService;
import jeonju.greenmarket.service.ItemService;
import jeonju.greenmarket.vo.ItemVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
    private ItemService itemService;
	
	@Autowired
	AdminOrderService adminOrderService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,@RequestParam(value="category_no", 
		    required = false, defaultValue="1") int category_no) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		// 모든 상품 가져오기
		List<ItemVO> items = itemService.getAllItems(category_no);
		
		
		// 각 상품의 이미지 경로 설정
			for (ItemVO item : items) {
				if (item.getImage() != null) {
					String imagePath = "resources/upload/" + item.getImage();
					item.setImagePath(imagePath);
				} else {
					// 이미지가 없는 경우 디폴트 이미지 경로 설정
				    String defaultImagePath = "/resources/img/product/NoImage.png";
				    item.setImagePath(defaultImagePath);
				}
			}
		
        model.addAttribute("items", items);
        System.out.println(items);
        return "home";
	}
	
	// 주문취소신청건 개수 표시
	@RequestMapping(value="/admin/index.do", method=RequestMethod.GET)
	public String countCancel(Model model) {
	    int countCancel = adminOrderService.countCancel();
	    model.addAttribute("countCancel", countCancel);
	    return "admin/index"; // 페이지를 렌더링하는 뷰 이름을 반환
	}
	
}
