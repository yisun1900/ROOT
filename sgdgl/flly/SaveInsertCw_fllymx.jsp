<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ssfgs=request.getParameter("ssfgs");
String jlh=request.getParameter("jlh");


String[] flbm=request.getParameterValues("flbm");
String[] slstr=request.getParameterValues("sl");
double sl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jsbz=null;
	ls_sql=" SELECT jsbz ";
	ls_sql+=" FROM cw_fllyjl ";
    ls_sql+=" where jlh='"+jlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jsbz=cf.fillNull(rs.getString("jsbz"));
	}
	rs.close();
	ps.close();

	if (jsbz.equals("1"))//0：未结算；1：已结算
	{
		out.print("错误！记录号["+jlh+"]已结算！");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<flbm.length ;i++ )
	{
		if (slstr[i]==null || slstr[i].trim().equals(""))
		{
			ls_sql="delete from cw_fllymx ";
			ls_sql+=" where jlh='"+jlh+"' and flbm='"+flbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		sl = Double.parseDouble(slstr[i].trim());
		if (sl==0)
		{
			ls_sql="delete from cw_fllymx ";
			ls_sql+=" where jlh='"+jlh+"' and flbm='"+flbm[i]+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			continue;
		}

		//查询是否已存在
		int count=0;
		ls_sql=" select count(*) ";
		ls_sql+=" from cw_fllymx ";
		ls_sql+=" where flbm='"+flbm[i]+"'  and jlh='"+jlh+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			ls_sql="insert into cw_fllymx (jlh,flbm,flmc,lx,jldw,dj,sl,je  ,lrr,lrsj   ,bz)";
			ls_sql+=" select                 ?,flbm,flmc,lx,jldw,dj,? ,?*dj,?  ,SYSDATE,''";
			ls_sql+=" from cw_flbm";
			ls_sql+=" where flbm='"+flbm[i]+"' and  ssfgs='"+ssfgs+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,jlh);
			ps.setDouble(2,sl);
			ps.setDouble(3,sl);
			ps.setString(4,yhmc);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="update cw_fllymx set sl=?,je=dj*?";
			ls_sql+=" where flbm='"+flbm[i]+"'  and jlh='"+jlh+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.setDouble(1,sl);
			ps.setDouble(2,sl);
			ps.executeUpdate();
			ps.close();
		}
	}

	double zsl=0;
	double zje=0;

	ls_sql=" SELECT sum(sl),sum(je)  ";
	ls_sql+=" FROM cw_fllymx ";
	ls_sql+=" where jlh='"+jlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zsl=rs.getDouble(1);
		zje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update cw_fllyjl set zsl="+zsl+",zje="+zje;
	ls_sql+=" where jlh='"+jlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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