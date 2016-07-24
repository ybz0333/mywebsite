package com.ybz.myWebsite.controller.front;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.ybz.myWebsite.controller.BaseController;
import com.ybz.myWebsite.po.Article;
import com.ybz.myWebsite.po.ArticleType;
import com.ybz.myWebsite.vo.ArticleArchiveVo;
import com.ybz.myWebsite.vo.ArticleSearchVo;
import com.ybz.myWebsite.vo.ArticleTypeVo;
import com.ybz.myWebsite.vo.ArticleVo;
import com.ybz.myWebsite.vo.Pager;

@Controller
@RequestMapping("/blog")
public class ArticleController extends BaseController{

	//查询文章
	@RequestMapping("/queryArticles")
	public String queryAllArticles(Model model, ArticleSearchVo articleSearchVo) throws Exception{
		//前台只显示已发布的文章，设置查询文章的state为2（已发布）
		Article article = articleSearchVo.getArticle();
		if(article == null) {
			article = new Article();
			articleSearchVo.setArticle(article);
		}
		article.setState(2);
		//若未设置文章类型，则设置文章类型为所有文章
		if(articleSearchVo.getArticleType()==null) {
			ArticleType articleType = new ArticleType();
			articleType.setId(1);
			articleSearchVo.setArticleType(articleType);
		}
		Pager<ArticleVo> articleVoPager = articleService.findArticleSearchVoWithPager(articleSearchVo);
		model.addAttribute("articleVoPager",articleVoPager);
		//文章类型列表，左侧栏要用
		List<ArticleTypeVo> articleTypeVoList = articleTypeService.findArticleTypeVos();
		model.addAttribute("articleTypeVoList", articleTypeVoList);
		//填充文章类型名
		ArticleType articleType = articleTypeService.findArticleTypeById(articleSearchVo.getArticleType().getId());
		model.addAttribute("articleTypeName", articleType.getTypeName());
		return "blog/blog_listArticles";
	}
	
	//按年月归档
	@RequestMapping("/archiveArticle")
	public String archiveArticle(Model model) throws Exception {
		//前台只显示已发布的文章，设置查询文章的state为2（已发布）
		List<ArticleArchiveVo> articleArchiveVoList = articleService.findArticleArchiveVos(2);
		model.addAttribute("articleArchiveVoList", articleArchiveVoList);
		//文章类型列表，左侧栏要用
		List<ArticleTypeVo> articleTypeVoList = articleTypeService.findArticleTypeVos();
		model.addAttribute("articleTypeVoList", articleTypeVoList);
		return "blog/blog_archive";
	}
	
	//阅读文章
	@RequestMapping("/read")
	public String readArticle(HttpSession session, Model model, Integer id) throws Exception{
		if(id == null) {
			throw new RuntimeException("按id查询文章时id为空");
		}
		ArticleVo articleVo = articleService.findArticleVoById(id);
		model.addAttribute("articleVo", articleVo);
		
		//判断该文章是否已被点赞，设置flagPraised标志
		@SuppressWarnings("unchecked")
		List<Integer> praisedArticleIdList = (LinkedList<Integer>)session.getAttribute("praisedArticleIdList");
		if(praisedArticleIdList == null) {
			praisedArticleIdList = new LinkedList<Integer>();
			session.setAttribute("praisedArticleIdList", praisedArticleIdList);
		}
		boolean flagPraised = false;
		for(Integer praisedArticleId : praisedArticleIdList) {
			if(id.equals(praisedArticleId)) {
				flagPraised = true;
				break;
			}
		}
		model.addAttribute("flagPraised", flagPraised);
		
		//查询文章点赞数
		Integer praiseCount = articleService.findPraiseCountById(id);
		if(praiseCount == null) {
			throw new RuntimeException("按id查询点赞数失败");
		}
		model.addAttribute("praiseCount", praiseCount);
		
		//点击量加1
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("id", id);
		param.put("clickCount", "clickCount");
		Integer clickCount = articleService.findClickCountById(id);
		if(clickCount == null) {
			throw new RuntimeException("按id查询点击量失败");
		}
		Article article = new Article();
		article.setId(id);
		article.setClickCount(clickCount+1);
		articleService.updateArticle(article);
		
		List<ArticleTypeVo> articleTypeVoList = articleTypeService.findArticleTypeVos();
		model.addAttribute("articleTypeVoList", articleTypeVoList);
		return "blog/blog_content";
	}
	
	//为文章点赞
	@RequestMapping("/praiseArticle")
	public ModelAndView praiseArticle(HttpSession session, Integer id) throws Exception{
		if(id == null) {
			throw new RuntimeException("为文章点赞时文章id为空");
		}
		//点赞数加1
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("id", id);
		param.put("praiseCount", "praiseCount");
		Integer praiseCount = articleService.findPraiseCountById(id);
		if(praiseCount == null) {
			throw new RuntimeException("按id查询点赞数失败");
		}
		praiseCount++;
		Article article = new Article();
		article.setId(id);
		article.setPraiseCount(praiseCount);
		articleService.updateArticle(article);
		
		//在session中的已点赞文章id列表中添加该文章id
		@SuppressWarnings("unchecked")
		List<Integer> praisedArticleIdList = (List<Integer>)session.getAttribute("praisedArticleIdList");
		if(praisedArticleIdList == null) {
			praisedArticleIdList = new LinkedList<Integer>();
			session.setAttribute("praisedArticleIdList", praisedArticleIdList);
		}
		praisedArticleIdList.add(id);
		
		Map<String,String> resultMap = new HashMap<String,String>();
		resultMap.put("result", "success");
		resultMap.put("praiseCount", praiseCount.toString());
		return new ModelAndView(new MappingJacksonJsonView(),resultMap);
	}
}