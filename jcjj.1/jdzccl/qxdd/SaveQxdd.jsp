<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=request.getParameter("ddbh");
String tdblr=cf.GB2Uni(request.getParameter("tdblr"));
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
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update jc_zczjx set clzt1=clzt,clzt='99'";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_zcdd set tdsj=?,tdblr=?,kclf=?,jctdyybm=?,tdsm=?,lsclzt=clzt,clzt='99'";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ls_sql+=" and jc_zcdd.clzt not in('00','03','05','07','19','21','23','30','98','99')";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tdsj);
	ps.setString(2,tdblr);
	ps.setDouble(3,kclf);
	ps.setString(4,jctdyybm);
	ps.setString(5,tdsm);
	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("<BR>退单失败！");
	}
	else
	{
		//集成订单
		ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs,zcdlbm,zcxlbm ,pdgc,pdgcmc,gys,ppmc  ,zqje              ,zhje           ,cbje             ,fssj)";
		ls_sql+=" select ddbh,'4','3'           ,ddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,'',zcdlbm,zcxlbm    ,'',ppbm,gys,ppmc      ,-1*(NVL(wdzje,0)+NVL(zqzjhze,0)),-1*(NVL(hkze,0)+NVL(zjhze,0)),-1*(NVL(cbze,0)+NVL(zjxcbze,0)),tdsj";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where  ddbh='"+ddbh+"'";
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>