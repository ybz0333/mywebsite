package com.ybz.myWebsite.controller.front;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/laboratory")
public class LaboratoryController {

	// 跳转到单页滚动模块
	@RequestMapping("/onePageScroll")
	public String gotoOnePageScroll() {
		return "laboratory/onePageScroll/onePageScroll";
	}
	
	// 跳转到音乐可视化模块
	@RequestMapping("/webAudio")
	public String gotoWebAudio(HttpServletRequest request, Model model) {
		// 获取音乐列表
		File mediaDir = new File(request.getSession().getServletContext()
				.getRealPath("/laboratory/webAudio/public/media/"));
		String[] musicNames = mediaDir.list();
		//System.out.println(Arrays.toString(musicNames));
		model.addAttribute("musicNames", musicNames);
		return "laboratory/webAudio/views/index";
	}
	
}
