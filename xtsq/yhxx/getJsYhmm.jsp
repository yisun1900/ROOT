<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010217")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%

String ssfgs=request.getParameter("ssfgs");
String dwbh=request.getParameter("dwbh");
String yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
String yhmc=cf.GB2Uni(request.getParameter("yhmc"));
String sfzh=cf.GB2Uni(request.getParameter("sfzh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String yhkl="0";
String sfzszg="";

try {
	conn=cf.getConnection();


	ls_sql="select yhkl,sfzszg ";
	ls_sql+=" from sq_yhxx ";
	ls_sql+=" where yhjs in('F0','F1','F2') and yhdlm='"+yhdlm+"' and ssfgs='"+ssfgs+"' and dwbh='"+dwbh+"' and yhmc='"+yhmc+"' and sfzh='"+sfzh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		yhkl=cf.fillNull(rs.getString("yhkl"));
		sfzszg=cf.fillNull(rs.getString("sfzszg"));
	}
	rs.close();
	ps.close();

	if (sfzszg.equals(""))
	{
		out.println("���󣡸��û�������");
		return;
	}
	else if (!sfzszg.equals("N") && !sfzszg.equals("Y"))
	{
		out.println("���󣡸��û�����ְ");
		return;
	}

	if (yhkl.equals("0"))
	{
		out.println("���󣡸��û�������");
	}
	else if (yhkl.equals(""))
	{
		out.println("���󣡿���Ϊ�ղ��ܵ�½");
	}
	else{

		ls_sql="update sq_yhxx set lxdlsbcs=0,kdlxtbz='Y',sccgdlsj=SYSDATE ";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		out.println("�����ɹ���");
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
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