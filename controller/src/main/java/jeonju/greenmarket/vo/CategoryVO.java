package jeonju.greenmarket.vo;

public class CategoryVO {
	private int categoryNo;			
	private int categoryNo2; 		
	private int createdBy;			
	private String createdAt;		
	private int modifiedBy;			
	private String modifiedAt;		
	private String categoryName;	
	
	
	
	public int getCategoryNo2() {
		return categoryNo2;
	}
	public void setCategoryNo2(int categoryNo2) {
		this.categoryNo2 = categoryNo2;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
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
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
}
