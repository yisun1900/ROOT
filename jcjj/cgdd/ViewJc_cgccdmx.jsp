<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String ls_sql=null;
%>

<html>
<head>
<title>�鿴��ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 14px'>
<div align="center">������ⵥ��ϸ</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="4%">����<BR>����*��</td>
	<td  width="3%">����</td>
	<td  width="3%">���񵥼�</td>
	<td  width="3%">����Ǳ�ϵ��</td>
	<td  width="4%">�ع�<BR>����*��</td>
	<td  width="3%">�ع񳤶�</td>
	<td  width="3%">�ع񵥼�</td>
	<td  width="3%">�ع�Ǳ�ϵ��</td>
	<td  width="3%">̨��</td>
	<td  width="3%">̨�泤��</td>
	<td  width="3%">̨�浥��</td>
	<td  width="3%">̨��Ǳ�ϵ��</td>
	<td  width="6%">�Ű�</td>
	<td  width="3%">�Ű����</td>
	<td  width="3%">�Ű嵥��</td>
	<td  width="5%">�Ű���</td>
	<td  width="6%">����</td>
	<td  width="8%">����</td>
	<td  width="7%">����</td>
	<td  width="4%">����</td>
	<td  width="4%">ʵ���ܼ�</td>
	<td  width="4%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cgmc,dgjs||'*'||dggd,TO_CHAR(dgcd),TO_CHAR(dgdj),TO_CHAR(dgfbxs),tgjs||'*'||tggd,TO_CHAR(tdcd),TO_CHAR(tgdj),TO_CHAR(tgfbxs),jc_tmbj.tmmc,TO_CHAR(tmcd),TO_CHAR(tmdj),TO_CHAR(tmfbxs),jdm_mbbm.mbmc,TO_CHAR(mbmj),TO_CHAR(mbdj),jdm_mbfbbm.mbfbmc,jdm_xtbm.xtmc,jdm_lsbm.lsmc,jdm_ctbm.ctmc,jdm_jlbm.jlmc,jc_cgccdmx.sjzj,jc_cgccdmx.bz  ";
	ls_sql+=" FROM jc_cgccdmx,jc_tmbj,jdm_ctbm,jdm_jlbm,jdm_lsbm,jdm_mbbm,jdm_mbfbbm,jdm_tjbbm,jdm_xtbm,jc_cgjgb  ";
    ls_sql+=" where jc_cgccdmx.cgbm=jc_cgjgb.cgbm and jc_cgccdmx.jlbm=jdm_jlbm.jlbm(+) and jc_cgccdmx.ctbm=jdm_ctbm.ctbm(+)";
    ls_sql+=" and jc_cgccdmx.tjbbm=jdm_tjbbm.tjbbm(+) and jc_cgccdmx.lsbm=jdm_lsbm.lsbm(+) and jc_cgccdmx.xtbm=jdm_xtbm.xtbm(+)";
    ls_sql+=" and jc_cgccdmx.mbfbbm=jdm_mbfbbm.mbfbbm(+) and jc_cgccdmx.mbbm=jdm_mbbm.mbbm(+) and jc_cgccdmx.tmbm=jc_tmbj.tmbm(+)";
    ls_sql+=" and jc_cgccdmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_cgccdmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>


<div align="center">�����ⵥ��ϸ</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="18%">�������</td>
	<td  width="10%">����</td>
	<td  width="10%">����</td>
	<td  width="12%">���</td>
	<td  width="40%">��ע</td>
</tr>
<%
	ls_sql="SELECT jc_cgwjbj.wjmc as jc_cgwjbj_wjmc,TO_CHAR(jc_cgwjccdmx.dj) as jc_cgwjccdmx_dj,jc_cgwjccdmx.sl as jc_cgwjccdmx_sl,jc_cgwjccdmx.je as jc_cgwjccdmx_je,jc_cgwjccdmx.bz as jc_cgwjccdmx_bz ";
	ls_sql+=" FROM jc_cgwjbj,jc_cgwjccdmx  ";
    ls_sql+=" where jc_cgwjccdmx.wjbm=jc_cgwjbj.wjbm";
    ls_sql+=" and jc_cgwjccdmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

<div align="center">�������ⵥ��ϸ</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">��������</td>
	<td  width="10%">�ͺ�</td>
	<td  width="32%">��Ʒ����</td>
	<td  width="6%">����</td>
	<td  width="6%">����</td>
	<td  width="10%">���</td>
	<td  width="16%">��ע</td>
</tr>
<%
	ls_sql="SELECT jc_cgdqbj.dqmc as jc_cgdqbj_dqmc,xh,cptz,TO_CHAR(jc_cgdqccdmx.dj) as jc_cgdqccdmx_dj,jc_cgdqccdmx.sl as jc_cgdqccdmx_sl,jc_cgdqccdmx.je as jc_cgdqccdmx_je,jc_cgdqccdmx.bz as jc_cgdqccdmx_bz ";
	ls_sql+=" FROM jc_cgdqbj,jc_cgdqccdmx  ";
    ls_sql+=" where jc_cgdqccdmx.dqbm=jc_cgdqbj.dqbm";
    ls_sql+=" and jc_cgdqccdmx.ddbh='"+ddbh+"'";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

</body>
</html>
