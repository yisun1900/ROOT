<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_cpgzjl_khbh=null;
String crm_cpgzjl_cpflbm=null;
String crm_cpgzjl_cplx=null;
String crm_cpgzjl_cpazlx=null;
String crm_cpgzjl_ghf=null;
String crm_cpgzjl_jgpp=null;
String crm_cpgzjl_ghfhzsj=null;
String crm_cpgzjl_sfxdd=null;
String crm_cpgzjl_sfxhxgl=null;
String crm_cpgzjl_zxsfwz=null;
String crm_cpgzjl_cpsjs=null;
String crm_cpgzjl_sfxfb=null;
String crm_cpgzjl_sfyyc=null;
String crm_cpgzjl_sfxtx=null;
String crm_cpgzjl_txrq=null;
String crm_cpgzjl_txxs=null;
String crm_cpgzjl_txnr=null;
String crm_cpgzjl_cpztbm=null;
String crm_cpgzjl_lrr=null;
String crm_cpgzjl_lrsj=null;
String crm_cpgzjl_lrbm=null;
String crm_cpgzjl_bz=null;
String crm_zxkhxx_khxm=null;
String crm_zxkhxx_fwdz=null;
String crm_zxkhxx_hth=null;
String crm_zxkhxx_sjs=null;
String crm_cpgzjl_fbdbh=null;
String crm_cpgzjl_ycdbh=null;
String crm_cpgzjl_zwyjcrq=null;
String crm_cpgzjl_jhrksj=null;
String crm_cpgzjl_jhshsj=null;
String crm_cpgzjl_jhazsj=null;
String crm_cpgzjl_ztfssj=null;
String crm_cpgzjl_srksj=null;
String crm_cpgzjl_sshsj=null;
String crm_cpgzjl_scazsj=null;
String crm_cpgzjl_azwcsj=null;
String khbh=null;
String cpflbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
cpflbm=cf.GB2Uni(request.getParameter("cpflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_cpgzjl.khbh as crm_cpgzjl_khbh,crm_cpgzjl.cpflbm as crm_cpgzjl_cpflbm,crm_cpgzjl.cplx as crm_cpgzjl_cplx,crm_cpgzjl.cpazlx as crm_cpgzjl_cpazlx,crm_cpgzjl.ghf as crm_cpgzjl_ghf,crm_cpgzjl.jgpp as crm_cpgzjl_jgpp,crm_cpgzjl.ghfhzsj as crm_cpgzjl_ghfhzsj,crm_cpgzjl.sfxdd as crm_cpgzjl_sfxdd,crm_cpgzjl.sfxhxgl as crm_cpgzjl_sfxhxgl,crm_cpgzjl.zxsfwz as crm_cpgzjl_zxsfwz,crm_cpgzjl.cpsjs as crm_cpgzjl_cpsjs,crm_cpgzjl.sfxfb as crm_cpgzjl_sfxfb,crm_cpgzjl.sfyyc as crm_cpgzjl_sfyyc,crm_cpgzjl.sfxtx as crm_cpgzjl_sfxtx,crm_cpgzjl.txrq as crm_cpgzjl_txrq,crm_cpgzjl.txxs as crm_cpgzjl_txxs,crm_cpgzjl.txnr as crm_cpgzjl_txnr,crm_cpgzjl.cpztbm as crm_cpgzjl_cpztbm,crm_cpgzjl.lrr as crm_cpgzjl_lrr,crm_cpgzjl.lrsj as crm_cpgzjl_lrsj,crm_cpgzjl.lrbm as crm_cpgzjl_lrbm,crm_cpgzjl.bz as crm_cpgzjl_bz,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.hth as crm_zxkhxx_hth,crm_zxkhxx.sjs as crm_zxkhxx_sjs,crm_cpgzjl.fbdbh as crm_cpgzjl_fbdbh,crm_cpgzjl.ycdbh as crm_cpgzjl_ycdbh,crm_cpgzjl.zwyjcrq as crm_cpgzjl_zwyjcrq,crm_cpgzjl.jhrksj as crm_cpgzjl_jhrksj,crm_cpgzjl.jhshsj as crm_cpgzjl_jhshsj,crm_cpgzjl.jhazsj as crm_cpgzjl_jhazsj,crm_cpgzjl.ztfssj as crm_cpgzjl_ztfssj,crm_cpgzjl.srksj as crm_cpgzjl_srksj,crm_cpgzjl.sshsj as crm_cpgzjl_sshsj,crm_cpgzjl.scazsj as crm_cpgzjl_scazsj,crm_cpgzjl.azwcsj as crm_cpgzjl_azwcsj ";
	ls_sql+=" from  crm_cpgzjl,crm_zxkhxx";
	ls_sql+=" where crm_cpgzjl.khbh=crm_zxkhxx.khbh and  (crm_cpgzjl.khbh='"+khbh+"') and  (crm_cpgzjl.cpflbm='"+cpflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_cpgzjl_khbh=cf.fillNull(rs.getString("crm_cpgzjl_khbh"));
		crm_cpgzjl_cpflbm=cf.fillNull(rs.getString("crm_cpgzjl_cpflbm"));
		crm_cpgzjl_cplx=cf.fillNull(rs.getString("crm_cpgzjl_cplx"));
		crm_cpgzjl_cpazlx=cf.fillNull(rs.getString("crm_cpgzjl_cpazlx"));
		crm_cpgzjl_ghf=cf.fillNull(rs.getString("crm_cpgzjl_ghf"));
		crm_cpgzjl_jgpp=cf.fillNull(rs.getString("crm_cpgzjl_jgpp"));
		crm_cpgzjl_ghfhzsj=cf.fillNull(rs.getDate("crm_cpgzjl_ghfhzsj"));
		crm_cpgzjl_sfxdd=cf.fillNull(rs.getString("crm_cpgzjl_sfxdd"));
		crm_cpgzjl_sfxhxgl=cf.fillNull(rs.getString("crm_cpgzjl_sfxhxgl"));
		crm_cpgzjl_zxsfwz=cf.fillNull(rs.getString("crm_cpgzjl_zxsfwz"));
		crm_cpgzjl_cpsjs=cf.fillNull(rs.getString("crm_cpgzjl_cpsjs"));
		crm_cpgzjl_sfxfb=cf.fillNull(rs.getString("crm_cpgzjl_sfxfb"));
		crm_cpgzjl_sfyyc=cf.fillNull(rs.getString("crm_cpgzjl_sfyyc"));
		crm_cpgzjl_sfxtx=cf.fillNull(rs.getString("crm_cpgzjl_sfxtx"));
		crm_cpgzjl_txrq=cf.fillNull(rs.getDate("crm_cpgzjl_txrq"));
		crm_cpgzjl_txxs=cf.fillNull(rs.getString("crm_cpgzjl_txxs"));
		crm_cpgzjl_txnr=cf.fillNull(rs.getString("crm_cpgzjl_txnr"));
		crm_cpgzjl_cpztbm=cf.fillNull(rs.getString("crm_cpgzjl_cpztbm"));
		crm_cpgzjl_lrr=cf.fillNull(rs.getString("crm_cpgzjl_lrr"));
		crm_cpgzjl_lrsj=cf.fillNull(rs.getDate("crm_cpgzjl_lrsj"));
		crm_cpgzjl_lrbm=cf.fillNull(rs.getString("crm_cpgzjl_lrbm"));
		crm_cpgzjl_bz=cf.fillNull(rs.getString("crm_cpgzjl_bz"));
		crm_zxkhxx_khxm=cf.fillNull(rs.getString("crm_zxkhxx_khxm"));
		crm_zxkhxx_fwdz=cf.fillNull(rs.getString("crm_zxkhxx_fwdz"));
		crm_zxkhxx_hth=cf.fillNull(rs.getString("crm_zxkhxx_hth"));
		crm_zxkhxx_sjs=cf.fillNull(rs.getString("crm_zxkhxx_sjs"));
		crm_cpgzjl_fbdbh=cf.fillNull(rs.getString("crm_cpgzjl_fbdbh"));
		crm_cpgzjl_ycdbh=cf.fillNull(rs.getString("crm_cpgzjl_ycdbh"));
		crm_cpgzjl_zwyjcrq=cf.fillNull(rs.getDate("crm_cpgzjl_zwyjcrq"));
		crm_cpgzjl_jhrksj=cf.fillNull(rs.getDate("crm_cpgzjl_jhrksj"));
		crm_cpgzjl_jhshsj=cf.fillNull(rs.getDate("crm_cpgzjl_jhshsj"));
		crm_cpgzjl_jhazsj=cf.fillNull(rs.getDate("crm_cpgzjl_jhazsj"));
		crm_cpgzjl_ztfssj=cf.fillNull(rs.getDate("crm_cpgzjl_ztfssj"));
		crm_cpgzjl_srksj=cf.fillNull(rs.getDate("crm_cpgzjl_srksj"));
		crm_cpgzjl_sshsj=cf.fillNull(rs.getDate("crm_cpgzjl_sshsj"));
		crm_cpgzjl_scazsj=cf.fillNull(rs.getDate("crm_cpgzjl_scazsj"));
		crm_cpgzjl_azwcsj=cf.fillNull(rs.getDate("crm_cpgzjl_azwcsj"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
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
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> ��Ʒ��Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"> �ͻ����� </td>
    <td><%=crm_zxkhxx_khxm%> </td>
    <td align="right"> ���ݵ�ַ </td>
    <td><%=crm_zxkhxx_fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ��ͬ�� </td>
    <td><%=crm_zxkhxx_hth%> </td>
    <td align="right"> ���ʦ </td>
    <td><%=crm_zxkhxx_sjs%> </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �ͻ����  </td>
  <td width="32%"> 
    <%=crm_cpgzjl_khbh%>  </td>
  <td align="right" width="18%">״̬����ʱ��</td>
  <td width="32%"><%=crm_cpgzjl_ztfssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ����</td>
  <td><%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm order by cpflbm",crm_cpgzjl_cpflbm,true);
%></td>
  <td align="right">��Ʒ״̬</td>
  <td><%
	cf.selectItem(out,"select cpztbm,cpztmc from dm_cpztbm order by cpztbm",crm_cpgzjl_cpztbm,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��Ʒ����  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "1+����Ʒ&2+��Ʒ",crm_cpgzjl_cplx,true);
%>  </td>
  <td align="right" width="18%"> 
    ��Ʒ��װ����  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "1+ʩ����&2+��װ��",crm_cpgzjl_cpazlx,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ������  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "�׹�+�׹�&��˾��+��˾��&δȷ��+δȷ��",crm_cpgzjl_ghf,true);
%>  </td>
  <td align="right" width="18%"> 
    �׹�Ʒ��  </td>
  <td width="32%"> 
    <%=crm_cpgzjl_jgpp%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��������֪ʱ��  </td>
  <td width="32%"> 
    <%=crm_cpgzjl_ghfhzsj%>  </td>
  <td align="right" width="18%"> 
    �Ƿ񽻵׺��¶���  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+��&N+��",crm_cpgzjl_sfxdd,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �Ƿ����������  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+��&N+��",crm_cpgzjl_sfxhxgl,true);
%>  </td>
  <td align="right" width="18%"> 
    ѡ���Ƿ����  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "Y+��&N+��",crm_cpgzjl_zxsfwz,true);
%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ��践��</td>
  <td><%
	cf.radioToken(out, "N+�޷���&Y+�ȴ�����&W+�����ɹ�&S+����ʧ��",crm_cpgzjl_sfxfb,true);
%></td>
  <td align="right">��������� </td>
  <td><%=crm_cpgzjl_fbdbh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �Ƿ����쳣  </td>
  <td width="32%"> 
<%
	cf.radioToken(out, "N+���쳣&Y+�ȴ�����&W+�쳣����ɹ�&S+�쳣���ʧ��",crm_cpgzjl_sfyyc,true);
%>  </td>
  <td align="right" width="18%">�쳣�����</td>
  <td width="32%"><%=crm_cpgzjl_ycdbh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�������</td>
  <td colspan="3"><%
	cf.radioToken(out, "Y+������&N+��",crm_cpgzjl_sfxtx,true);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��������  </td>
  <td width="32%"> 
    <%=crm_cpgzjl_txrq%>  </td>
  <td align="right" width="18%"> 
    ����Сʱ  </td>
  <td width="32%"> 
    <%=crm_cpgzjl_txxs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��������  </td>
  <td colspan="3"> 
    <%=crm_cpgzjl_txnr%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ¼����  </td>
  <td width="32%"> 
    <%=crm_cpgzjl_lrr%>  </td>
  <td align="right" width="18%"> 
    ¼��ʱ��  </td>
  <td width="32%"> 
    <%=crm_cpgzjl_lrsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ¼�벿��  </td>
  <td width="32%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx='F0' order by dwbh",crm_cpgzjl_lrbm,true);
