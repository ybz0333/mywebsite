package com.ybz.myWebsite.vo;

import java.util.List;

public class ArticleArchiveVo {
	private ArticleTimeGroup articleTimeGroup;
	private List<ArticleVo> articleVoList;
	
	public ArticleArchiveVo() {
	}
	public ArticleArchiveVo(ArticleTimeGroup articleTimeGroup,
			List<ArticleVo> articleVoList) {
		super();
		this.articleTimeGroup = articleTimeGroup;
		this.articleVoList = articleVoList;
	}
	
	public ArticleTimeGroup getArticleTimeGroup() {
		return articleTimeGroup;
	}
	public void setArticleTimeGroup(ArticleTimeGroup articleTimeGroup) {
		this.articleTimeGroup = articleTimeGroup;
	}
	public List<ArticleVo> getArticleVoList() {
		return articleVoList;
	}
	public void setArticleVoList(List<ArticleVo> articleVoList) {
		this.articleVoList = articleVoList;
	}

	@Override
	public String toString() {
		return "ArticleArchiveVo [articleTimeGroup=" + articleTimeGroup
				+ ", articleVoList=" + articleVoList + "]";
	}
}
