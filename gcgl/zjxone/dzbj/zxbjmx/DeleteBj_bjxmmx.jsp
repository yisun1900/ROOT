<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");
String[] xh=request.getParameterValues("xhbox");
String dqbm=cf.executeQuery("select sq_dwxx.dqbm from crm_zxkhxx,sq_dwxx where crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'");
if (dqbm==null || dqbm.equals(""))
{
	out.println("�����޵�������");
	return;
}
Connection conn = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		out.println("��������������ɣ��������޸�");
		return;
	}

	String bjjbbm=null;
	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=rs.getString(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<xh.length ;i++ )
	{
		String xmbh=null;
		ls_sql="SELECT xmbh";
		ls_sql+=" FROM bj_bjxmmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xmbh=rs.getString(1);
		}
		rs.close();
		ps.close();

		String sfbxx="";
		ls_sql="SELECT sfbxx";
		ls_sql+=" FROM bj_jzbjb";
		ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfbxx=cf.fillNull(rs.getString(1));
		}
		rs.close();
		ps.close();

		if (sfbxx.equals("1"))//1���ر��2�������3����ѡ�9��������
		{
			out.println("<BR>���ѣ���Ŀ��"+xmbh+"���Ǳر������ɾ��");
			continue;
		}
		else if (sfbxx.equals("2"))//1���ر��2�������3����ѡ�9��������
		{
			out.println("<BR>���ѣ���Ŀ��"+xmbh+"���Ǳ��������ɾ��");
			continue;
		}

		
		ls_sql="delete from bj_gclmxh ";
		ls_sql+=" where xmbh='"+xmbh+"'";
		ls_sql+=" and zjxxh='"+zjxxh+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		ls_sql="delete from bj_khglfxbh ";
		ls_sql+=" where xmbh=(select xmbh from bj_bjxmmxh where zjxxh='"+zjxxh+"' and xh="+xh[i]+")";
		ls_sql+=" and zjxxh='"+zjxxh+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


//		out.println(ls_sql);
/*
		ls_sql="delete from bj_dwgclzcyl ";
		ls_sql+=" where xmbh='"+xmbh+"'";
		ls_sql+=" and zjxxh='"+zjxxh+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/
		ls_sql="delete from bj_bjxmmxh ";
		ls_sql+=" where  zjxxh='"+zjxxh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	//������ţ�ɾ���м�պ�
	int pxxh=0;
	String lsxh=null;
	ls_sql="SELECT xh";
	ls_sql+=" FROM bj_bjxmmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ls_sql+=" order by xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lsxh=rs.getString(1);

		pxxh++;

		ls_sql="update bj_bjxmmxh set xmpx="+pxxh+" where zjxxh='"+zjxxh+"' and xh="+lsxh;
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}
%>