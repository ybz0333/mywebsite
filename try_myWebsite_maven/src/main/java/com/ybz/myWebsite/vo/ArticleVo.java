package com.ybz.myWebsite.vo;

import java.util.List;

import com.ybz.myWebsite.po.Article;
import com.ybz.myWebsite.po.ArticleType;

public class ArticleVo extends Article{
	private List<ArticleType>articleTypeList;

	public List<ArticleType> getArticleTypeList() {
		return articleTypeList;
	}

	public void setArticleTypeList(List<ArticleType> articleTypeList) {
		this.articleTypeList = articleTypeList;
	}

	@Override
	public String toString() {
		return "ArticleVo [id=" + this.getId() + ", authorName=" + this.getAuthorName()
		+ ", title=" + this.getTitle() + ", content=" + this.getContent()
		+ ", note=" + this.getNote() + ", createtime=" + this.getCreatetime() 
		+ ", state=" + this.getState() + ", clickCount=" + this.getClickCount() 
		+ ", praiseCount=" + this.getPraiseCount() + ", tags=" + this.getTags() 
		+ ", introduction=" + this.getIntroduction() + ", imgName=" + this.getImgName() 
		+ ", articleTypeList=" + articleTypeList + "]";
	}
}
