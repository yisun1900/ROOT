<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] lrxh=request.getParameterValues("lrxh");
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double blzjxje=0;
double zjxze=0;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00��¼��δ���
	{
		out.println("��������������ɣ�������ɾ��");
		return;
	}

	conn.setAutoCommit(false);

	String lx=null;
	int ysl=0;
	int xsl=0;
	for (int i=0;i<lrxh.length ;i++ )
	{
		ls_sql="select lx,ysl,xsl";
		ls_sql+=" from  jc_blzjxmx";
		ls_sql+=" where zjxxh='"+zjxxh+"' and lrxh="+lrxh[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			lx=rs.getString("lx");
			ysl=rs.getInt("ysl");
			xsl=rs.getInt("xsl");
		}
		else{
			conn.rollback();
			out.println("���󣡲����ڵ�������");
			return;
		}
		rs.close();
		ps.close();

		ls_sql="delete from jc_blzjxmx ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and lrxh="+lrxh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (lx.equals("1"))//1��������Ŀ��2��������Ŀ
		{
			ls_sql="update jc_blddmx set zjhsl=?";
			ls_sql+=" where lrxh="+lrxh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,ysl);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="delete from jc_blddmx ";
			ls_sql+=" where lrxh="+lrxh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

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
	out.print("����ʧ��,��������: " + ls_sql);
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