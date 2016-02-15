package com.ybz.myWebsite.controller.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class CustomDataConverter implements Converter<String,Date> {

	@Override
	public Date convert(String source) {
		//实现将日期转换成日期类型（格式为yyy-MM-dd HH:mm:ss）
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return simpleDateFormat.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//如果参数绑定失败返回null
		return null;
	}

}
