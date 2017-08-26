<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String gysmc=null;
String gysdz=null;
String gysfzr=null;
String gysdh=null;
String gyscz=null;
String email=null;
String cwdm=null;
String bz=null;
String sfhz=null;
sfhz=cf.GB2Uni(request.getParameter("sfhz"));
String gyslx=null;
gyslx=cf.GB2Uni(request.getParameter("gyslx"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
gysdz=cf.GB2Uni(request.getParameter("gysdz"));
gysfzr=cf.GB2Uni(request.getParameter("gysfzr"));
gysdh=cf.GB2Uni(request.getParameter("gysdh"));
gyscz=cf.GB2Uni(request.getParameter("gyscz"));
email=cf.GB2Uni(request.getParameter("email"));
cwdm=cf.GB2Uni(request.getParameter("cwdm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String cllx=cf.GB2Uni(request.getParameter("cllx"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jxc_gysxx";
	ls_sql+=" where gysmc='"+gysmc+"' and dqbm='"+dqbm+"'";
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
		out.println("错误！供应商名称已存在");
		return;
	}


	int gysbm=0;
	ls_sql="select NVL(max(gysbm),0)";
	ls_sql+=" from  jxc_gysxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gysbm=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gysbm++;

	conn.setAutoCommit(false);

	ls_sql="insert into jxc_gysxx ( gysbm,dqbm,gysmc,gyslx,gysdz,gysfzr,gysdh,gyscz,email,cwdm,bz,sfhz,cllx ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,gysbm);
	ps.setString(2,dqbm);
	ps.setString(3,gysmc);
	ps.setString(4,gyslx);
	ps.setString(5,gysdz);
	ps.setString(6,gysfzr);
	ps.setString(7,gysdh);
	ps.setString(8,gyscz);
	ps.setString(9,email);
	ps.setString(10,cwdm);
	ps.setString(11,bz);
	ps.setString(12,sfhz);
	ps.setString(13,cllx);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jxc_ppgysdzb ";
	ls_sql+=" where gysbm not in(select gysbm from jxc_gysxx) ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！供应商编码为：<%=gysbm%>");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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