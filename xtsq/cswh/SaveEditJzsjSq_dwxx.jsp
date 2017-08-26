<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010118")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

String[] jzrqStr=request.getParameterValues("jzrq");
String[] jzsjStr=request.getParameterValues("jzsj");

int jzrq=0;
int jzsj=0;

//����Ƿ�����ĩ��ת
//���أ� -1:����;0:��ȫ����ת��1:ֻ�����һ��δ��ת;2:�����������δ��ת

int jzMark=cf.checkYjQmjz("cw_qmjz",dwbh);

if (jzMark>0)
{
//	out.println("����δ��ת�����ܵ���תʱ�䣡"+jzMark);
//	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from sq_yjjzsj ";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<jzrqStr.length ;i++ )
	{
		
		if (jzrqStr[i]==null || jzrqStr[i].trim().equals(""))
		{
			continue;
		}

		jzrq=Integer.parseInt(jzrqStr[i]);
		jzsj=Integer.parseInt(jzsjStr[i]);

		ls_sql="insert into sq_yjjzsj (dwbh,jzrq,jzsj ) ";
		ls_sql+=" values(?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dwbh);
		ps.setInt(2,jzrq);
		ps.setInt(3,jzsj);
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
	out.print("Exception: " + e);
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