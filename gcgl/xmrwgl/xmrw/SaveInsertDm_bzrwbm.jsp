<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String rwbm=null;
String rwmc=null;
String rwflbm=null;
String zdjkrw=null;
String bjlb=null;
String sqtxnr=null;
int sqtxts=0;
String shtxnr=null;
int shtxts=0;
String sfyxhxgq=null;
String sfyxfc=null;
String sfxys=null;
String bz=null;
rwbm=cf.GB2Uni(request.getParameter("rwbm"));
rwmc=cf.GB2Uni(request.getParameter("rwmc"));
rwflbm=cf.GB2Uni(request.getParameter("rwflbm"));
zdjkrw=cf.GB2Uni(request.getParameter("zdjkrw"));
bjlb=cf.GB2Uni(request.getParameter("bjlb"));
sqtxnr=cf.GB2Uni(request.getParameter("sqtxnr"));
ls=request.getParameter("sqtxts");
try{
	if (!(ls.equals("")))  sqtxts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqtxts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[事前提醒天数]类型转换发生意外:"+e);
	return;
}
shtxnr=cf.GB2Uni(request.getParameter("shtxnr"));
ls=request.getParameter("shtxts");
try{
	if (!(ls.equals("")))  shtxts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shtxts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[事后提醒天数]类型转换发生意外:"+e);
	return;
}
sfyxhxgq=cf.GB2Uni(request.getParameter("sfyxhxgq"));
sfyxfc=cf.GB2Uni(request.getParameter("sfyxfc"));
sfxys=cf.GB2Uni(request.getParameter("sfxys"));
bz=cf.GB2Uni(request.getParameter("bz"));

String sfwlcb=cf.GB2Uni(request.getParameter("sfwlcb"));
String zyrwbm=cf.GB2Uni(request.getParameter("zyrwbm"));
double rwxh=0;
ls=request.getParameter("rwxh");
try{
	if (!(ls.equals("")))  rwxh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rwxh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[任务序号]类型转换发生意外:"+e);
	return;
}
String[] cpflbm=request.getParameterValues("cpflbm");

String xgytg=null;
int gytgts=0;
String sjcpxx=null;
String gznr=null;
String bjjbbm=null;
xgytg=cf.GB2Uni(request.getParameter("xgytg"));
ls=request.getParameter("gytgts");
try{
	if (!(ls.equals("")))  gytgts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gytgts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工艺停工天数]类型转换发生意外:"+e);
	return;
}
sjcpxx=cf.GB2Uni(request.getParameter("sjcpxx"));
gznr=cf.GB2Uni(request.getParameter("gznr"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sjcpfl="";
	if (cpflbm!=null)
	{
		for (int i=0;i<cpflbm.length ;i++ )
		{
			String cpflmc=null;
			ls_sql="select cpflmc";
			ls_sql+=" from  dm_cpflbm";
			ls_sql+=" where cpflbm='"+cpflbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				cpflmc=rs.getString(1);

				sjcpfl+="、"+cpflmc;
			}
			rs.close();
			ps.close();
		}
		if (!sjcpfl.equals(""))
		{
			sjcpfl=sjcpfl.substring(1);
		}
	}

	conn.setAutoCommit(false);

	ls_sql="delete from dm_bzrwcpfl ";
	ls_sql+=" where rwbm='"+rwbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (cpflbm!=null)
	{
		for (int i=0;i<cpflbm.length ;i++ )
		{
			if (cpflbm[i].equals(""))
			{
				continue;
			}

			ls_sql="insert into dm_bzrwcpfl(rwbm,cpflbm) values('"+rwbm+"','"+cpflbm[i]+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
	
	ls_sql="insert into dm_bzrwbm ( rwbm,rwmc,rwflbm,zdjkrw,bjlb,sqtxnr,sqtxts,shtxnr,shtxts,sfyxhxgq,sfyxfc,sfxys,sfwlcb,zyrwbm,rwxh,bz,xgytg,gytgts,sjcpxx,sjcpfl,bjjbbm,gznr ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rwbm);
	ps.setString(2,rwmc);
	ps.setString(3,rwflbm);
	ps.setString(4,zdjkrw);
	ps.setString(5,bjlb);
	ps.setString(6,sqtxnr);
	ps.setInt(7,sqtxts);
	ps.setString(8,shtxnr);
	ps.setInt(9,shtxts);
	ps.setString(10,sfyxhxgq);
	ps.setString(11,sfyxfc);
	ps.setString(12,sfxys);
	ps.setString(13,sfwlcb);
	ps.setString(14,zyrwbm);
	ps.setDouble(15,rwxh);
	ps.setString(16,bz);
	ps.setString(17,xgytg);
	ps.setLong(18,gytgts);
	ps.setString(19,sjcpxx);
	ps.setString(20,sjcpfl);
	ps.setString(21,bjjbbm);
	ps.setString(22,gznr);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	//调整序号
	int getrwxh=0;
	String getrwbm=null;
	ls_sql="SELECT rwbm";
	ls_sql+=" FROM dm_bzrwbm";
	ls_sql+=" order by rwxh,rwbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getrwbm=rs.getString(1);

		getrwxh++;

		ls_sql="update dm_bzrwbm set rwxh="+getrwxh;
		ls_sql+=" where  rwbm='"+getrwbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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