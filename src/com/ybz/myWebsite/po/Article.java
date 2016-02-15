package com.ybz.myWebsite.po;

import java.util.Date;

public class Article {
	private Integer id;
	private String authorName;//作者名称
	private String title;//文章标题
	private String content;//文章内容
	private String note;//备注
	private Date createtime;//创建时间
	private Integer state;//文章状态（1为草稿，2为已发布）
	private Integer clickCount;//点击量
	private Integer praiseCount;//点赞数
	private String tags;//文章标签（以逗号分隔多个标签）
	private String introduction;//导语
	
	public Article() {
		
	}

	public Article(Integer id, String authorName, String title, String content,
			String note, Date createtime, Integer state, Integer clickCount,
			Integer praiseCount, String tags, String introduction) {
		super();
		this.id = id;
		this.authorName = authorName;
		this.title = title;
		this.content = content;
		this.note = note;
		this.createtime = createtime;
		this.state = state;
		this.clickCount = clickCount;
		this.praiseCount = praiseCount;
		this.tags = tags;
		this.introduction = introduction;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getClickCount() {
		return clickCount;
	}

	public void setClickCount(Integer clickCount) {
		this.clickCount = clickCount;
	}

	public Integer getPraiseCount() {
		return praiseCount;
	}

	public void setPraiseCount(Integer praiseCount) {
		this.praiseCount = praiseCount;
	}
	
	public String getTags() {
		return tags;
	}
	
	public void setTags(String tags) {
		this.tags = tags;
	}
	
	public String getIntroduction() {
		return introduction;
	}
	
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", authorName=" + authorName + ", title="
				+ title + ", content=" + content + ", note=" + note
				+ ", createtime=" + createtime + ", state=" + state
				+ ", clickCount=" + clickCount + ", praiseCount=" + praiseCount
				+ ", tags=" + tags + ", introduction=" + introduction 
				+ "]";
	}
}