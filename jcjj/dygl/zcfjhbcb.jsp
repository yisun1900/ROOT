<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhjs=(String)session.getAttribute("yhjs");

String[] ddbh=request.getParameterValues("ddbh");
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double hkze=0;
double cbze=0;
try {
	conn=cf.getConnection();
	ls_sql="select crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh[0]+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
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

	ls_sql ="SELECT sum(je+ycf+qtfyje),sum(cbj*sl)";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where lx='1' and "+cf.GB2Uni(cf.arrayToInSQL(ddbh,"ddbh"));
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hkze=rs.getDouble(1);
		cbze=rs.getDouble(2);
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
<title>���ĸ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="35%" ><img src="/images/tubiao.jpg"> </td>
    <td width="65%" ><strong>���ĺ�ͬ����---���Ķ�����ϸ</strong></td>
  </tr>
</table>

<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="34%" align="right"> 
      <div align="left">�ͻ�������<b><%=khxm%></b></div>
    </td>
    <td width="34%" align="right"> 
      <div align="left">��ϵ��ʽ��<b><%=lxfs%></b></div>
    </td>
    <td width="34%" align="right"> 
      <div align="left">��ͬ�ţ�<b><%=hth%></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="2">��ַ��<b><%=fwdz%></b></td>
    <td>ǩԼ����/��װ���ʦ��<b><%=dwmc%>/<%=sjs%></b></td>
  </tr>
  <tr> 
    <td colspan="2">ʩ���೤��<b><%=sgbz%> <%=bzdh%></b></td>
    <td>�μӴ������<b><%=cxhdbm%></b></td>
  </tr>
</table> 

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="8%">Ʒ��</td>
	<td  width="10%">����</td>
	<td  width="8%">ϵ��</td>
	<td  width="7%">�ͺ�</td>
	<td  width="8%">���</td>

	<td  width="6%">����λ��</td>
	<td  width="7%">��ɫ</td>
	<td  width="5%">�۸�</td>
	<td  width="6%">�ɱ�����</td>
	<td  width="4%">����</td>

	<td  width="7%">�ɱ���</td>
	<td  width="8%">Զ�̷�+����</td>
	<td  width="4%" bgcolor="#CC99FF">����</td>
	<td  width="6%">������</td>
	<td  width="6%">��ע</td>
</tr>
<%
	ls_sql ="SELECT dwbh,zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'1','���ۼ�','2','<font color=\"#FF0000\">������</font>') xzjg,jc_zcddmx.cbj||'/'||jldwbm,jc_zcddmx.sl,jc_zcddmx.sl*jc_zcddmx.cbj,DECODE(ycf+qtfyje,0,'0',DECODE(ycf,0,'',ycf||'+')||DECODE(qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')||qtfyje),cxhdbl||'%' cxhdbl,ROUND(jc_zcddmx.je*cxhdbl/100,2) cxhdje,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where lx='1' and "+cf.GB2Uni(cf.arrayToInSQL(ddbh,"ddbh"));
    ls_sql+=" order by jc_zcddmx.zcdlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.ddbh,jc_zcddmx.zcbm";
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
    <td height="60"><b>��ע��</b></td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="34%" height="2"><b>�ۼƳɱ���<%=cbze%>Ԫ��Сд��</b></td>
    <td width="37%" height="2"><b>ʵ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ԫ��Сд��</b></td>
    <td width="29%" height="2"><b></b></td>
  </tr>
  <tr> 
    <td colspan="3"><b>����д����<%=cf.NumToRMBStr(hkze)%></b></td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <p><b></b></p>
    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td colspan="2">�ͻ�ǩ�֣�</td>
          <td width="544">�����ˣ�</td>
        </tr>
        <tr> 
          <td colspan="2">ǩ�����ڣ�<%=qhtsj%></td>
          <td width="544">ǩ�����ڣ�<%=qhtsj%></td>
        </tr>
      </table>
    </td>
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


