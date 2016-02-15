package com.ybz.myWebsite.vo;

import java.util.Date;
import java.util.List;

import com.ybz.myWebsite.po.Article;

public class ArticleEditVo extends Article {
	private List<Integer> chosenArticleTypeIdList;
	private String newArticleTypeText;
	
	public ArticleEditVo() {
	}	

	public ArticleEditVo(Integer id, String authorName, String title, 
			String content, String note, Date createtime, Integer state, 
			Integer clickCount, Integer praiseCount, String tags, String introduction, 
			List<Integer> chosenArticleTypeIdList, String newArticleTypeText) {
		super(id, authorName, title, content, note, createtime, state, 
				clickCount, praiseCount, tags, introduction);
		this.chosenArticleTypeIdList = chosenArticleTypeIdList;
		this.newArticleTypeText = newArticleTypeText;		
	}
	
	public List<Integer> getChosenArticleTypeIdList() {
		return chosenArticleTypeIdList;
	}
	public void setChosenArticleTypeIdList(List<Integer> chosenArticleTypeIdList) {
		this.chosenArticleTypeIdList = chosenArticleTypeIdList;
	}
	public String getNewArticleTypeText() {
		return newArticleTypeText;
	}
	public void setNewArticleTypeText(String newArticleTypeText) {
		this.newArticleTypeText = newArticleTypeText;
	}
	
	@Override
	public String toString() {
		return "AirticleEditVo [id=" + this.getId() + ", + authorName="+ this.getAuthorName()
				+ ", title=" + this.getTitle() + ", content=" + this.getContent()
				+ ", note=" + this.getNote() + ", createtime=" + this.getCreatetime()
				+ ", state=" + this.getState() + ", click_count=" + this.getClickCount() 
				+ ", praiseCount=" + this.getPraiseCount() +", tags=" + this.getTags() 
				+ ", introduction=" +this.getIntroduction() 
				+ ", chosenArticleTypeIdList=" + chosenArticleTypeIdList 
				+ ", newArticleTypeText=" + newArticleTypeText 
				+ "]";
	}
}