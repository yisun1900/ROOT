<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_khsmjl_jlh=null;
String crm_khsmjl_khbh=null;
String crm_zxkhxx_khxm=null;
String crm_zxkhxx_fwdz=null;
String crm_zxkhxx_sjs=null;
String crm_khsmjl_smsj=null;
String crm_khsmjl_smmd=null;
String crm_khsmjl_jdr=null;
String crm_khsmjl_jdrbh=null;
String crm_khsmjl_jdrbm=null;
String crm_khsmjl_sjjdqk=null;
String crm_khsmjl_jdjglrr=null;
String crm_khsmjl_jdjglrsj=null;
String crm_khsmjl_qksfss=null;
String crm_khsmjl_shr=null;
String crm_khsmjl_shsj=null;
String crm_khsmjl_shsm=null;
String crm_khsmjl_zt=null;
String crm_khsmjl_lrr=null;
String crm_khsmjl_lrsj=null;
String crm_khsmjl_lrbm=null;
String crm_khsmjl_ssfgs=null;
String crm_khsmjl_bz=null;

String lfcs=null;
String sfhf=null;
String hfr=null;
String hfsj=null;
String hfsm=null;


String wherecrm_khsmjl_jlh=null;
wherecrm_khsmjl_jlh=cf.GB2Uni(request.getParameter("jlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_khsmjl.jlh as crm_khsmjl_jlh,crm_khsmjl.khbh as crm_khsmjl_khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.sjs as crm_zxkhxx_sjs,crm_khsmjl.smsj as crm_khsmjl_smsj,crm_khsmjl.smmd as crm_khsmjl_smmd,crm_khsmjl.jdr as crm_khsmjl_jdr,crm_khsmjl.jdrbh as crm_khsmjl_jdrbh,crm_khsmjl.jdrbm as crm_khsmjl_jdrbm,crm_khsmjl.sjjdqk as crm_khsmjl_sjjdqk,crm_khsmjl.jdjglrr as crm_khsmjl_jdjglrr,crm_khsmjl.jdjglrsj as crm_khsmjl_jdjglrsj,crm_khsmjl.qksfss as crm_khsmjl_qksfss,crm_khsmjl.shr as crm_khsmjl_shr,crm_khsmjl.shsj as crm_khsmjl_shsj,crm_khsmjl.shsm as crm_khsmjl_shsm,crm_khsmjl.zt as crm_khsmjl_zt,crm_khsmjl.lrr as crm_khsmjl_lrr,crm_khsmjl.lrsj as crm_khsmjl_lrsj,crm_khsmjl.lrbm as crm_khsmjl_lrbm,crm_khsmjl.ssfgs as crm_khsmjl_ssfgs,crm_khsmjl.bz as crm_khsmjl_bz ";
	ls_sql+=" ,crm_khsmjl.lfcs,DECODE(crm_khsmjl.sfhf,'Y','�ط�','N','δ�ط�') sfhf,crm_khsmjl.hfr,crm_khsmjl.hfsj,crm_khsmjl.hfsm";
	ls_sql+=" from  crm_zxkhxx,crm_khsmjl";
	ls_sql+=" where crm_khsmjl.khbh=crm_zxkhxx.khbh(+) and  (crm_khsmjl.jlh='"+wherecrm_khsmjl_jlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lfcs=cf.fillNull(rs.getString("lfcs"));
		sfhf=cf.fillNull(rs.getString("sfhf"));
		hfr=cf.fillNull(rs.getString("hfr"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfsm=cf.fillNull(rs.getString("hfsm"));

		crm_khsmjl_jlh=cf.fillNull(rs.getString("crm_khsmjl_jlh"));
		crm_khsmjl_khbh=cf.fillNull(rs.getString("crm_khsmjl_khbh"));
		crm_zxkhxx_khxm=cf.fillNull(rs.getString("crm_zxkhxx_khxm"));
		crm_zxkhxx_fwdz=cf.fillNull(rs.getString("crm_zxkhxx_fwdz"));
		crm_zxkhxx_sjs=cf.fillNull(rs.getString("crm_zxkhxx_sjs"));
		crm_khsmjl_smsj=cf.fillNull(rs.getDate("crm_khsmjl_smsj"));
		crm_khsmjl_smmd=cf.fillNull(rs.getString("crm_khsmjl_smmd"));
		crm_khsmjl_jdr=cf.fillNull(rs.getString("crm_khsmjl_jdr"));
		crm_khsmjl_jdrbh=cf.fillNull(rs.getString("crm_khsmjl_jdrbh"));
		crm_khsmjl_jdrbm=cf.fillNull(rs.getString("crm_khsmjl_jdrbm"));
		crm_khsmjl_sjjdqk=cf.fillNull(rs.getString("crm_khsmjl_sjjdqk"));
		crm_khsmjl_jdjglrr=cf.fillNull(rs.getString("crm_khsmjl_jdjglrr"));
		crm_khsmjl_jdjglrsj=cf.fillNull(rs.getDate("crm_khsmjl_jdjglrsj"));
		crm_khsmjl_qksfss=cf.fillNull(rs.getString("crm_khsmjl_qksfss"));
		crm_khsmjl_shr=cf.fillNull(rs.getString("crm_khsmjl_shr"));
		crm_khsmjl_shsj=cf.fillNull(rs.getDate("crm_khsmjl_shsj"));
		crm_khsmjl_shsm=cf.fillNull(rs.getString("crm_khsmjl_shsm"));
		crm_khsmjl_zt=cf.fillNull(rs.getString("crm_khsmjl_zt"));
		crm_khsmjl_lrr=cf.fillNull(rs.getString("crm_khsmjl_lrr"));
		crm_khsmjl_lrsj=cf.fillNull(rs.getDate("crm_khsmjl_lrsj"));
		crm_khsmjl_lrbm=cf.fillNull(rs.getString("crm_khsmjl_lrbm"));
		crm_khsmjl_ssfgs=cf.fillNull(rs.getString("crm_khsmjl_ssfgs"));
		crm_khsmjl_bz=cf.fillNull(rs.getString("crm_khsmjl_bz"));
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
<div align="center"> �鿴��Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��¼��  </td>
  <td width="32%"> 
    <%=crm_khsmjl_jlh%>  </td>
  <td align="right" width="18%"> 
    �ͻ����  </td>
  <td width="32%"> 
    <%=crm_khsmjl_khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �ͻ�����  </td>
  <td width="32%"> 
    <%=crm_zxkhxx_khxm%>  </td>
  <td align="right" width="18%">���ʦ</td>
  <td width="32%"><%=crm_zxkhxx_sjs%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���ݵ�ַ  </td>
  <td colspan="3"><%=crm_zxkhxx_fwdz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʱ�� </td>
  <td><%=crm_khsmjl_smsj%></td>
  <td align="right">����Ŀ��</td>
  <td><%
	cf.selectItem(out,"select smmd c1,smmd c2 from dm_smmd order by smmd",crm_khsmjl_smmd,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ӵ��˱��</td>
  <td width="32%"><%=crm_khsmjl_jdrbh%></td>
  <td align="right" width="18%"> 
    �Ӵ���  </td>
  <td width="32%"> 
    <%=crm_khsmjl_jdr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ӵ��˲��� </td>
  <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",crm_khsmjl_jdrbm,true);
%></td>
  <td align="right" width="18%">���Ŵ���</td>
  <td width="32%"><%=lfcs%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ӵ����¼����</td>
  <td><%=crm_khsmjl_jdjglrr%></td>
  <td align="right">�Ӵ����¼��ʱ��</td>
  <td><%=crm_khsmjl_jdjglrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ʵ�ʽӴ���� </td>
  <td colspan="3"><%=crm_khsmjl_sjjdqk%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����Ƿ���ʵ</td>
  <td width="32%"><%
	cf.radioToken(out, "Y+��ʵ&N+����ʵ",crm_khsmjl_qksfss,true);
%></td>
  <td align="right" width="18%">״̬</td>
  <td width="32%"><%
	cf.radioToken(out, "1+δ¼���&2+��¼���&3+�����",crm_khsmjl_zt,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    �����  </td>
  <td width="32%"> 
    <%=crm_khsmjl_shr%>  </td>
  <td align="right" width="18%"> 
    ���ʱ��  </td>
  <td width="32%"> 
    <%=crm_khsmjl_shsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���˵��  </td>
  <td colspan="3"> 
    <%=crm_khsmjl_shsm%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�ط�</td>
  <td><%=sfhf%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ط���</td>
  <td><%=hfr%> </td>
  <td align="right">�ط�ʱ��</td>
  <td><%=hfsj%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ط�˵��</td>
  <td colspan="3"><%=hfsm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ¼���� </td>
  <td><%=crm_khsmjl_lrr%> </td>
  <td align="right"> ¼��ʱ�� </td>
  <td><%=crm_khsmjl_lrsj%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ¼�벿��  </td>
  <td width="32%"> 
    <%=crm_khsmjl_lrbm%>  </td>
  <td align="right" width="18%"> 
    �����ֹ�˾  </td>
  <td width="32%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx='F0' order by dwbh",crm_khsmjl_ssfgs,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ��ע  </td>
  <td colspan="3"> 
    <%=crm_khsmjl_bz%>    </td>
  </tr>
</table>
</body>
</html>
