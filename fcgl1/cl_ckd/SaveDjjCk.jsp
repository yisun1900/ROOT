<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckph=cf.GB2Uni(request.getParameter("ckph"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String[] ckmc=request.getParameterValues("ckmc");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lx="";
	ls_sql=" select lx";
	ls_sql+=" from cl_ckd";
	ls_sql+=" where ckph='"+ckph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));
	}
	rs.close();
	ps.close();
	
	conn.setAutoCommit(false);

	for (int i=0;i<ckmc.length ;i++ )
	{
		if (lx.equals("2"))//1：出库；2：退货
		{
			ls_sql="insert into cl_ckmx ( ckph,clbm,clmc,clgg,cldlmc,jldwmc,lrjsfs,lrbfb,ckmc,sfrk,cj,cjjsj,fgsdj,gdj,cksl,ckje,leixing ) ";
			ls_sql+=" select '"+ckph+"',cl_djjmx.clbm,cl_djjmx.clmc,cl_djjmx.clgg,cl_djjmx.cldlmc,cl_djjmx.jldwmc,cl_clbm.lrjsfs,cl_clbm.lrbfb,cl_djjmx.ckmc,cl_jgmx.sfrk,cl_jgmx.cj,cl_jgmx.cjjsj,cl_jgmx.fgsdj,cl_djjmx.gdj,sum(-1*cl_djjmx.sjsl),sum(-1*cl_djjmx.sjje),'1'";
			ls_sql+=" FROM cl_djjmx,cl_djj,cl_clbm,cl_jgmx";
			ls_sql+=" where cl_djjmx.czxh=cl_djj.czxh and cl_djj.khbh='"+khbh+"' and cl_djjmx.ckmc='"+cf.GB2Uni(ckmc[i])+"'";
			ls_sql+=" and cl_djjmx.clbm=cl_jgmx.clbm and cl_jgmx.dwbh=cl_djj.dwbh  ";
			ls_sql+=" and cl_djjmx.clbm=cl_clbm.clbm";
			ls_sql+=" group by cl_djjmx.clbm,cl_djjmx.clmc,cl_djjmx.clgg,cl_djjmx.cldlmc,cl_djjmx.jldwmc,cl_clbm.lrjsfs,cl_clbm.lrbfb,cl_djjmx.ckmc,cl_jgmx.sfrk,cl_jgmx.cj,cl_jgmx.cjjsj,cl_jgmx.fgsdj,cl_djjmx.gdj";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql="insert into cl_ckmx ( ckph,clbm,clmc,clgg,cldlmc,jldwmc,lrjsfs,lrbfb,ckmc,sfrk,cj,cjjsj,fgsdj,gdj,cksl,ckje,leixing ) ";
			ls_sql+=" select '"+ckph+"',cl_djjmx.clbm,cl_djjmx.clmc,cl_djjmx.clgg,cl_djjmx.cldlmc,cl_djjmx.jldwmc,cl_clbm.lrjsfs,cl_clbm.lrbfb,cl_djjmx.ckmc,cl_jgmx.sfrk,cl_jgmx.cj,cl_jgmx.cjjsj,cl_jgmx.fgsdj,cl_djjmx.gdj,sum(cl_djjmx.sjsl),sum(cl_djjmx.sjje),'1'";
			ls_sql+=" FROM cl_djjmx,cl_djj,cl_clbm,cl_jgmx";
			ls_sql+=" where cl_djjmx.czxh=cl_djj.czxh and cl_djj.khbh='"+khbh+"' and cl_djjmx.ckmc='"+cf.GB2Uni(ckmc[i])+"'";
			ls_sql+=" and cl_djjmx.clbm=cl_jgmx.clbm and cl_jgmx.dwbh=cl_djj.dwbh  ";
			ls_sql+=" and cl_djjmx.clbm=cl_clbm.clbm";
			ls_sql+=" group by cl_djjmx.clbm,cl_djjmx.clmc,cl_djjmx.clgg,cl_djjmx.cldlmc,cl_djjmx.jldwmc,cl_clbm.lrjsfs,cl_clbm.lrbfb,cl_djjmx.ckmc,cl_jgmx.sfrk,cl_jgmx.cj,cl_jgmx.cjjsj,cl_jgmx.fgsdj,cl_djjmx.gdj";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

	}
	
	double cksl=0;
	double ckje=0;

	ls_sql=" select sum(cksl),sum(ckje)";
	ls_sql+=" from cl_ckmx";
	ls_sql+=" where  (ckph='"+ckph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		cksl = rs.getDouble(1);
		ckje = rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update cl_ckd set ckzsl=ckzsl+"+cksl+",ckzje="+ckje;
	ls_sql+=" where  (ckph='"+ckph+"')  ";
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