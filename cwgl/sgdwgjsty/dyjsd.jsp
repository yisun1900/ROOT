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



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select khbh,sjbk";
	ls_sql+=" from  cw_sgdbgfty";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sjbk=rs.getDouble("sjbk");
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
<title>工程结算单</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<div align="center">工程结算单</div>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF">
    <td><table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
      <tr bgcolor="#FFFFFF" height="34">
        <td width="25%">客户编号：<U><%=khbh%></U></td>
        <td width="25%">客户姓名：<U><%=khxm%></U></td>
        <td width="25%">设计师：<U><%=sjs%></U></td>
        <td width="25%">监理：<U><%=zjxm%></U></td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td colspan="3">房屋地址：<U><%=fwdz%></U></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>施工工期 天</td>
        <td>实际工期 天 </td>
        <td>竣工日期：</td>
        <td>结算日期：</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>施工队：<u><%=sgdmc%></u></td>
        <td>施工队星级：</td>
        <td>结算比例： </td>
        <td>&nbsp;</td>
      </tr>
      
    </table></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">

      <tr bgcolor="#FFFFFF" height="34">
        <td width="25%">合同金额：<U><%=qye%></U></td>
        <td width="25%">工程造价：</td>
        <td width="25%">开工前变更：</td>
        <td width="25%">开工后变更：</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>实际金额：</td>
        <td>应结算：</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>其它费：</td>
        <td>应结算：</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>水电预收：</td>
        <td>水电变更：</td>
        <td>实际水电： </td>
        <td>应结算：</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>远程施工（补）：</td>
        <td>应扣质保金：</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td colspan="4" align="center">合计：</td>
        </tr>
    </table></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
      <tr bgcolor="#FFFFFF" height="34">
        <td width="25%">客户欠款：</td>
        <td width="25%">尾款：</td>
        <td width="25%">延期 天 </td>
        <td width="25%">延期费：</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>工地处罚：</td>
        <td>处罚原因：</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>客户满意度：</td>
        <td>客户不满意：</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>设计师处罚：</td>
        <td>监理处罚：</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>工程经理处罚：</td>
        <td>项目部处罚：</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>奖励原因： </td>
        <td>奖励金额：</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td colspan="4" align="center">合计处罚： 元</td>
        </tr>
    </table></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
      <tr bgcolor="#FFFFFF" height="34">
        <td width="33%">首期一次： 元 </td>
        <td width="34%">材料费：</td>
        <td width="33%">工地用品：</td>
        </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>首期二次： 元 </td>
        <td>材料费：</td>
        <td>工地用品：</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>中期一次： 元 </td>
        <td>材料费：</td>
        <td>工地用品：</td>
      </tr>
      
      <tr bgcolor="#FFFFFF" height="34">
        <td>巡检奖励：</td>
        <td>巡检处罚：</td>
        <td>&nbsp;</td>
        </tr>
      
      <tr bgcolor="#FFFFFF" height="34">
        <td colspan="3" align="center">合计已付：</td>
      </tr>
    </table></td>
  </tr>
</table>

<BR>
<table width="100%"  border="0" cellpadding="1" cellspacing="0" bgcolor="#999999" style="FONT-SIZE:14">
  <tr bgcolor="#FFFFFF" height="44">
    <td colspan="4">本次应结算：</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="34">
    <td width="25%">工程经理：<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
    <td width="25%">财务经理：<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
    <td width="25%">总经理：<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
    <td width="25%">领款人：<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td width="25%">&nbsp;</td>
    <td width="25%">&nbsp;</td>
    <td colspan="2" align="center"><U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U>年<U>&nbsp;&nbsp;&nbsp;&nbsp;</U>月<U>&nbsp;&nbsp;&nbsp;&nbsp;</U>日</td>
  </tr>
</table>


</body>
</html>

