<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String sgd=request.getParameter("sgd");
	String ls_sql=null;


	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	double allzbj=0;
	String sgdmc=null;

	double jxje=0;
	double zjje=0;
	double jsje=0;
	double allzjzbj=0;
	
	try {
		conn=cf.getConnection();

		ls_sql="select sgdmc,zbj";
		ls_sql+=" from  sq_sgd";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sgdmc=rs.getString("sgdmc");
			allzbj=rs.getDouble("zbj");
		}
		rs.close();
		ps.close();

		ls_sql="select sum(je)";
		ls_sql+=" from  cw_zbjjsjl";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jxje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(je)";
		ls_sql+=" from  cw_zbzjsjl";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(wxj)";
		ls_sql+=" from  cw_gdjsjl";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jsje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		allzjzbj=zjje+jsje-jxje;


	}
	catch (Exception e) {
		out.print("<BR>出错:" + e);
		out.print("<BR>SQL=" + ls_sql);
		return;
	}
	finally 
	{
		try{
			if (rs != null) rs.close(); 
			if (ps != null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			if (conn != null) cf.close(conn); 
		}
	}


%>
<body bgcolor="#FFFFFF">
<div align="center">减少质保金（施工队：<%=sgdmc%>，目前质保金：<%=allzbj%>，共增减质保金：<%=cf.formatDouble(jxje+zjje+jsje)%>） </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">序号</td>
	<td  width="8%">施工队</td>
	<td  width="14%">质保金减少原因</td>
	<td  width="14%">金额</td>
	<td  width="8%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="38">备注</td>
</tr>

<%
	ls_sql="SELECT cw_zbjjsjl.xuhao,sq_sgd.sgdmc,dm_zbjjsyybm.zbjjsyymc,cw_zbjjsjl.je,cw_zbjjsjl.lrr,cw_zbjjsjl.lrsj,cw_zbjjsjl.bz  ";
	ls_sql+=" FROM dm_zbjjsyybm,sq_sgd,cw_zbjjsjl  ";
    ls_sql+=" where cw_zbjjsjl.zbjjsyybm=dm_zbjjsyybm.zbjjsyybm(+) and cw_zbjjsjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_zbjjsjl.sgd='"+sgd+"'";
    ls_sql+=" order by cw_zbjjsjl.xuhao desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>


<div align="center"> 增加质保金</div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="8%">序号</td>
	<td  width="10%">施工队</td>
	<td  width="14%">金额</td>
	<td  width="8%">录入人</td>
	<td  width="10%">录入时间</td>
	<td  width="50%">备注</td>
  </tr>
  <%

	ls_sql="SELECT cw_zbzjsjl.xuhao,sq_sgd.sgdmc,cw_zbzjsjl.je,cw_zbzjsjl.lrr,cw_zbzjsjl.lrsj,cw_zbzjsjl.bz  ";
	ls_sql+=" FROM sq_sgd,cw_zbzjsjl  ";
    ls_sql+=" where cw_zbzjsjl.sgd=sq_sgd.sgd";
    ls_sql+=" and cw_zbzjsjl.sgd='"+sgd+"'";
    ls_sql+=" order by cw_zbzjsjl.xuhao desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("pdsgd","1");//列参数对象加入Hash表
	spanColHash.put("sgdlx","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
</table>

<div align="center">施工队完工结算 </div>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">结算记录号</td>
	<td  width="6%">客户姓名</td>
	<td  width="6%">合同号</td>
	<td  width="9%">工程原报价</td>
	<td  width="9%">工程签约额</td>
	<td  width="5%">折扣率</td>
	<td  width="8%">增减项金额</td>
	<td  width="8%">扣质保金</td>
	<td  width="5%">扣质保金比例</td>
	<td  width="9%">应付工费</td>
	<td  width="8%">结算时间</td>
	<td  width="20%">备注</td>
</tr>

<%

	ls_sql="SELECT cw_gdjsjl.gdjsjlh,crm_khxx.khxm,crm_khxx.hth,cw_gdjsjl.wdzgce,cw_gdjsjl.qye,TO_CHAR(cw_gdjsjl.zkl),cw_gdjsjl.zjxje,cw_gdjsjl.wxj,cw_gdjsjl.wxjbfb||'%',cw_gdjsjl.gdjskze,cw_gdjsjl.jssj,cw_gdjsjl.bz";
	ls_sql+=" FROM cw_gdjsjl,crm_khxx,sq_sgd  ";
    ls_sql+=" where cw_gdjsjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gdjsjl.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_gdjsjl.sgd='"+sgd+"' and cw_gdjsjl.wxj>0";
	ls_sql+=" order by cw_gdjsjl.jssj desc ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%>
</table>


</body>
</html>
