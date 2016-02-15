package com.ybz.myWebsite.vo;

import com.ybz.myWebsite.po.Article;
import com.ybz.myWebsite.po.ArticleType;

/**
 * 分页查询文章信息使用的查询条件对象（service层、controller层）
 * @author lenovo
 *
 */

public class ArticleSearchVo {
	private Article article;
	private ArticleType articleType;
	private Integer pageNum;
	private Integer pageSize;
	private Integer year;
	private Integer month;
	
	public ArticleSearchVo() {
	}
	public ArticleSearchVo(Article article, ArticleType articleType,
			Integer pageNum, Integer pageSize, Integer year, Integer month) {
		super();
		this.article = article;
		this.articleType = articleType;
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.year = year;
		this.month = month;
	}

	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public ArticleType getArticleType() {
		return articleType;
	}
	public void setArticleType(ArticleType articleType) {
		this.articleType = articleType;
	}
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "ArticleSearchVo [article=" + article + ", articleType="
				+ articleType + ", pageNum=" + pageNum + ", pageSize="
				+ pageSize + ", year=" + year + ", month=" + month + "]";
	}
}
