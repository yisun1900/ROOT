<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

String ls=null;
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
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

    //clzt not in('00','01','03','05','07','09','11','35','98','99')";
	if (clzt.equals("99"))
	{
		out.println("！错误，已退单");
		return;
	}
	else if (clzt.equals("00") || clzt.equals("01") || clzt.equals("03") || clzt.equals("05") || clzt.equals("07") || clzt.equals("09") || clzt.equals("11"))
	{
		out.println("！错误，未签合同，不能做退单");
		return;
	}
	else if (clzt.equals("35"))
	{
		out.println("！错误，已完结");
		return;
	}
	else if (clzt.equals("98"))
	{
		out.println("！错误，已取消预订单");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_cgdd set tdsj=?,tdblr=?,kclf=?,jctdyybm=?,tdsm=?,lsclzt=clzt,clzt='99'";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,tdsj);
	ps.setString(2,tdblr);
	ps.setDouble(3,kclf);
	ps.setString(4,jctdyybm);
	ps.setString(5,tdsm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_cgzjx set lsclzt=clzt,clzt='99'";
	ls_sql+=" where  ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,jjsjs ,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc  ,zqje      ,zhje    ,cbje,fssj)";
	ls_sql+=" select ddbh,'2','3',ddbh,khbh,fgsbh,qddm,jzsjs,clgw,ztjjgw,xmzy,cgsjs            ,'',''        ,pdgc,pdgcmc,gys,ppmc  ,-1*zqzjhze,-1*zjhze,0   ,tdsj";
	ls_sql+=" from jc_cgdd";
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
