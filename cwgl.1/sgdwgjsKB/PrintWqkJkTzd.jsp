<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String fgsbh=null;
String khxm=null;
String hth=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;

double wdzgce=0;
double qye=0;
double suijin=0;
double guanlif=0;
double zhwjrqyexm=0;
double zhzjxje=0;
double zjxsuijin=0;
double zjxguanlif=0;
double sfke=0;

try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,crm_khxx.dwbh,khxm,hth,crm_khxx.sgd,sgdmc,sgbz,wdzgce,qye,suijin,guanlif,zhwjrqyexm,zhzjxje,zjxsuijin,zjxguanlif,sfke";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,cw_fkcs,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and khbh='"+khbh+"' and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		hth=cf.fillNull(rs.getString("hth"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zhzjxje=rs.getDouble("zhzjxje");
		suijin=rs.getDouble("suijin");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		zjxsuijin=rs.getDouble("zjxsuijin");
		guanlif=rs.getDouble("guanlif");
		zjxguanlif=rs.getDouble("zjxguanlif");
		sfke=rs.getDouble("sfke");
	}
		rs.close();
		ps.close();



%>
<html>
<head>
<title>尾期款交款通知单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><b><font size="5">尾&nbsp;期&nbsp;款&nbsp;交&nbsp;款&nbsp;通&nbsp;知&nbsp;单</font></b> </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>

  <tr height="35"> 
    <td width="15%" height="41" align="center"><b>客户姓名</b></td>
    <td width="15%"><%=khxm%></td>
    <td width="15%" align="center"><b>合同号</b></td>
    <td width="20%"><%=hth%></td>
    <td width="15%" align="center"><b>工长</b></td>
    <td width="20%"><%=sgdmc%>（<%=sgbz%>） </td>
</tr>
  <tr height="35">
    <td height="35" colspan="4">1.合同金额</td>
    <td colspan="2" align="center"><%=cf.formatDouble(qye+suijin+guanlif+zhwjrqyexm)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">2.工程增项金额</td>
    <td colspan="2" align="center"><%=cf.formatDouble(zhzjxje+zjxsuijin+zjxguanlif)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">3.工程减项金额</td>
    <td colspan="2" align="center"><%=cf.formatDouble(zhzjxje+zjxsuijin+zjxguanlif)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">4.实际工程额</td>
    <td colspan="2" align="center"><%=cf.formatDouble(qye+zhzjxje+suijin+zhwjrqyexm+zjxsuijin+guanlif+zjxguanlif)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">5.已收首期款</td>
    <td colspan="2" align="center"><%=cf.formatDouble(sfke)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">6.已收中期款=（1+2-3）X95%-5</td>
    <td colspan="2" align="center"><%=cf.formatDouble(((qye+suijin+guanlif+zhwjrqyexm)+(zhzjxje+zjxsuijin+zjxguanlif))*95%-sfke)%></td>
  </tr>
    </tr>
    <tr height="35">
    <td height="35" colspan="4">7.已收首期款</td>
    <td colspan="2" align="center"><%=cf.formatDouble(sfke)%></td>
  </tr>
  </table>
<p align="left"> <strong>为了维护客户的权益，烦请您与我司工长核对该工程款项后，于&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日前亲自将款项交至我司财务部，否则由此所产生的经济与法律责任由您个人承担。</strong></p>
<table width="100%" height="72" border="0">
  <tr>
    <td>客户签字：</td>
    <td>工长签字：</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div align="center">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</div></td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div align="center">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</div></td>
  </tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
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