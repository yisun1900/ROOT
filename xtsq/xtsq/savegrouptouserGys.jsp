<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"700707")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%

String ls=null;
String yhdlm=request.getParameter("yhdlm");
String[] yhzbh=request.getParameterValues("yhzbh");
String wheresql="";

if (yhzbh!=null)
{
	for (int i=0;i<yhzbh.length ; i++)
	{
		if (i==0)
		{
			wheresql+="'"+yhzbh[i]+"'";
		}
		else{
			wheresql+=",'"+yhzbh[i]+"'";
		}
	}
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from sq_yhssz  where yhdlm='"+yhdlm+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (yhzbh!=null)
	{
		ls_sql="insert into sq_yhssz (yhdlm,yhzbh) ";
		ls_sql+=" select '"+yhdlm+"',yhzbh from sq_yhz where yhzbh in("+wheresql+") ";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

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
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>