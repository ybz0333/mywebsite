package com.ybz.myWebsite.service.impl;

import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ybz.myWebsite.constants.Constant;
import com.ybz.myWebsite.mapper.ArticleVoMapper;
import com.ybz.myWebsite.mapper.RelArticleAndTypeMapper;
import com.ybz.myWebsite.po.Article;
import com.ybz.myWebsite.po.ArticleType;
import com.ybz.myWebsite.po.RelArticleAndType;
import com.ybz.myWebsite.service.ArticleService;
import com.ybz.myWebsite.vo.ArticleArchiveVo;
import com.ybz.myWebsite.vo.ArticleSearchVo;
import com.ybz.myWebsite.vo.ArticleTimeGroup;
import com.ybz.myWebsite.vo.ArticleTimeVo;
import com.ybz.myWebsite.vo.ArticleVo;
import com.ybz.myWebsite.vo.Pager;

@Service
public class ArticleServiceImpl implements ArticleService{

	@Autowired
	private ArticleVoMapper articleVoMapper;
	
	@Autowired
	private RelArticleAndTypeMapper relArticleAndTypeMapper;
	
	@Override
	public Pager<ArticleVo> findArticleSearchVoWithPager(ArticleSearchVo articleSearchVo)
			throws Exception {
		
		//从articleSearchModel中获取值存入Map中，键为articleId、state、
		//articleTypeId、year、month、fromIndex、pageSize，没有的值不添加
		Map<String,Object> param = new HashMap<String, Object>();
		
		Article article = articleSearchVo.getArticle();
		if( article != null) {
			if(article.getId() != null) {
				param.put("articleId", article.getId());
			}
			if(article.getState() != null) {
				param.put("state", article.getState());
			}
		}
		ArticleType articleType = articleSearchVo.getArticleType();
		if(articleType != null) {
			if(articleType.getId() != null) {
				param.put("articleTypeId", articleType.getId());
			}
		}
		if(articleSearchVo.getYear() != null) {
			param.put("year", articleSearchVo.getYear());
		}
		if(articleSearchVo.getMonth() != null) {
			param.put("month", articleSearchVo.getMonth());
		}
		
		//查询文章数量
		int totalRecord = articleVoMapper.findArticleCount(param);
		
		Integer pageNum = articleSearchVo.getPageNum();
		Integer pageSize = articleSearchVo.getPageSize();
		if(pageNum == null) {
			pageNum = Constant.DEFAULT_PAGE_NUM;
		}
		if(pageSize == null) {
			pageSize = Constant.DEFAULT_PAGE_SIZE;
		}
		
		//起始索引
		int fromIndex	= pageSize * (pageNum -1);
		param.put("fromIndex", fromIndex);
		param.put("pageSize", pageSize);
		
		//查询文章信息
		List<ArticleVo> articleVoList = articleVoMapper.findArticleSearchVos(param);
		 
		//获取总页数
		int totalPage = totalRecord / pageSize;
		if(totalRecord % pageSize != 0) {
			totalPage++;
		}
		//组装Pager对象
		Pager<ArticleVo> result = new Pager<ArticleVo>(pageSize,
				pageNum, totalRecord, totalPage, articleVoList);
		
		return result;
	}

	@Override
	public List<ArticleVo> findArticleSearchVo(ArticleSearchVo articleSearchVo)
			throws Exception {
		//从articleSearchModel中获取值存入Map中，键为articleId、state、
		//articleTypeId、year、month，没有的值不添加
		Map<String,Object> param = new HashMap<String, Object>();
		
		Article article = articleSearchVo.getArticle();
		if( article != null) {
			if(article.getId() != null) {
				param.put("articleId", article.getId());
			}
			if(article.getState() != null) {
				param.put("state", article.getState());
			}
		}
		ArticleType articleType = articleSearchVo.getArticleType();
		if(articleType != null) {
			if(articleType.getId() != null) {
				param.put("articleTypeId", articleType.getId());
			}
		}
		if(articleSearchVo.getYear() != null) {
			param.put("year", articleSearchVo.getYear());
		}
		if(articleSearchVo.getMonth() != null) {
			param.put("month", articleSearchVo.getMonth());
		}
		
		//查询文章信息
		List<ArticleVo> articleVoList = articleVoMapper.findArticleSearchVos(param);
		return articleVoList;
	}	
	
