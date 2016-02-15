package com.ybz.myWebsite.service.impl;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ybz.myWebsite.mapper.ArticleTypeMapper;
import com.ybz.myWebsite.mapper.ArticleVoMapper;
import com.ybz.myWebsite.po.ArticleType;
import com.ybz.myWebsite.service.ArticleTypeService;
import com.ybz.myWebsite.vo.ArticleTypeGroup;
import com.ybz.myWebsite.vo.ArticleTypeVo;


@Service
public class ArticleTypeServiceImpl implements ArticleTypeService {
	
	@Autowired
	private ArticleVoMapper articleVoMapper;
	
	@Autowired
	private ArticleTypeMapper articleTypeMapper;

	@Override
	public List<ArticleTypeVo> findArticleTypeVos() throws Exception {
		List<ArticleTypeVo> articleTypeVoList = new LinkedList<ArticleTypeVo>();
		List<ArticleType> articleTypeList = articleTypeMapper.findArticleTypes();
		/*
		if(articleTypeList != null) {
			for(ArticleType articleType : articleTypeList) {
				ArticleTypeVo articleTypeVo = new ArticleTypeVo();
				BeanUtils.copyProperties(articleType, articleTypeVo);
				
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("articleTypeId", articleType.getId());
				int numTotal = articleVoMapper.findArticleCount(param);//取得该类型对应的文章总数
				articleTypeVo.setNumTotal(numTotal);
				param.put("state", 1);
				int numDraft = articleVoMapper.findArticleCount(param);//取得该类型对应的草稿数
				articleTypeVo.setNumDraft(numDraft);
				int numPublish = articleVoMapper.findArticleCount(param);//取得该类型对应的已发表文章总数
				articleTypeVo.setNumPublish(numPublish);
				
				articleTypeVoList.add(articleTypeVo);
			}
		}
		*/
		if(articleTypeList != null) {
			Map<String,Object> param = new HashMap<String,Object>();
			//取得该类型对应的文章总数
			List<ArticleTypeGroup> groupTotalList = articleTypeMapper.findArticleCountGroup(param);
			param.put("state", 1);
			//取得该类型对应的草稿数
			List<ArticleTypeGroup> groupDraftList = articleTypeMapper.findArticleCountGroup(param);
			//取得该类型对应的已发表文章总数
			param.put("state", 2);
			List<ArticleTypeGroup> groupPublishList = articleTypeMapper.findArticleCountGroup(param);
			
			//组装articleVoList
			for(ArticleType articleType : articleTypeList) {
				ArticleTypeVo articleTypeVo = new ArticleTypeVo();
				BeanUtils.copyProperties(articleType, articleTypeVo);
				//填写文章总数
				boolean hasArticleType = false;
				if(groupTotalList != null) {
					for(ArticleTypeGroup articleTypeGroup : groupTotalList) {
						if(articleType.getId() != null 
								&& articleType.getId().equals(articleTypeGroup.getArticleTypeId())) {
							articleTypeVo.setNumTotal(articleTypeGroup.getNum());
							hasArticleType = true;
							break;
						}
					}
					//如果分组结果中没有该文章类型的id，说明该文章类型对应的文章数量为0
					if(hasArticleType == false) {
						articleTypeVo.setNumTotal(0);
					}
				}
				//填写草稿总数
				hasArticleType = false;
				if(groupDraftList != null) {
					for(ArticleTypeGroup articleTypeGroup : groupDraftList) {
						if(articleType.getId() != null 
								&& articleType.getId().equals(articleTypeGroup.getArticleTypeId())) {
							articleTypeVo.setNumDraft(articleTypeGroup.getNum());
							hasArticleType = true;
							break;
						}
					}
					//如果分组结果中没有该文章类型的id，说明该文章类型对应的文章数量为0
					if(hasArticleType == false) {
						articleTypeVo.setNumDraft(0);
					}
				}
				//填写已发布文章总数
				hasArticleType = false;
				if(groupPublishList != null) {
					for(ArticleTypeGroup articleTypeGroup : groupPublishList) {
						if(articleType.getId() != null 
								&& articleType.getId().equals(articleTypeGroup.getArticleTypeId())) {
							articleTypeVo.setNumPublish(articleTypeGroup.getNum());
							hasArticleType = true;
							break;
						}
					}
					//如果分组结果中没有该文章类型的id，说明该文章类型对应的文章数量为0
					if(hasArticleType == false) {
						articleTypeVo.setNumPublish(0);
					}
				}
				articleTypeVoList.add(articleTypeVo);
			}
		}

		return articleTypeVoList;
	}

	@Override
	public List<ArticleType> findArticleTypes() throws Exception {
		List<ArticleType> articleType = articleTypeMapper.findArticleTypes();
		return articleType;
	}

	@Override
	public ArticleType findArticleTypeById(Integer id) throws Exception {
		return articleTypeMapper.findArticleTypeById(id);
	}

	@Override
	public void addNewArticleType(ArticleType articleType) throws Exception {
		articleTypeMapper.insertArticleType(articleType);
	}

	/*
	 * 删除文章类型
	 * 返回0表示删除成功，返回1表示要删除的文章类型还存在对应的文章
	 */
	@Override
	public int deleteArticleType(Integer id) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("articleTypeId", id);
		int num = articleVoMapper.findArticleCount(param);
		if(num != 0) {
			return 1;
		}
		articleTypeMapper.deleteArticleType(id);
		return 0;
	}

	@Override
	public void updateArticleType(ArticleType articleType) throws Exception {
		articleTypeMapper.updateArticleType(articleType);
	}
	
}
