<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String chooseitem = cf.getParameter(request,"chooseitem");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String fgsbh=null;
	String xqmc=null;
	String khzq=null;
	ls_sql="select fgsbh,xqmc,khzq";
	ls_sql+=" from  yx_xqhdfygl";
	ls_sql+=" where "+chooseitem;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		fgsbh=rs1.getString("fgsbh");
		xqmc=rs1.getString("xqmc");
		khzq=rs1.getString("khzq");

		ls_sql="delete from yx_xqhdfygl";
		ls_sql+=" where fgsbh='"+fgsbh+"' and xqmc='"+xqmc+"' and khzq='"+khzq+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		double sjcc=0;
		double sjfy=0;
		ls_sql="select sum(dqsjcz),sum(dqsjfy)";
		ls_sql+=" from  yx_xqhdfygl";
		ls_sql+=" where xqmc='"+xqmc+"' and fgsbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjcc=rs.getDouble(1);
			sjfy=rs.getDouble(2);
		}
		rs.close();
		ps.close();

		String dysfwc=null;
		String fasfwc=null;
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  yx_xqhdfygl";
		ls_sql+=" where xqmc='"+xqmc+"' and fgsbh='"+fgsbh+"' and dysfwc='Y'";
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
			dysfwc="Y";
		}
		else {
			dysfwc="N";
		}

		ls_sql="select count(*)";
		ls_sql+=" from  yx_xqhdfygl";
		ls_sql+=" where xqmc='"+xqmc+"' and fgsbh='"+fgsbh+"' and fasfwc='Y'";
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
			fasfwc="Y";
		}
		else {
			fasfwc="N";
		}

		ls_sql="update yx_xqcxhdgl set sjfy=?,sjcc=?,dysfwc=?,fasfwc=? ";
		ls_sql+=" where xqmc='"+xqmc+"' and fgsbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sjfy);
		ps.setDouble(2,sjcc);
		ps.setString(3,dysfwc);
		ps.setString(4,fasfwc);
		ps.executeUpdate();
		ps.close();

		String dqbm=null;
		ls_sql="select dqbm";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwbh='"+fgsbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			dqbm=rs.getString("dqbm");
		}
		rs.close();
		ps.close();

		String kfjdbm=null;
		if (fasfwc.equals("Y"))//N：未完成；Y：完成
		{
			kfjdbm="5";//1：未开发；2：已申请；3：已批准；4：未批准；5：已完成
		}
		else{
			kfjdbm="3";
		}

		ls_sql="update yx_lsdcb set kfjd='"+kfjdbm+"'";
		ls_sql+=" where xqmc='"+xqmc+"' and dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	
	
	}
	rs1.close();
	ps1.close();



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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>