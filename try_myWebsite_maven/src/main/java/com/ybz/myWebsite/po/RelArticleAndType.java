package com.ybz.myWebsite.po;

//Article和ArticleType的关联对象
public class RelArticleAndType {
	private int id;
	private int articleId;
	private int articleTypeId;
	
	public RelArticleAndType() {
	}
	public RelArticleAndType(int id, int articleId, int articleTypeId) {
		super();
		this.id = id;
		this.articleId = articleId;
		this.articleTypeId = articleTypeId;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getArticleTypeId() {
		return articleTypeId;
	}
	public void setArticleTypeId(int articleTypeId) {
		this.articleTypeId = articleTypeId;
	}

	@Override
	public String toString() {
		return "RelArticleAndType [id=" + id + ", articleId=" + articleId
				+ ", articleTypeId=" + articleTypeId + "]";
	}
}
