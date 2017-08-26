<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jsjlh=request.getParameter("jsjlh");

double jsjsze=0;
double sjbk=0;

double ycsjbk=0;
double ecsjbk=0;
double scsjbk=0;


String khbh=null;
String khxm=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String sgdmc=null;
double qye=0;
double zkl=0;

String gdjsjd="";
double clkhj=0;
String lrr=null;

String sqr="";
String sqsj="";
String sqbm="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select khbh,sjbk,lrr,gdjsjd";
	ls_sql+=" from  cw_sgdbgfty";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sjbk=rs.getDouble("sjbk");
		lrr=cf.fillNull(rs.getString("lrr"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	else{
		rs.close();
		ps.close();
		out.println("错误！拨款记录不存在:"+jsjlh);
		return;
	}
	rs.close();
	ps.close();

	int row=0;
	ls_sql="select jsjsze,sjbk";
	ls_sql+=" from  cw_sgdbgfty";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by jsjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jsjsze=rs.getDouble("jsjsze");
		sjbk=rs.getDouble("sjbk");

		row++;
		if (row==1)
		{
			ycsjbk=sjbk;
		}
		else if (row==2)
		{
			ecsjbk=sjbk;
		}
		else if (row==3)
		{
			scsjbk=sjbk;
		}
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,sjs,sgdmc,zjxm,qye,zkl";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		qye=rs.getDouble("qye");
		zkl=rs.getDouble("zkl");
	}
	rs.close();
	ps.close();


	ls_sql="select sqr,sqsj,sqbm";
	ls_sql+=" from  cw_sgdjssqjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ls_sql+=" and jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqr=cf.fillNull(rs.getString("sqr"));
		sqsj=cf.fillNull(rs.getDate("sqsj"));
		sqbm=cf.fillNull(rs.getString("sqbm"));
	}
	rs.close();
	ps.close();



	//施工队领材料合计
	clkhj=0;
	ls_sql="select sum(pszje)";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and psdzt in('2','3','5')";
	//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clkhj=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//工地用品合计
	ls_sql="select sum(je)";
	ls_sql+=" from  cw_gdyplyjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";//0：未结算；1：已结算
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clkhj+=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	clkhj=cf.round(clkhj,2);

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

<html>
<head>
<title>拨款单</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<div align="center">拨款单</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF" height="34">
    <td width="25%">客户编号：<U><%=khbh%></U></td>
    <td width="25%">客户姓名：<U><%=khxm%></U></td>
    <td width="25%">设计师：<U><%=sjs%></U></td>
    <td width="25%">监理：<U><%=zjxm%></U></td>
  </tr>
  
  <tr bgcolor="#FFFFFF" height="34">
    <td colspan="3">房屋地址：<U><%=fwdz%></U></td>
    <td>施工队：<U><%=sgdmc%></U></td>
  </tr>
  
  
  <tr bgcolor="#FFFFFF" height="34">
  <td>合同金额：<U><%=qye%></U></td>
  <td>折扣：<U><%=zkl%></U></td>
  <td>拨款基数：<U><%=jsjsze%></U></td>
  <td>材料款合计：<U><%=clkhj%></U></td>
</tr>
  <tr bgcolor="#FFFFFF" height="34">
  <td>第一次拨款：<U><%=ycsjbk%></U></td>
  <td>第二次拨款：<U><%=ecsjbk%></U></td>
  <td>第三次拨款：<U><%=scsjbk%></U></td>
  <td>&nbsp;</td>
</tr>
  <tr bgcolor="#FFFFFF" height="34">
  <td colspan="4">金额大写：<U><%=cf.NumToRMBStr(sjbk)%></U></td>
  </tr>
</table>

<BR>
<table width="100%"  border="0" cellpadding="1" cellspacing="0" bgcolor="#999999" style="FONT-SIZE:14">
  <tr bgcolor="#FFFFFF" height="34">
    <td width="25%">工程经理：<U>&nbsp;<%=sqr%>&nbsp;</U></td>
    <td width="25%">财务：<U>&nbsp;<%=lrr%>&nbsp;</U></td>
    <td width="25%">总经理：<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
    <td width="25%">领款人：<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td width="25%">&nbsp;</td>
    <td width="25%">&nbsp;</td>
    <td colspan="2" align="center"><U>&nbsp;<%=cf.today("YYYY")%>&nbsp;</U>年<U>&nbsp;<%=cf.today("MM")%>&nbsp;</U>月<U>&nbsp;<%=cf.today("DD")%>&nbsp;</U>日</td>
  </tr>
</table>


</body>
</html>

