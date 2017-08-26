<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
java.sql.Date xgsj=null;
String xgr=null;
String zt=null;
String hth=null;
String khxm=null;
String xglx=null;
java.sql.Date yqdjzsj=null;
double wdzgce=0;
double qye=0;
java.sql.Date xghqdjzsj=null;
double xwdzgce=0;
double xqye=0;
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("xgsj");
try{
	if (!(ls.equals("")))  xgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改时间]类型转换发生意外:"+e);
	return;
}
xgr=cf.GB2Uni(request.getParameter("xgr"));
zt=cf.GB2Uni(request.getParameter("zt"));
hth=cf.GB2Uni(request.getParameter("hth"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
xglx=cf.GB2Uni(request.getParameter("xglx"));

String yqdjzsjStr=request.getParameter("yqdjzsj");
try{
	if (!(yqdjzsjStr.equals("")))  yqdjzsj=java.sql.Date.valueOf(yqdjzsjStr.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqdjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[原签单结转时间]类型转换发生意外:"+e);
	return;
}


ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzgce不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程原报价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程签约额]类型转换发生意外:"+e);
	return;
}

String xghqdjzsjStr=request.getParameter("xghqdjzsj");
try{
	if (!(xghqdjzsjStr.equals("")))  xghqdjzsj=java.sql.Date.valueOf(xghqdjzsjStr.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghqdjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后签单结转时间]类型转换发生意外:"+e);
	return;
}


String xgsm=cf.GB2Uni(request.getParameter("xgsm"));


//检查是否当月最后一天
if (!xghqdjzsjStr.equals(""))
{
	String nian=xghqdjzsjStr.substring(0,4);
	String yue=xghqdjzsjStr.substring(5,7);
	String lday=cf.lastDay(nian,yue);

	if (xghqdjzsjStr.compareTo(cf.today())>0)
	{
		out.println("失败！[修改后签单结转时间]不能大于[今天"+cf.today()+"]!");
		return;
	}
}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String mqyjjzsj=null;
	String mqtdyjjzsj=null;
	String mqzt=null;
	String fgsbh=null;
	ls_sql="select yjjzsj,tdyjjzsj,zt,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mqyjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		mqtdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		mqzt=cf.fillNull(rs.getString("zt"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();
	if (!mqzt.equals(zt))
	{
		out.println("错误！[客户状态]已改变，不能修改");
		return;
	}

	if (!mqyjjzsj.equals(yqdjzsjStr))
	{
		out.println("错误！[签单结转时间]已改变，不能修改，可能您已经存盘了，客户接转时间["+mqyjjzsj+"]");
		return;
	}




	conn.setAutoCommit(false);

	ls_sql="insert into cw_jzsjxgjl ( khbh,xgsj,xgr,zt,hth,khxm,wdzgce,qye   ,xglx,yqdjzsj,ytdjzsj,xghqdjzsj,xghtdjzsj,xgsm ) ";
	ls_sql+=" values ( ?,SYSDATE,?,?,?,?,?,?   ,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,xgr);
	ps.setString(3,zt);
	ps.setString(4,hth);
	ps.setString(5,khxm);
	ps.setDouble(6,wdzgce);
	ps.setDouble(7,qye);

	ps.setString(8,xglx);
	ps.setDate(9,yqdjzsj);
	ps.setDate(10,null);
	ps.setDate(11,xghqdjzsj);
	ps.setDate(12,null);
	ps.setString(13,xgsm);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update crm_khxx";
	ls_sql+=" set yjjzsj=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,xghqdjzsj);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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