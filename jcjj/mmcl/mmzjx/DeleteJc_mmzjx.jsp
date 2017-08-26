<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] zjxxh =request.getParameterValues("zjxxh");

String yddbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;

double mmzjxje=0;
double zjxze=0;

String clzt=null;
String lx=null;
double ysl=0;
double xsl=0;
int xh;
int lrxh;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<zjxxh.length ;i++ )
	{
		ls_sql="select yddbh,clzt";
		ls_sql+=" from  jc_mmzjx";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs= ps.executeQuery();
		if (rs.next())
		{
			yddbh=rs.getString("yddbh");
			clzt=rs.getString("clzt");
		}
		else{
			conn.rollback();
			out.println("<BR>������������ڣ����������="+zjxxh[i]);
			return;
		}
		rs.close();
		ps.close();

		if (!clzt.equals("00"))//00��¼��δ���
		{
			conn.rollback();
			out.println("<BR>��������������ɣ�������ɾ�������������="+zjxxh[i]);
			return;
		}

		//ɾ��ľ��������

		ls_sql="select xh,lx,ysl,xsl";
		ls_sql+=" from  jc_mmzjxmx";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=rs.getInt("xh");
			lx=rs.getString("lx");
			ysl=rs.getDouble("ysl");
			xsl=rs.getDouble("xsl");

			if (lx.equals("1"))//1��������Ŀ��2��������Ŀ
			{
				ls_sql="update jc_mmdgdmx set zjhsl=?";
				ls_sql+=" where xh="+xh;
				ps1= conn.prepareStatement(ls_sql);
				ps1.setDouble(1,ysl);
				ps1.executeUpdate();
				ps1.close();
			}
			else{
				ls_sql="delete from jc_mmdgdmx ";
				ls_sql+=" where xh="+xh;
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		rs.close();
		ps.close();

		
		ls_sql="delete from jc_mmzjxmx ";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		//ɾ�����������
		ls_sql="select lrxh,lx,ysl,xsl";
		ls_sql+=" from  jc_wjzjxmx";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			lrxh=rs.getInt("lrxh");
			lx=rs.getString("lx");
			ysl=rs.getDouble("ysl");
			xsl=rs.getDouble("xsl");

			if (lx.equals("1"))//1��������Ŀ��2��������Ŀ
			{
				ls_sql="update jc_wjjddmx set zjhsl=?";
				ls_sql+=" where lrxh="+lrxh;
				ps1= conn.prepareStatement(ls_sql);
				ps1.setDouble(1,ysl);
				ps1.executeUpdate();
				ps1.close();
			}
			else{
				ls_sql="delete from jc_wjjddmx ";
				ls_sql+=" where lrxh="+lrxh;
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		rs.close();
		ps.close();

		ls_sql="delete from jc_wjzjxmx ";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		//ɾ������������
		ls_sql="select lrxh,lx,ysl,xsl";
		ls_sql+=" from  jc_blzjxmx";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			lrxh=rs.getInt("lrxh");
			lx=rs.getString("lx");
			ysl=rs.getDouble("ysl");
			xsl=rs.getDouble("xsl");

			if (lx.equals("1"))//1��������Ŀ��2��������Ŀ
			{
				ls_sql="update jc_blddmx set zjhsl=?";
				ls_sql+=" where lrxh="+lrxh;
				ps1= conn.prepareStatement(ls_sql);
				ps1.setDouble(1,ysl);
				ps1.executeUpdate();
				ps1.close();
			}
			else{
				ls_sql="delete from jc_blddmx ";
				ls_sql+=" where lrxh="+lrxh;
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
		rs.close();
		ps.close();
		
		ls_sql="delete from jc_blzjxmx ";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from jc_mmzjx ";
		ls_sql+=" where zjxxh='"+zjxxh[i]+"'";
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
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>