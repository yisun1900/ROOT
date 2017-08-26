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
String cldl=cf.GB2Uni(request.getParameter("cldl"));


String cwdm=cf.GB2Uni(request.getParameter("cwdm"));


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

	ls_sql="insert into jxc_ppxx ( ppbm,ppmc,pplb,cldl,scsmc,bz,cwdm,sfyyh) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,'N') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,ppbm);
	ps.setString(2,ppmc);
	ps.setString(3,pplb);
	ps.setString(4,cldl);
	ps.setString(5,scsmc);
	ps.setString(6,bz);
	ps.setString(7,cwdm);
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