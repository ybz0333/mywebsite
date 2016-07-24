package com.ybz.myWebsite.po;

import java.util.Date;

//备份的聊天记录
public class Chatlog {
    private Integer id;

    private Integer type; // 备份类型，0为系统备份，1为手动备份

    private Date createtime; // 备份时间

    private String content; // 内容

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

	@Override
	public String toString() {
		return "Chatlog [id=" + id + ", type=" + type + ", createtime="
				+ createtime + ", content=" + content + "]";
	}
    
}