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
String clfzd = request.getParameter("clfzd");
String[] wybh = request.getParameterValues("wybh");
String clfgs = request.getParameter("clfgs");

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

	if (clfzd.equals("clf"))
	{
		out.println("�޸Ĳ��Ϸѣ�"+dzbjzjmc+"<BR>");
	}
	else if (clfzd.equals("bclf"))
	{
		out.println("�޸Ĳ��Ϸѣ�"+dzbjzgjmc+"<BR>");
	}
	else if (clfzd.equals("cclf"))
	{
		out.println("�޸Ĳ��Ϸѣ�"+dzbjgjmc+"<BR>");
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

		ls_sql = "update bj_jzbjb ";
		ls_sql+= " set "+clfzd+"="+clfgs+",lrr='"+yhdlm+"',lrsj=trunc(SYSDATE)";
		ls_sql+= " where wybh='"+wybh[i]+"'";
//		out.println(ls_sql);
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
	alert("���۳ɹ���");
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