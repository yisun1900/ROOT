<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ppmc=null;
String pplb=null;
String scsmc=null;
String bz=null;
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
pplb=cf.GB2Uni(request.getParameter("pplb"));
scsmc=cf.GB2Uni(request.getParameter("scsmc"));
bz=cf.GB2Uni(request.getParameter("bz"));

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
String cldl=cf.GB2Uni(request.getParameter("cldl"));


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

	ls_sql="update jxc_ppxx set ppmc=?,pplb=?,scsmc=?,bz=?,cwdm=?,mrazhs=?,ppfzr=?,cldl=?";
	ls_sql+=" where  (ppbm="+whereppbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppmc);
	ps.setString(2,pplb);
	ps.setString(3,scsmc);
	ps.setString(4,bz);
	ps.setString(5,cwdm);
	ps.setInt(6,mrazhs);
	ps.setString(7,ppfzr);
	ps.setString(8,cldl);
	ps.executeUpdate();
	ps.close();


	ls_sql="update jxc_ppgysdzb set ppmc=? ";
	ls_sql+=" where ppbm='"+whereppbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ppmc);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jxc_ppgysdzb ";
	ls_sql+=" where ppbm not in(select ppbm from jxc_ppxx) ";
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