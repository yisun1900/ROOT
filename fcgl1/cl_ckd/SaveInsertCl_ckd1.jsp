<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String ckph=null;
String dwbh=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String ckr=null;
java.sql.Date cksj=null;
khbh="0";
ckph=cf.GB2Uni(request.getParameter("ckph"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
ckr=cf.GB2Uni(request.getParameter("ckr"));
ls=request.getParameter("cksj");
String jzph=dwbh+ls.substring(0,4)+ls.substring(5,7);

try{
	if (!(ls.equals("")))  cksj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cksj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*) ";
	ls_sql+="  from cl_ydjz where dwbh='"+dwbh+"' and  jzph='"+jzph+"' ";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1); 
	} 
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("���󣡱����ѽ�ת�������ٽ��г��������������������ɾ����ת��¼");
		return;
	}

	ls_sql="insert into cl_ckd ( khbh,ckph,dwbh,ckzt,lrr,lrsj,bz,ckr,cksj,ckzsl,ckzje) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,0,0) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,ckph);
	ps.setString(3,dwbh);
	ps.setString(4,"1");
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,bz);
	ps.setString(8,ckr);
	ps.setDate(9,cksj);
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
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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
