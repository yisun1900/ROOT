<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>集成家居订单跟踪</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhdlm=(String)session.getAttribute("yhdlm");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	
	String zdyhbz=cf.executeQuery("select zdyhbz from sq_yhxx where yhdlm='"+yhdlm+"'");//Y：重点用户；N：非重点用户
	String xmzymc="";
	String wheresql1="";
	String wheresql2="";
	String wheresql3="";
	String wheresql4="";
	if (zdyhbz.equals("Y"))
	{
		xmzymc="全部项目专员";
	}
	else 
	{
		xmzymc=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"'");
		wheresql1+=" and jc_mmydd.xmzy='"+xmzymc+"'";
		wheresql2+=" and jc_cgdd.xmzy='"+xmzymc+"'";
		wheresql3+=" and jc_jjdd.xmzy='"+xmzymc+"'";
		wheresql4+=" and jc_zcdd.xmzy='"+xmzymc+"'";
	}

%>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int mmhtyq=0;
int mmccyq=0;
int mmrkyq=0;
int mmazyq=0;

int cghtyq=0;
int cgccyq=0;
int cgfcyq=0;
int cgrkyq=0;
int cgazyq=0;

int jjhtyq=0;
int jjccyq=0;
int jjfcyq=0;
int jjrkyq=0;
int jjazyq=0;

int zcccyq=0;
int zcaztx=0;
int zcazyq=0;

int mmqxdds=0;
int cgqxdds=0;
int jjqxdds=0;
int zcqxdds=0;

try {
	conn=cf.getConnection();
/*****************************求取消订单数***********************************/
//求木门取消订单数
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmydd ";
	ls_sql+=" where clzt='99' ";
	ls_sql+=wheresql1;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmqxdds=rs.getInt(1);
	}
	ps.close();
	rs.close();
//求橱柜取消订单数
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd ";
	ls_sql+=" where clzt='99' ";
	ls_sql+=wheresql2;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgqxdds=rs.getInt(1);
	}
	ps.close();
	rs.close();
//求家具取消订单数
	ls_sql="select count(*)";
	ls_sql+=" from  jc_jjdd ";
	ls_sql+=" where clzt='99' ";
	ls_sql+=wheresql3;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjqxdds=rs.getInt(1);
	}
	ps.close();
	rs.close();
//求主材取消订单数
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd ";
	ls_sql+=" where clzt='99' ";
	ls_sql+=wheresql4;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcqxdds=rs.getInt(1);
	}
	ps.close();
	rs.close();


/*******************************签合同延期*********************************/
	//木门签合同延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmydd,crm_khxx";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh and jgrq-SYSDATE<30";
	ls_sql+=wheresql1;
	ls_sql+=" and clzt<'04'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmhtyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//橱柜签合同延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd,crm_khxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and jgrq-SYSDATE<25";
	ls_sql+=wheresql2;
	ls_sql+=" and clzt<'13'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cghtyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//家具签合同延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_jjdd,crm_khxx";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jgrq-SYSDATE<25";
	ls_sql+=wheresql3;
	ls_sql+=" and clzt<'13'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjhtyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

/*******************************初测延期*********************************/
	//木门初测延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where jhccsj<SYSDATE";
	ls_sql+=wheresql1;
	ls_sql+=" and clzt<'03'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmccyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//橱柜初测延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where jhccsj<SYSDATE";
	ls_sql+=wheresql2;
	ls_sql+=" and clzt<'07'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgccyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//家具初测延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where jhccsj<SYSDATE";
	ls_sql+=wheresql3;
	ls_sql+=" and clzt<'07'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjccyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//主材测量延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where (jhclsj<SYSDATE or tzclsj is not null)";
	ls_sql+=wheresql4;
	ls_sql+=" and xclbz in('2','3')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcccyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

/*******************************复测延期*********************************/
	//橱柜复测延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where jhfcsj<SYSDATE";
	ls_sql+=wheresql2;
	ls_sql+=" and clzt<'11'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgfcyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

/*******************************入库延期*********************************/
	//木门入库延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmydd,crm_khxx";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh and jgrq-SYSDATE<10";
	ls_sql+=wheresql1;
	ls_sql+=" and clzt<'05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmrkyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//橱柜入库延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd,crm_khxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh and jgrq-SYSDATE<8";
	ls_sql+=wheresql2;
	ls_sql+=" and clzt<'25'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgrkyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//家具入库延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_jjdd,crm_khxx";
	ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh and jgrq-SYSDATE<8";
	ls_sql+=wheresql3;
	ls_sql+=" and clzt<'25'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjrkyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

