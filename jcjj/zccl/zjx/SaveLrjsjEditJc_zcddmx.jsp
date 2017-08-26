<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
double jsbl=0;
double cbj=0;
ls=request.getParameter("jsbl");
try{
	if (!(ls.equals("")))  jsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jsbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("cbj");
try{
	if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
	return;
}

String zjxbh=request.getParameter("zjxbh");
String xh=request.getParameter("xh");
String jsfs=request.getParameter("jsfs");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ddbh=null;
	String sxhtsfysh=null;
	String sfjs="";
	ls_sql =" select ddbh,sxhtsfysh,sfjs";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ddbh=rs.getString("ddbh");
		sxhtsfysh=rs.getString("sxhtsfysh");
		sfjs=cf.fillNull(rs.getString("sfjs"));
	}
	rs.close();
	ps.close();

	if (!sxhtsfysh.equals("N"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ���д��ͬ�����");
		return;
	}

	if (!sfjs.equals("N") && !sfjs.equals("C"))//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M�����������
	{
		out.println("<BR>�����ѽ��㲻�����޸�");
		return;
	}

	conn.setAutoCommit(false);
	
	if (jsfs.equals("2"))//1������ۣ�2���������
	{
		ls_sql="update jc_zcddmx set cbj=?,jsbl=?";
		ls_sql+=" where xh="+xh;
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cbj);
		ps.setDouble(2,jsbl);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update jc_zcddmx set cbj=? ";
		ls_sql+=" where xh="+xh;
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,cbj);
		ps.executeUpdate();
		ps.close();
	}
	
	ls_sql="update jc_zczjxmx set zjcbje=zjsl*?";
	ls_sql+=" where zjxbh='"+zjxbh+"' and xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,cbj);
	ps.executeUpdate();
	ps.close();

	//���������jc_zczjx��:�������ܶ�
	double zjxcbze=0;
	ls_sql="select sum(zjcbje) ";
	ls_sql+=" from jc_zczjxmx ";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxcbze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zczjx set zjxcbze="+zjxcbze;
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//���ɶ���
	ls_sql="update jc_jcdd set cbje="+zjxcbze;
	ls_sql+=" where  gjz='"+zjxbh+"' and lx='4' and czlx='2'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="select sum(zjxcbze)";
	ls_sql+=" from jc_zczjx ";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt!='00'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxcbze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_zcdd set zjxcbze="+zjxcbze;
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("Exception: " + e);
	out.print("<BR>sql=" + ls_sql);
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