package com.ybz.myWebsite.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ybz.myWebsite.po.Chatlog;
import com.ybz.myWebsite.po.ChatlogExample;

public interface ChatlogMapper {
    int countByExample(ChatlogExample example);

    int deleteByExample(ChatlogExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Chatlog record);

    int insertSelective(Chatlog record);

    List<Chatlog> selectByExample(ChatlogExample example);

    Chatlog selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Chatlog record, @Param("example") ChatlogExample example);

    int updateByExample(@Param("record") Chatlog record, @Param("example") ChatlogExample example);

    int updateByPrimaryKeySelective(Chatlog record);

    int updateByPrimaryKey(Chatlog record);
    
    // 新增
    // 查询所有聊天记录（不包含聊天记录的内容）（按时间降序）
    List<Chatlog> selectWithoutContent();
}