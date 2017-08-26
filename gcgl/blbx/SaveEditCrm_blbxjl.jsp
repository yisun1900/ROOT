<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kbxbz=null;
String bxlbbm=null;
java.sql.Date bxkssj=null;
java.sql.Date bxjzsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bxsm=null;
kbxbz=cf.GB2Uni(request.getParameter("kbxbz"));
bxlbbm=cf.GB2Uni(request.getParameter("bxlbbm"));
ls=request.getParameter("bxkssj");
try{
	if (!(ls.equals("")))  bxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bxkssj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���޿�ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("bxjzsj");
try{
	if (!(ls.equals("")))  bxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[bxjzsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���޽�ֹʱ��]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bxsm=cf.GB2Uni(request.getParameter("bxsm"));

String[] xzbxxm=request.getParameterValues("xzbxxm");
String[] bxxm=request.getParameterValues("bxxm");
String[] qksm=request.getParameterValues("qksm");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_blbxjl set kbxbz=?,bxlbbm=?,bxkssj=?,bxjzsj=?,lrr=?,lrsj=?,lrbm=?,bxsm=? ";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kbxbz);
	ps.setString(2,bxlbbm);
	ps.setDate(3,bxkssj);
	ps.setDate(4,bxjzsj);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
	ps.setString(8,bxsm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set kbxbz=?,bxkssj=?,bxjzsj=?";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kbxbz);
	ps.setDate(2,bxkssj);
	ps.setDate(3,bxjzsj);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_khbxxm";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (bxxm!=null)
	{
		ls_sql="insert into crm_khbxxm(khbh,bxxm,sfbx,qksm)";
		ls_sql+=" select '"+khbh+"',bxxm,'N',''";
		ls_sql+=" from crm_bxxmbm";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (!kbxbz.equals("N"))
		{
			for (int i=0;i<xzbxxm.length ;i++ )
			{
				ls_sql="update crm_khbxxm set sfbx='Y'";
				ls_sql+="  where khbh='"+khbh+"' and bxxm='"+cf.GB2Uni(xzbxxm[i])+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		}

		for (int i=0;i<bxxm.length ;i++ )
		{
			ls_sql="update crm_khbxxm set qksm='"+cf.GB2Uni(qksm[i])+"'";
			ls_sql+="  where khbh='"+khbh+"' and bxxm='"+cf.GB2Uni(bxxm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	conn.commit();

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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>