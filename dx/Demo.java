import java.util.LinkedList;
import java.util.List;

import com.roya.mcc.thirdapi.sendsms.ISMSService;
import com.roya.mcc.thirdapi.sendsms.SMSService;

/**
 * ����Ϣ�������� 
 * @author li lin
 *
 */

public class Demo implements Runnable{


	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//���̲߳���
		new Demo().test();
	
		//���̲߳���
		for(int i = 0; i < 5; i++) {
			new Thread(new Demo(), "Thread-" + i).start();
		}
	}

	public void test() {
//		Ҫ���͵�����
		String threadName = Thread.currentThread().getName();
		String content = "���!" + threadName;
		//���ȼ�
		int priority = 1;
	
		//��ö��ŷ��ͷ�����
		ISMSService service = SMSService.getInstance();
		
		//���͵�������Ϣ
		long mid = Math.round(Math.random()*Long.MAX_VALUE);		//����Ψһ����Ϣ��ʾ,����ѯ״̬   
		if(service.sendSMS("13888888888", content, priority, mid) == 0 ) {
			for(int i = 0; i < 10; i ++) {
				int status = service.queryStatus(mid);
				if(status == 400) {
					System.out.println(threadName + "|����Ϣ���" + mid + "���ͳɹ�!");
					break;
				} else {
					System.out.println(threadName + "|����Ϣ���" + mid + "���ڵ�״̬Ϊ:" + status);
					try {
						Thread.sleep(1000);
					} catch (InterruptedException e) {}
				}
			}			
		} else {
			System.out.println(threadName + "|����Ϣ���" + mid + "��Ϣʧ�ܣ�");
		}
		
		//��ͬ�����ݺ�����Ȩ��ͬ���ֻ�����Ⱥ������Ϣ
		List list = new LinkedList();
		list.add("13811111111");
		list.add("13822222222");
		list.add("13833333333");
		if(service.sendSMS(list, content, priority) == 0) {
			System.out.println(threadName + "|Ⱥ���ɹ���");
		} else {
			System.out.println(threadName + "|Ⱥ��ʧ�ܣ�");
		}		
	}
	
	public void run() {
		test();
	}

}
