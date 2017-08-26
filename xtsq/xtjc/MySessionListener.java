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

		// 在application范围由一个HashSet集保存所有的session
		HashSet<HttpSession> sessions = (HashSet<HttpSession>) (HttpSession)application.getAttribute("sessions");
		if (sessions == null) 
		{
			 sessions = new HashSet<HttpSession>();
			 application.setAttribute("sessions", sessions);
		}

		// 新创建的session均添加到HashSet集中
		try {
			sessions.add(session);
		}
		catch(Exception e){
			System.out.print(e);
		}
		// 可以在别处从application范围中取出sessions集合
		// 然后使用sessions.size()获取当前活动的session数，即为“在线人数”
	}

	public void sessionDestroyed(HttpSessionEvent event) 
	{
		HttpSession session = event.getSession();
		ServletContext application = session.getServletContext();
		HashSet sessions = (HashSet) application.getAttribute("sessions");

		// 销毁的session均从HashSet集中移除
		sessions.remove(session);
	}
}
/*
<listener>
    <listener-class>MySessionListener类全名</listener-class>
</listener>
*/

//如何获取tomcat的数据库连接数


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

 

//统计在线人数..sessionCreated中添加ip判断


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
        if(rs){                      //如果队列中存在相同的IP 则SESSION不增加
            list.add(loginIp);
            System.out.println("ipList队列新增ip: "+loginIp);
            activeSessions++;
            System.out.println("新增SESSION,sessionId = " + sessionId +"; createTime = " + createTime
                             + "; loginIp = " + loginIp +"; 当前总SESSION值为 "+activeSessions);
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
                        System.out.println("ipList队列移除ip: "+loginIp);
                    }
                }
            }
            activeSessions--;                   //在用户销毁的时候,从队列中踢出这个IP
            System.out.println("销毁SESSION,sessionId = " + sessionId +"; overTime = " + overTime
                             + "; loginIp = " + loginIp +"; 当前总SESSION值为 "+activeSessions);
        }
    }

    public static int getActiveSessions() {
        return activeSessions;
    }

    public void setActiveSessions(int i) {
        activeSessions = i;
    }

}

