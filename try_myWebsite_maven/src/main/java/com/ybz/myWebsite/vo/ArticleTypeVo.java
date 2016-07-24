package com.ybz.myWebsite.vo;

import com.ybz.myWebsite.po.ArticleType;

public class ArticleTypeVo extends ArticleType{
	//文章总数
	private Integer numTotal;
	//已发布的文章数
	private Integer numPublish;
	//草稿数量
	private Integer numDraft;
	
	public ArticleTypeVo() {
	}

	public ArticleTypeVo(Integer numTotal, Integer numPublish, Integer numDraft) {
		super();
		this.numTotal = numTotal;
		this.numPublish = numPublish;
		this.numDraft = numDraft;
	}

	public Integer getNumTotal() {
		return numTotal;
	}

	public void setNumTotal(Integer numTotal) {
		this.numTotal = numTotal;
	}

	public Integer getNumPublish() {
		return numPublish;
	}

	public void setNumPublish(Integer numPublish) {
		this.numPublish = numPublish;
	}

	public Integer getNumDraft() {
		return numDraft;
	}

	public void setNumDraft(Integer numDraft) {
		this.numDraft = numDraft;
	}

	@Override
	public String toString() {
		return "ArticleTypeVo [id=" + super.getId() 
				+ ", typeName" + super.getTypeName() 
				+ ", description=" + super.getDescription() 
				+ ", numTotal=" + numTotal + "]" 
				+ ", numPublish=" + numPublish 
				+ ", numDraft=" + numDraft;
	}
}