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
	String bjjbbm=null;

	dqbm=request.getParameter("dqbm");
	bjjbbm=request.getParameter("bjjbbm");

	ls_sql="SELECT bj_tczcbj.ppmc,bj_tczcbj.gysmc,jxc_cldlbm.cldlmc,clxlmc,tcsjflmc,bj_tczcbj.cpbm,DECODE(bj_tczcbj.sfcscp,'Y','��','N','��') sfcscp,bj_tczcbj.sku,bj_tczcbj.cpmc,bj_tczcbj.xh,bj_tczcbj.gg,bj_tczcbj.jldw,bj_tczcbj.xdjldw,bj_tczcbj.xdb,bj_tczcbj.sh,DECODE(bj_tczcbj.sfxclxs,'1','����ȡ��','2','����ȡ��','3','4��5��','4','������') sfxclxs,bj_tczcbj.dj,bj_tczcbj.tccldj,DECODE(bj_tczcbj.sfkgdj,'Y','�ɸ�','N','��') sfkgdj,bj_tczcbj.jsj,DECODE(bj_tczcbj.sfyx,'1','��Զ��Ч','2','��Ч','3','�׶���Ч') sfyx,bj_tczcbj.yxkssj,bj_tczcbj.yxjzsj, bj_tczcbj.xuhao ";
	ls_sql+=" FROM bj_tczcbj,jxc_cldlbm,jxc_clxlbm,bj_tcsjflbm  ";
    ls_sql+=" where bj_tczcbj.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_tczcbj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_tczcbj.tcsjflbm=bj_tcsjflbm.tcsjflbm(+) ";
    ls_sql+=" and bj_tczcbj.dqbm='"+dqbm+"' and bj_tczcbj.bjjbbm='"+bjjbbm+"'";
    ls_sql+=" order by bj_tczcbj.tccpdlbm,bj_tczcbj.tccplbbm,bj_tczcbj.cpbm";
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
<table border="1" width="190%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">Ʒ��</td>
	<td  width="9%">��Ӧ��</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="4%">��Ʒ���</td>
	<td  width="4%">�ײ���������</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="3%">�Ƿ��в�Ʒ</td>
	<td  width="4%">SKU��</td>
	<td  width="7%">��Ʒ����</td>
	<td  width="7%">�ͺ�</td>
	<td  width="6%">���</td>
	<td  width="3%">������λ</td>
	<td  width="3%">�µ�������λ</td>
	<td  width="3%">�µ���</td>
	<td  width="3%">���(%)</td>
	<td  width="4%">�Ƿ��账��С��</td>
	<td  width="3%">�ײ��ڵ���</td>
	<td  width="3%">�ײͳ�������</td>
	<td  width="3%">�Ƿ�ɸĵ���</td>
	<td  width="3%">�����</td>
	<td  width="3%">�Ƿ���Ч</td>
	<td  width="4%">��Ч��ʼʱ��</td>
	<td  width="4%">��Ч����ʱ��</td>
	<td  width="2%">�������</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>