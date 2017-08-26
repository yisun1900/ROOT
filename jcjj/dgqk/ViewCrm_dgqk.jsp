<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_dgqk_khbh=null;
String dm_cpbm_cpmc=null;
String crm_dgqk_clgw=null;
String crm_dgqk_pp=null;
String crm_dgqk_sjfy=null;
String crm_dgqk_ysqk=null;
String crm_dgqk_yazrq=null;
String crm_dgqk_sazrq=null;
String crm_dgqk_lrr=null;
String crm_dgqk_lrsj=null;
String crm_dgqk_sl=null;
String crm_dgqk_bz=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_xb=null;
String crm_khxx_sjs=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String sq_dwxx_dwmc=null;
String sq_dwxx_dwdh=null;
String crm_dgqk_azbz=null;
String wherecrm_dgqk_khbh=null;
String wherecrm_dgqk_cpbm=null;
wherecrm_dgqk_khbh=cf.GB2Uni(request.getParameter("khbh"));
wherecrm_dgqk_cpbm=cf.GB2Uni(request.getParameter("cpbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_dgqk.khbh as crm_dgqk_khbh,dm_cpbm.cpmc as dm_cpbm_cpmc,crm_dgqk.clgw as crm_dgqk_clgw,crm_dgqk.pp as crm_dgqk_pp,crm_dgqk.sjfy as crm_dgqk_sjfy,crm_dgqk.ysqk as crm_dgqk_ysqk,crm_dgqk.yazrq as crm_dgqk_yazrq,crm_dgqk.sazrq as crm_dgqk_sazrq,crm_dgqk.lrr as crm_dgqk_lrr,crm_dgqk.lrsj as crm_dgqk_lrsj,crm_dgqk.sl as crm_dgqk_sl,crm_dgqk.bz as crm_dgqk_bz,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.xb as crm_khxx_xb,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,sq_dwxx.dwmc as sq_dwxx_dwmc,sq_dwxx.dwdh as sq_dwxx_dwdh,crm_dgqk.azbz as crm_dgqk_azbz ";
	ls_sql+=" from  crm_dgqk,crm_khxx,dm_cpbm,sq_dwxx";
	ls_sql+=" where crm_dgqk.cpbm=dm_cpbm.cpbm and crm_dgqk.khbh=crm_khxx.khbh and crm_dgqk.gys=sq_dwxx.dwbh and  (crm_dgqk.khbh='"+wherecrm_dgqk_khbh+"') and  (crm_dgqk.cpbm='"+wherecrm_dgqk_cpbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_dgqk_khbh=cf.fillNull(rs.getString("crm_dgqk_khbh"));
		dm_cpbm_cpmc=cf.fillNull(rs.getString("dm_cpbm_cpmc"));
		crm_dgqk_clgw=cf.fillNull(rs.getString("crm_dgqk_clgw"));
		crm_dgqk_pp=cf.fillNull(rs.getString("crm_dgqk_pp"));
		crm_dgqk_sjfy=cf.fillNull(rs.getString("crm_dgqk_sjfy"));
		crm_dgqk_ysqk=cf.fillNull(rs.getString("crm_dgqk_ysqk"));
		crm_dgqk_yazrq=cf.fillNull(rs.getDate("crm_dgqk_yazrq"));
		crm_dgqk_sazrq=cf.fillNull(rs.getDate("crm_dgqk_sazrq"));
		crm_dgqk_lrr=cf.fillNull(rs.getString("crm_dgqk_lrr"));
		crm_dgqk_lrsj=cf.fillNull(rs.getDate("crm_dgqk_lrsj"));
		crm_dgqk_sl=cf.fillNull(rs.getString("crm_dgqk_sl"));
		crm_dgqk_bz=cf.fillNull(rs.getString("crm_dgqk_bz"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_xb=cf.fillNull(rs.getString("crm_khxx_xb"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		sq_dwxx_dwdh=cf.fillNull(rs.getString("sq_dwxx_dwdh"));
		crm_dgqk_azbz=cf.fillNull(rs.getString("crm_dgqk_azbz"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���񡢲��ϡ�ľ�Ŷ������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#CCCCFF"> 
            <td width="15%"> 
              <div align="right">�ͻ����</div>
            </td>
            <td width="35%"> <%=crm_dgqk_khbh%> </td>
            <td width="15%"> 
              <div align="right">�ͻ�����</div>
            </td>
            <td width="35%"><%=crm_khxx_khxm%> </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="15%"> 
              <div align="right">�ͻ��绰</div>
            </td>
            <td width="35%"><%=crm_khxx_lxfs%> </td>
            <td width="15%"> 
              <div align="right">�Ա�</div>
            </td>
            <td width="35%"><%
	cf.selectToken(out,"M+��&W+Ů",crm_khxx_xb,true);
%> </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="15%"> 
              <div align="right">���ݵ�ַ</div>
            </td>
            <td width="35%"><%=crm_khxx_fwdz%> </td>
            <td width="15%"> 
              <div align="right">�ʼ�����</div>
            </td>
            <td width="35%"><%=crm_khxx_zjxm%> </td>
          </tr>
          <tr bgcolor="#CCCCFF"> 
            <td width="15%"> 
              <div align="right">���ʦ</div>
            </td>
            <td width="35%"> <%=crm_khxx_sjs%> </td>
            <td width="15%"> 
              <div align="right">ʩ����</div>
            </td>
            <td width="35%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='3' order by dwbh",crm_khxx_sgd,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right">��Ʒ</td>
            <td width="35%"><%=dm_cpbm_cpmc%></td>
            <td width="15%" align="right">����</td>
            <td width="35%"><%=crm_dgqk_sl%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">��Ӧ��</div>
            </td>
            <td width="35%"><%=sq_dwxx_dwmc%> </td>
            <td width="15%"> 
              <div align="right">��Ӧ�̵绰</div>
            </td>
            <td width="35%"><%=sq_dwxx_dwdh%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">פ��Ҿӹ���</div>
            </td>
            <td width="35%"> <%=crm_dgqk_clgw%> </td>
            <td width="15%"> 
              <div align="right">Ʒ��</div>
            </td>
            <td width="35%"> <%=crm_dgqk_pp%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">ʵ�ʷ���</div>
            </td>
            <td width="35%"> <%=crm_dgqk_sjfy%> </td>
            <td width="15%"> 
              <div align="right">��װ��־</div>
            </td>
            <td width="35%"><%
	cf.selectToken(out,"N+δ��װ&Y+�Ѱ�װ",crm_dgqk_azbz,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">Ӧ��װ����</div>
            </td>
            <td width="35%"> <%=crm_dgqk_yazrq%> </td>
            <td width="15%"> 
              <div align="right">ʵ�ʰ�װ����</div>
            </td>
            <td width="35%"> <%=crm_dgqk_sazrq%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">¼����</div>
            </td>
            <td width="35%"> <%=crm_dgqk_lrr%> </td>
            <td width="15%"> 
              <div align="right">¼��ʱ��</div>
            </td>
            <td width="35%"> <%=crm_dgqk_lrsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right">�����������</td>
            <td colspan="3"><%=crm_dgqk_ysqk%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%" align="right">��ע</td>
            <td colspan="3"><%=crm_dgqk_bz%></td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
