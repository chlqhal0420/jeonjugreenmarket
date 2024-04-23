package jeonju.greenmarket.vo;

public class OrderVO {
	private String orderNo;
	private int createdBy;
	private String createdAt;
	private int modifiedBy;
	private String modifiedAt;
	private String orderStatus;
	private String name;
	private String addr;
	private String addrPost;
	private String addrDetail;
	private String tel;
	private String phone;
	private String req;
	private int totalOrderAmount;
	private int totalShippingCost;
	private String productName; //상품명
	
	
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public int getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public String getModifiedAt() {
		return modifiedAt;
	}
	public void setModifiedAt(String modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrPost() {
		return addrPost;
	}
	public void setAddrPost(String addrPost) {
		this.addrPost = addrPost;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReq() {
		return req;
	}
	public void setReq(String req) {
		this.req = req;
	}
	public int getTotalOrderAmount() {
		return totalOrderAmount;
	}
	public void setTotalOrderAmount(int totalOrderAmount) {
		this.totalOrderAmount = totalOrderAmount;
	}
	public int getTotalShippingCost() {
		return totalShippingCost;
	}
	public void setTotalShippingCost(int totalShippingCost) {
		this.totalShippingCost = totalShippingCost;
	}
	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", createdBy=" + createdBy + ", createdAt=" + createdAt + ", modifiedBy="
				+ modifiedBy + ", modifiedAt=" + modifiedAt + ", orderStatus=" + orderStatus + ", name=" + name
				+ ", addr=" + addr + ", addrPost=" + addrPost + ", addrDetail=" + addrDetail + ", tel=" + tel
				+ ", phone=" + phone + ", req=" + req + ", totalOrderAmount=" + totalOrderAmount
				+ ", totalShippingCost=" + totalShippingCost + "]";
	}
	
	
}
