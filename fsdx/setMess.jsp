<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='cn.net.emay.metone.api.Client,cn.net.emay.metone.api.MO,cn.net.emay.metone.api.StatusReport'%>
<%@ page import='cn.net.emay.metone.api.UtilList,java.net.URL,java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%
	String dh=cf.GB2Uni(request.getParameter("dh"));

	
	String cont="GBK";
	String sjnumber=dh;					//发送者号码
	String sjnr="2008新的一年,新的开始,让我们共同努力,完成优铂利人共同的梦想!!!";						//手机内容
	String ymsn="0SDK-EB2-0240-PGYTK";				//亿美提供的序列号
	String ympass="615226";			//亿美提供的注册码
	int siz=0;
	int m=0;
	Client cl = null;

	cl = new Client(ymsn);

//	cl.setDebug(true);

	out.println("注册服务："+cl.registEx(ympass));

//	cl.registEx("1");

	out.println("余额：" + cl.getBalance());
	out.println("系统启动:"+cl.sendSMSEx(new String[] {sjnumber} ,sjnr ,cont));
	out.println("<br>发送号码:"+sjnumber);
	out.println("<br>发送内容:"+sjnr);

//	out.println("系统启动:"+cl.sendSMSEx(new String[] { glysj } ,fwqqdzt ,cont));
//	out.println("注册号码注销:" + cl.logout());
			
%>
