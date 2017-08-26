<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sqxh=null;
String xm=null;
String zw=null;
String sqlrr=null;
String dh=null;
String bgdh=null;
String yx=null;
String bz=null;
String dwbh=null;
String ssfgs=null;
String ygbh=null;
String sfywc=null;
String cz=null;
String mpbb=null;
//计算出 库序号
String ls_sql2=null;
int xh=0;
int yqsl=0;
String xhs=null;
ls_sql2="select NVL(max(TO_NUMBER(sqxh))+1,1)";
ls_sql2+=" from  xz_mpyzsq";
xhs=cf.executeQuery(ls_sql2);
xh=Integer.parseInt(xhs);
sqxh=cf.addZero(xh,7);

java.sql.Date sqrq=null;
java.sql.Date yqjfrq=null;
xm=cf.GB2Uni(request.getParameter("xm"));
zw=cf.GB2Uni(request.getParameter("zw"));
dh=cf.GB2Uni(request.getParameter("dh"));
bgdh=cf.GB2Uni(request.getParameter("bgdh"));
sqlrr=cf.GB2Uni(request.getParameter("sqlrr"));
yx=cf.GB2Uni(request.getParameter("yx"));
bz=cf.GB2Uni(request.getParameter("bz"));
cz=cf.GB2Uni(request.getParameter("cz"));
mpbb=cf.GB2Uni(request.getParameter("mpbb"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ygbh=cf.GB2Uni(request.getParameter("ygbh"));
sfywc="N";

ls=request.getParameter("yqsl");
try{
	if (!(ls.equals("")))  yqsl=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[要求数量]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yqjfrq");
try{
	if (!(ls.equals("")))  yqjfrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqjfrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[要求交付日期]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into xz_mpyzsq ( sqxh,xm,zw,sqlrr,dh,bgdh,yx,bz,dwbh,sqrq,yqjfrq,yqsl,sfywc,cz,ssfgs,ygbh,mpbb ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sqxh);
	ps.setString(2,xm);
	ps.setString(3,zw);
	ps.setString(4,sqlrr);
	ps.setString(5,dh);
	ps.setString(6,bgdh);
	ps.setString(7,yx);
	ps.setString(8,bz);
	ps.setString(9,dwbh);
	ps.setDate(10,sqrq);
	ps.setDate(11,yqjfrq);
	ps.setInt(12,yqsl);
	ps.setString(13,sfywc);
	ps.setString(14,cz);
	ps.setString(15,ssfgs);
	ps.setString(16,ygbh);
	ps.setString(17,mpbb);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

