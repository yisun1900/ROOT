<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yddbh=null;
String mmdglxbm=null;
String mlx=null;
String mmxh=null;
long sl=0;
String ysbm=null;
String czbm=null;
String azwzbm=null;
String kqfxbm=null;

String ctbs=null;
String blxhbm=null;
String bz=null;
yddbh=cf.GB2Uni(request.getParameter("yddbh"));
mmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
mlx=cf.GB2Uni(request.getParameter("mlx"));
mmxh=cf.GB2Uni(request.getParameter("mmxh"));
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订购数量]类型转换发生意外:"+e);
	return;
}
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
czbm=cf.GB2Uni(request.getParameter("czbm"));
azwzbm=cf.GB2Uni(request.getParameter("azwzbm"));
kqfxbm=cf.GB2Uni(request.getParameter("kqfxbm"));
ctbs=cf.GB2Uni(request.getParameter("ctbs"));

blxhbm=cf.GB2Uni(request.getParameter("blxhbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String dczlbm=cf.GB2Uni(request.getParameter("dczlbm"));
String sfsmjcc=cf.GB2Uni(request.getParameter("sfsmjcc"));
String sfydc=cf.GB2Uni(request.getParameter("sfydc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int xh=0;

try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  jc_mmydmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="insert into jc_mmydmx ( yddbh,mmdglxbm,mlx,mmxh,sl,ysbm,czbm,azwzbm,kqfxbm,ctbs,blxhbm,bz,xh,dczlbm,sfsmjcc,sfydc ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yddbh);
	ps.setString(2,mmdglxbm);
	ps.setString(3,mlx);
	ps.setString(4,mmxh);
	ps.setLong(5,sl);
	ps.setString(6,ysbm);
	ps.setString(7,czbm);
	ps.setString(8,azwzbm);
	ps.setString(9,kqfxbm);
	ps.setString(10,ctbs);
	ps.setString(11,blxhbm);
	ps.setString(12,bz);
	ps.setInt(13,xh);
	ps.setString(14,dczlbm);
	ps.setString(15,sfsmjcc);
	ps.setString(16,sfydc);
	ps.executeUpdate();
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
	out.print("存盘失败,发生意外: " + ls_sql);
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