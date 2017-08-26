<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;
String zcbm=null;
String zcmc=null;
String sfyh=null;
String zcdlbm=null;
String zcxlbm=null;
String xh=null;
String gg=null;
double lsj=0;
double yhj=0;
String dwbh=null;
String zp=null;
String bz=null;
String zclbbm=null;
String zcysbm=null;
String jldwbm=null;
String sfbhpj=null;
long pjts=0;
zcmc=cf.GB2Uni(request.getParameter("zcmc"));
sfyh=cf.GB2Uni(request.getParameter("sfyh"));
zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
ls=request.getParameter("lsj");
try{
	if (!(ls.equals("")))  lsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[零售价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yhj");
try{
	if (!(ls.equals("")))  yhj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yhj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠价]类型转换发生意外:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
zp=cf.GB2Uni(request.getParameter("zp"));
bz=cf.GB2Uni(request.getParameter("bz"));
zclbbm=cf.GB2Uni(request.getParameter("zclbbm"));
zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
sfbhpj=cf.GB2Uni(request.getParameter("sfbhpj"));
ls=request.getParameter("pjts");
try{
	if (!(ls.equals("")))  pjts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pjts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配件套数]类型转换发生意外:"+e);
	return;
}

double cbj=0;
double cxcbj=0;
double lscxhdbl=0;
String sfycx=null;
double cxj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjzsj=null;

ls=request.getParameter("cbj");
try{
	if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxcbj");
try{
	if (!(ls.equals("")))  cxcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxcbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销结算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lscxhdbl");
try{
	if (!(ls.equals("")))  lscxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lscxhdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销期计入活动比例]类型转换发生意外:"+e);
	return;
}
sfycx=request.getParameter("sfycx");
ls=request.getParameter("cxj");
try{
	if (!(ls.equals("")))  cxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxkssj");
try{
	if (!(ls.equals("")))  cxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxjzsj");
try{
	if (!(ls.equals("")))  cxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销结束时间]类型转换发生意外:"+e);
	return;
}
String dqbm=request.getParameter("dqbm");

double jsbl=0;
ls=request.getParameter("jsbl");
try{
	if (!(ls.equals("")))  jsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jsbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算比例]类型转换发生意外:"+e);
	return;
}
double cxhdbl=0;
ls=request.getParameter("cxhdbl");
try{
	if (!(ls.equals("")))  cxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxhdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动比例]类型转换发生意外:"+e);
	return;
}
String cpjb=cf.GB2Uni(request.getParameter("cpjb"));
String fgsx=cf.GB2Uni(request.getParameter("fgsx"));
String cd=cf.GB2Uni(request.getParameter("cd"));
String cpsm=cf.GB2Uni(request.getParameter("cpsm"));
String sftjcp=request.getParameter("sftjcp");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String ppmc=null;
	String gys=null;
	ls_sql=" select ppmc,gys" ;
	ls_sql+=" from sq_gysxx " ;
	ls_sql+=" where gysmc='"+dwbh+"' and dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		ppmc = rs.getString("ppmc");			    
		gys = rs.getString("gys");			    
	}
	else{
		rs.close();
		ps.close();
		out.println("<BR>错误，不存在的[品牌供应商名称]："+dwbh);
		return;
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(TO_NUMBER(zcbm)),0)";
	ls_sql+=" from  jc_zcjgb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	count++;
	zcbm=cf.addZero(count,7);

	ls_sql="insert into jc_zcjgb ( zcbm,zcmc,zcdlbm,xh,gg,lsj,yhj,dwbh,ppmc,gys   ,zp,bz,zclbbm,zcysbm,jldwbm,sfbhpj,pjts,sfyh,cbj,sfycx  ,cxj,cxcbj,lscxhdbl,cxkssj,cxjzsj,zcxlbm,dqbm,jsbl,cxhdbl,cpjb  ,fgsx,cd,cpsm,lrr,lrsj,lrbm,sftjcp) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,'"+yhmc+"',SYSDATE,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zcbm);
	ps.setString(2,zcmc);
	ps.setString(3,zcdlbm);
	ps.setString(4,xh);
	ps.setString(5,gg);
	ps.setDouble(6,lsj);
	ps.setDouble(7,yhj);
	ps.setString(8,dwbh);
	ps.setString(9,ppmc);
	ps.setString(10,gys);

	ps.setString(11,zp);
	ps.setString(12,bz);
	ps.setString(13,zclbbm);
	ps.setString(14,zcysbm);
	ps.setString(15,jldwbm);
	ps.setString(16,sfbhpj);
	ps.setLong(17,pjts);
	ps.setString(18,sfyh);
	ps.setDouble(19,cbj);
	ps.setString(20,sfycx);

	ps.setDouble(21,cxj);
	ps.setDouble(22,cxcbj);
	ps.setDouble(23,lscxhdbl);
	ps.setDate(24,cxkssj);
	ps.setDate(25,cxjzsj);
	ps.setString(26,zcxlbm);
	ps.setString(27,dqbm);
	ps.setDouble(28,jsbl);
	ps.setDouble(29,cxhdbl);
	ps.setString(30,cpjb);

	ps.setString(31,fgsx);
	ps.setString(32,cd);
	ps.setString(33,cpsm);
	ps.setString(34,lrbm);
	ps.setString(35,sftjcp);

	
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>

		存盘成功，主材编码：<%=zcbm%>
		<P><A HREF="loadPhoto.jsp?zcbm=<%=zcbm%>" target="_blank">上传照片</A>
		<P><A HREF="viewPhoto.jsp?zcbm=<%=zcbm%>" target="_blank">查看照片</A>

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