<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String jc_zczjx_ddbh=null;
String jc_zczjx_zjxbh=null;
String jc_zczjx_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_dwbh=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String jc_zczjx_zczjxyybm=null;
String jc_zczjx_qrr=null;
String jc_zczjx_qrsj=null;
String jc_zczjx_htshsj=null;
String jc_zczjx_sshsj=null;
String jc_zczjx_clzt=null;
String jc_zczjx_lrr=null;
String jc_zczjx_lrsj=null;
String jc_zczjx_dwbh=null;
String jc_zczjx_bz=null;


String sxhtsfysh=null;
String sxhtshr=null;
String sxhtshsj=null;
String sfjs=null;
String jissj=null;
String jisr=null;
String wjsj=null;


double zqzjxze=0;
double zjxze=0;
double zjxcbze=0;
double zjxzkl=0;
String dzyy=null;
double zjxcxhdje=0;
String jssj=null;
String jsr=null;

double zqzjxclf=0;
double zhzjxclf=0;
double zjxycf=0;
double zjxqtf=0;

String zcfgsbh="";
String qddm="";
String jzsjs="";
String zjxfssj="";

String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
String gys=null;
String ppmc=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String jjsjs=null;
String khjl=null;
String sfjrht=null;

double zsje=0;
double zjxyjjrje=0;
String yjjzsj=null;
double sskje=0;
double shsskje=0;


