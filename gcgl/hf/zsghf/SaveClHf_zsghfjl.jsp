<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String sfjj=null;
String clsm=null;
String clr=null;
java.sql.Date clsj=null;

sfjj=cf.GB2Uni(request.getParameter("sfjj"));
clsm=cf.GB2Uni(request.getParameter("clsm"));
clr=cf.GB2Uni(request.getParameter("clr"));
ls=request.getParameter("clsj");
try{
	if (!(ls.equals("")))  clsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量clsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[处理时间]类型转换发生意外:"+e);
	return;
}


String lrr=null;
String lrbm=null;
java.sql.Date lrsj=null;
String bz=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
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
bz=cf.GB2Uni(request.getParameter("bz"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
String zrbm=cf.GB2Uni(request.getParameter("zrbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="insert into hf_zsghfcljl (hfjlh,zrbm,khbh,sfjj,clr,clsj,clsm,lrr,lrsj,lrbm,bz)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,SYSDATE,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfjlh);
	ps.setString(2,zrbm);
	ps.setString(3,khbh);
	ps.setString(4,sfjj);
	ps.setString(5,clr);
	ps.setDate(6,clsj);
	ps.setString(7,clsm);
	ps.setString(8,lrr);
	ps.setString(9,lrbm);
	ps.setString(10,bz);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update hf_zsghfwtbm set clzt=?";
	ls_sql+=" where  hfjlh="+hfjlh+" and zrbm='"+zrbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfjj);
	ps.executeUpdate();
	ps.close();

	int wclsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  hf_zsghfwtbm";
	ls_sql+=" where  hfjlh="+hfjlh+" and clzt='1' ";//1：未处理；2：在处理；3：已解决
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wclsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	int zclsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  hf_zsghfwtbm";
	ls_sql+=" where  hfjlh="+hfjlh+" and clzt='2' ";//1：未处理；2：在处理；3：已解决
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zclsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	int yclsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  hf_zsghfwtbm";
	ls_sql+=" where  hfjlh="+hfjlh+" and clzt='3' ";//1：未处理；2：在处理；3：已解决
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yclsl=rs.getInt(1);
	}
	rs.close();
	ps.close();


	String wtclzt="1";//1：未处理；2：在处理；3：已解决
	if (wclsl==0)
	{
		if (zclsl==0)
		{
			wtclzt="3";
		}
		else{
			wtclzt="2";
		}
	}
	else{
		if (zclsl==0 && yclsl==0)
		{
			wtclzt="1";
		}
		else{
			wtclzt="2";
		}
	}
	
	ls_sql="update hf_zsghfjl set wtclzt=?";
	ls_sql+=" where  hfjlh='"+hfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wtclzt);
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