<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dwbh=request.getParameter("dwbh");
String[] clbm =request.getParameterValues("clbm");
String[] cj =request.getParameterValues("cj");
String[] cjjsj =request.getParameterValues("cjjsj");
String[] fgsdj =request.getParameterValues("fgsdj");
String[] gdj =request.getParameterValues("gdj");

String[] xjgsxsj =request.getParameterValues("xjgsxsj");
String[] cxkssj =request.getParameterValues("cxkssj");
String[] cxjzsj =request.getParameterValues("cxjzsj");
String[] cxcj =request.getParameterValues("cxcj");
String[] cxcjjsj =request.getParameterValues("cxcjjsj");
String[] cxfgsdj =request.getParameterValues("cxfgsdj");
String[] cxgdj =request.getParameterValues("cxgdj");

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
		String sfycx =request.getParameter("sfycx"+(i+1));

		if (!xjgsxsj[i].equals(""))//�¼۸���Чʱ��
		{
			tzsl++;

			if (sfycx.equals("Y"))//N��û������Y���д���
			{
				if (cxkssj[i].equals(""))
				{
					conn.rollback();
					out.println("���ϱ��롾"+clbm[i]+"�������д������ޡ�������ʼʱ�䡿");
					return;
				}
				if (cxjzsj[i].equals(""))
				{
					conn.rollback();
					out.println("���ϱ��롾"+clbm[i]+"�������д������ޡ���������ʱ�䡿");
					return;
				}
				if (cxgdj[i].equals("") || cxgdj[i].equals("0.0") || cxgdj[i].equals("0"))
				{
					conn.rollback();
					out.println("���ϱ��롾"+clbm[i]+"�������д������ޡ������ڹ��Ӽۡ�");
					return;
				}
			}

			sql=" update cl_jgmx set tzr='"+yhmc+"',tzsj=SYSDATE";
			sql+=" ,xjgsxsj=TO_DATE('"+xjgsxsj[i]+"','YYYY-MM-DD'),xjgsfgx='1'";
			sql+=" ,xcj="+cj[i]+",xcjjsj="+cjjsj[i]+",xfgsdj="+fgsdj[i]+",xgdj="+gdj[i];
			sql+=" ,xsfycx='"+sfycx+"',xcxkssj=TO_DATE('"+cxkssj[i]+"','YYYY-MM-DD'),xcxjzsj=TO_DATE('"+cxjzsj[i]+"','YYYY-MM-DD')";
			sql+=" ,xcxcj="+cxcj[i]+",xcxcjjsj="+cxcjjsj[i]+",xcxfgsdj="+cxfgsdj[i]+",xcxgdj="+cxgdj[i];
			sql+=" where clbm='"+clbm[i]+"' and dwbh='"+dwbh+"' ";
//			out.println(sql);
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}

	}

	sql=" update cl_jgmx set cj=xcj,cjjsj=xcjjsj,fgsdj=xfgsdj,gdj=xgdj,sfycx=xsfycx,cxkssj=xcxkssj,cxjzsj=xcxjzsj,cxcj=xcxcj,cxcjjsj=xcxcjjsj,cxfgsdj=xcxfgsdj,cxgdj=xcxgdj    ,xjgsfgx='2',xjgsxsj=null,xcj=null,xcjjsj=null,xfgsdj=null,xgdj=null,xsfycx=null,xcxkssj=null,xcxjzsj=null,xcxcj=null,xcxcjjsj=null,xcxfgsdj=null,xcxgdj=null";
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

