<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");

String khfwjlh=cf.GB2Uni(request.getParameter("khfwjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sbyybm=cf.GB2Uni(request.getParameter("sbyybm"));
String sbyyxs=cf.GB2Uni(request.getParameter("sbyyxs"));
String djr=cf.GB2Uni(request.getParameter("djr"));
String djbm=cf.GB2Uni(request.getParameter("djbm"));
java.sql.Date djsj=null;
String ls=null;
ls=request.getParameter("djsj");
try{
	if (!(ls.equals("")))  djsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量djsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[登记时间]类型转换发生意外:"+e);
	return;
}
String sbkhlx=cf.GB2Uni(request.getParameter("sbkhlx"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String xzxzt=null;


int count=0;

try {
	conn=cf.getConnection();


	String yzxdm=null;
	String ysjs=null;
	String yzxzt=null;
	String ssfgs=null;
	String ykhfwjlh=null;
	String ysfxhf=null;
	java.sql.Date yhfrq=null;
	String ysbyybm=null;
	String sjsjdjlh=null;
	String dmjdjlh=null;
	ls_sql="select zxdm,zxzt,ssfgs,sjs,khfwjlh,sfxhf,hfrq,sbyybm,sjsjdjlh,dmjdjlh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yzxdm=rs.getString("zxdm");
		yzxzt=rs.getString("zxzt");
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ysjs=rs.getString("sjs");
		ykhfwjlh=rs.getString("khfwjlh");
		ysfxhf=rs.getString("sfxhf");
		yhfrq=rs.getDate("hfrq");
		ysbyybm=rs.getString("sbyybm");
		sjsjdjlh=rs.getString("sjsjdjlh");
		dmjdjlh=rs.getString("dmjdjlh");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	xzxzt="4";//4：失败

	//结束：设计师接单记录
	ls_sql="update crm_sjsjdjl set zxzt=?,sbyybm=?,sbyyxs=?,jssj=?,jslrr=?";//zxzt,0：咨询登记； 1:设计师咨询；2:设计师提交飞单；3：已签约；4：失败
	ls_sql+=" where  (sjsjdjlh='"+sjsjdjlh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xzxzt);
	ps.setString(2,sbyybm);
	ps.setString(3,sbyyxs);
	ps.setDate(4,djsj);
	ps.setString(5,yhmc);
	ps.executeUpdate();
	ps.close();

	//结束：店面接单记录
	ls_sql="update crm_dmjdjl set zxzt=?,sbyybm=?,sbyyxs=?,jssj=?,jslrr=?";//zxzt,0：咨询登记； 1:设计师咨询；2:设计师提交飞单；3：已签约；4：失败
	ls_sql+=" where  (dmjdjlh='"+dmjdjlh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xzxzt);
	ps.setString(2,sbyybm);
	ps.setString(3,sbyyxs);
	ps.setDate(4,djsj);
	ps.setString(5,yhmc);
	ps.executeUpdate();
	ps.close();

	//插入表：咨询客户服务记录（crm_zxkhfwjl）
	ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,zxdm,sjs,sbyybm,sbyyxs,czlx,xzxzt,yzxzt,ysfxhf,yhfrq,yzxdm,ysjs,ysbyybm,lrr,lrsj,lrbm,ykhfwjlh,sbkhlx,sfhf)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,'D',?,?,?,?,?,?,?,?,?,?,?,?,'N')";//13：失败登记
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khfwjlh);
	ps.setString(2,khbh);
	ps.setString(3,ssfgs);
	ps.setString(4,yzxdm);
	ps.setString(5,ysjs);
	ps.setString(6,sbyybm);
	ps.setString(7,sbyyxs);
	ps.setString(8,xzxzt);
	ps.setString(9,yzxzt);
	ps.setString(10,ysfxhf);
	ps.setDate(11,yhfrq);

	ps.setString(12,yzxdm);
	ps.setString(13,ysjs);
	ps.setString(14,ysbyybm);
	ps.setString(15,yhmc);
	ps.setDate(16,djsj);
	ps.setString(17,dwbh);
	ps.setString(18,ykhfwjlh);
	ps.setString(19,sbkhlx);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_zxkhxx set zxzt=?,hfsbyybm=?,hfsbyyxs=?,hfsbsj=?,khfwjlh=?,hfsbkhlx=? ";
	ls_sql+="  where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xzxzt);
	ps.setString(2,sbyybm);
	ps.setString(3,sbyyxs);
	ps.setDate(4,djsj);
	ps.setString(5,khfwjlh);
	ps.setString(6,sbkhlx);
	ps.executeUpdate();
	ps.close();

	


	//删除临时报价

	//临时报价--项目明细
	ls_sql="delete from bj_mbbjxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--工料分析表
	ls_sql="delete from bj_mbglfxb ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--房间信息
	ls_sql="delete from bj_mbfjxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--工程量明细
	ls_sql="delete from bj_mbgclmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--主材用量
	ls_sql="delete from bj_mbzcyl ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//临时报价--其它收费项目明细
	ls_sql="delete from bj_mbsfxmmx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	

	conn.commit();

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