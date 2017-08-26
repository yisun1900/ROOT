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
		shortContent = "���!abc";
		longContent = "������һ���ⲿϵͳVIP ��MCCϵͳ�е��ⲿ���зַ�������������9�����Ҹ�������Ӧ�����ӣ�MCC�ͻ���������ŷ�����Ӧ������";
		priority = 1;
	}
	
	//���Ե�������
	public void testSendSingleSMS() {
		long startt = System.currentTimeMillis();
		//���͵�������
		service.sendSMS("13812345678", shortContent, priority, 0);
		System.out.println("���͵�������Ϣ�ɹ�!����ʱ��(����):" + (System.currentTimeMillis() - startt));
		
		startt = System.currentTimeMillis();
		//�ı䷢�����ݳ��ȴ���70������
		service.sendSMS("13812345678", longContent, priority, 0);
		System.out.println("���͵�������Ϣ�ɹ�!����ʱ��(����):" + (System.currentTimeMillis() - startt));		
	}
	
	//����1000����������
	public void testSendSingle2SMS() {
		long startt = System.currentTimeMillis();
		//���͵�������
		for(int i = 0; i < 1000; i++) {
			service.sendSMS("13812345678", shortContent, priority, 0);
		}
		System.out.println("����1000��������Ϣ�ɹ�!����ʱ��(����):" + (System.currentTimeMillis() - startt));
				
		startt = System.currentTimeMillis();
		//�ı䷢�����ݳ��ȴ���70������
		for(int i = 0; i < 1000; i++) {
			service.sendSMS("13812345678", shortContent, priority, 0);
		}
		System.out.println("����1000��������Ϣ�ɹ�!����ʱ��(����):" + (System.currentTimeMillis() - startt));		
	}	
	
	//����Ⱥ��
	public void testSendAllSMS() {
		//�ֻ������б�
		List list = new LinkedList();
		
		//��ʼִ��ʱ��
		long startt = System.currentTimeMillis();
		//�������10000���ֻ������б�
		for(int i=0; i < 10000; i++) {
			list.add("138" + ((int)(Math.random() * Integer.MAX_VALUE) % 99999999));
		}
		System.out.println("����10000���ֻ������б�ɹ�!����ʱ��(����):" + (System.currentTimeMillis() - startt));
		
		startt = System.currentTimeMillis();
		//��ö��ŷ��ͷ�����
		ISMSService service = SMSService.getInstance();
		service.sendSMS(list, shortContent, priority);
		System.out.println("Ⱥ�������ݳɹ�!����ʱ��(����):" + (System.currentTimeMillis() - startt));
		
		startt = System.currentTimeMillis();
		//�ı䷢�����ݳ��ȴ���70������
		service.sendSMS(list, longContent, priority);
		System.out.println("Ⱥ�������ݳɹ�!����ʱ��(����):" + (System.currentTimeMillis() - startt));		
	}

	
	//ѹ������
	public void testDrang() {
		for(int i = 0; i < 100; i++) {
			System.out.println("======= ��" + i + "��ѹ�����Կ�ʼ ========");
			testSendSingleSMS();
			testSendSingle2SMS();
			testSendAllSMS();
			System.out.println("======= ��" + i + "��ѹ�����Խ��� ========");
		}
	}
	
}
