<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;

String xzjg=cf.GB2Uni(request.getParameter("xzjg"));
double zqdj=0;
ls=request.getParameter("zqdj");
try{
	if (!(ls.equals("")))  zqdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前实销单价]类型转换发生意外:"+e);
	return;
}
double dpzk=0;
ls=request.getParameter("dpzk");
try{
	if (!(ls.equals("")))  dpzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dpzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单品折扣]类型转换发生意外:"+e);
	return;
}
double dj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后实销单价]类型转换发生意外:"+e);
	return;
}

String zcpzwzbm=null;
String zcysbm=null;
double sl=0;
double ycf=0;

zcpzwzbm=cf.GB2Uni(request.getParameter("zcpzwzbm"));
zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));


ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
double zqje=0;
ls=request.getParameter("zqje");
try{
	if (!(ls.equals("")))  zqje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前合同材料费]类型转换发生意外:"+e);
	return;
}
double je=0;
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量je不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后合同材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ycf");
try{
	if (!(ls.equals("")))  ycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ycf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[远程费]类型转换发生意外:"+e);
	return;
}

String qtfy=cf.GB2Uni(request.getParameter("qtfy"));
double qtfyje=0;
ls=request.getParameter("qtfyje");
try{
	if (!(ls.equals("")))  qtfyje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qtfyje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[其它费金额]类型转换发生意外:"+e);
	return;
}

double cxhdbl=0;
double cxhdje=0;
double cbj=0;
double jsbl=0;
ls=request.getParameter("cxhdbl");
try{
	if (!(ls.equals("")))  cxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxhdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动比率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxhdje");
try{
	if (!(ls.equals("")))  cxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxhdje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cbj");
try{
	if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[成本价]类型转换发生意外:"+e);
	return;
}
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

String bz=cf.GB2Uni(request.getParameter("bz"));

String ddbh=request.getParameter("ddbh");
String zcbm=request.getParameter("zcbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int mark=0;
	String clzt=null;
	String khbh=null;
	String fgsbh=null;
	String ppbm=null;
	String gys=null;
	String ppmc=null;
	ls_sql =" select clzt,khbh,fgsbh,ppbm,gys,ppmc";
	ls_sql+=" from jc_zcysd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
		fgsbh=rs.getString("fgsbh");
		ppbm=rs.getString("ppbm");
		gys=rs.getString("gys");
		ppmc=rs.getString("ppmc");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR><font color=\"#FF0000\"><B>错误，不能再进行修改！合同已完成</B></font>");
		mark=1;
	}

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcysdmx";
	ls_sql+=" where ddbh='"+ddbh+"' and zcbm='"+zcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR><font color=\"#FF0000\"><B>错误！该种主材已被选择</B></font>");
		mark=1;
	}

	String getppbm=null;
	String getgys=null;
	String getppmc=null;
	ls_sql="select dwbh,gys,ppmc";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where zcbm='"+zcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getppbm=cf.fillNull(rs.getString("dwbh"));
		getgys=cf.fillNull(rs.getString("gys"));
		getppmc=cf.fillNull(rs.getString("ppmc"));
	}
	else{
		out.println("<font color=\"#FF0000\"><B>错误！该种主材不存在</B></font>");
		mark=1;
	}
	rs.close();
	ps.close();

	if (!getppbm.equals(ppbm) || !getgys.equals(gys) || !getppmc.equals(ppmc))
	{
		out.println("<font color=\"#FF0000\"><B>错误！[品牌供应商、供应商、品牌]与订单不一致，订单（"+ppbm+","+gys+","+ppmc+"）；报价表（"+getppbm+","+getgys+","+getppmc+"）</B></font>");
		mark=1;
	}

	if (mark==0)
	{
		String cxhdbz=null;
		if (cxhdbl>0)
		{
			cxhdbz="Y";
		}
		else{
			cxhdbz="N";
		}

		long xh=0;
		ls_sql="select NVL(max(xh),0)";
		ls_sql+=" from  jc_zcysdmx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xh=rs.getLong(1);
		}
		rs.close();
		ps.close();
		xh++;

		
		ls_sql ="insert into jc_zcysdmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,cxjsbl,lscxhdbl  ,xzjg,zqdj,dpzk,dj,cbj,jsbl,sl,zqje,je,ycf,qtfy,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,zjhcxhdje,lx,lrr,lrsj  ,sxbz,sxhtyy,fgsbh,bz,sftjcp)"; 
		ls_sql+="                select ?,?,?,?          ,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xh,gg       ,?     ,jldwbm,sfbhpj,pjts,lsj,yhj  ,cbj  ,jsbl  ,cxhdbl  ,sfycx,cxkssj,cxjzsj,cxj,cxcbj,cxjsbl,lscxhdbl  ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?                                                         ,?,?,?,?,?,'1',?,SYSDATE                              ,?,?,?,?,sftjcp";//xzjg 1:销售限价；2:促销价
		ls_sql+=" from  jc_zcjgb";
		ls_sql+=" where zcbm='"+zcbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xh);
		ps.setString(2,ddbh);
		ps.setString(3,khbh);
		ps.setString(4,zcbm);

		ps.setString(5,zcysbm);

		ps.setString(6,xzjg);
		ps.setDouble(7,zqdj);
		ps.setDouble(8,dpzk);
		ps.setDouble(9,dj);
		ps.setDouble(10,cbj);
		ps.setDouble(11,jsbl);
		ps.setDouble(12,sl);
		ps.setDouble(13,zqje);
		ps.setDouble(14,je);
		ps.setDouble(15,ycf);
		ps.setString(16,qtfy);
		ps.setDouble(17,qtfyje);
		ps.setDouble(18,sl);
		ps.setDouble(19,zqje);
		ps.setDouble(20,je);
		ps.setDouble(21,ycf);
		ps.setDouble(22,qtfyje);

		ps.setString(23,zcpzwzbm);
		ps.setString(24,cxhdbz);
		ps.setDouble(25,cxhdbl);
		ps.setDouble(26,cxhdje);
		ps.setDouble(27,cxhdje);
		ps.setString(28,yhmc);

		ps.setString(29,"1");//1：非手写；2：手写
		ps.setString(30,"");
		ps.setString(31,fgsbh);
		ps.setString(32,bz);
		ps.executeUpdate();
		ps.close();

		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%

		response.sendRedirect("Jc_zcddmxAjaxList.jsp?ddbh="+ddbh);
	}


}
catch (Exception e) {
	out.print("Exception: " + e);
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