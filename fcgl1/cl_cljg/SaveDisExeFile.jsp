<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String[] fgsbh =request.getParameterValues("fgsbh");
String[] clbm =request.getParameterValues("clbm");
String[] cjjsj =request.getParameterValues("cjjsj");
String[] fgsdj =request.getParameterValues("fgsdj");
String[] gdj =request.getParameterValues("gdj");
String[] ckmc =request.getParameterValues("ckmc");
String[] sfrk =request.getParameterValues("sfrk");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //�õ�����

	System.out.println("��ʼ���¸��ļ۸񣬲����ˣ�"+yhmc);


	conn.setAutoCommit(false);

	for (i=0;i<clbm.length ;i++ )
	{

		sql ="update cl_jgmx set cjjsj="+cjjsj[i]+",fgsdj="+fgsdj[i]+",gdj="+gdj[i]+",sfrk='"+sfrk[i]+"',ckmc='"+cf.GB2Uni(ckmc[i])+"'";
		sql+=" where dwbh='"+fgsbh[i]+"' and clbm='"+clbm[i]+"'";
		ps= conn.prepareStatement(sql);
		
		ps.executeUpdate();
		ps.close();

		if (i%200==0)
		{
			System.out.println(i);
		}
	}
	
	conn.commit();

	System.out.println("���¸��ļ۸���ɣ������ˣ�"+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[���¸��ļ۸�]�ɹ���");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>����ʧ��,��������: " + e);
	out.print("<P>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              
