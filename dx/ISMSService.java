/***************************************
 *                                     *
 *  MCC: �ͷ�ϵͳ                        *
 *                                     *
 *  ���а�Ȩ(c) �Ϻ�������Ϣϵͳ���޹�˾     *
 *                                     *
 ***************************************/
package com.roya.mcc.thirdapi.sendsms;

import java.util.List;

/**
 * �·�����Ϣ����ӿڣ��ṩ�����������͵Ķ���Ϣ
 * 
 * @author  li lin
 */
public interface ISMSService {
	
	/**
	 * ��ͬ�����ݺ�����Ȩ��ͬ���ֻ�����Ⱥ������Ϣ 
	 * 
	 * @param list �ֻ������б�(����ֵΪString��)
	 * @param content ����
	 * @param priority ���ȼ�
	 * @return �������:0 -- �����ɹ� ��0 -- ��������
	 */	
	public int sendSMS(List list, String content, int priority);

	/**
	 * ��ָ�����ֻ����뷢�Ͷ���Ϣ
	 * 
	 * @param mobile �ֻ�����
	 * @param content ����
	 * @param priority ���ȼ�
	 * @param mid ����Ϣ��ţ�Ψһ��ʾһ������Ϣ��ͨ���˱�Ų�ѯ����Ϣ״̬����
	 * @return �������:0 -- �����ɹ� ��0 -- ��������
	 */
	public int sendSMS(String mobile, String content, int priority, long mid);

	/**
	 * ͨ�����͵Ķ���Ϣ��Ų�ѯ��������Ϣ��״̬����
	 * @param mid ����Ϣ��ţ�Ψһ��ʾһ������Ϣ
	 * @return ����Ϣ��״̬����
	 */	
	public int queryStatus(long mid);
	
}
