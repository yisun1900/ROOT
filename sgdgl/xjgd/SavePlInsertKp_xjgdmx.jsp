<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xjjlh=request.getParameter("xjjlh");
String khbh=request.getParameter("khbh");
String[] kpxmbm=request.getParameterValues("kpxmbm");
String[] wzcs=request.getParameterValues("wzcs");
String[] kpjg=request.getParameterValues("kpjg");
String[] bz=request.getParameterValues("bz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql=" delete from  kp_xjgdmx";
	ls_sql+=" where  xjjlh='"+xjjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<kpxmbm.length ;i++ )
	{
		if (wzcs[i].equals(""))
		{
			continue;
		}

		ls_sql="insert into kp_xjgdmx ( xjjlh,kpxmbm,kpdlbm,kpjg,kpcfbm,bz,kf,sgdfk,kcjdebl,wzcs,kpxmmc,kpjgdy,cfbz ) ";
		ls_sql+=" select ?,kpxmbm,kpdlbm,kpjg,kpcfbm,?,kf,sgdfk,kcjdebl,?,kpxmmc,kpjgdy,cfbz ";
		ls_sql+=" from kp_gckpxm ";
		ls_sql+=" where kpxmbm='"+kpxmbm[i]+"' and kpjg='"+kpjg[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,xjjlh);
		ps.setString(2,cf.GB2Uni(bz[i]));
		ps.setString(3,wzcs[i]);
		ps.executeUpdate();
		ps.close();
	}
	

	
	double allkf=0;
	double allsgdfk=0;
	double allkcjdebl=0;
	ls_sql="select sum(kf*wzcs),sum(sgdfk*wzcs),sum(kcjdebl*wzcs)";
	ls_sql+=" from  kp_xjgdmx";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allkf=rs.getDouble(1);
		allsgdfk=rs.getDouble(2);
		allkcjdebl=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	String cfspbz=null;
	if (allsgdfk>0 || allkcjdebl>0)
	{
		cfspbz="2";
	}
	else{
		cfspbz="1";
	}

	ls_sql="update kp_xjgdjl set fkze="+allsgdfk+",kfzs="+allkf+",kcjdebl="+allkcjdebl+",cfspbz='"+cfspbz+"'";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
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
	out.print("存盘失败,发生意外: " + e);
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