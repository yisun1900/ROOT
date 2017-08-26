<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_hddj_khbh=null;
String crm_hddj_khxm=null;
String crm_hddj_xb=null;
String crm_hddj_lxfs=null;
String dm_cqbm_cqmc=null;
String crm_hddj_fwdz=null;
String crm_hddj_cgdz=null;
String sq_dwxx_dwmc=null;
String crm_hddj_hdsgbz=null;
String crm_hddj_hdsjs=null;
String crm_hddj_lrr=null;
String crm_hddj_lrsj=null;
String crm_hddj_bz=null;
String wherecrm_hddj_khbh=null;
wherecrm_hddj_khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_hddj.khbh as crm_hddj_khbh,crm_hddj.khxm as crm_hddj_khxm,crm_hddj.xb as crm_hddj_xb,crm_hddj.lxfs as crm_hddj_lxfs,dm_cqbm.cqmc as dm_cqbm_cqmc,crm_hddj.fwdz as crm_hddj_fwdz,crm_hddj.cgdz as crm_hddj_cgdz,sq_dwxx.dwmc as sq_dwxx_dwmc,crm_hddj.hdsgbz as crm_hddj_hdsgbz,crm_hddj.hdsjs as crm_hddj_hdsjs,crm_hddj.lrr as crm_hddj_lrr,crm_hddj.lrsj as crm_hddj_lrsj,crm_hddj.bz as crm_hddj_bz ";
	ls_sql+=" from  crm_hddj,dm_cqbm,sq_dwxx";
	ls_sql+=" where crm_hddj.cqbm=dm_cqbm.cqbm(+) and crm_hddj.hdsgd=sq_dwxx.dwbh(+) and  (crm_hddj.khbh='"+wherecrm_hddj_khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_hddj_khbh=cf.fillNull(rs.getString("crm_hddj_khbh"));
		crm_hddj_khxm=cf.fillNull(rs.getString("crm_hddj_khxm"));
		crm_hddj_xb=cf.fillNull(rs.getString("crm_hddj_xb"));
		crm_hddj_lxfs=cf.fillNull(rs.getString("crm_hddj_lxfs"));
		dm_cqbm_cqmc=cf.fillNull(rs.getString("dm_cqbm_cqmc"));
		crm_hddj_fwdz=cf.fillNull(rs.getString("crm_hddj_fwdz"));
		crm_hddj_cgdz=cf.fillNull(rs.getString("crm_hddj_cgdz"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		crm_hddj_hdsgbz=cf.fillNull(rs.getString("crm_hddj_hdsgbz"));
		crm_hddj_hdsjs=cf.fillNull(rs.getString("crm_hddj_hdsjs"));
		crm_hddj_lrr=cf.fillNull(rs.getString("crm_hddj_lrr"));
		crm_hddj_lrsj=cf.fillNull(rs.getDate("crm_hddj_lrsj"));
		crm_hddj_bz=cf.fillNull(rs.getString("crm_hddj_bz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �鿴��Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">�ͻ����</div>
            </td>
            <td width="35%"> <%=crm_hddj_khbh%> </td>
            <td width="15%"> 
              <div align="right">�ͻ�����</div>
            </td>
            <td width="35%"> <%=crm_hddj_khxm%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">�Ա�</div>
            </td>
            <td width="35%"> <%
	cf.selectToken(out,"M+��&W+Ů",crm_hddj_xb,true);
%> </td>
            <td width="15%"> 
              <div align="right">��ϵ��ʽ</div>
            </td>
            <td width="35%"> <%=crm_hddj_lxfs%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">��������</div>
            </td>
            <td width="35%"> <%=dm_cqbm_cqmc%> </td>
            <td width="15%"> 
              <div align="right">��װ�޵�ַ</div>
            </td>
            <td width="35%"> <%=crm_hddj_fwdz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">�ص�װ�޵�ַ</div>
            </td>
            <td width="35%"> <%=crm_hddj_cgdz%> </td>
            <td width="15%"> 
              <div align="right">�ص�ʩ����</div>
            </td>
            <td width="35%"> <%=sq_dwxx_dwmc%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">�ص�����</div>
            </td>
            <td width="35%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('4') order by dwbh",crm_hddj_hdsgbz,true);
%> </td>
            <td width="15%"> 
              <div align="right">�ص����ʦ</div>
            </td>
            <td width="35%"> <%=crm_hddj_hdsjs%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">¼����</div>
            </td>
            <td width="35%"> <%=crm_hddj_lrr%> </td>
            <td width="15%"> 
              <div align="right">¼��ʱ��</div>
            </td>
            <td width="35%"> <%=crm_hddj_lrsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="15%"> 
              <div align="right">��ע</div>
            </td>
            <td colspan="3"> <%=crm_hddj_bz%> 
            </td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
