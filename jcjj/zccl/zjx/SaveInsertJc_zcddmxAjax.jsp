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
String sfzp=request.getParameter("sfzp");
double zsdj=0;
ls=request.getParameter("zsdj");
try{
	if (!(ls.equals("")))  zsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zsdj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[赠送单价]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");
String zjxbh=request.getParameter("zjxbh");
String clbm=request.getParameter("clbm");


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
	String qddm=null;
	String jzsjs=null;
	String ppbm=null;
	String gys=null;
	String ppmc=null;
	ls_sql =" select clzt,khbh,fgsbh,qddm,jzsjs,ppbm,gys,ppmc";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
		fgsbh=rs.getString("fgsbh");
		qddm=rs.getString("qddm");
		jzsjs=rs.getString("jzsjs");
		ppbm=rs.getString("ppbm");
		gys=rs.getString("gys");
		ppmc=rs.getString("ppmc");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！增减项单已完成");
		return;
	}

	String dqbm=null;
	ls_sql =" select dqbm ";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zczjxmx,jc_zcddmx";
	ls_sql+=" where jc_zczjxmx.zjxbh='"+zjxbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh and jc_zcddmx.zcbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR><font color=\"#FF0000\"><B>提醒！该种主材已被选择</B></font>");
	}



	String getppmc=null;
	String getgysmc=null;
	String getscsmc=null;
	ls_sql="select ppmc,gysmc,scsmc";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb";
	ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
	ls_sql+=" and jxc_clbm.clbm='"+clbm+"' and jxc_cljgb.dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getppmc=cf.fillNull(rs.getString("ppmc"));
		getgysmc=cf.fillNull(rs.getString("gysmc"));
		getscsmc=cf.fillNull(rs.getString("scsmc"));
	}
	else{
		out.println("<font color=\"#FF0000\"><B>错误！该种主材不存在</B></font>");
		mark=1;
	}
	rs.close();
	ps.close();

	if (!getppmc.equals(ppbm) || !getgysmc.equals(gys) || !getscsmc.equals(ppmc))
	{
		out.println("<font color=\"#FF0000\"><B>错误！[品牌、供应商、子品牌]与订单不一致，订单（"+ppbm+","+gys+","+ppmc+"）；报价表（"+getppmc+","+getgysmc+","+getscsmc+"）</B></font>");
		mark=1;
	}

	conn.setAutoCommit(false);

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
		ls_sql+=" from  jc_zcddmx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xh=rs.getLong(1);
		}
		rs.close();
		ps.close();
		xh++;
		
		if (xzjg.equals("1"))//1:销售限价；2:促销价
		{
			ls_sql ="insert into jc_zcddmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg                                                                                      ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj                                                 ,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,cxjsbl,lscxhdbl                                                                                                ,xzjg,zqdj,dpzk,dj,cbj,jsbl,sl,zqje,je,ycf,qtfy,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,zjhcxhdje,lx,lrr,lrsj  ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz,sftjcp,cksl,ckje,shsl,sfzp,zsdj ,jsfs,zdxsj,bzyjjrbl,cxyjjrbl,yjjrbl,htyjjrje,zjhyjjrje)"; 
			ls_sql+="                select ?,?,?,?          ,jxc_clbm.clmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.ppmc,jxc_cljgb.gysmc,jxc_clbm.scsmc,jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.gg      ,?     ,jxc_clbm.jldwbm,jxc_clbm.sfbhpj,jxc_clbm.pjts,jxc_cljgb.lsj,jxc_cljgb.xsj  ,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_cljgb.cxhdbl,jxc_cljgb.sfycx,jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,jxc_cljgb.cxj,jxc_cljgb.cxcbj,jxc_cljgb.cxjsbl,jxc_cljgb.lscxhdbl  ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?                                                         ,?,?,?,?,?,'2',?,SYSDATE                              ,?,?,?,?,?,?,sftjcp,0,0,0,?,?                                    ,jsfs,zdxsj,yjjrbl  ,cxyjjrbl,yjjrbl,0       ,yjjrbl/100*?";//xzjg 1:销售限价；2:促销价
			ls_sql+=" FROM jxc_clbm,jxc_cljgb";
			ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
			ls_sql+=" and jxc_clbm.clbm='"+clbm+"' and jxc_cljgb.dqbm='"+dqbm+"'";
		}
		else{
			ls_sql ="insert into jc_zcddmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg                                                                                      ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj                                                 ,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,cxjsbl,lscxhdbl                                                                                                ,xzjg,zqdj,dpzk,dj,cbj,jsbl,sl,zqje,je,ycf,qtfy,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,zjhcxhdje,lx,lrr,lrsj  ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz,sftjcp,cksl,ckje,shsl,sfzp,zsdj ,jsfs,zdxsj,bzyjjrbl,cxyjjrbl,yjjrbl  ,htyjjrje,zjhyjjrje)"; 
			ls_sql+="                select ?,?,?,?          ,jxc_clbm.clmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.ppmc,jxc_cljgb.gysmc,jxc_clbm.scsmc,jxc_clbm.cllbbm,jxc_clbm.xh,jxc_clbm.gg      ,?     ,jxc_clbm.jldwbm,jxc_clbm.sfbhpj,jxc_clbm.pjts,jxc_cljgb.lsj,jxc_cljgb.xsj  ,jxc_cljgb.cbj,jxc_cljgb.jsbl,jxc_cljgb.cxhdbl,jxc_cljgb.sfycx,jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,jxc_cljgb.cxj,jxc_cljgb.cxcbj,jxc_cljgb.cxjsbl,jxc_cljgb.lscxhdbl  ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?                                                         ,?,?,?,?,?,'2',?,SYSDATE                              ,?,?,?,?,?,?,sftjcp,0,0,0,?,?                                    ,jsfs,zdxsj,yjjrbl  ,cxyjjrbl,cxyjjrbl,0       ,cxyjjrbl/100*?";//xzjg 1:销售限价；2:促销价
			ls_sql+=" FROM jxc_clbm,jxc_cljgb";
			ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
			ls_sql+=" and jxc_clbm.clbm='"+clbm+"' and jxc_cljgb.dqbm='"+dqbm+"'";
		}
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xh);
		ps.setString(2,ddbh);
		ps.setString(3,khbh);
		ps.setString(4,clbm);

		ps.setString(5,zcysbm);

		ps.setString(6,xzjg);
		ps.setDouble(7,zqdj);
		ps.setDouble(8,dpzk);
		ps.setDouble(9,dj);
		ps.setDouble(10,cbj);
		ps.setDouble(11,jsbl);
		ps.setDouble(12,0);
		ps.setDouble(13,0);
		ps.setDouble(14,0);
		ps.setDouble(15,0);
		ps.setString(16,qtfy);
		ps.setDouble(17,0);
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
		ps.setString(32,qddm);
		ps.setString(33,jzsjs);
		ps.setString(34,bz);
		ps.setString(35,sfzp);
		ps.setDouble(36,zsdj);
		ps.setDouble(37,je);
		ps.executeUpdate();
		ps.close();