String ddlx=null;
String zjxbh=null;
zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select DECODE(sfjrht,'Y','����','N','������') sfjrht,jc_zczjx.zsje,jc_zczjx.zjxcbze,jc_zczjx.zqzjxze,jc_zczjx.zjxze,jc_zczjx.zjxzkl,jc_zczjx.dzyy,jc_zczjx.zjxcxhdje,jc_zczjx.jssj,jc_zczjx.jsr,   zcdlbm,zcxlbm,ppbm,gys,ppmc,jc_zczjx.clgw,ztjjgw,jc_zczjx.xmzy,jjsjs,zjxfssj,jc_zczjx.fgsbh,qddm,jzsjs,DECODE(jc_zczjx.ddlx,'1','ϵͳ����Ʒ�ƶ���','2','ϵͳ������Ʒ�ƶ���') ddlx,jc_zczjx.ddbh as jc_zczjx_ddbh,jc_zczjx.zjxbh as jc_zczjx_zjxbh,jc_zczjx.khbh as jc_zczjx_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,jc_zczjx.zczjxyybm as jc_zczjx_zczjxyybm,jc_zczjx.qrr as jc_zczjx_qrr,jc_zczjx.qrsj as jc_zczjx_qrsj,jc_zczjx.htshsj as jc_zczjx_htshsj,jc_zczjx.sshsj as jc_zczjx_sshsj,jc_zczjx.clzt as jc_zczjx_clzt,jc_zczjx.lrr as jc_zczjx_lrr,jc_zczjx.lrsj as jc_zczjx_lrsj,jc_zczjx.dwbh as jc_zczjx_dwbh,jc_zczjx.bz as jc_zczjx_bz ";
	ls_sql+=" ,jc_zczjx.zqzjxclf,jc_zczjx.zhzjxclf,jc_zczjx.zjxycf,jc_zczjx.zjxqtf,jc_zczjx.khjl";
	ls_sql+=" ,jc_zczjx.zjxyjjrje,jc_zczjx.yjjzsj,jc_zczjx.sskje,jc_zczjx.shsskje,DECODE(jc_zczjx.sxhtsfysh,'M','����д��ͬ','Y','�����','N','δ���') sxhtsfysh,jc_zczjx.sxhtshr,jc_zczjx.sxhtshsj,DECODE(jc_zczjx.sfjs,'N','δ����','C','��ѡ�����','Y','�ѽ���','M','���������') sfjs,jc_zczjx.jissj,jc_zczjx.jisr,jc_zczjx.wjsj";
	ls_sql+=" from  crm_khxx,jc_zczjx";
	ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh and (jc_zczjx.zjxbh='"+zjxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxyjjrje=rs.getDouble("zjxyjjrje");
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		sskje=rs.getDouble("sskje");
		shsskje=rs.getDouble("shsskje");
		sfjrht=cf.fillNull(rs.getString("sfjrht"));
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		sxhtshr=cf.fillNull(rs.getString("sxhtshr"));
		sxhtshsj=cf.fillNull(rs.getString("sxhtshsj"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		jissj=cf.fillNull(rs.getString("jissj"));
		jisr=cf.fillNull(rs.getString("jisr"));
		wjsj=cf.fillNull(rs.getString("wjsj"));
		
		zsje=rs.getDouble("zsje");
		khjl=cf.fillNull(rs.getString("khjl"));
		zqzjxclf=rs.getDouble("zqzjxclf");
		zhzjxclf=rs.getDouble("zhzjxclf");
		zjxycf=rs.getDouble("zjxycf");
		zjxqtf=rs.getDouble("zjxqtf");

		zjxcbze=rs.getDouble("zjxcbze");
		zqzjxze=rs.getDouble("zqzjxze");
		zjxze=rs.getDouble("zjxze");
		zjxzkl=rs.getDouble("zjxzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		jssj=cf.fillNull(rs.getString("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));

		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		jjsjs=cf.fillNull(rs.getString("jjsjs"));

		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		zcfgsbh=cf.fillNull(rs.getString("fgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		ddlx=cf.fillNull(rs.getString("ddlx"));
		jc_zczjx_ddbh=cf.fillNull(rs.getString("jc_zczjx_ddbh"));
		jc_zczjx_zjxbh=cf.fillNull(rs.getString("jc_zczjx_zjxbh"));
		jc_zczjx_khbh=cf.fillNull(rs.getString("jc_zczjx_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		jc_zczjx_zczjxyybm=cf.fillNull(rs.getString("jc_zczjx_zczjxyybm"));
		jc_zczjx_qrr=cf.fillNull(rs.getString("jc_zczjx_qrr"));
		jc_zczjx_qrsj=cf.fillNull(rs.getString("jc_zczjx_qrsj"));
		jc_zczjx_htshsj=cf.fillNull(rs.getDate("jc_zczjx_htshsj"));
		jc_zczjx_sshsj=cf.fillNull(rs.getDate("jc_zczjx_sshsj"));
		jc_zczjx_clzt=cf.fillNull(rs.getString("jc_zczjx_clzt"));
		jc_zczjx_lrr=cf.fillNull(rs.getString("jc_zczjx_lrr"));
		jc_zczjx_lrsj=cf.fillNull(rs.getString("jc_zczjx_lrsj"));
		jc_zczjx_dwbh=cf.fillNull(rs.getString("jc_zczjx_dwbh"));
		jc_zczjx_bz=cf.fillNull(rs.getString("jc_zczjx_bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
if (yhjs.equals("G0"))
{
	crm_khxx_sjs="&nbsp;";
}
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
.STYLE2 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">
<div align="center">���������� 
</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      �ͻ����    </td>
    <td width="32%"> <%=jc_zczjx_khbh%> </td>
    <td width="18%" align="right"> 
      ��ͬ��    </td>
    <td width="32%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      �ͻ�����    </td>
    <td width="32%"><%=crm_khxx_khxm%> �� 
      <input type="button" value="�鿴�绰" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=jc_zczjx_khbh%>')" name="button4" >
��</td>
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ���ʦ    </td>
    <td width="32%"><%=crm_khxx_sjs%> </td>
    <td width="18%" align="right"> 
      �ʼ�    </td>
    <td width="32%"><%=crm_khxx_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ǩԼ����    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",crm_khxx_dwbh,true);
%> </td>
    <td width="18%" align="right"> 
      ʩ����    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",crm_khxx_sgd,true);
%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="18%" align="right" bgcolor="#CCFFCC">���������ֹ�˾</td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zcfgsbh+"'",zcfgsbh,true);
%></td>
    <td width="18%" align="right">������������</td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qddm+"'",qddm,true);
%></td>
  </tr>

  <tr bgcolor="#FFFFFF"> 
    <td width="18%" bgcolor="#CCFFCC" align="right">�����������ʦ</td>
    <td width="32%" bgcolor="#CCFFCC"><%=jzsjs%></td>
    <td width="18%" align="right" bgcolor="#CCFFCC">�ͻ�����</td>
    <td width="32%" bgcolor="#CCFFCC"><%=jzsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="26" colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ������� </td>
    <td><%=jc_zczjx_ddbh%> </td>
    <td align="right"> ��������� </td>
    <td><%=jc_zczjx_zjxbh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>�Ƿ�����װ��ͬ</strong></td>
    <td><strong><%=sfjrht%></strong></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ����״̬ </td>
    <td><%
	cf.selectToken(out,"00+¼��δ���&01+¼�������&02+��ȷ��&04+�����ѽ���&03+���ͻ�&05+�����ͻ�&30+�������&99+�˵�",jc_zczjx_clzt,true);
%>    </td>
    <td align="right"> �������ʱ��</td>
    <td><%=zjxfssj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���Ĵ���</td>
    <td><%=zcdlbm%></td>
    <td align="right">����С��</td>
    <td><%=zcxlbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">��Ʒ��</td>
    <td width="32%"><%=ppbm%></td>
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">��Ӧ��</td>
    <td width="32%"><%=gys%></td>
    <td width="18%" align="right">Ʒ��</td>
    <td width="32%"><%=ppmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">פ��Ҿӹ���</td>
    <td width="32%"><%=clgw%></td>
    <td width="18%" align="right">չ���Ҿӹ���</td>
    <td width="32%"><%=ztjjgw%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">��ĿרԱ</td>
    <td width="32%"><%=xmzy%></td>
    <td width="18%" align="right">�Ҿ����ʦ</td>
    <td width="32%"><%=jjsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="26" colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��д��ͬ�Ƿ������</td>
    <td><%=sxhtsfysh%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��д��ͬ�����</td>
    <td><%=sxhtshr%></td>
    <td align="right">��д��ͬ���ʱ��</td>
    <td><%=sxhtshsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�Ƿ��ѽ���</td>
    <td><%=sfjs%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������</td>
    <td><%=jisr%></td>
    <td align="right">����ʱ��</td>
    <td><%=jissj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="26" colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ������ԭ��    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select zczjxyybm,zczjxyymc from jdm_zczjxyybm order by zczjxyybm",jc_zczjx_zczjxyybm,true);
%> </td>
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><span class="STYLE1">�������ۿ�</span></td>
    <td><%=zjxzkl%></td>
    <td align="right" class="STYLE1">���ͽ��</td>
    <td><%=zsje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">����ԭ��</span></td>
    <td colspan="3" bgcolor="#FFFFCC"><%=dzyy%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><strong>��ǰ����������Ϸ�</strong></td>
    <td><%=zqzjxclf%></td>
    <td align="right"><strong>�ۺ���������Ϸ�</strong></td>
    <td><%=zhzjxclf%></td>
  </tr>
  
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC"><strong>������Զ�̷�</strong></td>
    <td><%=zjxycf%></td>
    <td align="right"><strong>������������</strong></td>
    <td><%=zjxqtf%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"><strong>��ǰ�������ܶ�</strong></td>
    <td bgcolor="#FFFFCC"><%=zqzjxze%></td>
    <td align="right" bgcolor="#FFFFCC"><strong>�ۺ��������ܶ�</strong></td>
    <td bgcolor="#FFFFCC"><%=zjxze%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"><strong>������������</strong></td>
    <td bgcolor="#FFFFCC"><%=zjxcxhdje%></td>
    <td align="right" bgcolor="#FFFFCC"><strong>������ҵ��������</strong></td>
    <td bgcolor="#FFFFCC"><%=zjxyjjrje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">ʵ�տ���</span></td>
    <td bgcolor="#FFFFCC"><%=sskje%></td>
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">�������ʵ�տ���</span></td>
    <td bgcolor="#FFFFCC"><%=shsskje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">����ҵ��ʱ��</span></td>
    <td bgcolor="#FFFFCC"><%=yjjzsj%></td>
    <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
    <td bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ȷ����    </td>
    <td width="32%"> <%=jc_zczjx_qrr%> </td>
    <td width="18%" align="right"> 
      ȷ��ʱ��    </td>
    <td width="32%"> <%=jc_zczjx_qrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ҽ�����</td>
    <td><%=jsr%></td>
    <td align="right">���ҽ���ʱ��</td>
    <td><%=jssj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ��ͬ�ͻ�ʱ��    </td>
    <td width="32%"> <%=jc_zczjx_htshsj%> </td>
    <td width="18%" align="right"> 
      ʵ�ͻ�ʱ��    </td>
    <td width="32%"> <%=jc_zczjx_sshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      ¼��ʱ��    </td>
    <td width="32%"> <%=jc_zczjx_lrsj%> </td>
    <td width="18%" align="right">¼���� </td>
    <td width="32%"><%=jc_zczjx_lrr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">��������</td>
    <td width="32%"><%=ddlx%></td>
    <td width="18%" align="right">¼�벿��</td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jc_zczjx_dwbh+"'",jc_zczjx_dwbh,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">��ע</td>
    <td><%=jc_zczjx_bz%></td>
    <td><div align="right">���ʱ��</div></td>
    <td><%=wjsj%></td>
  </tr>
</table>
<table border="1" width="200%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">����</td>
	<td  width="4%">���ı���</td>
	<td  width="3%">��д��־</td>
	<td  width="2%">�Ƿ���Ʒ</td>
	<td  width="5%" bgcolor="#CCCCCC">ϵ��</td>
	<td  width="6%">��������</td>
	<td  width="5%">�ͺ�</td>
	<td  width="5%">���</td>
	<td  width="3%">ѡ��۸�</td>
	<td  width="3%">����</td>
	<td  width="2%">������λ</td>
	<td  width="3%" >��������</td>
	<td  width="3%" >ҵ���������</td>
	<td  width="3%" bgcolor="#CC99FF">���͵���</td>
	<td  width="3%" bgcolor="#CC99FF">���ͽ��</td>
	<td  width="3%" bgcolor="#CC99FF">��������</td>
	<td  width="4%" bgcolor="#CC99FF">��ǰ�������Ϸ�</td>
	<td  width="4%" bgcolor="#CC99FF">�ۺ��������Ϸ�</td>
	<td  width="4%" bgcolor="#CC99FF">����Զ�̷�</td>
	<td  width="4%" bgcolor="#CC99FF">����������</td>
	<td  width="4%" bgcolor="#CC99FF">�����ϼ�</td>
	<td  width="4%" bgcolor="#CC99FF">�����������</td>
	<td  width="4%" bgcolor="#CC99FF">����ҵ��������</td>
	<td  width="4%">��װλ��</td>
	<td  width="3%">��ɫ</td>
	<td  width="4%">��д��ͬԭ��</td>
	<td  width="13%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql ="SELECT DECODE(jc_zczjxmx.lx,'1','ԭ��Ŀ','2','����') lx,jc_zcddmx.zcbm,DECODE(jc_zczjxmx.sxbz,'1','����д','2','��д') sxbz,DECODE(jc_zcddmx.sfzp,'Y','��Ʒ','N','��') sfzp,zclbbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,DECODE(xzjg,'0','��д','1','���ۼ�','2','<font color=\"#FF0000\">������</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,jc_zcddmx.jldwbm,cxhdbl||'%' cxhdbl,yjjrbl||'%' yjjrbl,TO_CHAR(jc_zcddmx.zsdj),round(jc_zcddmx.zsdj*jc_zczjxmx.zjsl,2),jc_zczjxmx.zjsl,jc_zczjxmx.zqzjje,jc_zczjxmx.zjje ,jc_zczjxmx.zjycf,jc_zczjxmx.zjqtfy,(jc_zczjxmx.zjje+jc_zczjxmx.zjycf+jc_zczjxmx.zjqtfy),jc_zczjxmx.zjcxhdje,jc_zczjxmx.zjyjjrje,zcpzwzbm,jc_zcddmx.zcysbm,jc_zcddmx.sxhtyy,jc_zczjxmx.bz ";
	ls_sql+=" FROM jc_zczjxmx,jc_zcddmx";
    ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh(+) and jc_zczjxmx.zjxbh='"+zjxbh+"'";
    ls_sql+=" order by jc_zczjxmx.lx,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
</body>
</html>
