<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String psdh=request.getParameter("psdh");
String[] clbm=request.getParameterValues("clbm");
String[] gdj=request.getParameterValues("gdj");
String[] pssl=request.getParameterValues("pssl");

double psje=0;
double sjckdj=0;
double sjpssl=0;
double sumpssl=0;
double sumpsje=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String pszt=null;
	String khbh=null;
	ls_sql=" SELECT pszt,khbh ";
	ls_sql+=" FROM cl_psd ";
    ls_sql+=" where psdh='"+psdh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pszt=cf.fillNull(rs.getString("pszt"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	if (!pszt.equals("1"))//1��δ�ύ��2�����ύ��3��������
	{
		out.print("�������ύ���������޸�");
		return;
	}


	conn.setAutoCommit(false);
/***********************************************************\
|		�޸Ĳ�����������										|
\***********************************************************/
	for (int i=0;i<clbm.length ; i++)
	{
		try
			{
			sjckdj = Double.parseDouble(gdj[i]);
			}
		catch(Exception e){
			conn.rollback();
			out.print("[���͵���]���ָ�ʽ����ȷ������ȷ��");
			return;
			}
		try
			{
			sjpssl = Double.parseDouble(pssl[i]);
			}
		catch(Exception e){
			conn.rollback();
			out.print("[��������]���ָ�ʽ����ȷ������ȷ��");
			return;
			}

			psje=sjckdj*sjpssl;


/*******************************************************\
|		������������������ʼ���������������������ͬ		|
\*******************************************************/
		ls_sql="update cl_psdmx set gdj="+sjckdj+",pssl="+sjpssl+",psje="+psje;
		ls_sql+=" where psdh='"+psdh+"' and clbm='"+cf.GB2Uni(clbm[i])+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}
/************************************************************
|		��ѯɾ������������									|
*************************************************************/
	ls_sql=" SELECT sum(pssl),sum(psje) ";
	ls_sql+=" FROM cl_psdmx ";
    ls_sql+=" where psdh='"+psdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sumpssl=rs.getDouble(1);
		sumpsje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

/************************************************************
|		���²��ϳ��ⵥ�е�����									|
*************************************************************/
	ls_sql="update cl_psd set pszsl="+sumpssl+",pszje="+sumpsje;
	ls_sql+=" where psdh='"+psdh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();



	double zjfje = 0;
	ls_sql="SELECT qye";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjfje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double xjpsje=0;
	ls_sql=" SELECT sum(pszje) FROM cl_psd where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		xjpsje = rs.getDouble(1);
	}
	rs.close();
	ps.close();

/*
	if (xjpsje>zjfje*0.25 || xjpsje<zjfje*0.18)
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("�������ͱ������ѣ�ֱ�ӷѡ�<%=zjfje%>���������ܶ<%=xjpsje%>������ǰ���ͱ�����<%=Math.round(xjpsje/zjfje*10000)/100%>%��");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
*/


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
	out.print("����ʧ��,��������: " + e);
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