/*******************************安装/送货延期*********************************/
	//木门安装延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where jhazsj<SYSDATE";
	ls_sql+=wheresql1;
	ls_sql+=" and clzt<'11'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmazyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//橱柜安装延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where jhazrq<SYSDATE";
	ls_sql+=wheresql2;
	ls_sql+=" and clzt<'31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgazyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//家具安装延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where jhazrq<SYSDATE";
	ls_sql+=wheresql3;
	ls_sql+=" and clzt<'31'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjazyq=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//主材送货提醒
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where (htshsj<SYSDATE+2)";
	ls_sql+=wheresql4;
	ls_sql+=" and clzt<'03'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcaztx=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//主材送货延期
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where (htshsj<SYSDATE or tzshsj is not null)";
	ls_sql+=wheresql4;
	ls_sql+=" and clzt<'09'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcazyq=rs.getInt(1);
	}
	ps.close();
	rs.close();
/*
*/

}
catch (Exception e) {
	out.print("Exception: " + e);
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


<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">集成家居订单跟踪（项目专员：<%=xmzymc%>）</div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
  <tr align="center"> 
    <td width="6%" > 
      <div align="center"><b>类 型</b></div>
    </td>
    <td width="9%" > 
      <div align="center">初测延期&nbsp;</div>
    </td>
    <td width="9%" > 
      <div align="center">复测延期&nbsp;</div>
    </td>
    <td width="9%" >签合同延期</td>
    <td width="9%" >入库延期</td>
    <td width="12%" >安装/送货提醒</td>
    <td width="12%" > 
      <div align="center">安装/送货延期</div>
    </td>
    <td width="9%" >取消订单</td>
  </tr>
  <tr align="center"> 
    <td width="10%" > 
      <div align="center">木门</div>
    </td>
    <td width="9%" ><a href="ViewMmCcmx.jsp" target="_blank"><%=mmccyq%>起</a></td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" ><a href="ViewMmHtmx.jsp" target="_blank"><%=mmhtyq%>起</a></td>
    <td width="9%" ><a href="ViewMmRkmx.jsp" target="_blank"><%=mmrkyq%>起</a></td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" ><a href="ViewMmAzmx.jsp" target="_blank"><%=mmazyq%>起</a></td>
    <td width="9%" ><a href="ViewMmTdmx.jsp" target="_blank"><%=mmqxdds%>起</a></td>
  </tr>
  <tr align="center"> 
    <td width="10%" >橱柜</td>
    <td width="9%" ><a href="ViewCgCcmx.jsp" target="_blank"><%=cgccyq%>起</a></td>
    <td width="9%" ><a href="ViewCgFcmx.jsp" target="_blank"><%=cgfcyq%>起</a></td>
    <td width="9%" ><a href="ViewCgHtmx.jsp" target="_blank"><%=cghtyq%>起</a></td>
    <td width="9%" ><a href="ViewCgRkmx.jsp" target="_blank"><%=cgrkyq%>起</a></td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" ><a href="ViewCgAzmx.jsp" target="_blank"><%=cgazyq%>起</a></td>
    <td width="9%" ><a href="ViewCgTdmx.jsp" target="_blank"><%=cgqxdds%>起</a></td>
  </tr>
  <tr align="center"> 
    <td width="10%" >家具</td>
    <td width="9%" ><a href="ViewJjCcmx.jsp" target="_blank"><%=jjccyq%>起</a></td>
    <td width="9%" ><a href="ViewJjFcmx.jsp" target="_blank"><%=jjfcyq%>起</a></td>
    <td width="9%" ><a href="ViewJjHtmx.jsp" target="_blank"><%=jjhtyq%>起</a></td>
    <td width="9%" ><a href="ViewJjRkmx.jsp" target="_blank"><%=jjrkyq%>起</a></td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" ><a href="ViewJjAzmx.jsp" target="_blank"><%=jjazyq%>起</a></td>
    <td width="9%" ><a href="ViewJjTdmx.jsp" target="_blank"><%=jjqxdds%>起</a></td>
  </tr>
  <tr align="center"> 
    <td width="10%" >主材</td>
    <td width="9%" ><a href="ViewZcCcmx.jsp" target="_blank"><%=zcccyq%>起</a></td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" ><a href="ViewZcAzTxmx.jsp" target="_blank"><%=zcaztx%>起</a></td>
    <td width="9%" ><a href="ViewZcAzmx.jsp" target="_blank"><%=zcazyq%>起</a></td>
    <td width="9%" ><a href="ViewZcTdmx.jsp" target="_blank"><%=zcqxdds%>起</a></td>
  </tr>
</table>

</body>
</html>
