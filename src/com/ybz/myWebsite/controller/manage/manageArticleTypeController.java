package com.ybz.myWebsite.controller.manage;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ybz.myWebsite.controller.BaseController;
import com.ybz.myWebsite.po.ArticleType;
import com.ybz.myWebsite.vo.ArticleTypeVo;

@Controller
@RequestMapping("/manage")
public class manageArticleTypeController extends BaseController {

	//查询所有文章类型与对应文章数目
	@RequestMapping("/queryArticleTypesWithNum")
	public String queryArticleTypesWithNum(Model model) throws Exception {
		List<ArticleTypeVo> articleTypeVoList = articleTypeService.findArticleTypeVos();
		model.addAttribute("articleTypeVoList", articleTypeVoList);
		return "manage/manageArticleType";
	}
	
	//编辑新文章类型信息
	@RequestMapping("/editNewArticleType")
	public String editArticleNewType() throws Exception {
		return "manage/editArticleType";
	}
	
	//添加新文章类型到数据库
	@RequestMapping("/addNewArticleType")
	public @ResponseBody String addNewArticleType(ArticleType articleType) throws Exception {
		//检查类型名是否重复
		List<ArticleType> articleTypeList = articleTypeService.findArticleTypes();
		String articleTypeName = articleType.getTypeName();
		for(ArticleType articleTypeTemp : articleTypeList) {
			if(articleTypeName.equals(articleTypeTemp.getTypeName())) {
				return "duplicate";
			}
		}
		articleTypeService.addNewArticleType(articleType);
		return "success";
	}
	
	//编辑已有文章类型信息
	@RequestMapping("/editArticleType")
	public String editArticleType(Integer id, Model model) throws Exception {
		if(id == null) {
			throw new RuntimeException("按id查询文章类型时id为空");
		}
		ArticleType articleType = articleTypeService.findArticleTypeById(id);
		model.addAttribute("articleType", articleType);
		return "manage/editArticleType";
	}
	
	//更新文章类型
	@RequestMapping("/updateArticleType")
	public @ResponseBody String updateArticleType(ArticleType articleType) throws Exception {
		if(articleType.getId() == null) {
			throw new RuntimeException("更新文章类型时类型id为空");
		}
		//检查类型名是否重复
		List<ArticleType> articleTypeList = articleTypeService.findArticleTypes();
		Integer id = articleType.getId();
		String articleTypeName = articleType.getTypeName();
		for(ArticleType articleTypeTemp : articleTypeList) {
			//与原名称重复没有关系
			if(articleTypeTemp.getId() !=null && 
					!id.equals(articleTypeTemp.getId()) && 
					articleTypeName.equals(articleTypeTemp.getTypeName())) {
				return "duplicate";
			}
		}
		articleTypeService.updateArticleType(articleType);
		return "success";
	}
	
	@RequestMapping("/deleteArticleType")
	public @ResponseBody String deleteArticleType(Integer id) throws Exception {
		if(id == null) {
			throw new RuntimeException("删除文章类型时id为空");
		}
		int result = articleTypeService.deleteArticleType(id);
		if(result == 0) {
			return "success";
		} else if(result == 1) {
			return "still_have_articles";
		} else {
			return "error";
		}
	}
}
