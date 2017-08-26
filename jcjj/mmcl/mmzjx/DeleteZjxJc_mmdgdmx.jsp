<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] xh=request.getParameterValues("xh");
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double mmzjxje=0;
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
	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再删除");
		return;
	}

	conn.setAutoCommit(false);

	String lx=null;
	int ysl=0;
	int xsl=0;
	for (int i=0;i<xh.length ;i++ )
	{
		ls_sql="select lx,ysl,xsl";
		ls_sql+=" from  jc_mmzjxmx";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xh="+xh[i];
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
			out.println("错误！不存在的增减项");
			return;
		}
		rs.close();
		ps.close();

		ls_sql="delete from jc_mmzjxmx ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (lx.equals("1"))//1：已有项目；2：新增项目
		{
			ls_sql="update jc_mmdgdmx set zjhsl=?";
			ls_sql+=" where xh="+xh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.setInt(1,ysl);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="delete from jc_mmdgdmx ";
			ls_sql+=" where xh="+xh[i];
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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