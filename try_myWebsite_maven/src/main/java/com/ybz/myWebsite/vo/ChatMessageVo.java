package com.ybz.myWebsite.vo;

// 用于封装聊天表单的数据
public class ChatMessageVo {
	String from; // 发言人
	String to; // 接收者
	String color; // 字体颜色
	String content; // 发言内容
	
	public ChatMessageVo() {
		
	}
	public ChatMessageVo(String from, String to, String color, String content) {
		super();
		this.from = from;
		this.to = to;
		this.color = color;
		this.content = content;
	}
	
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "ChatMessageVo [from=" + from + ", to=" + to + ", color="
				+ color + ", content=" + content + "]";
	}
}
