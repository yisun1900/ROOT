/***************************************
 *                                     *
 *  MCC: 客服系统                        *
 *                                     *
 *  所有版权(c) 上海若雅信息系统有限公司     *
 *                                     *
 ***************************************/
package com.roya.mcc.thirdapi.sendsms;

import java.util.List;

/**
 * 下发短消息服务接口，提供给第三方发送的短信息
 * 
 * @author  li lin
 */
public interface ISMSService {
	
	/**
	 * 相同的内容和优先权不同的手机号码群发短消息 
	 * 
	 * @param list 手机号码列表(其中值为String型)
	 * @param content 内容
	 * @param priority 优先级
	 * @return 错误代码:0 -- 操作成功 非0 -- 操作出错
	 */	
	public int sendSMS(List list, String content, int priority);

	/**
	 * 给指定的手机号码发送短消息
	 * 
	 * @param mobile 手机号码
	 * @param content 内容
	 * @param priority 优先级
	 * @param mid 短信息编号，唯一标示一条短信息，通过此编号查询短信息状态报告
	 * @return 错误代码:0 -- 操作成功 非0 -- 操作出错
	 */
	public int sendSMS(String mobile, String content, int priority, long mid);

	/**
	 * 通过发送的短信息编号查询此条短信息的状态报告
	 * @param mid 短信息编号，唯一标示一条短信息
	 * @return 短信息的状态报告
	 */	
	public int queryStatus(long mid);
	
}
