package jeonju.greenmarket.vo;

public class LikeVO {
	private int wishNo;
	private String itemNo;
	private int createdBy;
	private String createdAt;
	private int modifiedBy;
	private String modifiedAt;
	private String userid;
	private String name;
	private int price;
	private String image;
	
	

	public LikeVO(){
	}



	public int getWishNo() {
		return wishNo;
	}



	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
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



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	@Override
	public String toString() {
		return "LikeVO [wishNo=" + wishNo + ", itemNo=" + itemNo + ", createdBy=" + createdBy + ", createdAt="
				+ createdAt + ", modifiedBy=" + modifiedBy + ", modifiedAt=" + modifiedAt + ", userid=" + userid
				+ ", name=" + name + ", price=" + price + ", image=" + image + "]";
	}
	
	
}