//		out.println(xh);


		double yjjrbl=0;
		ls_sql =" select yjjrbl";
		ls_sql+=" from jc_zcddmx";
		ls_sql+=" where xh="+xh;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yjjrbl=rs.getDouble("yjjrbl");
		}
		rs.close();
		ps.close();

		double zjyjjrje=cf.round(je*yjjrbl/100,2);

		ls_sql ="insert into jc_zczjxmx (ddbh,zjxbh,xh   ,zjsl,zqzjje,zjje,zjcxhdje,zjycf,zjqtfy,zjcbje,bz,zqsxdj,dpzkl,zhsxdj  ,lx,sxbz,cksl,ckje,shsl,zjyjjrje) ";
		ls_sql+=" values( ?,?,?   ,?,?,?,?,?,?,?,?,?,?,?  ,'2','1',0,0,0,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setString(2,zjxbh);
		ps.setLong(3,xh);

		ps.setDouble(4,sl);
		ps.setDouble(5,zqje);
		ps.setDouble(6,je);
		ps.setDouble(7,cxhdje);
		ps.setDouble(8,ycf);
		ps.setDouble(9,qtfyje);
		ps.setDouble(10,sl*cbj);//增减成本金额
		ps.setString(11,bz);
		ps.setDouble(12,zqdj);
		ps.setDouble(13,dpzk);
		ps.setDouble(14,dj);
		ps.setDouble(15,zjyjjrje);
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
	}

	conn.commit();


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

	
	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql ="SELECT jc_zcddmx.xh xh,DECODE(jc_zczjxmx.lx,'1','原项目','2','新增') lx,DECODE(jc_zczjxmx.sxbz,'1','非手写','2','手写') sxbz,jc_zcddmx.sxhtyy,jc_zcddmx.dwbh,zclbbm,jc_zcddmx.zcbm zcbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'1','销售价','2','<font color=\"#FF0000\">促销价</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl,jc_zczjxmx.zjje ,jc_zczjxmx.zjycf,jc_zczjxmx.zjqtfy,jc_zczjxmx.zjcxhdje,jc_zcddmx.zjhsl,jc_zcddmx.zjhje,jc_zcddmx.zjhycf,jc_zcddmx.zjhqtfy,jc_zcddmx.zjhcxhdje,cxhdbl||'%' cxhdbl,jc_zczjxmx.bz  ";
	ls_sql+=" FROM jc_zczjxmx,jc_zcddmx";
    ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh and jc_zczjxmx.zjxbh='"+zjxbh+"'";
    ls_sql+=" order by jc_zczjxmx.lx,jc_zcddmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_zcddmxMain.jsp?zjxbh="+zjxbh+"&ddbh="+ddbh);
	pageObj.setPageRow(1000);//设置每页显示记录数
