<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmzjxyybm=null;
String zjxbz=null;
String bz=null;
java.sql.Date jhazsj=null;
mmzjxyybm=cf.GB2Uni(request.getParameter("mmzjxyybm"));
zjxbz=cf.GB2Uni(request.getParameter("zjxbz"));
bz=cf.GB2Uni(request.getParameter("bz"));
ls=request.getParameter("jhazsj");
try{
	if (!(ls.equals("")))  jhazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhazsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划安装时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date zjxfssj=null;
ls=request.getParameter("zjxfssj");
try{
	if (!(ls.equals("")))  zjxfssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjxfssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项发生时间]类型转换发生意外:"+e);
	return;
}
double mmzkl=0;
ls=request.getParameter("mmzkl");
try{
	if (!(ls.equals("")))  mmzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mmzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[订单折扣]类型转换发生意外:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));

String yddbh=request.getParameter("yddbh");
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String fgsbh=null;
	ls_sql="select clzt,fgsbh";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	//获取保留小数参数＋＋＋＋＋＋＋＋＋＋＋开始
	int jcddblxs=-100;//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	int jcddmxblxs=-100;//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jcddblxs=rs.getInt(1);
		jcddmxblxs=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>错误，没有设置『集成订单保留小数位数』，请联系管理员");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>错误，没有设置『集成订单明细保留小数』，请联系管理员");
		return;
	}
	//获取保留小数参数＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	int count=0;
	ls_sql=" select kjxsj-SYSDATE";
	ls_sql+=" from jc_mmydd";
	ls_sql+=" where yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count<0)
	{
		out.println("提醒！已超出可减项截止时间");
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_mmzjx set mmzjxyybm=?,bz=?,jhazsj=?,zjxfssj=?,mmzkl=?,dzyy=? ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmzjxyybm);
	ps.setString(2,bz);
	ps.setDate(3,jhazsj);
	ps.setDate(4,zjxfssj);
	ps.setDouble(5,mmzkl);
	ps.setString(6,dzyy);
	ps.executeUpdate();
	ps.close();

	//对小数位处理＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql="update jc_mmdgdmx set dj=ROUND(bzdj*"+mmzkl+"/10,"+jcddmxblxs+")";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ls_sql+=" and xh in(select xh from jc_mmzjxmx where zjxxh='"+zjxxh+"' and lx='2')";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_wjjddmx set dj=ROUND(bzdj*"+mmzkl+"/10,"+jcddmxblxs+")";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ls_sql+=" and lrxh in(select lrxh from jc_wjzjxmx where zjxxh='"+zjxxh+"' and lx='2')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update jc_blddmx set dj=ROUND(bzdj*"+mmzkl+"/10,"+jcddmxblxs+")";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ls_sql+=" and lrxh in(select lrxh from jc_blzjxmx where zjxxh='"+zjxxh+"' and lx='2')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//对小数位处理－－－－－－－－－－－－－－－结束
		
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>