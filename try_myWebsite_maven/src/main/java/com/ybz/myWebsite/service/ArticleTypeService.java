package com.ybz.myWebsite.service;

import java.util.List;

import com.ybz.myWebsite.po.ArticleType;
import com.ybz.myWebsite.vo.ArticleTypeVo;



public interface ArticleTypeService {

	public List<ArticleTypeVo> findArticleTypeVos() throws Exception;
	
	public List<ArticleType> findArticleTypes() throws Exception;
	
	public ArticleType findArticleTypeById(Integer id) throws Exception;
	
	public void addNewArticleType(ArticleType articleType) throws Exception;
	
	/*
	 * 删除文章类型
	 * 返回0表示删除成功，返回1表示要删除的文章类型还存在对应的文章
	 */
	public int deleteArticleType(Integer id) throws Exception;

	public void updateArticleType(ArticleType articleType) throws Exception;
	
}
