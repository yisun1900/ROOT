<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mdjgqjbm=null;
String mdjgqj=null;
long qskd=0;
long zzkd=0;
long qsgd=0;
long zzgd=0;
mdjgqjbm=cf.GB2Uni(request.getParameter("mdjgqjbm"));
mdjgqj=cf.GB2Uni(request.getParameter("mdjgqj"));
String mlx=request.getParameter("mlx");
ls=request.getParameter("qskd");
try{
	if (!(ls.equals("")))  qskd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qskd������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʼ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zzkd");
try{
	if (!(ls.equals("")))  zzkd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zzkd������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ֹ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("qsgd");
try{
	if (!(ls.equals("")))  qsgd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qsgd������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʼ�߶�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zzgd");
try{
	if (!(ls.equals("")))  zzgd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zzgd������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ֹ�߶�]����ת����������:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into jdm_mdjgqj ( mdjgqjbm,mdjgqj,qskd,zzkd,qsgd,zzgd,mlx ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mdjgqjbm);
	ps.setString(2,mdjgqj);
	ps.setLong(3,qskd);
	ps.setLong(4,zzkd);
	ps.setLong(5,qsgd);
	ps.setLong(6,zzgd);
	ps.setString(7,mlx);
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
	out.print("����ʧ��,��������: " + e);
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