<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhjs=(String)session.getAttribute("yhjs");

String ddbh=request.getParameter("ddbh");
String bzdh="";
String sgd="";
String clgwdh="";
String dwbh="";
String dwdh="";
String ssfgs="";
String clgw="";

String khxm=null;
String cxhdbm=null;
String sjs="";
String dwmc="";
String sgbz=null;
String hth=null;
String jc_mmydd_jhazsj=null;
String tzshsj=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String sgddh=null;
String fgsbh=null;
String xmzy=null;
String xmzydh=null;
String bz=null;
String ppbm=null;
String clzt=null;
String tdsj=null;
String jhshsj=null;
String khbh=null;
String bjjbmc=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double hkze=0;
double wdzje=0;
double zczkl=0;
try {
	conn=cf.getConnection();
	ls_sql="select jc_zcdd.khbh,jc_zcdd.clgw,crm_khxx.fgsbh,crm_khxx.dwbh,jhshsj,jc_zcdd.tdsj,jc_zcdd.clzt,jc_zcdd.ppbm,jc_zcdd.bz,crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,tzshsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,jc_zcdd.zczkl,jc_zcdd.wdzje,jc_zcdd.hkze,sgdmc,sq_sgd.dh,fwdz,lxfs";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		jhshsj=cf.fillNull(rs.getDate("jhshsj"));
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ppbm=cf.fillHtml(rs.getString("ppbm"));
		bz=cf.fillHtml(rs.getString("bz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		zczkl=rs.getDouble("zczkl");
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("htshsj"));
		tzshsj=cf.fillNull(rs.getDate("tzshsj"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
	 }
	 rs.close();
	 ps.close();

	 if (clzt.equals("99"))
	 {
		 hkze=-1*hkze;
	 }

	ls_sql="select bjjbmc,sgdmc,'('||sq_sgd.dh||')' dh";
	ls_sql+=" from  crm_zxkhxx,bdm_bjjbbm,sq_sgd";
	ls_sql+=" where crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and  crm_zxkhxx.khbh='"+khbh+"'";
	ls_sql+=" and  crm_zxkhxx.sgd=sq_sgd.sgd(+)";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
	 }
	 rs.close();
	 ps.close();


	ls_sql=" select dwdh from sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwdh=cf.fillNull(rs.getString("dwdh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dwdh from sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwdh=cf.fillNull(rs.getString("dwdh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+clgw+"' and zwbm='08'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clgwdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	if (yhjs.equals("G0"))
	{
		sjs="&nbsp;";
	}

%>

<html>
<head>
<title>ȫװ���ײͶ���/���յ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td colspan="3" align="center" >  <strong>�����ڴ��ݼ�װ����/���յ���<b>������ţ�<%=ddbh%></b>��</strong></td>
  </tr>
    <tr> 
    <td height="20"> 
      Ʒ�����ƣ�<b><%=ppbm%></b>    </td>
    <td width="34%"  height="20"> 
      �������ڣ�<b><%=tzshsj%></b>    </td>
    <td width="34%"  height="20"> 
      �ͻ����ڣ�<b><%=jhshsj%></b>    </td>
  </tr>
    <tr> 
    <td height="20"  colspan="2"> 
      ǩԼ���棺<b><%=dwmc%></b>    </td>
    <td width="34%"  height="20"> 
      ����绰��<b><%=dwdh%></b>    </td>
  </tr>
  <tr> 
    <td height="20"> 
      �˿�������<b><%=khxm%></b>    </td>
    <td width="34%"  height="20"> 
      �˿͵绰��  </td>
    <td width="34%"  height="20"> 
      ʩ���ӣ�<b><%=sgdmc%><%=sgddh%></b></td>
  </tr>
  <tr> 
    <td colspan="2">�ͻ���ַ��<b><%=fwdz%></b></td>
    <td>�ֳ��绰��<b><%=bzdh%></b></td>
  </tr>
  <tr> 
    <td>���Ϲ��ʣ�<b><%=clgw%></b></td>
    <td>&nbsp;���Ϲ��ʵ绰��<b><%=clgwdh%></b></td>
    <td>&nbsp;</td>
  </tr>
</table> 

<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="10%">��װλ��</td>
	<td  width="15%">��Ʒ����</td>
	<td  width="15%">�ͺ�</td>
	<td  width="14%">���</td>
	<td  width="10%">��ɫ</td>
	<td  width="6%">��λ</td>
	<td  width="8%">��������</td>
    <td  width="8%">ʵ������</td>
	<td  width="7%">��ע</td>
</tr>
<%

	if (clzt.equals("99"))
	{
		ls_sql ="SELECT zcpzwzbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,_zcddmx.zcysbm,jldwbm,-1*jc_zcddmx.sl,-1*jc_zcddmx.zjhsl,jc_zcddmx.bz  ";
	}
	else{
		ls_sql ="SELECT zcpzwzbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,jc_zcddmx.zcysbm,jldwbm,jc_zcddmx.sl,jc_zcddmx.zjhsl,jc_zcddmx.bz  ";
	}
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' and lx='1'";
    ls_sql+=" order by jc_zcddmx.zcdlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.zcbm";
	
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 
  <tr valign="top">
    <td colspan="9" height="60"><b>��ע��</b><%=bz%></td>
  </tr>
  <tr  >
    <td height="42" colspan="9" align="center">
	  <p>&nbsp;</p>
	  <p align="justify">����ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u> &nbsp;&nbsp;&nbsp;
	     �����ڴ���Ϲ���ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u> &nbsp;&nbsp;&nbsp;
         �����ڴ�곤/���곤ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u> </p></td>
  </tr>
</table>

<div align="center"><BR>
    <strong>��Ʒ�ͻ�/��װ���յ�</strong>
</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr align="center">
    <td height="200" ><div align="justify">
	�˿������<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
	    <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
	    <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
<BR>
<BR>
Ʒ�ƣ�<u>�ǡ� ���</u> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ͺţ�<u>�ǡ� ���</u> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; ��Ʒ������<u>�ǡ� ���</u>
<BR>
<BR>
������������⣬�˿������<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
	<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>	
	<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>	
    <BR>
    <BR>
�����ˣ��˿ͣ�ǩ�֣�<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <u>&nbsp;&nbsp;&nbsp;&nbsp; </u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>��<u>&nbsp;&nbsp;&nbsp;&nbsp;</u>�� </div></td>
  </tr>
</table>

<table cellspacing="0" cellpadding="0" width="100%" style='FONT-SIZE: 14px'>
  <tr height="22">
    <td  height="22">ע��1���������еĲ�Ʒ���ơ�����ͺš���λ�������ɲ���Ա�������ĵ���д�����������򹩻��̷������������绰֪ͨ��</td>
  </tr>
  <tr height="22">
    <td  height="22">&nbsp;&nbsp;&nbsp;&nbsp;2��������ָ��������Ӧ����˶Բ�Ʒ��Ϣ����24Сʱ�ڶԶ���ǩ�ֲ��ش������ڴ�װ�Σ�ͬʱ���е绰ȷ�ϡ�������ͬ������ΥԼ��</td>
  </tr>
  <tr height="22">
    <td  height="22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ɵ���ʧ�ɹ����̳е���</td>
  </tr>
  <tr height="22">
    <td  height="22">&nbsp;&nbsp;&nbsp;&nbsp;3���˿ͶԲ�Ʒ�������������ͺŽ�������ȷ�ϣ������ֱ̳����������ͻ�����Ϊ�������ڴ�װ�εĽ������ݡ�</td>
  </tr>
  <tr height="22">
    <td  height="22">&nbsp;&nbsp;&nbsp;&nbsp;4�����˿����պ��ֲ�Ʒ�����������⣬������Ӧ�����������ˡ��������Ρ�</td>
  </tr>
  <tr height="22">
    <td  height="22">&nbsp;&nbsp;&nbsp;&nbsp;5������һʽ���ݣ�����Ա���̻�ָ�������˸�һ�ݡ�</td>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


