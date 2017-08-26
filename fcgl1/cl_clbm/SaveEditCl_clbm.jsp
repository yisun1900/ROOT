<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;

String clmc=null;
String clgg=null;

String bz=null;
String jldwmc=null;
String cldlmc=null;
double bfb=0;

clmc=cf.GB2Uni(request.getParameter("clmc"));
clgg=cf.GB2Uni(request.getParameter("clgg"));


bz=cf.GB2Uni(request.getParameter("bz"));
jldwmc=cf.GB2Uni(request.getParameter("jldwmc"));
cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));



String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
String wxr=cf.GB2Uni(request.getParameter("wxr"));
String lx=cf.GB2Uni(request.getParameter("lx"));
String paixu=cf.GB2Uni(request.getParameter("paixu"));
String[] bjjb=request.getParameterValues("bjjb");



String clbm=cf.GB2Uni(request.getParameter("whereclbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql=" delete from cl_jgmx ";
	ls_sql+=" where clbm='"+clbm+"' and bjjbbm not in("+cf.arrayToStr(bjjb,"'","'",",")+")";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	
	String bjjbmc="";
	for (int i=0;i<bjjb.length ;i++ )
	{
		ls_sql="select bjjbmc";
		ls_sql+=" from  bdm_bjjbbm";
		ls_sql+=" where bjjbbm='"+bjjb[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			bjjbmc+=rs.getString("bjjbmc")+"、";
		}
		rs.close();
		ps.close();

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  cl_jgmx";
		ls_sql+=" where clbm='"+clbm+"' and bjjbbm='"+bjjb[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count==0)
		{
			String jgdwbh="";
			ls_sql="select dwbh ";
			ls_sql+=" from sq_dwxx ";
			ls_sql+=" where dwlx='F0' and cxbz='N'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				jgdwbh=rs.getString(1);

				ls_sql=" insert into cl_jgmx ( clbm,dwbh,bjjbbm,cj,cjjsj,fgsdj,gdj,ckmc,sfrk,tzr,tzsj,sfycx ) ";
				ls_sql+=" values ( ?,?,?,0,0,0,0,'请录入仓库','Y',?,?,'N' ) ";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setString(1,clbm);
				ps1.setString(2,jgdwbh);
				ps1.setString(3,bjjb[i]);
				ps1.setString(4,lrr);
				ps1.setDate(5,lrsj);
				ps1.executeUpdate();
				ps1.close();
			}
			rs.close();
			ps.close();
		}

	}
	
    ls_sql="update cl_clbm set clmc=?,clgg=?,jldwmc=?,cldlmc=?,bz=?,lrr=?,lrsj=?,wxr=?,lx=?,paixu=?,bjjb=? ";
	ls_sql+=" where clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clmc);
	ps.setString(2,clgg);
	ps.setString(3,jldwmc);
	ps.setString(4,cldlmc);
	ps.setString(5,bz);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,wxr);
	ps.setString(9,lx);
	ps.setString(10,paixu);
	ps.setString(11,bjjbmc);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>