//设置显示列
	String[] disColName={"lx","sxbz","zclbbm","zcmc","xinghao","gg","xzjg","dj","jldwbm","cxhdbl","zjsl","zjje","zjycf","zjqtfy","zjcxhdje","zjhsl","zjhje","zjhycf","zjhqtfy","zjhcxhdje","zcpzwzbm","zcysbm","sxhtyy","zcbm","dwbh","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的主材"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_zcddmx.jsp?zjxbh="+zjxbh+"&ddbh="+ddbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">增减项明细（增减项编号：<%=zjxbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="360%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">类型</td>
	<td  width="3%">手写标志</td>
	<td  width="7%">系列</td>
	<td  width="5%">主材名称</td>
	<td  width="5%">型号</td>
	<td  width="4%">规格</td>
	<td  width="3%">选择价格</td>
	<td  width="3%">单价</td>
	<td  width="2%">计量单位</td>
	<td  width="3%">计入活动比率</td>
	<td  width="3%" bgcolor="#CC99FF">增减数量</td>
	<td  width="4%" bgcolor="#CC99FF">增减材料费</td>
	<td  width="3%" bgcolor="#CC99FF">增减远程费</td>
	<td  width="3%" bgcolor="#CC99FF">增减其它费</td>
	<td  width="4%" bgcolor="#CC99FF">增减计入活动金额</td>
	<td  width="3%">原数量</td>
	<td  width="4%">原材料费</td>
	<td  width="3%">原远程费</td>
	<td  width="3%">原其它费</td>
	<td  width="4%">原计入活动金额</td>
	<td  width="4%">铺装位置</td>
	<td  width="3%">颜色</td>
	<td  width="5%">手写合同原因</td>
	<td  width="3%">主材编码</td>
	<td  width="5%">子品牌</td>
	<td  width="5%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>