<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jsjlh=request.getParameterValues("jsjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	for (int i=0;i<jsjlh.length ;i++ )
	{
		String spbz="";
		ls_sql="select spbz";
		ls_sql+=" from  cw_zjjsjl";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			spbz=rs.getString("spbz");
		}
		else{
			conn.rollback();
			out.println("���󣡽����¼�ţ�"+jsjlh[i]+"������");
			return;
		}
		rs.close();
		ps.close();

		if (!spbz.equals("1") && !spbz.equals("2"))
		{
			conn.rollback();
			out.println("���󣡽����¼�ţ�"+jsjlh[i]+"����״̬����ȷ");
			return;
		}

		String khbh="";
		String tclx="";
		ls_sql="select khbh,tclx";
		ls_sql+=" from  cw_zjjsmx";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			khbh=rs.getString("khbh");
			tclx=rs.getString("tclx");

			ls_sql=" update crm_khxx set zjjsbz='0',zjjsbl=null,zjjsje=null,zjjsjlh=null";
			ls_sql+=" where crm_khxx.khbh='"+khbh+"' ";//0��δ���㣻1���ѽ���
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		rs.close();
		ps.close();

		ls_sql="delete from cw_zjjsmx";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_zjqtfymx";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_zjjsjl";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


	}


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
	out.print("Exception: " + e);
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