	@Override
	public ArticleVo findArticleVoById(Integer id) throws Exception {
		return articleVoMapper.findArticleVoById(id);
	}

	@Override
	public void addNewArticle(ArticleVo articleVo) throws Exception {
		Article article = new Article();
		BeanUtils.copyProperties(articleVo, article);
		//插入文章并获取生成的id
		articleVoMapper.insertArticle(article);
		//插入文章与文章类型的关系
		List<ArticleType> articleTypeList = articleVo.getArticleTypeList();
		if(articleTypeList == null) {
			//throw new RuntimeException("文章没有对应的文章类型");
			//文章没有对应的文章类型，设置类型为未分类
			RelArticleAndType relArticleAndType = new RelArticleAndType();
			relArticleAndType.setArticleId(article.getId());
			relArticleAndType.setArticleTypeId(1);
			relArticleAndTypeMapper.insertRelArticleAndType(relArticleAndType);			
		} else {
			for(ArticleType articleType : articleTypeList) {
				RelArticleAndType relArticleAndType = new RelArticleAndType();
				relArticleAndType.setArticleId(article.getId());
				relArticleAndType.setArticleTypeId(articleType.getId());
				relArticleAndTypeMapper.insertRelArticleAndType(relArticleAndType);				
			}
		}
	}

	@Override
	public void updateArticle(ArticleVo articleVo) throws Exception {
		Integer articleId = articleVo.getId();
		if(articleId == null) {
			throw new RuntimeException("要更新的文章id为空");
		}
		Article article = new Article();
		BeanUtils.copyProperties(articleVo, article);
		//更新文章
		articleVoMapper.updateArticle(article);
		//删除文章对应的所有关系
		relArticleAndTypeMapper.deleteRelArticleAndTypes(articleId);
		//重新插入文章对应的关系
		List<ArticleType> articleTypeList = articleVo.getArticleTypeList();
		if(articleTypeList == null) {
			//throw new RuntimeException("文章没有对应的文章类型");
			//文章没有对应的文章类型，设置类型为未分类
			RelArticleAndType relArticleAndType = new RelArticleAndType();
			relArticleAndType.setArticleId(article.getId());
			relArticleAndType.setArticleTypeId(1);
			relArticleAndTypeMapper.insertRelArticleAndType(relArticleAndType);			
		} else {
			for(ArticleType articleType : articleTypeList) {
				RelArticleAndType relArticleAndType = new RelArticleAndType();
				relArticleAndType.setArticleId(article.getId());
				relArticleAndType.setArticleTypeId(articleType.getId());
				relArticleAndTypeMapper.insertRelArticleAndType(relArticleAndType);
			}
		}
	}

