<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
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
String bz=null;
String ppbm=null;
String clzt=null;
String sxhtshr=null;
String clgw=null;
String bjjb="";
String sxhtsfysh=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double hkze=0;
double wdzje=0;
double zczkl=0;


	
try {
	conn=cf.getConnection();
	ls_sql="select jc_zcdd.sxhtshr,jc_zcdd.clzt,jc_zcdd.ppbm,jc_zcdd.bz,crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,jc_zcdd.zczkl,jc_zcdd.wdzje,jc_zcdd.hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs,jc_zcdd.clgw,crm_khxx.bjjb,sxhtsfysh";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh[0]+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sxhtshr=cf.fillNull(rs.getString("sxhtshr"));
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
		clgw=cf.fillNull(rs.getString("clgw"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
	 }
	 rs.close();
	 ps.close();
 
//String sxhtsfysh=cf.executeQuery("select sxhtsfysh from jc_zcdd where ddbh='"+ddbh+"'"); 

	if (sxhtsfysh!=null && sxhtsfysh.equals("N"))//M������д��ͬ��Y������ˣ�N��δ���
	{
		out.println("������д��ͬδ��ˣ����ܴ�ӡ");
		return;
	}

	 if (clzt.equals("99"))
	 {
		 hkze=-1*hkze;
	 }
	
	//out.println(ls_sql);

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

<html>
<head>
<title>���ĸ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="24%"> <img src="/images/tubiao111.jpg"> </td>
	  <div align="center"><strong>ȫװ���ײͺ�ͬ�������ײ���������ϸ</strong></div>
  </tr>
  <tr> 
    <td height="20" align="right" colspan="2"> 
      <div align="left">�ͻ�������<b><%=khxm%></b></div>
    </td>
    <td width="33%" align="right" height="20"> 
      <div align="left">��ϵ��ʽ��<b><%=lxfs%></b></div>
    </td>
    <td width="34%" align="right" height="20"> 
      <div align="left">��ͬ�ţ�<b><%=hth%></b></div>
    </td>
  </tr>
  <tr> 
    <td colspan="4">��ַ��<b><%=fwdz%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ǩԼ����/��װ���ʦ��<b><%=dwmc%>/<%=sjs%></b></td>
  </tr>
  <tr> 
    <td colspan="4">ʩ���೤��<b><%=sgbz%> <%=bzdh%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�μӴ������<b><%=cxhdbm%></b></td>
  </tr>
  <tr> 
    <td align="right" colspan="2"> 
      <div align="left">��ĿרԱ��<b><%=xmzy%></b></div>
    </td>
    <td align="right" width="33%"> 
      <div align="left">��ĿרԱ�绰��<b><%=xmzydh%></b></div>
    </td>
    <td align="right" width="34%"> 
		<div align="left">����ˣ�<b><%=sxhtshr%></b></div>
    </td>
  </tr>
    <tr> 
    <td align="right" colspan="2"> 
      <div align="left">���Ϲ��ʣ�<b><%=clgw%></b></div>
    </td>
    <td align="right" width="33%"> 
      <div align="left">�ײͼ���<b><%=bjjb%></b></div>
    </td>
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
	<td  width="6%">����</td>
	<td  width="4%">����</td>

	<td  width="7%">���Ϸ�</td>
	<td  width="8%">Զ�̷�+����</td>
	<td  width="8%">���Ϸ�+Զ�̷�+����</td>
	<td  width="4%" bgcolor="#CC99FF">����</td>
	<td  width="6%">������</td>
	<td  width="6%">��ע</td>
</tr>
<%
	ls_sql ="SELECT dwbh,zcmc,zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'1','���ۼ�','2','<font color=\"#FF0000\">������</font>') xzjg,jc_zcddmx.dj||'/'||jldwbm,jc_zcddmx.sl,jc_zcddmx.je,qtfyje+ycf,je+qtfyje+ycf,cxhdbl||'%' cxhdbl,cxhdje,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx";
    ls_sql+=" where lx='1' and "+cf.GB2Uni(cf.arrayToInSQL(ddbh,"ddbh"));
    ls_sql+=" order by jc_zcddmx.zcdlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.ddbh,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	
	
%> 
</table>

<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td colspan="4"><p>�ͻ�ǩ��:<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ���ʦǩ��:<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></p>
      <p>&nbsp;</p></td>
  </tr>
  <tr> 
    <td colspan="4"><p>���Ϲ���ǩ��:<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �곤ǩ�֣�<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></p></td>
  </tr>
</table>

</body>
</html>


