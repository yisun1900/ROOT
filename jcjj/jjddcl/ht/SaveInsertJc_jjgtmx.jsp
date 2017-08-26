<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gtxh=null;
String ddbh=null;
String gtmc=null;
String jjazwz=null;
String guige=null;
String jjlx=null;
String bclx=null;
String bcys=null;
double bcbfje=0;
double pjbfje=0;
double zj=0;
String bz=null;
gtxh=cf.GB2Uni(request.getParameter("gtxh"));
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
gtmc=cf.GB2Uni(request.getParameter("gtmc"));
jjazwz=cf.GB2Uni(request.getParameter("jjazwz"));
guige=cf.GB2Uni(request.getParameter("guige"));
jjlx=cf.GB2Uni(request.getParameter("jjlx"));
bclx=cf.GB2Uni(request.getParameter("bclx"));
bcys=cf.GB2Uni(request.getParameter("bcys"));
ls=request.getParameter("bcbfje");
try{
	if (!(ls.equals("")))  bcbfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bcbfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[板材部分金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pjbfje");
try{
	if (!(ls.equals("")))  pjbfje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pjbfje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配件部分金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zj");
try{
	if (!(ls.equals("")))  zj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[总价]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String fgsbh=null;
	String clzt=null;
	double jjzkl=0;
	ls_sql="select fgsbh,clzt,jjzkl";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		clzt=rs.getString("clzt");
		jjzkl=rs.getDouble("jjzkl");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("13"))
	{
		out.println("！错误，处理状态不正确");
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



	String bcpp=null;
	ls_sql="select bcpp";
	ls_sql+=" from  jc_jjbjbj";
	ls_sql+=" where  bclx='"+bclx+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bcpp=rs.getString("bcpp");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="insert into jc_jjgtmx ( gtxh,ddbh,gtmc,jjazwz,guige,jjlx,bcpp,bclx,bcys,bz   ,zqbcbfje,zqpjbfje,zqzj,bcbfje,pjbfje,zj,sl,zjhsl ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,ROUND(?,"+jcddmxblxs+"),ROUND(?,"+jcddmxblxs+"),ROUND(?,"+jcddmxblxs+"),1,1 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gtxh);
	ps.setString(2,ddbh);
	ps.setString(3,gtmc);
	ps.setString(4,jjazwz);
	ps.setString(5,guige);
	ps.setString(6,jjlx);
	ps.setString(7,bcpp);
	ps.setString(8,bclx);
	ps.setString(9,bcys);
	ps.setString(10,bz);

	ps.setDouble(11,bcbfje);
	ps.setDouble(12,pjbfje);
	ps.setDouble(13,zj);
	ps.setDouble(14,bcbfje*jjzkl/10);
	ps.setDouble(15,pjbfje*jjzkl/10);
	ps.setDouble(16,zj*jjzkl/10);
	ps.executeUpdate();
	ps.close();

	//计算金额总计＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	double jjje=0;
	double cpjjje=0;
	double xcmje=0;
	double htze=0;

	double zqjjje=0;
	double zqcpjjje=0;
	double zqxcmje=0;
	double wdzje=0;

	//家具合同金额
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjje=rs.getDouble(1);
		zqjjje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//成品家具合同金额
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_cpjjddmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpjjje=rs.getDouble(1);
		zqcpjjje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//型材门合同金额
	ls_sql="select sum(zj),sum(zqzj)";
	ls_sql+=" from  jc_jjxcmmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xcmje=rs.getDouble(1);
		zqxcmje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//合同总额
	htze=jjje+xcmje+cpjjje;
	wdzje=zqjjje+zqxcmje+zqcpjjje;

	ls_sql="update jc_jjdd set jjje=ROUND(?,"+jcddmxblxs+"),xcmje=ROUND(?,"+jcddmxblxs+"),cpjjje=ROUND(?,"+jcddmxblxs+"),htze=ROUND(?,"+jcddblxs+")   ,zqjjje=?,zqxcmje=?,zqcpjjje=?,wdzje=? ";
	ls_sql+="          ,jjzjje=ROUND(?,"+jcddmxblxs+"),xcmzjje=ROUND(?,"+jcddmxblxs+"),cpjjzjje=ROUND(?,"+jcddmxblxs+"),zjhze=ROUND(?,"+jcddblxs+")   ,zqjjzjje=?,zqxcmzjje=?,zqcpjjzjje=?,zqzjhze=?";
    ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jjje);
	ps.setDouble(2,xcmje);
	ps.setDouble(3,cpjjje);
	ps.setDouble(4,htze);

	ps.setDouble(5,zqjjje);
	ps.setDouble(6,zqxcmje);
	ps.setDouble(7,zqcpjjje);
	ps.setDouble(8,wdzje);

	ps.setDouble(9,jjje);
	ps.setDouble(10,xcmje);
	ps.setDouble(11,cpjjje);
	ps.setDouble(12,htze);

	ps.setDouble(13,zqjjje);
	ps.setDouble(14,zqxcmje);
	ps.setDouble(15,zqcpjjje);
	ps.setDouble(16,wdzje);

	ps.executeUpdate();
	ps.close();

	//集成订单
	ls_sql="update jc_jcdd set zqje=?,zhje=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where ddbh='"+ddbh+"' and lx='3' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wdzje);
	ps.setDouble(2,htze);
	ps.executeUpdate();
	ps.close();

	//计算金额总计＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

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
	out.print("存盘失败,发生意外: " + e);
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