%>  </td>
  <td align="right" width="18%">��Ʒ���ʦ</td>
  <td width="32%"><%=crm_cpgzjl_cpsjs%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><%=crm_cpgzjl_bz%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ����Ӧ��������  </td>
  <td width="32%"> 
    <%=crm_cpgzjl_zwyjcrq%>  </td>
  <td align="right" width="18%">�ƻ���װʱ��</td>
  <td width="32%"><%=crm_cpgzjl_jhazsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ����ʱ��</td>
  <td><%=crm_cpgzjl_jhrksj%></td>
  <td align="right">ʵ���ʱ��</td>
  <td><%=crm_cpgzjl_srksj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �ƻ��ͻ�ʱ��  </td>
  <td width="32%"> 
    <%=crm_cpgzjl_jhshsj%>  </td>
  <td align="right" width="18%">ʵ�ͻ�ʱ��</td>
  <td width="32%"><%=crm_cpgzjl_sshsj%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�״����Ű�װʱ��</td>
  <td width="32%"><%=crm_cpgzjl_scazsj%></td>
  <td align="right" width="18%">��װ���ʱ�� </td>
  <td width="32%"><%=crm_cpgzjl_azwcsj%></td>
</tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">��Ʒ����</td>
	<td  width="9%">��Ʒ״̬</td>
	<td  width="8%">����ʱ��</td>
	<td  width="6%">������</td>
	<td  width="6%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="11%">¼�벿��</td>
	<td  width="37%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cpflmc,cpztmc,crm_cpztgzjl.fssj,crm_cpztgzjl.zrr,crm_cpztgzjl.lrr,crm_cpztgzjl.lrsj,dwmc,crm_cpztgzjl.bz";
	ls_sql+=" FROM crm_cpztgzjl,dm_cpztbm,dm_cpflbm,sq_dwxx  ";
    ls_sql+=" where crm_cpztgzjl.cpztbm=dm_cpztbm.cpztbm and crm_cpztgzjl.cpflbm=dm_cpflbm.cpflbm and crm_cpztgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and crm_cpztgzjl.khbh='"+khbh+"' and crm_cpztgzjl.cpflbm='"+cpflbm+"'";
    ls_sql+=" order by crm_cpztgzjl.cpflbm,crm_cpztgzjl.fssj ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>
</body>
</html>
