<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");


String[] xuhao =request.getParameterValues("xuhao");
String[] bcpp =request.getParameterValues("bcpp");
String[] bclx =request.getParameterValues("bclx");
String[] bchd =request.getParameterValues("bchd");
String[] dj =request.getParameterValues("dj");

  
//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;

int i=0;

try {
	conn=cf.getConnection();    //�õ�����

	System.out.println("��ʼ����[�Ҿ߰��]���ۣ������ˣ�"+yhmc);


	conn.setAutoCommit(false);

	for (i=0;i<xuhao.length ;i++ )
	{
		sql ="insert into jc_jjbjbj (bcpp,bclx,dj,bchd)";
		sql+=" values('"+cf.GB2Uni(bcpp[i])+"','"+cf.GB2Uni(bclx[i])+"',"+dj[i]+","+cf.GB2Uni(bchd[i])+")";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		if (i%40==0)
		{
			System.out.println(xuhao[i]);
		}
	}
	
	conn.commit();

	System.out.println("����[�Ҿ߰��]������ɣ������ˣ�"+yhmc);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("[���ӱ���]�ɹ���");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("<P>������ţ�" + xuhao[i]);
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
