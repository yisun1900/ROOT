<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_zxhfjl_khbh=null;
String crm_zxkhxx_khxm=null;
String crm_zxkhxx_fwdz=null;
String crm_zxkhxx_lxfs=null;
String crm_zxhfjl_hfjlh=null;
String crm_zxhfjl_khhfqk=null;
String crm_zxhfjl_lfbz=null;
String crm_zxhfjl_lfsj=null;
String crm_zxhfjl_ctbz=null;
String crm_zxhfjl_ctsj=null;
String crm_zxhfjl_yqghdm=null;
String crm_zxhfjl_yqghsjs=null;
String crm_zxhfjl_sjszysp=null;
String crm_zxhfjl_sjsfw=null;
String crm_zxhfjl_qtryfw=null;
String crm_zxhfjl_gcbj=null;
String crm_zxhfjl_gsztyx=null;
String crm_zxhfjl_xwgjfm=null;
String crm_zxhfjl_sfjxhf=null;
String crm_zxhfjl_xchfrq=null;
String crm_zxhfjl_hfsj=null;
String crm_zxhfjl_hfr=null;
String crm_zxhfjl_clfs=null;
String txry=null;
String sq_dwxx_dwmc=null;
String crm_zxhfjl_zxdm=null;
String crm_zxhfjl_sjs=null;
String cxgtbz=null;
String cxgtsj=null;
String csgtbz=null;
String csgtsj=null;
String zxkhyxbm=null;
String yylfsj=null;
String xclfsj=null;
String sjsgtnl=null;


