<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ppmc=null;
String pplb=null;
String clxl=null;
String scsmc=null;
String bz=null;
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
pplb=cf.GB2Uni(request.getParameter("pplb"));
clxl=cf.GB2Uni(request.getParameter("clxl"));
scsmc=cf.GB2Uni(request.getParameter("scsmc"));
bz=cf.GB2Uni(request.getParameter("bz"));

String sfyyh=null;
java.sql.Date yhkssj=null;
java.sql.Date yhjzsj=null;
sfyyh=request.getParameter("sfyyh");
ls=request.getParameter("yhkssj");
try{
	if (!(ls.equals("")))  yhkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yhkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yhjzsj");
try{
	if (!(ls.equals("")))  yhjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yhjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠截至时间]类型转换发生意外:"+e);
	return;
}
String yhnr=cf.GB2Uni(request.getParameter("yhnr"));
String[] ssfgs=request.getParameterValues("ssfgs");
String cwdm=cf.GB2Uni(request.getParameter("cwdm"));
String ppfzr=cf.GB2Uni(request.getParameter("ppfzr"));
int mrazhs=0;
ls=request.getParameter("mrazhs");
try{
	if (!(ls.equals("")))  mrazhs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mrazhs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[每日安装户数限制]类型转换发生意外:"+e);
	return;
}

String whereppbm=null;
whereppbm=cf.GB2Uni(request.getParameter("whereppbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jxc_ppxx";
	ls_sql+=" where ppbm!='"+whereppbm+"' and ppmc='"+ppmc+"'";
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
		out.println("错误！子品牌已存在");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update jxc_ppxx set ppmc=?,pplb=?,clxl=?,scsmc=?,bz=?,sfyyh=?,yhkssj=?,yhjzsj=?,yhnr=?,cwdm=?,mrazhs=?,ppfzr=? ";
	ls_sql+=" where  (ppbm="+whereppbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppmc);
	ps.setString(2,pplb);
	ps.setString(3,clxl);
	ps.setString(4,scsmc);
	ps.setString(5,bz);
	ps.setString(6,sfyyh);
	ps.setDate(7,yhkssj);
	ps.setDate(8,yhjzsj);
	ps.setString(9,yhnr);
	ps.setString(10,cwdm);
	ps.setInt(11,mrazhs);
	ps.setString(12,ppfzr);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jxc_ppgysdzb";
	ls_sql+=" where ppbm='"+whereppbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<ssfgs.length ;i++ )
	{
		ls_sql="insert into jxc_ppgysdzb (ppbm,ssfgs ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,whereppbm);
		ps.setString(2,ssfgs[i]);
		ps.executeUpdate();
		ps.close();
	}


	ls_sql="update jxc_ppgysdzb set ppmc=?";
	ls_sql+=" where ppbm='"+whereppbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppmc);
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
	out.print("<BR>出错:" + e);
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