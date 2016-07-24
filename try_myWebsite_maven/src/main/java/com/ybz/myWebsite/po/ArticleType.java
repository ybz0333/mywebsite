package com.ybz.myWebsite.po;

public class ArticleType {
	private Integer id;
	private String typeName;
	private String description;
	
	public ArticleType() {
	}
	
	public ArticleType(Integer id, String typeName, String description) {
		super();
		this.id = id;
		this.typeName = typeName;
		this.description = description;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "ArticleType [id=" + id + ", typeName=" + typeName
				+ ", description=" + description + "]";
	}
	
	// 重写equals和hasCode方法，以便于判断容器中是否包含某文章类型
	@Override
	public int hashCode() {
		return id.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		ArticleType other = (ArticleType)obj;
		return this.id.equals(other.id);
	}
}
