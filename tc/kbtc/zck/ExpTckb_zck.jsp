<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String dqbm=null;

	dqbm=request.getParameter("dqbm");

	ls_sql="SELECT bjjbmc,tckb_zck.kbcpbm,tckb_zck.kbwlbm,tckb_zck.ppmc,tckb_zck.gysmc,tckb_zck.cpdl,tckb_zck.cpxl,tckb_zck.cpbm,tckb_zck.cpmc,tckb_zck.xh,tckb_zck.gg,tckb_zck.cptz,tckb_zck.czlx,tckb_zck.cpks,tckb_zck.cplx,tckb_zck.jldw,tckb_zck.xdjldw,tckb_zck.xdb,tckb_zck.sh,DECODE(tckb_zck.sfxclxs,'1','����ȡ��','2','����ȡ��','3','4��5��','4','������') sfxclxs,tckb_zck.jsj,tckb_zck.lsj,tckb_zck.sjj,DECODE(tckb_zck.cllx,'1','���ڲ�Ʒ','2','�����Ʒ') cllx,DECODE(tckb_zck.sfyx,'1','��������','2','ֹͣ����','3','�׶�����','4','��ǰ��ʵ') sfyx,tckb_zck.yxkssj,tckb_zck.yxjzsj, tckb_zck.xuhao,DECODE(tckb_zck.sfkgdj,'Y','�ɸ�','N','��') sfkgdj ";
	ls_sql+=" FROM tckb_zck,bdm_bjjbbm ";
    ls_sql+=" where tckb_zck.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckb_zck.dqbm='"+dqbm+"'";
    ls_sql+=" order by tckb_zck.bjjbbm,tckb_zck.kbcpbm,tckb_zck.cpdl,tckb_zck.cpxl,tckb_zck.cpbm";
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="280%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
      <td width="2%">���ۼ���</td>
      <td width="3%">�Ʊ���Ʒ����</td>
      <td width="3%">�Ʊ����ϱ���</td>
      <td width="4%">Ʒ��</td>
      <td width="8%">��Ӧ��</td>
      <td width="4%">��Ʒ����</td>
      <td width="4%">��ƷС��</td>
	  <td width="3%">��Ʒ����</td>
      <td width="6%">��Ʒ����</td>
      <td width="5%">�ͺ�</td>
      <td width="5%">���</td>
      <td width="7%">��Ʒ����</td>
      <td width="5%">��������</td>
      <td width="5%">��Ʒ��ʽ</td>
      <td width="4%">��Ʒ����</td>
	  <td width="2%">���ۼ�����λ</td>
	  <td width="2%">�µ�������λ</td>
	  <td width="2%">�µ���</td>
	  <td width="2%">��ģ�%��</td>
	  <td width="2%">�Ƿ��账��С��</td>
	  <td width="2%">�����</td>
	  <td width="2%">���ۼ�</td>
	  <td width="2%">���ڼ�</td>
	  <td width="2%">��������</td>
	<td  width="2%">�Ƿ���Ч</td>
	<td  width="3%">��Ч��ʼʱ��</td>
	<td  width="3%">��Ч����ʱ��</td>
      <td width="2%">����</td>
	<td  width="2%">�Ƿ�ɸĵ���</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>