<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sqxh=null;
String ls=null;
String dwbh=null;
java.sql.Date sqrq=null;
String sqr=null;
String fymc=null;
double sxje=0;
String bz=null;
//�Զ��������
String ls_sql2=null;
int xh=0;
String xhs=null;
ls_sql2="select NVL(max(TO_NUMBER(sqxh))+1,1)";
ls_sql2+=" from  xz_bgfysbb";
xhs=cf.executeQuery(ls_sql2);
xh=Integer.parseInt(xhs);
sqxh=cf.addZero(xh,7);

dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
sqr=cf.GB2Uni(request.getParameter("sqr"));
fymc=cf.GB2Uni(request.getParameter("fymc"));
ls=request.getParameter("sxje");
try{
	if (!(ls.equals("")))  sxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sxje������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}

bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into xz_bgfysbb ( dwbh,sqrq,sqr,fymc,sxje,bz,sqxh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setDate(2,sqrq);
	ps.setString(3,sqr);
	ps.setString(4,fymc);
	ps.setDouble(5,sxje);
	ps.setString(6,bz);
	ps.setString(7,sqxh);
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