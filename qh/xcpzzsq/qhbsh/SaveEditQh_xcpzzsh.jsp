<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String tbr=null;
String qhbshyj=null;
String qhbshr=null;
String bz=null;
tbr=cf.GB2Uni(request.getParameter("tbr"));
bz=cf.GB2Uni(request.getParameter("bz"));
qhbshyj=cf.GB2Uni(request.getParameter("qhbshyj"));
String whereshbbh=null;
whereshbbh=(String)session.getAttribute("shbbh");
long sl=0;
double jg=0;
double fyzj=0;
java.sql.Date yjwcsj=null;
java.sql.Date sjwcsj=null;
java.sql.Date qhbshsj=null;
ls=request.getParameter("qhbshsj");
try{
	if (!(ls.equals("")))  qhbshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qhbshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�󻮲����ʱ��]����ת����������:"+e);
	return;
}

ls=request.getParameter("jg");
try{
	if (!(ls.equals("")))  jg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jg������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۸�]����ת����������:"+e);
	return;
}
ls=request.getParameter("fyzj");
try{
	if (!(ls.equals("")))  fyzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fyzj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ܼ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjwcsj");
try{
	if (!(ls.equals("")))  yjwcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yjwcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ԥ�����ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjwcsj");
try{
	if (!(ls.equals("")))  sjwcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjwcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�����ʱ��]����ת����������:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update qh_xcpzzsh set tbr=?,qhbshsj=?,jg=?,fyzj=?,yjwcsj=?,sjwcsj=?,qhbshyj=?,bz=? ";
	ls_sql+=" where  (shbbh='"+whereshbbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tbr);
	ps.setDate(2,qhbshsj);
	ps.setDouble(3,jg);
	ps.setDouble(4,fyzj);
	ps.setDate(5,yjwcsj);
	ps.setDate(6,sjwcsj);
	ps.setString(7,qhbshyj);
	ps.setString(8,bz);
	
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>�޸����ݿ�ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("�ɹ����棡");
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