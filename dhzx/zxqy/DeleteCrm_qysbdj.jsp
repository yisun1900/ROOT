<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String khfwjlh=null;
String xzxzt=null;
String zxzt=null;
String sfxhf=null;
java.sql.Date hfrq=null;
String zxdm=null;
String sjs=null;
String sbyybm=null;
String ysbyybm=null;

String nowzxzt=null;
String nowsfxhf=null;
java.sql.Date nowhfrq=null;
String nowzxdm=null;
String nowsjs=null;
String nowsbyybm=null;

try {
	conn=cf.getConnection();

	String ykhfwjlh=null;
	ls_sql="select khfwjlh,xzxzt,yzxzt,ysfxhf,yhfrq,yzxdm,ysjs,sbyybm,ysbyybm,ykhfwjlh";
	ls_sql+=" from  crm_zxkhfwjl";
	ls_sql+=" where khbh='"+khbh+"' and czlx='D' order by khfwjlh desc";//D：失败登记
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khfwjlh=cf.fillNull(rs.getString("khfwjlh"));
		xzxzt=cf.fillNull(rs.getString("xzxzt"));
		zxzt=cf.fillNull(rs.getString("yzxzt"));
		sfxhf=cf.fillNull(rs.getString("ysfxhf"));
		hfrq=rs.getDate("yhfrq");
		zxdm=cf.fillNull(rs.getString("yzxdm"));
		sjs=cf.fillNull(rs.getString("ysjs"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		ysbyybm=cf.fillNull(rs.getString("ysbyybm"));
		ykhfwjlh=cf.fillNull(rs.getString("ykhfwjlh"));
	}
	else{
		out.println("错误！操作失败，不存在的登记编号");
		return;
	}
	rs.close();
	ps.close();


	String sjsjdjlh=null;
	String dmjdjlh=null;
	ls_sql="select zxzt,sfxhf,hfrq,zxdm,sjs,sbyybm,sjsjdjlh,dmjdjlh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nowzxzt=cf.fillNull(rs.getString("zxzt"));
		nowsfxhf=cf.fillNull(rs.getString("sfxhf"));
		nowhfrq=rs.getDate("hfrq");
		nowzxdm=cf.fillNull(rs.getString("zxdm"));
		nowsjs=cf.fillNull(rs.getString("sjs"));
		nowsbyybm=cf.fillNull(rs.getString("sbyybm"));
		sjsjdjlh=rs.getString("sjsjdjlh");
		dmjdjlh=rs.getString("dmjdjlh");
	}
	else{
		out.println("错误！不存在的客户编号");
		return;
	}
	rs.close();
	ps.close();




	conn.setAutoCommit(false);


	//还原：设计师接单记录
	ls_sql="update crm_sjsjdjl set zxzt=?,sbyybm=null,sbyyxs=null,jssj=null,jslrr=null";//zxzt,0：咨询登记； 1:设计师咨询；2:设计师提交飞单；3：已签约；4：失败
	ls_sql+=" where  (sjsjdjlh='"+sjsjdjlh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxzt);
	ps.executeUpdate();
	ps.close();

	//还原：店面接单记录
	ls_sql="update crm_dmjdjl set zxzt=?,sbyybm=null,sbyyxs=null,jssj=null,jslrr=null";//zxzt,0：咨询登记； 1:设计师咨询；2:设计师提交飞单；3：已签约；4：失败
	ls_sql+=" where  (dmjdjlh='"+dmjdjlh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxzt);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set zxzt=?,sbyybm=?,sbkhlx=null,sbyyxs=null,sbsj=null,khfwjlh=?";//zxzt,0：咨询登记； 1:设计师咨询；2:设计师提交飞单；3：已签约；4：失败
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxzt);
	ps.setString(2,ysbyybm);
	ps.setString(3,ykhfwjlh);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from crm_zxkhfwjl ";
	ls_sql+=" where  (khfwjlh='"+khfwjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from crm_qysbdj ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("Exception: " + ls_sql);
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