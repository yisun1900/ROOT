<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cw_jsjl_jsjlh=null;
String cw_jsjl_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_sjs=null;
String crm_khxx_hth=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;

String cw_jsjl_jsr=null;
String cw_jsjl_jssj=null;
String cw_jsjl_bqyfkze=null;
String cw_jsjl_bz=null;
String cw_jsjl_qye=null;
String cw_jsjl_zjje=null;
String cw_jsjl_jsl=null;
String jsdw=null;
String jsfs=null;
String scbz=null;
String scr=null;
String scsj=null;
String wherecw_jsjl_jsjlh=request.getParameter("jsjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jsfs,DECODE(scbz,'N','δɾ��','Y','<font color=\"#FF0000\">��ɾ��</font>') scbz,scr,scsj,jsdw,cw_jsjl.jsjlh as cw_jsjl_jsjlh,cw_jsjl.khbh as cw_jsjl_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.hth as crm_khxx_hth,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,cw_jsjl.bqyfkze as cw_jsjl_bqyfkze,cw_jsjl.jsr as cw_jsjl_jsr,cw_jsjl.jssj as cw_jsjl_jssj,cw_jsjl.bz as cw_jsjl_bz,cw_jsjl.qye as cw_jsjl_qye,cw_jsjl.zjje as cw_jsjl_zjje,cw_jsjl.jsl as cw_jsjl_jsl ";
	ls_sql+=" from  cw_jsjl,crm_khxx";
	ls_sql+=" where cw_jsjl.khbh=crm_khxx.khbh(+) and  (cw_jsjl.jsjlh='"+wherecw_jsjl_jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsfs=cf.fillNull(rs.getString("jsfs"));
		scbz=cf.fillNull(rs.getString("scbz"));
		scr=cf.fillNull(rs.getString("scr"));
		scsj=cf.fillNull(rs.getString("scsj"));
		jsdw=cf.fillNull(rs.getString("jsdw"));
		cw_jsjl_jsjlh=cf.fillNull(rs.getString("cw_jsjl_jsjlh"));
		cw_jsjl_khbh=cf.fillNull(rs.getString("cw_jsjl_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));


		cw_jsjl_jsr=cf.fillNull(rs.getString("cw_jsjl_jsr"));
		cw_jsjl_jssj=cf.fillNull(rs.getDate("cw_jsjl_jssj"));
		cw_jsjl_bqyfkze=cf.fillNull(rs.getString("cw_jsjl_bqyfkze"));
		cw_jsjl_bz=cf.fillNull(rs.getString("cw_jsjl_bz"));
		cw_jsjl_qye=cf.fillNull(rs.getString("cw_jsjl_qye"));
		cw_jsjl_zjje=cf.fillNull(rs.getString("cw_jsjl_zjje"));
		cw_jsjl_jsl=cf.fillNull(rs.getString("cw_jsjl_jsl"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">�鿴������Ϣ�������¼�ţ�<%=cw_jsjl_jsjlh%>�� </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">�ͻ����</td>
    <td width="30%"><%=cw_jsjl_khbh%></td>
    <td width="20%" align="right">��ͬ��</td>
    <td width="30%"><%=crm_khxx_hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%"> 
      <div align="right">�ͻ�����</div>
    </td>
    <td width="30%"> <%=crm_khxx_khxm%> </td>
    <td width="20%"> 
      <div align="right">��ϵ��ʽ</div>
    </td>
    <td width="30%"><%=crm_khxx_lxfs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%"> 
      <div align="right">���ʦ</div>
    </td>
    <td width="30%"><%=crm_khxx_sjs%> </td>
    <td width="20%"> 
      <div align="right">�ʼ�����</div>
    </td>
    <td width="30%"><%=crm_khxx_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%"> 
      <div align="right">ʩ����</div>
    </td>
    <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%> </td>
    <td width="20%"> 
      <div align="right">ǩԼ����</div>
    </td>
    <td width="30%"> <%=crm_khxx_qyrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%"> 
      <div align="right">ǩԼ����</div>
    </td>
    <td width="30%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%> </td>
    <td width="20%"> 
      <div align="right"></div>
    </td>
    <td width="30%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%"> 
      <div align="right">ǩԼ��</div>
    </td>
    <td width="30%"><%=cw_jsjl_qye%> </td>
    <td width="20%"> 
      <div align="right">�����������</div>
    </td>
    <td width="30%"><%=cw_jsjl_zjje%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%" align="right" bgcolor="#FFFFCC">���ڽ�����</td>
    <td width="30%"><%=cw_jsjl_jsl%>% </td>
    <td width="20%" align="right">���㷽ʽ</td>
    <td width="30%"><%
	cf.radioToken(out, "1+������ȫ�����&2+������ͬ��������",jsfs,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%"> 
      <div align="right">���ڽ�����ܶ�</div>
    </td>
    <td width="30%"><%=cw_jsjl_bqyfkze%></td>
    <td width="20%"> 
      <div align="right"></div>
    </td>
    <td width="30%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%"> 
      <div align="right">������</div>
    </td>
    <td width="30%"> <%=cw_jsjl_jsr%> </td>
    <td width="20%"> 
      <div align="right">����ʱ��</div>
    </td>
    <td width="30%"> <%=cw_jsjl_jssj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="20%" align="right" bgcolor="#CCCCFF">ɾ����־</td>
    <td width="30%" bgcolor="#CCCCFF"><%=scbz%></td>
    <td width="20%" align="right" bgcolor="#FFFFCC">���㵥λ</td>
    <td width="30%" bgcolor="#FFFFCC"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jsdw+"'",jsdw,true);
%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%" align="right">ɾ����</td>
    <td width="30%"><%=scr%></td>
    <td width="20%" align="right">ɾ��ʱ��</td>
    <td width="30%"><%=scsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="20%" align="right">��ע</td>
    <td colspan="3"><%=cw_jsjl_bz%></td>
  </tr>
</table>

</body>
</html>
