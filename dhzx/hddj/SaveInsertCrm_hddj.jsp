<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khxm=null;
String xb=null;
String lxfs=null;
String cqbm=null;
String fwdz=null;
String cgdz=null;
String hdsgd=null;
String hdsgbz=null;
String hdsjs=null;
String lrr=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
String bz=null;
khxm=cf.GB2Uni(request.getParameter("khxm"));
xb=cf.GB2Uni(request.getParameter("xb"));
lxfs=cf.GB2Uni(request.getParameter("lxfs"));
cqbm=cf.GB2Uni(request.getParameter("cqbm"));
fwdz=cf.GB2Uni(request.getParameter("fwdz"));
cgdz=cf.GB2Uni(request.getParameter("cgdz"));
hdsgd=cf.GB2Uni(request.getParameter("hdsgd"));
hdsgbz=cf.GB2Uni(request.getParameter("hdsgbz"));
hdsjs=cf.GB2Uni(request.getParameter("hdsjs"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_hddj";
	ls_sql+=" where fwdz='"+fwdz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	if (count>0)
	{
		out.println("错误！此房屋地址已存在，不能重复存盘");
		return;
	}

	//客户编号
	int xh=0;
	ls_sql="select NVL(max(TO_NUMBER(khbh))+1,1)";
	ls_sql+=" from  crm_hddj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();
	String khbh=cf.addZero(xh,7);
	
	
	ls_sql="insert into crm_hddj ( khbh,khxm,xb,lxfs,cqbm,fwdz,cgdz,hdsgd,hdsgbz,hdsjs,bz,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,TRUNC(SYSDATE) ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,khxm);
	ps.setString(3,xb);
	ps.setString(4,lxfs);
	ps.setString(5,cqbm);
	ps.setString(6,fwdz);
	ps.setString(7,cgdz);
	ps.setString(8,hdsgd);
	ps.setString(9,hdsgbz);
	ps.setString(10,hdsjs);
	ps.setString(11,bz);
	ps.setString(12,lrr);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！生成客户编号<<%=khbh%>>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
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