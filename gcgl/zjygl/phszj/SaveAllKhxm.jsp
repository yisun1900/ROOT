<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrph = request.getParameter("lrph");
String[] khbh=request.getParameterValues("khbh");
String[] zjxm=request.getParameterValues("zjxm");
String[] lrxh=request.getParameterValues("lrxh");
String[] sgbz=request.getParameterValues("sgbz");

String ls=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int count=0;

try {
	conn=cf.getConnection();

	int ii=0;
	for (int i=0;i<khbh.length ;i++ )
	{
		if (zjxm[i].equals(""))
		{
			out.println("<BR>*****�������Ϊ:"+lrxh[i]+"�Ŀͻ����["+khbh[i]+"]���̵���Ϊ��");
			ii++;
		}
		if (sgbz[i].equals(""))
		{
			out.println("<BR>���棡���Ϊ:"+lrxh[i]+"�Ŀͻ����["+khbh[i]+"]ʩ������Ϊ��");
		}
	}
	if (ii>0)
	{
		out.println("<BR>*****����ʧ�ܣ���");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<khbh.length ;i++ )
	{

		ls_sql="update crm_khxx set zjxm=?,sgbz=?";
		ls_sql+=" where  khbh='"+khbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cf.GB2Uni(zjxm[i]));
		ps.setString(2,cf.GB2Uni(sgbz[i]));
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_lrphmx set sfsz='N',xzjxm=?,xsgbz=?";
		ls_sql+=" where  khbh='"+khbh[i]+"' and lrph="+lrph;
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,cf.GB2Uni(zjxm[i]));
		ps.setString(2,cf.GB2Uni(sgbz[i]));
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	for (int i=0;i<khbh.length ;i++ )
	{
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where zjxm='"+cf.GB2Uni(zjxm[i])+"' and kgrq=(select kgrq from crm_khxx where khbh='"+khbh[i]+"')";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		ps.close();
		rs.close();

		if (count>1)
		{
			out.println("<BR>*****���棡���Ϊ:"+lrxh[i]+"�Ŀͻ����["+khbh[i]+"]�Ĺ��̵���["+cf.GB2Uni(zjxm[i])+"]������["+count+"]�����ؿ���");
		}

	}

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>