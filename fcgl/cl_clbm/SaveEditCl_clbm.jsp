<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String clbm=null;
String clmc=null;
String clgg=null;
String lrjsfs=null;
String lrbfb=null;
String bz=null;
String jldwmc=null;
String cldlmc=null;
double bfb=0;
clbm=cf.GB2Uni(request.getParameter("clbm"));
clmc=cf.GB2Uni(request.getParameter("clmc"));
clgg=cf.GB2Uni(request.getParameter("clgg"));
lrjsfs=cf.GB2Uni(request.getParameter("lrjsfs"));
lrbfb=cf.GB2Uni(request.getParameter("lrbfb"));
bz=cf.GB2Uni(request.getParameter("bz"));
jldwmc=cf.GB2Uni(request.getParameter("jldwmc"));
cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
if (lrjsfs.equals("2"))
{
	try
		{
		bfb = Double.parseDouble(lrbfb);
		}
	catch(Exception e){
		out.print("[����ٷֱ�]���ָ�ʽ����ȷ������ȷ��");
		return;
		}
}


String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
String wxr=cf.GB2Uni(request.getParameter("wxr"));
String lx=cf.GB2Uni(request.getParameter("lx"));
String paixu=cf.GB2Uni(request.getParameter("paixu"));

if (lrjsfs.equals("1")){bfb=0;}

String whereclbm=cf.GB2Uni(request.getParameter("whereclbm"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update cl_clbm set clbm=?,clmc=?,clgg=?,jldwmc=?,lrjsfs=?,lrbfb=?,cldlmc=?,bz=?,lrr=?,lrsj=?,wxr=?,lx=?,paixu=? ";
	ls_sql+=" where clbm='"+whereclbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clbm);
	ps.setString(2,clmc);
	ps.setString(3,clgg);
	ps.setString(4,jldwmc);
	ps.setString(5,lrjsfs);
	ps.setDouble(6,bfb);
	ps.setString(7,cldlmc);
	ps.setString(8,bz);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,wxr);
	ps.setString(12,lx);
	ps.setString(13,paixu);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>