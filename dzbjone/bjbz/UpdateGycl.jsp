<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
String[] xmbh = request.getParameterValues("xmbh");
String gycl = cf.GB2Uni(request.getParameter("gycl"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String xmmc=null;
String bjjbmc=null;

try {
	conn=cf.getConnection();    //�õ�����


	conn.setAutoCommit(false);

	for (int i=0;i<xmbh.length ;i++ )
	{
		ls_sql="select xmmc";
		ls_sql+=" from bj_jzbjb";
		ls_sql+= " where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xmmc=rs.getString("xmmc");

			ls_sql="select bjjbmc";
			ls_sql+=" from bdm_bjjbbm";
			ls_sql+= " where bjjbbm='"+bjjbbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				bjjbmc=rs1.getString("bjjbmc");
			}
			rs1.close();
			ps1.close();

			ls_sql = "update bj_jzbjb ";
			ls_sql+= " set gycl='"+gycl+"',lrr='"+yhmc+"',lrsj=trunc(SYSDATE)";
			ls_sql+= " where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+xmbh[i]+"'";
			ps1= conn.prepareStatement(ls_sql);
			if (ps1.executeUpdate()==1)
			{
				out.println("<BR>��Ŀ��š�"+xmbh[i]+"����"+xmmc+"�������ۼ���"+bjjbmc+"�����޸�");
			}
			ps1.close();
		}
		rs.close();
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
