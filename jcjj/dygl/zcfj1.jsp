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

String khxm=null;
String cxhdbm=null;
String sjs="";
String dwmc="";
String sgbz=null;
String hth=null;
String jc_mmydd_jhazsj=null;
String qhtsj=null;
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double hkze=0;
double wdzje=0;
double zczkl=0;
try {
	conn=cf.getConnection();
	ls_sql="select jc_zcdd.tdsj,jc_zcdd.clzt,jc_zcdd.ppbm,jc_zcdd.bz,crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,jc_zcdd.zczkl,jc_zcdd.wdzje,jc_zcdd.hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
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
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("htshsj"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
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

	ls_sql=" select bgdh from sq_yhxx";
	ls_sql+=" where yhmc='"+xmzy+"' and ssfgs ='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzydh=cf.fillHtml(rs.getString("bgdh"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="24%">&nbsp;  </td>
<%
	if (clzt.equals("99"))
	 {
		%>
		<td colspan="3"><strong>ȫװ���ײͶ���/���յ���<b>������ţ�<%=ddbh%></b>��</strong></td>
		<%
	 }
	 else{
		%>
		<td colspan="3"><strong>ȫװ���ײͶ���/���յ���<b>������ţ�<%=ddbh%></b>��</strong></td>
		<%
	 }
%>
  </tr>
    <tr> 
    <td height="20" align="right" colspan="2"> 
      <div align="left">Ʒ�����ƣ�<b><%=khxm%></b></div>
    </td>
    <td width="33%" align="right" height="20"> 
      <div align="left">�������ڣ�<b><%=lxfs%></b></div>
    </td>
    <td width="34%" align="right" height="20"> 
      <div align="left">�ͻ����ڣ�<b><%=hth%></b></div>
    </td>
  </tr>
    <tr> 
    <td height="20" align="right" colspan="2"> 
      <div align="left">ǩԼ���棺<b><%=khxm%></b></div>
    </td>
    <td width="34%" align="right" height="20"> 
      <div align="left">����绰��<b><%=hth%></b></div>
    </td>
  </tr>
  <tr> 
    <td height="20" align="right" colspan="2"> 
      <div align="left">�˿�������<b><%=khxm%></b></div>
    </td>
    <td width="33%" align="right" height="20"> 
      <div align="left">�˿͵绰��<b><%=lxfs%></b></div>
    </td>
    <td width="34%" align="right" height="20"> 
      <div align="left">�ֳ������ˣ�<b><%=hth%></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="4">�ͻ���ַ��<b><%=fwdz%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ֳ��绰��<b><%=dwmc%>/<%=sjs%></b></td>
  </tr>
  <tr> 
    <td colspan="4">���Ϲ��ʣ�<b><%=sgbz%> <%=bzdh%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���Ϲ��ʵ绰��<b><%=cxhdbm%></b></td>
  </tr>

</table> 

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="9%">��Ʒ����</td>
	<td  width="13%">�ͺ�</td>
	<td  width="13%">���</td>
	<td  width="7%">��װλ��</td>
	<td  width="7%">��ɫ</td>
	<td  width="5%">��λ</td>
	<td  width="7%">����</td>
    <td  width="7%">ʵ������&nbsp</td>
	<td  width="8%">Զ�̷�+����</td>
	<td  width="10%">��ע</td>
</tr>
<%

	if (clzt.equals("99"))
	{
		ls_sql ="SELECT zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,c_zcddmx.zcysbm,jldwbm,-1*jc_zcddmx.sl,DECODE(ycf+qtfyje,0,'0',DECODE(ycf,0,'',ycf||'+')||DECODE(qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')||qtfyje),jc_zcddmx.bz  ";
	}
	else{
		ls_sql ="SELECT zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,jldwbm,jc_zcddmx.sl,DECODE(ycf+qtfyje,0,'0',DECODE(ycf,0,'',ycf||'+')||DECODE(qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')||qtfyje),jc_zcddmx.bz  ";
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

</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 16px'>
  <tr valign="top"> 
    <td height="60"><b>��ע��</b><%=bz%></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0">
  <col width="67">
  <col width="18">
  <col width="63">
  <col width="92">
  <col width="110">
  <col width="45">
  <col width="68">
  <col width="43">
  <col width="39">
  <col width="74">
  <col width="130">
  <tr height="13">
    <td colspan="3" rowspan="4" height="86" width="148">������ָ��<br>
      ������ǩ��</td>
    <td colspan="2" rowspan="4" width="202">��</td>
    <td colspan="3" rowspan="3" width="156">�����ڴ�װ�� ??????????���Ϲ���ǩ��</td>
    <td colspan="3" rowspan="3" width="243">��</td>
  </tr>
  <tr height="13"> </tr>
  <tr height="13"> </tr>
  <tr height="47">
    <td colspan="3" height="47" width="156">�����ڴ�곤/���곤?? ǩ��</td>
    <td colspan="3" width="243">��</td>
  </tr>
  <tr height="34">
    <td colspan="11" height="34">��Ʒ�ͻ�/��װ���յ�</td>
  </tr>
  <tr height="23">
    <td colspan="3" height="23">�˿������</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
  </tr>
  <tr height="13">
    <td height="13">��</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>��</td>
  </tr>
  <tr height="19">
    <td height="19">Ʒ�ƣ�</td>
    <td></td>
    <td colspan="2">�� ��         ���      </td>
    <td></td>
    <td colspan="2">����ͺţ�</td>
    <td colspan="4">�ǡ�             �� ��     </td>
  </tr>
  <tr height="19">
    <td height="19">��</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>��</td>
  </tr>
  <tr height="19">
    <td height="19" colspan="2">��Ʒ������</td>
    <td colspan="4">����     ����ϸ�������������⣬�˿����      </td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
  </tr>
  <tr height="27">
    <td height="27">��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
  </tr>
  <tr height="31">
    <td height="31">��</td>
    <td>��</td>
    <td>��</td>
    <td colspan="2">�����ˣ��˿ͣ�ǩ��</td>
    <td>��</td>
    <td>��</td>
    <td colspan="4">��  ��     ��</td>
  </tr>
  <tr height="6">
    <td height="6">��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
    <td>��</td>
  </tr>
  <tr height="22">
    <td colspan="11" height="22">ע��1���������еĲ�Ʒ���ơ�����ͺš���λ�������ɲ���Ա�������ĵ���д�����������򹩻��̷������������绰֪ͨ��</td>
  </tr>
  <tr height="22">
    <td colspan="11" height="22">    2��    ������ָ��������Ӧ����˶Բ�Ʒ��Ϣ����24Сʱ�ڶԶ���ǩ�ֲ��ش������ڴ�װ�Σ�ͬʱ���е绰ȷ�ϡ�������ͬ������ΥԼ��</td>
  </tr>
  <tr height="22">
    <td colspan="11" height="22">   ����ɵ���ʧ�ɹ����̳е���</td>
  </tr>
  <tr height="22">
    <td colspan="11" height="22">    3���˿ͶԲ�Ʒ�������������ͺŽ�������ȷ�ϣ������ֱ̳����������ͻ�����Ϊ�������ڴ�װ�εĽ������ݡ�</td>
  </tr>
  <tr height="22">
    <td colspan="11" height="22">    4�����˿����պ��ֲ�Ʒ�����������⣬������Ӧ�����������ˡ��������Ρ�</td>
  </tr>
  <tr height="22">
    <td colspan="11" height="22">    5������һʽ���ݣ�����Ա���̻�ָ�������˸�һ�ݡ�</td>
  </tr>
  <tr height="22">
    <td height="22"></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
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


