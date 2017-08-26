<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] hfjlh=request.getParameterValues("hfjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	for (int i=0;i<hfjlh.length ;i++ )
	{
		String khbh="";
		String lx="";
		ls_sql="select khbh,lx";
		ls_sql+=" from  crm_fdkhhf";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			lx=cf.fillNull(rs.getString("lx"));
		}
		rs.close();
		ps.close();

		String ywy="";
		ls_sql="select ywy";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ywy=cf.fillNull(rs.getString("ywy"));
		}
		rs.close();
		ps.close();



		String clzt="";
		ls_sql="select clzt";
		ls_sql+=" from  crm_qysbdj";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=cf.fillNull(rs.getString("clzt"));
		}
		rs.close();
		ps.close();

		if (!clzt.equals("5"))//1�����ʦ�ύ��2����ˡ�3���г�����ˡ�4���Ӵ�������ˡ�5���ط�
		{
			conn.rollback();
			out.println("����״̬����ȷ");
			return;
		}

		ls_sql="update crm_qysbdj set clzt='2',hfjlh=null,hfr=null,hfsj=null,hfsbyybm=null,hfsbkhlx=null,hfsbyyxs=null,hfwhkh=null";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_zxkhxx set zxzt='4',hfwhkh=null,sjhfsbyybm=null,sjhfsbkhlx=null,sjhfsbyyxs=null,sjhfsbsj=null";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


	
		ls_sql="delete from crm_fdkhhf ";
		ls_sql+=" where hfjlh='"+hfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}



	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("Exception: " + ls_sql);
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