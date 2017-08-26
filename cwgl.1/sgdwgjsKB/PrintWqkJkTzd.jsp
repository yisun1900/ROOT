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
<title>β�ڿ��֪ͨ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"><b><font size="5">β&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;ͨ&nbsp;֪&nbsp;��</font></b> </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>

  <tr height="35"> 
    <td width="15%" height="41" align="center"><b>�ͻ�����</b></td>
    <td width="15%"><%=khxm%></td>
    <td width="15%" align="center"><b>��ͬ��</b></td>
    <td width="20%"><%=hth%></td>
    <td width="15%" align="center"><b>����</b></td>
    <td width="20%"><%=sgdmc%>��<%=sgbz%>�� </td>
</tr>
  <tr height="35">
    <td height="35" colspan="4">1.��ͬ���</td>
    <td colspan="2" align="center"><%=cf.formatDouble(qye+suijin+guanlif+zhwjrqyexm)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">2.����������</td>
    <td colspan="2" align="center"><%=cf.formatDouble(zhzjxje+zjxsuijin+zjxguanlif)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">3.���̼�����</td>
    <td colspan="2" align="center"><%=cf.formatDouble(zhzjxje+zjxsuijin+zjxguanlif)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">4.ʵ�ʹ��̶�</td>
    <td colspan="2" align="center"><%=cf.formatDouble(qye+zhzjxje+suijin+zhwjrqyexm+zjxsuijin+guanlif+zjxguanlif)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">5.�������ڿ�</td>
    <td colspan="2" align="center"><%=cf.formatDouble(sfke)%></td>
  </tr>
    <tr height="35">
    <td height="35" colspan="4">6.�������ڿ�=��1+2-3��X95%-5</td>
    <td colspan="2" align="center"><%=cf.formatDouble(((qye+suijin+guanlif+zhwjrqyexm)+(zhzjxje+zjxsuijin+zjxguanlif))*95%-sfke)%></td>
  </tr>
    </tr>
    <tr height="35">
    <td height="35" colspan="4">7.�������ڿ�</td>
    <td colspan="2" align="center"><%=cf.formatDouble(sfke)%></td>
  </tr>
  </table>
<p align="left"> <strong>Ϊ��ά���ͻ���Ȩ�棬����������˾�����˶Ըù��̿������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��ǰ���Խ��������˾���񲿣������ɴ��������ľ����뷨�������������˳е���</strong></p>
<table width="100%" height="72" border="0">
  <tr>
    <td>�ͻ�ǩ�֣�</td>
    <td>����ǩ�֣�</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</div></td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div align="center">��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</div></td>
  </tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
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