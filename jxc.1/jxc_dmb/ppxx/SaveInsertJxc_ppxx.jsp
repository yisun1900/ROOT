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


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jxc_ppxx";
	ls_sql+=" where ppmc='"+ppmc+"'";
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

	int ppbm=0;
	ls_sql="select NVL(max(ppbm),0)";
	ls_sql+=" from  jxc_ppxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ppbm=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ppbm++;
	
	conn.setAutoCommit(false);


	ls_sql="insert into jxc_ppxx ( ppbm,ppmc,pplb,clxl,scsmc,bz,sfyyh,yhkssj,yhjzsj,yhnr,cwdm,mrazhs,ppfzr ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,ppbm);
	ps.setString(2,ppmc);
	ps.setString(3,pplb);
	ps.setString(4,clxl);
	ps.setString(5,scsmc);
	ps.setString(6,bz);
	ps.setString(7,sfyyh);
	ps.setDate(8,yhkssj);
	ps.setDate(9,yhjzsj);
	ps.setString(10,yhnr);
	ps.setString(11,cwdm);
	ps.setInt(12,mrazhs);
	ps.setString(13,ppfzr);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from jxc_ppgysdzb";
	ls_sql+=" where ppbm='"+ppbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<ssfgs.length ;i++ )
	{
		ls_sql="insert into jxc_ppgysdzb (ppbm,ssfgs ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,ppbm);
		ps.setString(2,ssfgs[i]);
		ps.executeUpdate();
		ps.close();
	}

		
	conn.commit();


	
	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！产生新的子品牌编码为：<%=ppbm%>");
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