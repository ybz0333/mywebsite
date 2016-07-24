package com.ybz.myWebsite.mapper;

import java.util.List;
import java.util.Map;

import com.ybz.myWebsite.po.Article;
import com.ybz.myWebsite.vo.ArticleTimeGroup;
import com.ybz.myWebsite.vo.ArticleVo;

public interface ArticleVoMapper {
	
	/**
	 * 查询文章信息（带分页） 
	 * @param Map类型的param中可传入：
	 * "articleId":int类型的articleId
	 * "articleTypeId":int类型的articleTypeId
	 * "state":int类型的state
	 * "year":int类型的year
	 * "month":int类型的month
	 * "fromIndex":int类型的fromIndex对象
	 * "pageSize":int类型的pageSize对象
	 * @return List<ArticleVo>
	 * @throws Exception
	 */
	List<ArticleVo> findArticleSearchVos(Map<String,Object> param) throws Exception;
	
	/**
	 * 查询文章数量
	 * @param Map类型的param中可传入：
	 * "articleTypeId":int类型的articleTypeId
	 * "state":int类型的state
	 * "year":int类型的year
	 * "month":int类型的month
	 * @return int
	 * @throws Exception
	 */
	int findArticleCount(Map<String,Object> param) throws Exception;
	
	//根据id查询查询文章信息
	ArticleVo findArticleVoById(Integer id) throws Exception;
	
	/**
	 * 根据id查询文章信息（不包含类型信息）
	 * @param Map类型的param中可传入：
	 * "clickCount":int类型的clickCount
	 * "praiseCount":int类型的praiseCount
	 * @return
	 * @throws Exception
	 */
	Article findArticleById(Map<String,Object> param) throws Exception;
	
	//插入文章
	void insertArticle(Article article) throws Exception;
	
	//更新文章
	void updateArticle(Article article) throws Exception;
	
	//按id删除文章
	void deleteArticleById(Integer id) throws Exception;
	
	/**
	 * 文章年月分组查询
	 * @param Map类型的param中可传入：
	 * "state":int类型的state
	 * @return
	 * @throws Exception
	 */
	List<ArticleTimeGroup> findArticleTimeGroup(Map<String,Object> param) throws Exception;
}
