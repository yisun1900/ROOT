import java.util.LinkedList;
import java.util.List;

import com.roya.mcc.thirdapi.sendsms.ISMSService;
import com.roya.mcc.thirdapi.sendsms.SMSService;

/**
 * 短消息发送例子 
 * @author li lin
 *
 */

public class Demo implements Runnable{


	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//单线程测试
		new Demo().test();
	
		//多线程测试
		for(int i = 0; i < 5; i++) {
			new Thread(new Demo(), "Thread-" + i).start();
		}
	}

	public void test() {
//		要发送的内容
		String threadName = Thread.currentThread().getName();
		String content = "你好!" + threadName;
		//优先级
		int priority = 1;
	
		//获得短信发送服务单例
		ISMSService service = SMSService.getInstance();
		
		//发送单条短消息
		long mid = Math.round(Math.random()*Long.MAX_VALUE);		//生成唯一短消息标示,待查询状态   
		if(service.sendSMS("13888888888", content, priority, mid) == 0 ) {
			for(int i = 0; i < 10; i ++) {
				int status = service.queryStatus(mid);
				if(status == 400) {
					System.out.println(threadName + "|短消息编号" + mid + "发送成功!");
					break;
				} else {
					System.out.println(threadName + "|短消息编号" + mid + "现在的状态为:" + status);
					try {
						Thread.sleep(1000);
					} catch (InterruptedException e) {}
				}
			}			
		} else {
			System.out.println(threadName + "|短消息编号" + mid + "消息失败！");
		}
		
		//相同的内容和优先权不同的手机号码群发短消息
		List list = new LinkedList();
		list.add("13811111111");
		list.add("13822222222");
		list.add("13833333333");
		if(service.sendSMS(list, content, priority) == 0) {
			System.out.println(threadName + "|群发成功！");
		} else {
			System.out.println(threadName + "|群发失败！");
		}		
	}
	
	public void run() {
		test();
	}

}
