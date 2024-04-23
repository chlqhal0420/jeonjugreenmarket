package jeonju.greenmarket.controller;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jeonju.greenmarket.service.MyPageService;
import jeonju.greenmarket.service.OrderService;
import jeonju.greenmarket.vo.AddressVO;
import jeonju.greenmarket.vo.BasketVO;
import jeonju.greenmarket.vo.OrderDetailVO;
import jeonju.greenmarket.vo.OrderVO;
import jeonju.greenmarket.vo.SecurityUserVO;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	
	 // 상품 상세보기 -> 주문 페이지 이동시 4개의 데이터 전달
    @RequestMapping(value="itemOrder.do", method=RequestMethod.POST)
    public String itemOrder(@RequestParam String itemNo, 
                            @RequestParam String itemCnt, 
                            @RequestParam String price, 
                            @RequestParam String name,
                            Model model) {
        
        // itemCnt와 price를 int로 변환
        int itemCount = Integer.parseInt(itemCnt);
        int itemPrice = Integer.parseInt(price);
        
		/*
		 * System.out.println("itemNo: " + itemNo); System.out.println("itemCnt: " +
		 * itemCount); System.out.println("price: " + itemPrice);
		 * System.out.println("name: " + name);
		 */
        
        // 모델에 데이터 추가
        model.addAttribute("itemNo", itemNo);
        model.addAttribute("itemCnt", itemCount);
        model.addAttribute("price", itemPrice);
        model.addAttribute("name", name);
        
        // 주문 페이지로 이동
        return "order/itemOrder";
    }
    
    // 주문 정보 DB저장
    @RequestMapping(value="orderInsert.do", method=RequestMethod.POST)
    public void orderInsert(OrderVO vo, HttpServletResponse res) throws IOException {
    	System.out.println("주문한회원 번호::"+ vo.getCreatedBy());
    	int orderInsert = orderService.orderInsert(vo);
    	System.out.println("주문정보저장완료: "+orderInsert);
    	System.out.println("OrderVO 정보: " + vo.toString());
    	
		  res.setContentType("text/html; charset=utf-8");
		  res.setCharacterEncoding("UTF-8");
		  
		  if (orderInsert > 0) { res.getWriter().
		  append("<script>location.href='itemList.do'</script>"
		  ); } else { res.getWriter().
		  append("<script>alert('주문 및 결제가 완료되지 않았습니다.');location.href='itemList.do'</script>"
		  ); } res.getWriter().flush();
		 
    }
    
    // 주문상품상세 정보 DB저장
    @RequestMapping(value="orderDetailInsert.do", method=RequestMethod.POST)
    public String  orderDetailInsert(OrderDetailVO vo) {
    	
        int orderDetailInsert = orderService.orderDetailInsert(vo);
        System.out.println("주문상세정보저장완료: " + orderDetailInsert);
        System.out.println("OrderDetailVO: " + vo.toString());
		return "item/itemList";
    } 
    
    	//장바구니에서 주문하기 클릭시 상품 주문페이지로 보내기
    	@RequestMapping(value = "order_in_basket.do", method=RequestMethod.GET)
    	public String OrderBasketList(Model model,Authentication auth) {
    		SecurityUserVO login =(SecurityUserVO)auth.getPrincipal();
    		BasketVO basketVO = new BasketVO();
    		System.out.println("");
    		basketVO.setCreatedBy(login.getCreatedBy());
    		Map<String, List> basketMap= orderService.SelectBasketListWithIsChecked(basketVO);
    		model.addAttribute("basketMap",basketMap);
    	return "order/order_in_basket";
    	
    }
    
    	//주문화면에서 배송지목록 가져오기 
   	 @Autowired
   	    MyPageService mypageService;

   	    @PostMapping("/shipping_addresses_list.do")
   	    public ResponseEntity<String> getShippingAddresses(Authentication auth) {
   	        SecurityUserVO login = (SecurityUserVO) auth.getPrincipal();
   	        StringBuilder htmlBuilder = new StringBuilder();

   	        List<AddressVO> addr = mypageService.addrList(login.getCreatedBy());
   	        for (AddressVO address : addr) {
   	            htmlBuilder.append("<tr style='padding:10px;'>")
   	                       .append("<td><button type='button' style='background-color: white; color: gray; border: 1px solid gray;' ")
   	                       .append("onclick='selectAddr(\"")
   	                       .append(address.getDef()).append("\", \"")
   	                       .append(address.getAddrPost()).append("\", \"")
   	                       .append(address.getAddr()).append("\", \"")
   	                       .append(address.getAddrDetail()).append("\", \"")
   	                       .append(address.getName()).append("\", \"")
   	                       .append(address.getPhone())
   	                       .append("\");'>선택</button></td>")
   	                       .append("<td style='padding:10px;'>").append(address.getDef()).append("</td>")
   	                       .append("<td style='padding:10px;'>").append(address.getAddrPost()).append("</td>")
   	                       .append("<td style='padding:10px;'>").append(address.getAddr()).append("</td>")
   	                       .append("<td style='padding:10px;'>").append(address.getAddrDetail()).append("</td>")
   	                       .append("<td style='padding:10px;'>").append(address.getName()).append("</td>")
   	                       .append("<td style='padding:10px;'>").append(address.getPhone()).append("</td>")
   	                       .append("</tr>");
   	        }
   	        HttpHeaders headers = new HttpHeaders();
   	        headers.add(HttpHeaders.CONTENT_TYPE, "text/html; charset=UTF-8");

   	        return ResponseEntity.ok()
   	                             .headers(headers)
   	                             .body(htmlBuilder.toString());
   	    }
   	 //기본 배송지 정보 불러오기
   	 @RequestMapping(value="/basic_address.do", method=RequestMethod.POST)
   	 @ResponseBody 
   	 public ResponseEntity<?> getDefaultAddress(Authentication auth) {
         try {
             SecurityUserVO login = (SecurityUserVO) auth.getPrincipal();
             int createdBy = login.getCreatedBy();
             AddressVO address = mypageService.selectBasicAddr(createdBy);
             if (address != null) {
                 return ResponseEntity.ok(address);
             } else {
                 return ResponseEntity.notFound().build();
             }
         } catch (Exception e) {
             return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred: " + e.getMessage());
         }
     }
 
 
   	 
   	 
   	 
   	    
   	    
   	    // 주문 취소 처리
   	 @RequestMapping(value="mypage/cancelOrder.do", method=RequestMethod.POST)
   	 public String cancelOrder(String orderNo) {
   		 
   		 int cancelOrder=orderService.cancelOrder(orderNo);
   		 System.out.println("주문취소처리: "+cancelOrder);
   		 return "mypage/mypage_order";
   	 }
   	    
}













