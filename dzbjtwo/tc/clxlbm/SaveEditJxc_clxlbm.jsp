<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String clxlbm=null;
String clxlmc=null;
String cldlmc=null;
clxlmc=cf.GB2Uni(request.getParameter("clxlmc"));
cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
double tcslxz=0;
ls=request.getParameter("tcslxz");
try{
	if (!(ls.equals("")))  tcslxz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tcslxz]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ײ���������]����ת����������:"+e);
	return;
}
double ccbfjj=0;
ls=request.getParameter("ccbfjj");
try{
	if (!(ls.equals("")))  ccbfjj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ccbfjj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������ּӼ�]����ת����������:"+e);
	return;
}
String sfxzsl=cf.GB2Uni(request.getParameter("sfxzsl"));


String whereclxlbm=null;
whereclxlbm=cf.GB2Uni(request.getParameter("whereclxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String yclxlmc="";
String sfxg="N";
try {
	conn=cf.getConnection();
	//��ѯԭ����С������
	ls_sql=" select clxlmc ";
	ls_sql+=" from jxc_clxlbm ";
	ls_sql+=" where (clxlbm='"+whereclxlbm+"') ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		yclxlmc=rs.getString("clxlmc");
	}
	rs.close();
	ps.close();
	if (!(yclxlmc.equals(clxlmc)))
	{sfxg="Y";}

	conn.setAutoCommit(false);

	if (sfxg.equals("Y"))
	{
		//�޸�jxc_ckthd
		ls_sql=" update jxc_ckthd set clxlbm='"+clxlmc+"' where clxlbm='"+yclxlmc+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		out.print("��������Ѿ��޸ģ�");
		//�޸�jxc_ppxx
		ls_sql=" update jxc_ppxx set clxl='"+clxlmc+"' where clxl='"+yclxlmc+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		//�޸�jxc_clbm
		ls_sql=" update jxc_clbm set clxlbm='"+clxlmc+"' where clxlbm='"+yclxlmc+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		//�޸�jxc_kcb
		ls_sql=" update jxc_kcb set clxlbm='"+clxlmc+"' where clxlbm='"+yclxlmc+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		//�޸�jxc_djjmx
		ls_sql=" update jxc_djjmx set cldlmc='"+clxlmc+"' where cldlmc='"+yclxlmc+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		//�޸�jxc_djjflmx
		ls_sql=" update jxc_djjflmx set cldlmc='"+clxlmc+"' where cldlmc='"+yclxlmc+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update jxc_clxlbm set clxlmc=?,cldlmc=?,sfxzsl=?,tcslxz=?,ccbfjj=? ";
	ls_sql+=" where  (clxlbm='"+whereclxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clxlmc);
	ps.setString(2,cldlmc);
	ps.setString(3,sfxzsl);
	ps.setDouble(4,tcslxz);
	ps.setDouble(5,ccbfjj);
	ps.executeUpdate();
	ps.close();

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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>