<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//���ӱ����м�����
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//���ӱ����и߼�����
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//���ӱ��۸߼�����

String yhdlm=(String)session.getAttribute("yhdlm");
String xzgycl = request.getParameter("xzgycl");
String[] wybh = request.getParameterValues("wybh");
String gycl = cf.GB2Uni(request.getParameter("gycl"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String scbz=null;
String czlx=null;

String xmbh=null;
String xmmc=null;

try {
	conn=cf.getConnection();    //�õ�����

	if (xzgycl.equals("a"))
	{
		out.println("�滻���գ�"+dzbjzjmc+"���ղ��ϼ��<BR>");
	}
	else if (xzgycl.equals("b"))
	{
		out.println("�滻���գ�"+dzbjzgjmc+"���ղ��ϼ��<BR>");
	}
	else if (xzgycl.equals("c"))
	{
		out.println("�滻���գ�"+dzbjgjmc+"���ղ��ϼ��<BR>");
	}
	else if (xzgycl.equals("all"))
	{
		out.println("�滻���գ�ȫ��<BR>");
	}

	conn.setAutoCommit(false);

	for (int i=0;i<wybh.length ;i++ )
	{
		ls_sql="select xmbh,xmmc";
		ls_sql+=" from bj_jzbjb";
		ls_sql+= " where wybh='"+wybh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xmbh=rs.getString("xmbh");
			xmmc=rs.getString("xmmc");
		}
		rs.close();
		ps.close();

		if (xzgycl.equals("a"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set agycl='"+gycl+"',lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
		else if (xzgycl.equals("b"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set bgycl='"+gycl+"',lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
		else if (xzgycl.equals("c"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set cgycl='"+gycl+"',lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
		else if (xzgycl.equals("all"))
		{
			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set agycl='"+gycl+"',bgycl='"+gycl+"',cgycl='"+gycl+"',lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where wybh='"+wybh[i]+"'";
		}
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()==1)
		{
			out.println("<BR>��š�"+(i+1)+"�������Ϊ��"+xmbh+"������Ŀ��"+xmmc+"�����޸�");
		}
		ps.close();
	}

	conn.commit();
		
	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
