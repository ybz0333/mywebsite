package com.ybz.myWebsite.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

import com.ybz.myWebsite.constants.Constant;

public class CodeUtilTest {
	
	@Test
	public void testEncryptBase64() {
	   String sKey = Constant.DEFAULT_KEY;
	   String str = "test";
	   Date date = new Date(System.currentTimeMillis());
	   SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   String strDate = simpleDateFormat.format(date);
	   long start = new Date().getTime();
	   System.out.println("开始时间：" + strDate + "   毫秒数：" + start); 
	   for ( int i = 0 ; i < 1 ; i ++) {   
	    String strEncrypto = CodeUtil.encryptBase64(str, sKey);
	    System.out.println("被加密的字符串：" + str + "\r\n加密后的结果：" + strEncrypto);
	    String strDecrypto = CodeUtil.decryptBase64(strEncrypto, sKey);
	    System.out.println("解密后的结果：" + strDecrypto); 
	   }   
	   Date date2 = new Date(System.currentTimeMillis());
	   String strDate2 = simpleDateFormat.format(date2);
	   long start2 = new Date().getTime();
	   System.out.println("结束时间：" + strDate2 + "   毫秒数：" + start2);
	   long time = start2 - start;
	   System.out.println("间隔时间：" + time);
	}
	
}
