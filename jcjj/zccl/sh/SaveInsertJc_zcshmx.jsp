<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");


String[] shslStr=request.getParameterValues("shsl");
String[] bz=request.getParameterValues("bz");


String shr=cf.GB2Uni(request.getParameter("shr"));
String shqk=cf.GB2Uni(request.getParameter("shqk"));

String ls=null;
java.sql.Date shsj=null;
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[送货时间]类型转换发生意外:"+e);
	return;
}

String shdbh=request.getParameter("shdbh");
String ddbh=request.getParameter("ddbh");
String[] zcbm=request.getParameterValues("zcbm");
String[] xh=request.getParameterValues("xh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String clzt="";
	String ddshbz="";
	String ddlx="";
	ls_sql =" select khbh,clzt,ddshbz,ddlx";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		ddlx=cf.fillNull(rs.getString("ddlx"));
	}
	rs.close();
	ps.close();

	if (ddlx.equals("4"))
	{
		if (!clzt.equals("18") && !clzt.equals("20"))//18：已出库; 20：部分送货
		{
			out.println("<BR>错误，存盘失败！订单状态不正确"+clzt);
			return;
		}
	}
	else{
		if (ddshbz.equals("1"))////等待送货通知标志  1：不需待电；2：待电未通知；3：待电已通知
		{
			if (!clzt.equals("13") && !clzt.equals("15") && !clzt.equals("17") && !clzt.equals("20"))//13：工厂已接收;15：确定送货时间;17：已通知送货; 20：部分送货
			{
				out.println("<BR>错误，存盘失败！订单状态不正确");
				return;
			}
		}
		else{
			if (!clzt.equals("15") && !clzt.equals("17") && !clzt.equals("20"))//15：确定送货时间;17：已通知送货; 20：部分送货
			{
				out.println("<BR>错误，存盘失败！订单状态不正确");
				return;
			}
		}
	}



	conn.setAutoCommit(false);
	
		
	ls_sql="update jc_zcdd set lsclzt='"+clzt+"',clzt='20'";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_zcshd (shdbh,ddbh,khbh,shr,shsj,lrr,lrsj,dwbh,bz)";
	ls_sql+=" values(?,?,?,?,?,?,SYSDATE,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shdbh);
	ps.setString(2,ddbh);
	ps.setString(3,khbh);
	ps.setString(4,shr);
	ps.setDate(5,shsj);
	ps.setString(6,yhmc);
	ps.setString(7,dwbh);
	ps.setString(8,shqk);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xh.length ;i++ )
	{
		double shsl=0;

		shsl=Double.parseDouble(shslStr[i]);

		if (shsl==0)
		{
			continue;
		}
		
		ls_sql="insert into jc_zcshmx (shdbh,xh,ddbh,khbh,zcbm,shsl,bz)";
		ls_sql+=" select                   ?,xh,ddbh,khbh,zcbm,?,?";
		ls_sql+=" from jc_zcddmx";
		ls_sql+=" where ddbh='"+ddbh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,shdbh);
		ps.setDouble(2,shsl);
		ps.setString(3,cf.GB2Uni(bz[i]));
		ps.executeUpdate();
		ps.close();
		
		ls_sql =" select sum(shsl)";
		ls_sql+=" from jc_zcshmx";
		ls_sql+=" where ddbh='"+ddbh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			shsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="update jc_zcddmx set shsl="+shsl;
		ls_sql+=" where ddbh='"+ddbh+"' and xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}
%>