package com.ybz.myWebsite.service;

import java.util.List;

import com.ybz.myWebsite.po.Article;
import com.ybz.myWebsite.vo.ArticleArchiveVo;
import com.ybz.myWebsite.vo.ArticleSearchVo;
import com.ybz.myWebsite.vo.ArticleTimeVo;
import com.ybz.myWebsite.vo.ArticleVo;
import com.ybz.myWebsite.vo.Pager;

public interface ArticleService {
	
	public Pager<ArticleVo> findArticleSearchVoWithPager(ArticleSearchVo articleSearchVo) throws Exception;
	
	public List<ArticleVo> findArticleSearchVo(ArticleSearchVo articleSearchVo) throws Exception;	
	
	public ArticleVo findArticleVoById(Integer id) throws Exception;

	public void addNewArticle(ArticleVo articleVo) throws Exception;

	public void updateArticle(ArticleVo articleVo) throws Exception;
	
	public Integer findArticleCount(Integer articleTypeId) throws Exception;
	
	public void deleteArticle(Integer id) throws Exception;
	
	public Integer findClickCountById(Integer id) throws Exception;
	
	public Integer findPraiseCountById(Integer id) throws Exception;
	
	public void updateArticle(Article article) throws Exception;
	
	public List<ArticleTimeVo> findArticleTimeVos() throws Exception;
	
	/*
	 * 前后台查询文章归档列表所传入的state不同：
	 * 前台只显示已发布的文章，state设置为2；后台显示所有文章，state设置为null
	 */
	public List<ArticleArchiveVo> findArticleArchiveVos(Integer state) throws Exception;
	
}
