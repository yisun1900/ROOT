<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhjs=(String)session.getAttribute("yhjs");

String khbh=request.getParameter("khbh");

String bzdh="";
String sgd="";

String khxm=null;
String cxhdbm=null;
String sjs="";
String dwmc="";
String sgbz=null;
String hth=null;
String lxfs=null;
String fwdz=null;

String dwbh=null;
String fgsbh=null;
String xmzy=null;
String xmzydh=null;
String clzt=null;
String tdsj=null;
String clgw=null;
String bjjbmc=null;
String sxhtshr=null;
String sxhtsfysh=null;

String sgdmc="";
String sgddh="";
String sjsdh="";
String clgwdh="";
String dgkh="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select crm_khxx.dwbh,crm_khxx.fgsbh,crm_khxx.clgw,crm_khxx.khxm,cxhdbm,dwmc,sjs,crm_khxx.sgd,sgbz,crm_khxx.hth,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs,dgkh";
	ls_sql+=" from  crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and  crm_khxx.khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		khxm=cf.fillNull(rs.getString("khxm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		dgkh=cf.fillNull(rs.getString("dgkh"));
	 }
	 rs.close();
	 ps.close();
	 

	//���ʦ�绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_sqbm";
	ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sfzszg in('Y','N') and sq_yhxx.zwbm in('23','04') and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+fgsbh+"' and zwbm='08' and sfzszg in('Y','N') and yhmc ='"+clgw+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clgwdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>�������ĺ�ͬ��ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td width="19%"><span lang=EN-US><img src="/images/tubiao111.jpg" v:shapes="_x0000_i1025"></span> </td>
		<td colspan="2" align="center"><strong>�����ڴ�������Ĺ�����ϸ</strong></td>
        <td width="16%">&nbsp;</td>
        <td width="19%">&nbsp;</td>
  </tr>
  <tr> 
    <td height="20"> �˿�������<b><%=khxm%></b>      </td>
    <td width="27%" height="20">�绰��<b><%=lxfs%></b> </td>
    <td height="20" colspan="2">װ�޵�ַ��<b><%=fwdz%></b></td>
    <td height="20">��Ա���ţ�<b><%=dgkh%></b></td>
  </tr>
  
  <tr> 
    <td>���ʦ��<b><%=sjs%></b></td>
    <td>�绰��<b><%=sjsdh%></b></td>
    <td width="19%">���Ϲ��ʣ�<b><%=clgw%></b></td>
    <td colspan="2">�绰��<b><%=clgwdh%></b></td>
  </tr>
  <tr>
    <td colspan="5">	</td>
  </tr>
</table> 

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center" height="23">
	<td  width="8%">��������</td>
	<td  width="8%">����</td>
	<td  width="9%">��Ʒ���</td>
	<td  width="12%">��ƷƷ��</td>
	<td  width="9%">���ۺ�ͬ��</td>
	<td  width="8%">ʵ���տ���</td>
	<td  width="6%">�Ƿ��ؼ�</td>
	<td  width="7%">���ͻ�����</td>
	<td  width="8%">���ͻ����</td>
	<td  width="25%">��ע</td>
</tr>
<%

	String ddbh=null;
	String zcxlbm=null;
	String ppbm=null;
	String xshth=null;
	String sftjp=null;
	double wdzje=0;
	double hkze=0;
	double khfdbl=0;
	double fkje=0;
	String qhtsj=null;
	String bz=null;

	double allwdzje=0;
	double allhkze=0;

	ls_sql="SELECT jc_zcdd.ddbh,zcxlbm,ppbm,jc_zcdd.xshth,DECODE(jc_zcdd.sftjp,'Y','�ؼ�','N','��') sftjp,jc_zcdd.wdzje,jc_zcdd.qhtsj ";
	ls_sql+=" ,jc_zcdd.hkze,jc_zcdd.khfdbl,jc_zcdd.bz";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where jc_zcdd.khbh='"+khbh+"' ";
	ls_sql+=" and jc_zcdd.ddlx='9'";//9����������
	ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));

		xshth=cf.fillNull(rs.getString("xshth"));
		sftjp=cf.fillNull(rs.getString("sftjp"));
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		khfdbl=rs.getDouble("khfdbl");

		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		bz=cf.fillHtml(rs.getString("bz"));

		allwdzje+=wdzje;
		allwdzje=cf.round(allwdzje,2);
		allhkze+=hkze;
		allhkze=cf.round(allhkze,2);

		ls_sql=" select sum(fkje) ";
		ls_sql+=" from cw_khfkjl";
		ls_sql+=" where ddbh='"+ddbh+"' and fklxbm='23' and scbz='N'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			fkje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		%>
		<tr bgcolor="#FFFFF"  align="center" height="23">
			<td><%=qhtsj%></td>
			<td><%=dwmc%></td>
			<td><%=zcxlbm%></td>
			<td><%=ppbm%></td>
			<td><%=xshth%></td>
			<td><%=wdzje%></td>
			<td><%=sftjp%></td>
			<td><%=khfdbl%>%</td>
			<td><%=cf.round(wdzje*(khfdbl/100),2)%></td>
			<td><%=bz%></td>
		</tr>
		<%

	 }
	 rs.close();
	 ps.close();
%> 
	<tr bgcolor="#FFFFF"  align="center" height="23">
		<td colspan="5">ʵ�ʷ������ϼƣ�<%=allwdzje%>Ԫ</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>

</table>


  <table width="100%" border="0" style='FONT-SIZE: 14px' >
	<tr height="25">
	  <td colspan="3">˵��������Ϊ�����ڴ�������Ĳ�Ʒ����˿����ݲ�Ʒ���ۺ�ͬ�����Ͻ����к˶ԣ��˶�����ǩ��ȷ�Ϻ󣬵��ܲ�����������ս��㡣</td>
	</tr>
	<tr height="25"> 
	  <td width="309">�˿�ǩ�֣�<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
	  <td width="310">���Ϲ���ǩ�֣�<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
	  <td width="336">���澭��ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
	</tr>
	<tr height="25"> 
	  <td>��&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
	  <td>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
	  <td>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
	</tr>
  </table>   



</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception:2 " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


