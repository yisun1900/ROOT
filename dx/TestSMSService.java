package com.roya.mcc.thirdapi.sendsms.test;

import java.util.LinkedList;
import java.util.List;

import com.roya.mcc.thirdapi.sendsms.ISMSService;
import com.roya.mcc.thirdapi.sendsms.SMSService;

import junit.framework.TestCase;

public class TestSMSService extends TestCase {
	ISMSService service;
	String shortContent;
	String longContent;
	int priority;
	
	public static void main(String[] args) {
		junit.swingui.TestRunner.run(TestSMSService.class);
	}
	
	protected void setUp() throws Exception {
		service = SMSService.getInstance();
		shortContent = "你好!abc";
		longContent = "加入有一个外部系统VIP 在MCC系统中的外部上行分发代码中设置了9，并且给出了相应的连接，MCC就会把这条短信发给对应的连接";
		priority = 1;
	}
	
	//测试单条发送
	public void testSendSingleSMS() {
		long startt = System.currentTimeMillis();
		//发送单条短信
		service.sendSMS("13812345678", shortContent, priority, 0);
		System.out.println("发送单条短信息成功!花费时间(毫秒):" + (System.currentTimeMillis() - startt));
		
		startt = System.currentTimeMillis();
		//改变发送内容长度大于70个汉字
		service.sendSMS("13812345678", longContent, priority, 0);
		System.out.println("发送单条长信息成功!花费时间(毫秒):" + (System.currentTimeMillis() - startt));		
	}
	
	//测试1000条单条发送
	public void testSendSingle2SMS() {
		long startt = System.currentTimeMillis();
		//发送单条短信
		for(int i = 0; i < 1000; i++) {
			service.sendSMS("13812345678", shortContent, priority, 0);
		}
		System.out.println("发送1000单条短信息成功!花费时间(毫秒):" + (System.currentTimeMillis() - startt));
				
		startt = System.currentTimeMillis();
		//改变发送内容长度大于70个汉字
		for(int i = 0; i < 1000; i++) {
			service.sendSMS("13812345678", shortContent, priority, 0);
		}
		System.out.println("发送1000单条长信息成功!花费时间(毫秒):" + (System.currentTimeMillis() - startt));		
	}	
	
	//测试群发
	public void testSendAllSMS() {
		//手机号码列表
		List list = new LinkedList();
		
		//开始执行时间
		long startt = System.currentTimeMillis();
		//随机生成10000个手机号码列表
		for(int i=0; i < 10000; i++) {
			list.add("138" + ((int)(Math.random() * Integer.MAX_VALUE) % 99999999));
		}
		System.out.println("生成10000个手机号码列表成功!花费时间(毫秒):" + (System.currentTimeMillis() - startt));
		
		startt = System.currentTimeMillis();
		//获得短信发送服务单例
		ISMSService service = SMSService.getInstance();
		service.sendSMS(list, shortContent, priority);
		System.out.println("群发短内容成功!花费时间(毫秒):" + (System.currentTimeMillis() - startt));
		
		startt = System.currentTimeMillis();
		//改变发送内容长度大于70个汉字
		service.sendSMS(list, longContent, priority);
		System.out.println("群发长内容成功!花费时间(毫秒):" + (System.currentTimeMillis() - startt));		
	}

	
	//压力测试
	public void testDrang() {
		for(int i = 0; i < 100; i++) {
			System.out.println("======= 第" + i + "轮压力测试开始 ========");
			testSendSingleSMS();
			testSendSingle2SMS();
			testSendAllSMS();
			System.out.println("======= 第" + i + "轮压力测试结束 ========");
		}
	}
	
}
