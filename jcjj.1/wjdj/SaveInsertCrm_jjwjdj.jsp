<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjwjr=null;
java.sql.Date jjwjsj=null;
jjwjr=cf.GB2Uni(request.getParameter("jjwjr"));
ls=request.getParameter("jjwjsj");
try{
	if (!(ls.equals("")))  jjwjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jjwjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int zcsl=0;
int jjsl=0;
int mmsl=0;
int cgsl=0;
int js=0;

try {
	conn=cf.getConnection();

	//����Ƿ��������
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_mmydd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('20','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mmsl=rs.getInt(1);
		js+=mmsl;
	}
	rs.close();
	ps.close();
	if (mmsl>0)
	{
		out.println("<BR>������ľ�Ŷ������봦�ڣ���������ᡢȡ��Ԥ�������˵�������״̬���С�"+mmsl+"��������������Ҫ��");
	}

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_cgdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('35','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cgsl=rs.getInt(1);
		js+=cgsl;
	}
	rs.close();
	ps.close();
	if (cgsl>0)
	{
		out.println("<BR>�����󣬳��񶩵����봦�ڣ���������ᡢȡ��Ԥ�������˵�������״̬���С�"+cgsl+"��������������Ҫ��");
	}

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_jjdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('35','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjsl=rs.getInt(1);
		js+=jjsl;
	}
	rs.close();
	ps.close();
	if (jjsl>0)
	{
		out.println("<BR>�����󣬼Ҿ߶������봦�ڣ���������ᡢȡ��Ԥ�������˵�������״̬���С�"+jjsl+"��������������Ҫ��");
	}

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_zcdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('30','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsl=rs.getInt(1);
		js+=zcsl;
	}
	rs.close();
	ps.close();
	if (zcsl>0)
	{
		out.println("<BR>���������Ķ������봦�ڣ���������ᡢȡ��Ԥ�������˵�������״̬���С�"+zcsl+"��������������Ҫ��");
	}

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_zczjx ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('30','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsl=rs.getInt(1);
		js+=zcsl;
	}
	rs.close();
	ps.close();
	if (zcsl>0)
	{
		out.println("<BR>������������������봦�ڣ���������ᡢ�˵���2��״̬���С�"+zcsl+"��������������Ҫ��");
	}

	if (js>0)
	{
		out.println("<P>����������ֻ�����е�����ᣬ�������ͻ����");
		return;
	}

	ls_sql="update crm_khxx set jjwjbz='Y',jjwjr=?,jjwjsj=? ";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjwjr);
	ps.setDate(2,jjwjsj);
	ps.executeUpdate();
	ps.close();


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
	out.print("����ʧ��,��������: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
