package com.ybz.myWebsite.vo;

import java.util.Date;

//用于文章年月的分组查询
public class ArticleTimeGroup {
	private Date createtime;
	private int num;
	
	public ArticleTimeGroup() {
	}
	public ArticleTimeGroup(Date createtime, int num) {
		super();
		this.createtime = createtime;
		this.num = num;
	}
	
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	@Override
	public String toString() {
		return "ArticleTimeGroup [createtime=" + createtime + ", num=" + num
				+ "]";
	}
	
}