String hfjlh=null;
hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_zxhfjl.sjsgtnl,crm_zxhfjl.zxkhyxbm,crm_zxhfjl.yylfsj,crm_zxhfjl.xclfsj,crm_zxhfjl.khbh as crm_zxhfjl_khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,crm_zxhfjl.hfjlh as crm_zxhfjl_hfjlh,crm_zxhfjl.khhfqk as crm_zxhfjl_khhfqk,crm_zxhfjl.lfbz as crm_zxhfjl_lfbz,crm_zxhfjl.lfsj as crm_zxhfjl_lfsj,crm_zxhfjl.ctbz as crm_zxhfjl_ctbz,crm_zxhfjl.ctsj as crm_zxhfjl_ctsj,crm_zxhfjl.yqghdm as crm_zxhfjl_yqghdm,crm_zxhfjl.yqghsjs as crm_zxhfjl_yqghsjs,crm_zxhfjl.sjszysp as crm_zxhfjl_sjszysp,crm_zxhfjl.sjsfw as crm_zxhfjl_sjsfw,crm_zxhfjl.qtryfw as crm_zxhfjl_qtryfw,crm_zxhfjl.gcbj as crm_zxhfjl_gcbj,crm_zxhfjl.gsztyx as crm_zxhfjl_gsztyx,crm_zxhfjl.xwgjfm as crm_zxhfjl_xwgjfm,crm_zxhfjl.sfjxhf as crm_zxhfjl_sfjxhf,crm_zxhfjl.xchfrq as crm_zxhfjl_xchfrq,crm_zxhfjl.hfsj as crm_zxhfjl_hfsj,crm_zxhfjl.hfr as crm_zxhfjl_hfr,crm_zxhfjl.clfs as crm_zxhfjl_clfs,crm_zxhfjl.txry,sq_dwxx.dwmc as sq_dwxx_dwmc,crm_zxhfjl.zxdm as crm_zxhfjl_zxdm,crm_zxhfjl.sjs as crm_zxhfjl_sjs ";
	ls_sql+=" ,crm_zxhfjl.cxgtbz,crm_zxhfjl.cxgtsj,crm_zxhfjl.csgtbz,crm_zxhfjl.csgtsj";
	ls_sql+=" from  crm_zxhfjl,crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxhfjl.hfbm=sq_dwxx.dwbh and crm_zxhfjl.khbh=crm_zxkhxx.khbh and  (crm_zxhfjl.hfjlh='"+hfjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsgtnl=cf.fillNull(rs.getString("sjsgtnl"));
		zxkhyxbm=cf.fillNull(rs.getString("zxkhyxbm"));
		yylfsj=cf.fillNull(rs.getDate("yylfsj"));
		xclfsj=cf.fillNull(rs.getDate("xclfsj"));
		cxgtbz=cf.fillNull(rs.getString("cxgtbz"));
		cxgtsj=cf.fillNull(rs.getDate("cxgtsj"));
		csgtbz=cf.fillNull(rs.getString("csgtbz"));
		csgtsj=cf.fillNull(rs.getDate("csgtsj"));

		crm_zxhfjl_khbh=cf.fillNull(rs.getString("crm_zxhfjl_khbh"));
		crm_zxkhxx_khxm=cf.fillNull(rs.getString("crm_zxkhxx_khxm"));
		crm_zxkhxx_fwdz=cf.fillNull(rs.getString("crm_zxkhxx_fwdz"));
		crm_zxkhxx_lxfs=cf.fillNull(rs.getString("crm_zxkhxx_lxfs"));
		crm_zxhfjl_hfjlh=cf.fillNull(rs.getString("crm_zxhfjl_hfjlh"));
		crm_zxhfjl_khhfqk=cf.fillNull(rs.getString("crm_zxhfjl_khhfqk"));
		crm_zxhfjl_lfbz=cf.fillNull(rs.getString("crm_zxhfjl_lfbz"));
		crm_zxhfjl_lfsj=cf.fillNull(rs.getDate("crm_zxhfjl_lfsj"));
		crm_zxhfjl_ctbz=cf.fillNull(rs.getString("crm_zxhfjl_ctbz"));
		crm_zxhfjl_ctsj=cf.fillNull(rs.getDate("crm_zxhfjl_ctsj"));
		crm_zxhfjl_yqghdm=cf.fillNull(rs.getString("crm_zxhfjl_yqghdm"));
		crm_zxhfjl_yqghsjs=cf.fillNull(rs.getString("crm_zxhfjl_yqghsjs"));
		crm_zxhfjl_sjszysp=cf.fillNull(rs.getString("crm_zxhfjl_sjszysp"));
		crm_zxhfjl_sjsfw=cf.fillNull(rs.getString("crm_zxhfjl_sjsfw"));
		crm_zxhfjl_qtryfw=cf.fillNull(rs.getString("crm_zxhfjl_qtryfw"));
		crm_zxhfjl_gcbj=cf.fillNull(rs.getString("crm_zxhfjl_gcbj"));
		crm_zxhfjl_gsztyx=cf.fillNull(rs.getString("crm_zxhfjl_gsztyx"));
		crm_zxhfjl_xwgjfm=cf.fillNull(rs.getString("crm_zxhfjl_xwgjfm"));
		crm_zxhfjl_sfjxhf=cf.fillNull(rs.getString("crm_zxhfjl_sfjxhf"));
		crm_zxhfjl_xchfrq=cf.fillNull(rs.getDate("crm_zxhfjl_xchfrq"));
		crm_zxhfjl_hfsj=cf.fillNull(rs.getDate("crm_zxhfjl_hfsj"));
		crm_zxhfjl_hfr=cf.fillNull(rs.getString("crm_zxhfjl_hfr"));
		crm_zxhfjl_clfs=cf.fillNull(rs.getString("crm_zxhfjl_clfs"));
		txry=cf.fillNull(rs.getString("txry"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		crm_zxhfjl_zxdm=cf.fillNull(rs.getString("crm_zxhfjl_zxdm"));
		crm_zxhfjl_sjs=cf.fillNull(rs.getString("crm_zxhfjl_sjs"));
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
<div align="center"> ��ѯ�ط���Ϣ���طü�¼�ţ�<%=crm_zxhfjl_hfjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#E8E8FF"> 
    <td align="right" width="18%"> �ͻ���� </td>
    <td width="32%"> <%=crm_zxhfjl_khbh%> </td>
    <td align="right" width="19%"> �ͻ����� </td>
    <td width="31%"> <%=crm_zxkhxx_khxm%> </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td align="right" width="18%"> ���ݵ�ַ </td>
    <td width="32%"> <%=crm_zxkhxx_fwdz%> </td>
    <td align="right" width="19%"> ��ϵ��ʽ </td>
    <td width="31%"> <%=crm_zxkhxx_lxfs%> </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td align="right" width="18%">��ѯ����</td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_zxhfjl_zxdm+"'",crm_zxhfjl_zxdm,true);
%></td>
    <td align="right" width="19%">���ʦ</td>
    <td width="31%"><%=crm_zxhfjl_sjs%></td>
  </tr>
  <tr bgcolor="#E8E8FF">
    <td colspan="4" align="center">�ͻ���������</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> ������־ </td>
    <td width="32%"> <%
	cf.radioToken(out, "N+δ����&Y+������",crm_zxhfjl_lfbz,true);
%> </td>
    <td width="19%" align="right"> ����ʱ�� </td>
    <td width="31%"> <%=crm_zxhfjl_lfsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> ��ƽ��ͼ��־ </td>
    <td width="32%"> <%
	cf.radioToken(out, "N+δ��ͼ&Y+�ѳ�ͼ",crm_zxhfjl_ctbz,true);
%> </td>
    <td width="19%" align="right"> ��ƽ��ͼʱ�� </td>
    <td width="31%"> <%=crm_zxhfjl_ctsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��Ч��ͼ��־</td>
    <td><%
	cf.selectToken(out,"N+δ��ͼ&Y+�ѳ�ͼ",cxgtbz,true);
%></td>
    <td align="right">��Ч��ͼʱ��</td>
    <td><%=cxgtsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ʩ��ͼ��־</td>
    <td><%
	cf.selectToken(out,"N+δ��ͼ&Y+�ѳ�ͼ",csgtbz,true);
%></td>
    <td align="right">��ʩ��ͼʱ��</td>
    <td><%=csgtsj%></td>
  </tr>
  <tr bgcolor="#E8E8FF">
    <td colspan="4" align="center">�ط�ָ��</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> ��Ʒ����Ƿ�����</td>
    <td width="32%"> <%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",crm_zxhfjl_sjszysp,true);
%> </td>
    <td width="19%" align="right">���ʦ��ͨ����</td>
    <td width="31%"><%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",sjsgtnl,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ʦ����</td>
    <td><%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",crm_zxhfjl_sjsfw,true);
%></td>
    <td align="right">���̱���</td>
    <td><%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm  ",crm_zxhfjl_gcbj,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> ������Ա���� </td>
    <td width="32%"> <%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",crm_zxhfjl_qtryfw,true);
%> </td>
    <td width="19%" align="right">��˾����ӡ��</td>
    <td width="31%"><%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",crm_zxhfjl_gsztyx,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">ϣ���Ľ����� </td>
    <td colspan="3"><%
	cf.selectItem(out,"select hfxmbm,hfxmmc from dm_zxhfxmbm order by hfxmbm ",crm_zxhfjl_xwgjfm,true);
%></td>
  </tr>
  <tr bgcolor="#E8E8FF">
    <td colspan="4" align="center">�طý��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ط�����</td>
    <td>
        <%
		cf.selectItem(out,"select zxkhyxbm,zxkhyxmc from dm_zxkhyxbm where zxkhyxbm='"+zxkhyxbm+"'",zxkhyxbm,true);
%>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">ԤԼ����ʱ��</td>
    <td><%=yylfsj%></td>
    <td align="right">ԤԼ����ʱ��</td>
    <td><%=xclfsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> �Ƿ�����ط� </td>
    <td width="32%"> <%
	cf.radioToken(out, "Y+�����ط�&N+�طý���",crm_zxhfjl_sfjxhf,true);
%> </td>
    <td width="19%" align="right"> �´λط����� </td>
    <td width="31%"> <%=crm_zxhfjl_xchfrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> Ҫ��������� </td>
    <td><%
	cf.radioToken(out, "N+��Ҫ��&Y+Ҫ�����",crm_zxhfjl_yqghdm,true);
%>    </td>
    <td align="right"> Ҫ��������ʦ </td>
    <td><%
	cf.radioToken(out, "N+��Ҫ��&Y+Ҫ�����",crm_zxhfjl_yqghsjs,true);
%>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> �Ƿ����������� </td>
    <td><%
	cf.radioToken(out, "0+������&1+���ѵ���&2+�������ʦ",crm_zxhfjl_clfs,true);
%>    </td>
    <td align="right"> ������Ա </td>
    <td><%=txry%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ͻ��ط����</td>
    <td colspan="3"><%=crm_zxhfjl_khhfqk%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> �ط�ʱ�� </td>
    <td width="32%"> <%=crm_zxhfjl_hfsj%> </td>
    <td width="19%" align="right"> �ط��� </td>
    <td width="31%"> <%=crm_zxhfjl_hfr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> �طò��� </td>
    <td width="32%"> <%=sq_dwxx_dwmc%> </td>
    <td width="19%" align="right">&nbsp; </td>
    <td width="31%">&nbsp; </td>
  </tr>
</table>

<table border="1" bgcolor="#E8E8FF" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="4%">���</td>
	<td  width="6%">����</td>
	<td  width="5%">��ʽ</td>
	<td  width="7%">��������</td>
	<td  width="7%">���ѹؼ���</td>
	<td  width="44%">��������</td>
	<td  width="5%">״̬</td>
	<td  width="7%">�鿴ʱ��</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT xh,ygbh,yhmc,DECODE(txfs,'1','ϵͳ','2','�绰','3','����','4','����','9','ȫ��'),DECODE(txlx,'01','��ѯ�ط�','02','��ʩ���̻ط�','03','Ͷ�߱��޻ط�','04','Ͷ�߱���'),txgjz,txnr,DECODE(ckzt,'1','δ�鿴','2','�鿴'),cksj,lrr,lrsj";
	ls_sql+=" FROM sq_txxxb ";
    ls_sql+=" where txfs='1' and txlx='01' and txgjz='"+hfjlh.trim()+"'";
	ls_sql+=" order by xh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
	pageObj.alignStr[6]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>

</body>
</html>
