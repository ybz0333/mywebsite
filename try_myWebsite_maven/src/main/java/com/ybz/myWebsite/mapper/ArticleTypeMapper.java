package com.ybz.myWebsite.mapper;

import java.util.List;
import java.util.Map;

import com.ybz.myWebsite.po.ArticleType;
import com.ybz.myWebsite.vo.ArticleTypeGroup;

public interface ArticleTypeMapper {
	
	//查询文章类型信息 
	List<ArticleType> findArticleTypes() throws Exception;

	//按id查询文章类型信息 
	ArticleType findArticleTypeById(int id) throws Exception;
	
	//插入文章类型信息
	void insertArticleType(ArticleType articleType) throws Exception;
	
	//更新文章类型信息
	void updateArticleType(ArticleType articleType) throws Exception;
	
	//删除文章类型
	void deleteArticleType(int id) throws Exception;
	
	/**
	 * 分组查询文章数量
	 * @param Map类型的param中可传入：
	 * state:int类型的state
	 * @return
	 * @throws Exception
	 */
	List<ArticleTypeGroup> findArticleCountGroup(Map<String,Object> param) throws Exception;
	
	//根据文章id查询文章类型信息
	List<ArticleType> findArticleTypesByArticleId(Integer id) throws Exception;
	
}
