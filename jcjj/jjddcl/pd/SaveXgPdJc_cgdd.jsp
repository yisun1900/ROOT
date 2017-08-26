<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String oldjjsjs=cf.GB2Uni(request.getParameter("oldjjsjs"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));
String sjsgpyybm=cf.GB2Uni(request.getParameter("sjsgpyybm"));
String pdr=cf.GB2Uni(request.getParameter("pdr"));
String pdsm=cf.GB2Uni(request.getParameter("pdsm"));
java.sql.Date pdsj=null;

ls=request.getParameter("pdsj");
try{
	if (!(ls.equals("")))  pdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[派单时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (clzt.equals("00") || clzt.equals("01") || clzt.equals("33") || clzt.equals("35") || clzt.equals("98") || clzt.equals("99"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql="update jc_jjdd set jjsjs=?,pdr=?,pdsj=?,pdsm=?,sjsgpyybm=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjsjs);
	ps.setString(2,pdr);
	ps.setDate(3,pdsj);
	ps.setString(4,pdsm);
	ps.setString(5,sjsgpyybm);
	ps.executeUpdate();
	ps.close();
	
	ls_sql="update jc_jjzjx set jjsjs=?";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjsjs);
	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="update jc_jcdd set jjsjs=? ";
	ls_sql+=" where ddbh='"+ddbh+"' and lx='3'";//1：木门；2：橱柜；3：家具；4：主材
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjsjs);
	ps.executeUpdate();
	ps.close();

	//插入橱柜设计师改派记录
	if (!oldjjsjs.equals(jjsjs))
	{
		ls_sql="insert into jc_jjsjsgpjl(ddbh,jjsjs,yjjsjs,sjsgpyybm,pdsm,lrr,lrsj)";
		ls_sql+=" values(?,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setString(2,jjsjs);
		ps.setString(3,oldjjsjs);
		ps.setString(4,sjsgpyybm);
		ps.setString(5,pdsm);
		ps.setString(6,pdr);
		ps.setDate(7,pdsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="update jc_jjsjsgpjl set sjsgpyybm=?,pdsm=?";
		ls_sql+=" where ddbh='"+ddbh+"' and jjsjs='"+jjsjs+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjsgpyybm);
		ps.setString(2,pdsm);
		ps.executeUpdate();
		ps.close();
	}

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