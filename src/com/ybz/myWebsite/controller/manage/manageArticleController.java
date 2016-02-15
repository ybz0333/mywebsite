package com.ybz.myWebsite.controller.manage;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ybz.myWebsite.constants.Constant;
import com.ybz.myWebsite.controller.BaseController;
import com.ybz.myWebsite.po.Article;
import com.ybz.myWebsite.po.ArticleType;
import com.ybz.myWebsite.vo.ArticleSearchVo;
import com.ybz.myWebsite.vo.ArticleTimeVo;
import com.ybz.myWebsite.vo.ArticleTypeVo;
import com.ybz.myWebsite.vo.ArticleVo;
import com.ybz.myWebsite.vo.Pager;

@Controller
@RequestMapping("/manage")
public class manageArticleController extends BaseController{

	//查询文章
	@RequestMapping("/manageArticle")
	public String queryAllArticles(Model model, ArticleSearchVo articleSearchVo, Date chosenCreateTime) throws Exception{
		//如果没指定文章类型，默认查询类型1（所有）的文章
		//利用数据回显在下拉列表中标识查询的类型
		if(articleSearchVo.getArticleType() == null) {
			ArticleType articleType = new ArticleType();
			articleType.setId(1);
			articleSearchVo.setArticleType(articleType);
		}		
		//如果页面传来的文章的state为0，则将其设置为null，利用数据回显使其选中“全部”
		Article article = articleSearchVo.getArticle();
		if(article != null) {
			if(article.getState() == 0) {
				article.setState(null);
			}			
		}
		//从页面传来的ChosenCreatTime中获取年月，添加到articleSearchVo中
		if(chosenCreateTime != null) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(chosenCreateTime);
			Integer year = cal.get(Calendar.YEAR);
			Integer month = cal.get(Calendar.MONTH)+1;
			articleSearchVo.setYear(year);
			articleSearchVo.setMonth(month);			
		}
		
