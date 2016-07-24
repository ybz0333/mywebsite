package com.ybz.myWebsite.service.impl;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.BlockJUnit4ClassRunner;

import com.ybz.myWebsite.service.ArticleService;
import com.ybz.myWebsite.vo.ArticleArchiveVo;
import com.ybz.myWebsite.vo.ArticleTimeVo;

@RunWith(BlockJUnit4ClassRunner.class)
public class ArticleServiceImplTest extends UnitTestBase{
	public ArticleServiceImplTest() {
		super("classpath*:spring/applicationContext-*.xml");
	}
	
	@Test
	public void testFindArticleTimeVos() throws Exception {
		ArticleService articleService = super.getBean("articleServiceImpl");
		List<ArticleTimeVo> articleTimeVoList = articleService.findArticleTimeVos();
		System.out.println(articleTimeVoList);
	}
	
	@Test
	public void testFindArticleArchiveVos() throws Exception {
		ArticleService articleService = super.getBean("articleServiceImpl");
		List<ArticleArchiveVo> articleArchiveVoList = articleService.findArticleArchiveVos(null);
		System.out.println(articleArchiveVoList);
		List<ArticleArchiveVo> articleArchiveVoList2 = articleService.findArticleArchiveVos(2);
		System.out.println(articleArchiveVoList2);
	}
}
