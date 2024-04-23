package jeonju.greenmarket.vo;

public class BasketVO {
	private int basketNo;
	private String itemNo;
	private int createdBy;
	private int itemCnt;
	private String createdAt;
	private String modifiedAt;
	private int modifiedBy;
	private int price;
	private String checked;
	
	public BasketVO(){
	}
	
	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	
	
	public int getBasketNo() {
		return basketNo;
	}
	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}
	public String getItemNo() {
		return itemNo;
	}
	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public int getItemCnt() {
		return itemCnt;
	}
	public void setItemCnt(int itemCnt) {
		this.itemCnt = itemCnt;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getModifiedAt() {
		return modifiedAt;
	}
	public void setModifiedAt(String modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	public int getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "BasketVO [basketNo=" + basketNo + ", itemNo=" + itemNo + ", createdBy=" + createdBy + ", itemCnt="
				+ itemCnt + ", createdAt=" + createdAt + ", modifiedAt=" + modifiedAt + ", modifiedBy=" + modifiedBy
				+ ", price=" + price + ", checked=" + checked + "]";
	}


	
}