		Pager<ArticleVo> articleVoPager = articleService.findArticleSearchVoWithPager(articleSearchVo);
		model.addAttribute("articleVoPager",articleVoPager);
		List<ArticleTypeVo> articleTypeVoList = articleTypeService.findArticleTypeVos();
		model.addAttribute("articleTypeVoList", articleTypeVoList);
		List<ArticleTimeVo> articleTimeVoList = articleService.findArticleTimeVos();
		model.addAttribute("articleTimeVoList", articleTimeVoList);
		//用于设置年月的下拉列表默认选中项（普通类型不会默认进行数据回显）
		model.addAttribute("chosenCreateTime", chosenCreateTime);
		return "manage/manageArticle";
	}
	
	//编辑新文章
	@RequestMapping("editNewArticle")
	public String editNewArticle(Model model) throws Exception {
		//查询文章类型（不包含数量），编辑页面中有用
		List<ArticleType> articleTypeList = articleTypeService.findArticleTypes();
		model.addAttribute("articleTypeList" , articleTypeList);
		return "manage/editArticle";
	}
	
	//添加新文章到数据库
	@RequestMapping("/addNewArticle")
	public String addNewArticle(ArticleVo articleVo, String newArticleTypeText) throws Exception {
		//时间为空则设置为当前时间
		if(articleVo.getCreatetime() == null) {
			articleVo.setCreatetime(new Date());
		}
		//将newArticleTypeText合并到articleVo中
		mergeArticleVoAndText(articleVo, newArticleTypeText);
		articleService.addNewArticle(articleVo);
		return "success";
	}
	
	//编辑已有文章
	@RequestMapping("/editArticle")
	public String editArticle(Model model, Integer id) throws Exception{
		if(id == null) {
			throw new RuntimeException("按id查询文章时id为空");
		}
		//按id查询文章
		ArticleVo articleVo = articleService.findArticleVoById(id);
		model.addAttribute("articleVo", articleVo);
		//查询文章类型（不包含数量），编辑页面中有用
		List<ArticleType> articleTypeList = articleTypeService.findArticleTypes();
		model.addAttribute("articleTypeList" , articleTypeList);
		return "manage/editArticle";
	}
	
	//将newArticleTypeText合并到articleVo中
	private ArticleVo mergeArticleVoAndText(ArticleVo articleVo,
			String newArticleTypeText) throws Exception {
		if (newArticleTypeText != null) {
			newArticleTypeText = newArticleTypeText.trim();
			if (!newArticleTypeText.equals("")) {
				String typeTexts[] = newArticleTypeText.split(",");
				// 查询文章类型（不包含数量）
				List<ArticleType> articleTypeList = articleTypeService
						.findArticleTypes();
				// 检查新增类型的名称是否与数据库中已有类型的名称重复
				for (String typeText : typeTexts) {
					String typeTextTrim = typeText.trim();
					if (!typeTextTrim.equals("")) {
						boolean notEqual = true;
						for (ArticleType articleType : articleTypeList) {
							if (typeTextTrim.equals(articleType.getTypeName()
									.trim())) {
								notEqual = false;
								break;
							}
						}
						// 若没有重复，则插入新类型
						if (notEqual == true) {
							ArticleType articleType = new ArticleType();
							articleType.setTypeName(typeTextTrim);
							articleType.setDescription("none");
							// 插入的同时获得自增主键，增加到articleVo的articleTypeList中
							articleTypeService.addNewArticleType(articleType);
							articleVo.getArticleTypeList().add(articleType);
							// 查询出的articleTypeList中也要加入新类型
							articleTypeList.add(articleType);
						}
					}
				}
			}
		}
		return articleVo;
	}
	
	//更新文章
	@RequestMapping("/updateArticle")
	public String updateArticle(ArticleVo articleVo, String newArticleTypeText) throws Exception {
		if(articleVo.getId() == null) {
			throw new RuntimeException("更新文章时文章id为空");
		}
		//时间为空则设置为当前时间
		if(articleVo.getCreatetime() == null) {
			articleVo.setCreatetime(new Date());
		}
		//将newArticleTypeText合并到articleVo中
		mergeArticleVoAndText(articleVo, newArticleTypeText);
		//去除类型id为空的文章类型
		Iterator<ArticleType> iter = articleVo.getArticleTypeList().iterator();
		while(iter.hasNext()) {
			ArticleType articleType = iter.next();
			if(articleType.getId() == null) {
				iter.remove();
			}
		}
		articleService.updateArticle(articleVo);
		return "success";
	}
	
	//删除文章
	@RequestMapping("/deleteArticle")
	public @ResponseBody String deleteArticle(Integer id) throws Exception {
		if(id == null) {
			throw new RuntimeException("删除文章时id为空");
		}
		articleService.deleteArticle(id);
		return "success";
	}
	
	//预览文章
	@RequestMapping("/previewArticle")
	public String previewArticle(Integer id, Model model) throws Exception {
		if(id == null) {
			throw new RuntimeException("预览文章时id为空");
		}
		ArticleVo articleVo = articleService.findArticleVoById(id);
		model.addAttribute("articleVo", articleVo);
		return "readArticle";
	}
	
	//改变文章状态
	@RequestMapping("/changeState")
	public ModelAndView changeState(Integer id, Integer stateChangeTo, Integer pageNum) throws Exception {
		if(id == null) {
			throw new RuntimeException("改变文章状态时文章id为空");
		}
		if(stateChangeTo == null) {
			throw new RuntimeException("改变文章状态时目标状态为空");
		}
		ArticleVo articleVo = new ArticleVo();
		articleVo.setId(id);
		articleVo.setState(stateChangeTo);
		articleService.updateArticle(articleVo);
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("pageNum", pageNum);
		return new ModelAndView("redirect:/manage/manageArticle.action",modelMap);
	}
	
	//上传图片
	@RequestMapping("/uploadImage")
	public String uploadImage(
			MultipartFile article_pic//接收文章图片
			) throws Exception {
		if(article_pic != null) {
			//原始名称
			String originalFileName = article_pic.getOriginalFilename();
			//上传图片
			if(originalFileName != null && originalFileName.length() > 0) {
				//存储图片的物理路径
				String picture_path = Constant.PICTURE_PATH;
				//新的图片路径
				String newFileName = UUID.randomUUID()
					+ originalFileName.substring(originalFileName.lastIndexOf("."));
				//新图片
				File newFile = new File(picture_path + newFileName);
				//将内存中的数据写入磁盘
				article_pic.transferTo(newFile);
				//图片名称、数据库、返回等操作
			}
		}
		return "";
	}
}
