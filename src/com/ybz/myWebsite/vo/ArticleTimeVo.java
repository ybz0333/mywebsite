package com.ybz.myWebsite.vo;

import java.util.Date;

public class ArticleTimeVo {
	//文章创建时间
	private Date createtime;
	//文章总数
	private Integer numTotal;
	//已发布的文章数
	private Integer numPublish;
	//草稿数量
	private Integer numDraft;
	
	public ArticleTimeVo() {
	}
	public ArticleTimeVo(Date createtime, Integer numTotal, Integer numPublish,
			Integer numDraft) {
		super();
		this.createtime = createtime;
		this.numTotal = numTotal;
		this.numPublish = numPublish;
		this.numDraft = numDraft;
	}
	
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
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
		return "ArticleTimeVo [createtime=" + createtime + ", numTotal="
				+ numTotal + ", numPublish=" + numPublish + ", numDraft="
				+ numDraft + "]";
	}
	
}
