<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dwbh=request.getParameter("dwbh");
String[] clbm =request.getParameterValues("clbm");
String[] xcjjsj =request.getParameterValues("xcjjsj");
String[] xgdj =request.getParameterValues("xgdj");

String[] xjgsxsj =request.getParameterValues("xjgsxsj");


String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
int count=0;
int tzsl=0;
try {
	conn=cf.getConnection();    //�õ�����


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{

		if (!xjgsxsj[i].equals(""))//�¼۸���Чʱ��
		{
			tzsl++;

			sql=" update cl_jgmx set tzr='"+yhmc+"',tzsj=SYSDATE";
			sql+=" ,xjgsxsj=TO_DATE('"+xjgsxsj[i]+"','YYYY-MM-DD'),xjgsfgx='1'";
			sql+=" ,xcjjsj="+xcjjsj[i]+",xgdj="+xgdj[i];
			sql+=" where clbm='"+clbm[i]+"' and dwbh='"+dwbh+"' ";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}

	}

	sql=" update cl_jgmx set cjjsj=xcjjsj,gdj=xgdj  ,xjgsfgx='2',xjgsxsj=null,xcjjsj=null,xgdj=null";
	sql+=" where dwbh='"+dwbh+"' and xjgsxsj<=SYSDATE";
	ps= conn.prepareStatement(sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("�۸�����ɹ������޸ļ۸�[<%=tzsl%>]��");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>sql=" + sql);
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

