<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='cn.net.emay.metone.api.Client,cn.net.emay.metone.api.MO,cn.net.emay.metone.api.StatusReport'%>
<%@ page import='cn.net.emay.metone.api.UtilList,java.net.URL,java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%
	String dh=cf.GB2Uni(request.getParameter("dh"));

	
	String cont="GBK";
	String sjnumber=dh;					//�����ߺ���
	String sjnr="2008�µ�һ��,�µĿ�ʼ,�����ǹ�ͬŬ��,����Ų����˹�ͬ������!!!";						//�ֻ�����
	String ymsn="0SDK-EB2-0240-PGYTK";				//�����ṩ�����к�
	String ympass="615226";			//�����ṩ��ע����
	int siz=0;
	int m=0;
	Client cl = null;

	cl = new Client(ymsn);

//	cl.setDebug(true);

	out.println("ע�����"+cl.registEx(ympass));

//	cl.registEx("1");

	out.println("��" + cl.getBalance());
	out.println("ϵͳ����:"+cl.sendSMSEx(new String[] {sjnumber} ,sjnr ,cont));
	out.println("<br>���ͺ���:"+sjnumber);
	out.println("<br>��������:"+sjnr);

//	out.println("ϵͳ����:"+cl.sendSMSEx(new String[] { glysj } ,fwqqdzt ,cont));
//	out.println("ע�����ע��:" + cl.logout());
			
%>
