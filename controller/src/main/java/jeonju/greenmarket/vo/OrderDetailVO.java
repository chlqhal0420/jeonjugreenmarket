package jeonju.greenmarket.vo;

public class OrderDetailVO {
	private String orderNo;
	private String createdBy;
	private String createdAt;
	private int price;
	private int itemCnt;
	private String name;
	private String orderStatus; // 주문상태
	private int totalOrderAmount; // 최종결제금액
	private int paymentNo; //결제번호
	
	
	
	
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public int getTotalOrderAmount() {
		return totalOrderAmount;
	}
	public void setTotalOrderAmount(int totalOrderAmount) {
		this.totalOrderAmount = totalOrderAmount;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getItemCnt() {
		return itemCnt;
	}
	public void setItemCnt(int itemCnt) {
		this.itemCnt = itemCnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "OrderDetailVO [orderNo=" + orderNo + ", createdBy=" + createdBy + ", createdAt=" + createdAt
				+ ", price=" + price + ", itemCnt=" + itemCnt + ", name=" + name + "]";
	}
	
	
	
}
