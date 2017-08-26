<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] fkxh=request.getParameterValues("fkxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<fkxh.length ;i++ )
	{
		String jsjlh="";
		ls_sql =" select jsjlh";
		ls_sql+=" from jc_gysjsfkjl";
		ls_sql+=" where fkxh='"+fkxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jsjlh=cf.fillNull(rs.getString("jsjlh"));
		}
		rs.close();
		ps.close();

		ls_sql =" delete from jc_gysjsfkjl";
		ls_sql+=" where fkxh='"+fkxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		double jsje=0;
		ls_sql =" select jsje";
		ls_sql+=" from jc_gysjs";
		ls_sql+=" where jsjlh='"+jsjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jsje=rs.getDouble("jsje");
		}
		rs.close();
		ps.close();


		double ljfkbl=0;
		double ljfkje=0;
		ls_sql =" select sum(fkbl) fkbl,sum(fkje) fkje";
		ls_sql+=" from jc_gysjsfkjl";
		ls_sql+=" where jsjlh='"+jsjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ljfkbl=rs.getDouble("fkbl");
			ljfkje=rs.getDouble("fkje");
		}
		rs.close();
		ps.close();

		if (jsje!=0)
		{
			ljfkbl=cf.round(ljfkje*100/jsje,2);
		}
		else{
			ljfkbl=0;
		}

		String shbz="";//N��δ��ˣ�Y����ˣ�S�����ָ��F���������
		String sfjs="";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�S�����ָ���
		if (ljfkbl==0)
		{
			shbz="Y";
			sfjs="M";
		}
		else if (ljfkbl>=100)
		{
			shbz="F";
			sfjs="F";
		}
		else{
			shbz="S";
			sfjs="S";
		}

		ls_sql="update jc_gysjs set fkbl=?,fkje=?,shbz=?";
		ls_sql+=" where jsjlh='"+jsjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,ljfkbl);
		ps.setDouble(2,ljfkje);
		ps.setString(3,shbz);
		ps.executeUpdate();
		ps.close();



		String ddbh=null;
		ls_sql =" select ddbh";
		ls_sql+=" from jc_gysjsmx";
		ls_sql+=" where jsjlh="+jsjlh;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			ddbh=cf.fillNull(rs1.getString("ddbh"));

		if (ddbh.length()==9)
		{
			String getsfjs="";
			ls_sql =" select sfjs";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getsfjs=cf.fillNull(rs.getString("sfjs"));
			}
			rs.close();
			ps.close();

			if (!getsfjs.equals("F") && !getsfjs.equals("S"))
			{
				conn.rollback();
				out.println("<BR>���󣬶�����"+ddbh+"��δ��˻��Ѹ���:"+getsfjs);
				return;
			}

			ls_sql="update jc_zcdd set sfjs='"+sfjs+"' ";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶�S�����ָ���
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
		else{
			String getsfjs="";
			ls_sql =" select sfjs";
			ls_sql+=" from jc_zczjx";
			ls_sql+=" where zjxbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getsfjs=cf.fillNull(rs.getString("sfjs"));
			}
			rs.close();
			ps.close();

			if (!getsfjs.equals("F") && !getsfjs.equals("S"))
			{
				conn.rollback();
				out.println("<BR>���������"+ddbh+"��δ��˻��Ѹ���");
				return;
			}

			ls_sql="update jc_zczjx set sfjs='"+sfjs+"' ";
			ls_sql+=" where zjxbh='"+ddbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		}
		rs1.close();
		ps1.close();
	}


	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ������ɹ���");
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
