<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String cgjhph=request.getParameter("cgjhph");
String[] clbm=request.getParameterValues("clbm");
String[] jhcgslStr=request.getParameterValues("jhcgsl");
String[] jhcgdjstr=request.getParameterValues("jhcgdj");
double jhcgsl=0;
double jhcgdj=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jhdzt=null;
	ls_sql=" SELECT jhdzt ";
	ls_sql+=" FROM jxc_clcgjh ";
    ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jhdzt=cf.fillNull(rs.getString("jhdzt"));
	}
	rs.close();
	ps.close();

	if (!jhdzt.equals("0"))//0��δ�ύ��1���ȴ���ˣ�2�������ɣ�3���ѷֽ�ɶ�����5�����ڰ�����⣻9���ƻ����
	{
		out.print("���󣡲ɹ��ƻ�["+cgjhph+"]���ύ���������޸ģ�");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ; i++)
	{
		jhcgsl = Double.parseDouble(jhcgslStr[i]);
		jhcgdj = Double.parseDouble(jhcgdjstr[i].trim());

		ls_sql="update jxc_cgjhmx set jhcgsl=?,jhcgdj=?,jhcgje=? ";
		ls_sql+=" where clbm='"+clbm[i]+"'  and cgjhph='"+cgjhph+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,jhcgsl);
		ps.setDouble(2,jhcgdj);
		ps.setDouble(3,jhcgsl*jhcgdj);
		ps.executeUpdate();
		ps.close();

	}




	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>