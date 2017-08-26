<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String[] zsxm=request.getParameterValues("zsxm");
String[] slstr=request.getParameterValues("sl");
String[] lx=request.getParameterValues("lx");
double sl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from crm_khzsxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<zsxm.length ;i++ )
	{
		
		if (slstr[i]==null || slstr[i].trim().equals(""))
		{
			continue;
		}

		sl=Double.parseDouble(slstr[i]);

		if (lx[i].equals("1"))
		{
			ls_sql="insert into crm_khzsxx (khbh,zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,sjsl,zsjz,lx,lrr,lrsj)";
			ls_sql+=" select ?,zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,?,?*cbdj,'1','"+yhmc+"',SYSDATE";
			ls_sql+=" from jc_hdzsxx";
			ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+ssfgs+"' and zsxm='"+cf.GB2Uni(zsxm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setDouble(2,sl);
			ps.setDouble(3,sl);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into crm_khzsxx (khbh,zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,sjsl,zsjz,lx,lrr,lrsj)";
			ls_sql+=" select ?,zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz,?,?*cbdj,'2','"+yhmc+"',SYSDATE";
			ls_sql+=" from jc_hddxzsxx";
			ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+ssfgs+"' and zsxm='"+cf.GB2Uni(zsxm[i])+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setDouble(2,sl);
			ps.setDouble(3,sl);
			ps.executeUpdate();
			ps.close();
		}
	}

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khzsxx  ";
	ls_sql+=" where khbh='"+khbh+"' and lx='2'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		conn.rollback();
		out.println("错误！只能『多选一』的赠送项目，不可以选择【"+count+"】项");
		return;
	}

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khzsxx  ";
	ls_sql+=" where khbh='"+khbh+"' and (sjsl<zsslxx OR sjsl>zsslsx)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		conn.rollback();
		out.println("错误！有【"+count+"】项的赠送数量超过上限，或小于下限");
		return;
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