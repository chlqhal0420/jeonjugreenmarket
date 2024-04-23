package jeonju.greenmarket.vo;

public class PaymentVO {
	private String orderNo;
	private int createdBy;
	private String createdAt;
	private int modifiedBy;
	private String modifiedAt;
	private String paymentMethod;
	private int totalPaymentAmount;
	
	
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
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public int getTotalPaymentAmount() {
		return totalPaymentAmount;
	}
	public void setTotalPaymentAmount(int totalPaymentAmount) {
		this.totalPaymentAmount = totalPaymentAmount;
	}
	
	@Override
	public String toString() {
		return "PaymentVO [orderNo=" + orderNo + ", createdBy=" + createdBy + ", createdAt=" + createdAt
				+ ", modifiedBy=" + modifiedBy + ", modifiedAt=" + modifiedAt + ", paymentMethod=" + paymentMethod
				+ ", totalPaymentAmount=" + totalPaymentAmount + "]";
	}
	
	
	
}
