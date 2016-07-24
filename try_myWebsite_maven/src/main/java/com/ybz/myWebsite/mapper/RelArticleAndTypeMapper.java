package com.ybz.myWebsite.mapper;

import com.ybz.myWebsite.po.RelArticleAndType;

public interface RelArticleAndTypeMapper {
	
	//插入文章与文章类型的关系
	void insertRelArticleAndType(RelArticleAndType relArticleAndType) throws Exception;
	
	//删除某文章对应的所有关系
	void deleteRelArticleAndTypes(int articleId) throws Exception;
}
