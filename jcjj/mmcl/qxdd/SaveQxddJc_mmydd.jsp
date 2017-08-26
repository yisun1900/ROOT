<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));

String ls=null;
String tdlrr=cf.GB2Uni(request.getParameter("tdlrr"));
String jctdyybm=cf.GB2Uni(request.getParameter("jctdyybm"));
String tdsm=cf.GB2Uni(request.getParameter("tdsm"));
double kclf=0;
java.sql.Date tdsj=null;

ls=request.getParameter("kclf");
try{
	if (!(ls.equals("")))  kclf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kclf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣测量费]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("tdsj");
try{
	if (!(ls.equals("")))  tdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[退单时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update jc_mmydd set tdsj=?,tdlrr=?,kclf=?,jctdyybm=?,tdsm=?,lsclzt=clzt,clzt='99'";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tdsj);
	ps.setString(2,tdlrr);
	ps.setDouble(3,kclf);
	ps.setString(4,jctdyybm);
	ps.setString(5,tdsm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_mmzjx set lsclzt=clzt,clzt='99'";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()>0)
	{
		out.println("提醒！！！该订单有增减项，系统进行自动退单");
	}
	ps.close();

	//集成订单
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy  ,jjsjs,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc  ,zqje      ,zhje    ,cbje,fssj)";
	ls_sql+=" select yddbh,'1','3'          ,yddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy ,'','',''           ,pdgc,pdgcmc,gys,ppmc  ,-1*zqzjhze,-1*zjhze,0   ,tdsj";
	ls_sql+=" from jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("退单成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
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