	@Override
	public Integer findArticleCount(Integer articleTypeId) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("articleTypeId", articleTypeId);
		return articleVoMapper.findArticleCount(param);
	}
	
	@Override
	public void deleteArticle(Integer id) throws Exception {
		articleVoMapper.deleteArticleById(id);
		relArticleAndTypeMapper.deleteRelArticleAndTypes(id);
	}

	/*
	@Override
	public Article findArticleById(Map<String, Object> param) throws Exception {
		return articleVoMapper.findArticleById(param);
	}
	*/
	
	@Override
	public Integer findClickCountById(Integer id) throws Exception {
		if(id == null) {
			throw new RuntimeException("查询点击量时文章id为空");
		}
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("id", id);
		param.put("clickCount", "clickCount");
		Article article = articleVoMapper.findArticleById(param);
		return article.getClickCount();
	}

	@Override
	public Integer findPraiseCountById(Integer id) throws Exception {
		if(id == null) {
			throw new RuntimeException("查询点赞数时文章id为空");
		}
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("id", id);
		param.put("praiseCount", "praiseCount");
		Article article = articleVoMapper.findArticleById(param);
		return article.getPraiseCount();
	}
	
	@Override
	public void updateArticle(Article article) throws Exception {
		if(article.getId() == null) {
			throw new RuntimeException("要更新的文章id为空");
		}
		articleVoMapper.updateArticle(article);
	}

	@Override
	public List<ArticleTimeVo> findArticleTimeVos() throws Exception {
		List<ArticleTimeVo> articleTimeVoList = new LinkedList<ArticleTimeVo>();
		Map<String,Object> param = new HashMap<String,Object>();
		//取得所有文章的按年月分组查询结果
		List<ArticleTimeGroup> groupTotalList = articleVoMapper.findArticleTimeGroup(param);
		param.put("state", 1);
		//取得草稿的按年月分组查询结果
		List<ArticleTimeGroup> groupDraftList = articleVoMapper.findArticleTimeGroup(param);
		//取得已发表文章的按年月分组查询结果
		param.put("state", 2);
		List<ArticleTimeGroup> groupPublishList = articleVoMapper.findArticleTimeGroup(param);
		
		//组装articleTimeVoList
		if(groupTotalList != null) {
			for(ArticleTimeGroup groupTotal : groupTotalList) {
				ArticleTimeVo articleTimeVo = new ArticleTimeVo();
				articleTimeVo.setCreatetime(groupTotal.getCreatetime());
				articleTimeVo.setNumTotal(groupTotal.getNum());
				//填写草稿数
				boolean hasArticleTime = false;
				if(groupDraftList != null) {
					for(ArticleTimeGroup groupDraft : groupDraftList) {
						if(groupDraft.getCreatetime() != null
								&& groupTotal.getCreatetime() != null
								&& groupDraft.getCreatetime().equals(groupTotal.getCreatetime())) {
							articleTimeVo.setNumDraft(groupDraft.getNum());
							hasArticleTime = true;
						}
					}
				}
				//如果草稿按年月分组结果中没有这一时间，说明该时间对应的草稿数量为0
				if(hasArticleTime == false) {
					articleTimeVo.setNumDraft(0);
				}
				//填写已发布文章数
				hasArticleTime = false;
				if(groupPublishList != null) {
					for(ArticleTimeGroup groupPublish : groupPublishList) {
						if(groupPublish.getCreatetime() != null
								&& groupTotal.getCreatetime() != null
								&& groupPublish.getCreatetime().equals(groupTotal.getCreatetime())) {
							articleTimeVo.setNumDraft(groupPublish.getNum());
							hasArticleTime = true;
						}
					}
				}
				//如果已发布文章按年月分组结果中没有这一时间，说明该时间对应的已发布文章数量为0
				if(hasArticleTime == false) {
					articleTimeVo.setNumPublish(0);
				}
				articleTimeVoList.add(articleTimeVo);
			}
		}
		return articleTimeVoList;
	}

	@Override
	public List<ArticleArchiveVo> findArticleArchiveVos(Integer state) throws Exception {
		List<ArticleArchiveVo> articleArchiveVoList = new LinkedList<ArticleArchiveVo>();
		
		Map<String,Object> param = new HashMap<String,Object>();
		if(state != null) {
			param.put("state", state);
		}
		List<ArticleTimeGroup> groupList = articleVoMapper.findArticleTimeGroup(param);

		//组装articleArchiveVoList
		if(groupList != null) {
			for(ArticleTimeGroup articleTimeGroup : groupList) {
				ArticleArchiveVo articleArchiveVo = new ArticleArchiveVo();
				articleArchiveVo.setArticleTimeGroup(articleTimeGroup);
				
				ArticleSearchVo articleSearchVo = new ArticleSearchVo();
				
				//设置查询的文章状态
				Article article = new Article();
				article.setState(state);
				articleSearchVo.setArticle(article);
				
				//设置查询年月
				Calendar cal = Calendar.getInstance();
				cal.setTime(articleTimeGroup.getCreatetime());
				Integer year = cal.get(Calendar.YEAR);
				articleSearchVo.setYear(year);
				Integer month = cal.get(Calendar.MONTH)+1;
				articleSearchVo.setMonth(month);
				
				List<ArticleVo> articleVoList = findArticleSearchVo(articleSearchVo);
				articleArchiveVo.setArticleVoList(articleVoList);
				articleArchiveVoList.add(articleArchiveVo);
			}
		}
		return articleArchiveVoList;
	}
	
}
