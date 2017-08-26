import java.util.HashSet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpSessionAttributeListener;  
import javax.servlet.http.HttpSessionBindingEvent;  
import javax.servlet.http.HttpSessionBindingListener;  
import javax.servlet.http.HttpSessionEvent;  
import javax.servlet.http.HttpSessionListener;  

import javax.servlet.http.*;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.Date;
import java.util.ArrayList;
import java.sql.Timestamp;
import javax.servlet.ServletRequestListener;
import javax.servlet.ServletRequestEvent;

public class MySessionListener implements HttpSessionListener 
{
 
    public MySessionListener() 
    {
    	 
    }

	public void sessionCreated(HttpSessionEvent event)
	{
		HttpSession session = event.getSession();
		ServletContext application = session.getServletContext();

		// ��application��Χ��һ��HashSet���������е�session
		HashSet<HttpSession> sessions = (HashSet<HttpSession>) (HttpSession)application.getAttribute("sessions");
		if (sessions == null) 
		{
			 sessions = new HashSet<HttpSession>();
			 application.setAttribute("sessions", sessions);
		}

		// �´�����session����ӵ�HashSet����
		try {
			sessions.add(session);
		}
		catch(Exception e){
			System.out.print(e);
		}
		// �����ڱ𴦴�application��Χ��ȡ��sessions����
		// Ȼ��ʹ��sessions.size()��ȡ��ǰ���session������Ϊ������������
	}

	public void sessionDestroyed(HttpSessionEvent event) 
	{
		HttpSession session = event.getSession();
		ServletContext application = session.getServletContext();
		HashSet sessions = (HashSet) application.getAttribute("sessions");

		// ���ٵ�session����HashSet�����Ƴ�
		sessions.remove(session);
	}
}
/*
<listener>
    <listener-class>MySessionListener��ȫ��</listener-class>
</listener>
*/

//��λ�ȡtomcat�����ݿ�������


public class OnlineCounter extends HttpServlet implements HttpSessionListener,  
    HttpSessionAttributeListener,HttpSessionBindingListener {  
public OnlineCounter(){  
    System.out.println("OnlineCounter initialized.");  
}  
private static final long serialVersionUID = 1L;  

private static int sessionCounter = 0;  

private static int attributeCounter = 0;  

public void sessionCreated(HttpSessionEvent se) {  
    sessionCounter++;  
    System.out.println("session created:" + sessionCounter);  
}  

public void sessionDestroyed(HttpSessionEvent se) {  
    sessionCounter--;  
    System.out.println("session destroied");  
}  

public void attributeAdded(HttpSessionBindingEvent se) {  
    attributeCounter++;  
    System.out.println("attribute added :" + attributeCounter);  
}  

public void attributeRemoved(HttpSessionBindingEvent se) {  
    attributeCounter--;  
    System.out.println("attribute removed");  
}  

public void attributeReplaced(HttpSessionBindingEvent se) {  
    System.out.println(se.getName()+" replaced");  
}  
    
public void valueBound(HttpSessionBindingEvent event){  
      System.out.println(event.getName()+"_Bound_"+event.getValue());  
}  

public void valueUnbound(HttpSessionBindingEvent event) {  
    System.out.println(event.getName()+"_Unbound_"+event.getValue());  
}  

public static int getOnlineSession() {  
    return sessionCounter;  
}  
public static int getOnlineAttribute() {  
    return attributeCounter;  
}  
}  

 

//ͳ����������..sessionCreated�����ip�ж�


public class SessionCounter implements HttpSessionListener,ServletRequestListener {
    private static final String CONTENT_TYPE = "text/html; charset=GBK";
    private static int activeSessions = 0;
    private HttpServletRequest request;
    private static ArrayList list = new ArrayList();

    public void init() throws ServletException {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        HttpSession session = request.getSession();
    }

    public void destroy() {
    }

    public void requestDestroyed(ServletRequestEvent event) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public void requestInitialized(ServletRequestEvent sre){
        request=(HttpServletRequest)sre.getServletRequest();
    }


    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        String sessionId = httpSessionEvent.getSession().getId();
        Timestamp createTime = new Timestamp(System.currentTimeMillis());
        String loginIp = request.getRemoteAddr();
        boolean rs = true;
        if(list.size() > 0){
            for(int i = 0;i < list.size(); i ++){
                if(loginIp.equals(list.get(i))){
                    rs = false;
                }
            }
        }
        if(rs){                      //��������д�����ͬ��IP ��SESSION������
            list.add(loginIp);
            System.out.println("ipList��������ip: "+loginIp);
            activeSessions++;
            System.out.println("����SESSION,sessionId = " + sessionId +"; createTime = " + createTime
                             + "; loginIp = " + loginIp +"; ��ǰ��SESSIONֵΪ "+activeSessions);
        }
    }

    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        String sessionId = httpSessionEvent.getSession().getId();
        Timestamp overTime = new Timestamp(System.currentTimeMillis());
        String loginIp = request.getRemoteAddr();
        if(activeSessions>0){
            if(list.size() > 0){
                for(int i = 0;i < list.size(); i ++){
                    if(loginIp.equals(list.get(i))){
                        list.remove(i);  
                        System.out.println("ipList�����Ƴ�ip: "+loginIp);
                    }
                }
            }
            activeSessions--;                   //���û����ٵ�ʱ��,�Ӷ������߳����IP
            System.out.println("����SESSION,sessionId = " + sessionId +"; overTime = " + overTime
                             + "; loginIp = " + loginIp +"; ��ǰ��SESSIONֵΪ "+activeSessions);
        }
    }

    public static int getActiveSessions() {
        return activeSessions;
    }

    public void setActiveSessions(int i) {
        activeSessions = i;
    }

}

