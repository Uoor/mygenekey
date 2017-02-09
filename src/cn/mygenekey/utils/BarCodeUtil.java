package cn.mygenekey.utils;

import  org.apache.commons.lang3.*;
/**
 * Created by mh on 17-2-8.
 */
public class BarCodeUtil {
	public static String getRandomBarCode(int i) {
		//获取整数的位数
		int size = sizeOfInt(i);

		//项目封顶9位数的 barCode
		int Max = 8;
		int number = (int)(i *  Math.pow(10,(8 - size)));

		//对一个八位整数，封装为一个 //格式 xAxB - xCxD - xExF - xGxH

		//生成8为随机 字符串
		RandomStringUtils.randomAlphanumeric(8);
		String a = "";
		//执行4次插入字符和 “—”
		for(int j = 4;j > 0 && number >= 0;j --) {
			int temp = number % 100;
			number = number / 100;

			if(temp < 10) {
				a = a + "0" + temp + RandomStringUtils.randomAlphanumeric(2) ;
			} else {
				a = a + temp + RandomStringUtils.randomAlphanumeric(2) ;
			}

			if(j != 1) {
				a = a + "-";
			}

		}

		return a;

	}

	final static int[] sizeTable = { 9, 99, 999, 9999, 99999, 999999, 9999999,
			99999999, 999999999, Integer.MAX_VALUE };

	static int sizeOfInt(int x) {
		for (int i = 0;; i++)
			if (x <= sizeTable[i])
				return i + 1;
	}

	/*
	public static void main(String[] args) {
		System.out.println("1");
		BarCodeUtil.getRandomBarCode(133);
	}
	*/
}
