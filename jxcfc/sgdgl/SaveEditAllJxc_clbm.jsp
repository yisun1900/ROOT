<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String sgph=request.getParameter("sgph");
String[] clbm=request.getParameterValues("clbm");
String[] sgslStr=request.getParameterValues("sgsl");
String[] sgjgstr=request.getParameterValues("sgjg");
double sgsl=0;
double sgjg=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sgdzt=null;
	ls_sql=" SELECT sgdzt ";
	ls_sql+=" FROM jxc_clsgd ";
    ls_sql+=" where sgph='"+sgph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdzt=cf.fillNull(rs.getString("sgdzt"));
	}
	rs.close();
	ps.close();

	if (!sgdzt.equals("0"))//0��δ�ύ��1�����ύ��2�����ͨ����5�����ֳ��⣻3���ѳ��⣻4�������
	{
		out.print("�����깺��["+sgph+"]���ύ���������޸ģ�");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ; i++)
	{
		sgsl = Double.parseDouble(sgslStr[i]);
		sgjg = Double.parseDouble(sgjgstr[i].trim());

		ls_sql="update jxc_clsgmx set sgsl=?,sgjg=?,sgje=?,shsl=?,shjg=?,shje=?";
		ls_sql+=" where clbm='"+clbm[i]+"'  and sgph='"+sgph+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sgsl);
		ps.setDouble(2,sgjg);
		ps.setDouble(3,sgsl*sgjg);
		ps.setDouble(4,sgsl);
		ps.setDouble(5,sgjg);
		ps.setDouble(6,sgsl*sgjg);
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