<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010216")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%

String ssfgs=request.getParameter("ssfgs");
String dwbh=request.getParameter("dwbh");
String yhmc=cf.GB2Uni(request.getParameter("yhmc"));
String sfzh=cf.GB2Uni(request.getParameter("sfzh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String yhdlm="0";
String yhkl="0";
String sfzszg="";

try {
	conn=cf.getConnection();


	ls_sql="select yhdlm,yhkl,sfzszg ";
	ls_sql+=" from sq_yhxx ";
	ls_sql+=" where zwbm='04' and ssfgs='"+ssfgs+"' and dwbh='"+dwbh+"' and yhmc='"+yhmc+"' and sfzh='"+sfzh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
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


	yhkl=cf.makejm(yhkl);

	if (yhkl.equals("0"))
	{
		out.println("���󣡸��û�������");
	}
	else if (yhdlm.equals(""))
	{
		out.println("����δȡ���û��������δ��Ȩ");
	}
	else{
		out.println("�û���½����"+yhdlm+"���û����"+yhkl);

		ls_sql="update sq_yhxx set lxdlsbcs=0,sccgdlsj=SYSDATE ";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
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