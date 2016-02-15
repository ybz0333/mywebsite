package com.ybz.myWebsite.vo;

//用于文章类型的分组查询
public class ArticleTypeGroup {
	private int articleTypeId;
	private int num;
	
	public ArticleTypeGroup() {
	}
	
	public ArticleTypeGroup(int articleTypeId, int num) {
		super();
		this.articleTypeId = articleTypeId;
		this.num = num;
	}
	
	public int getArticleTypeId() {
		return articleTypeId;
	}
	public void setArticleTypeId(int articleTypeId) {
		this.articleTypeId = articleTypeId;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "ArticleTypeGroup [articleTypeId=" + articleTypeId + ", num="
				+ num + "]";
	}
}
