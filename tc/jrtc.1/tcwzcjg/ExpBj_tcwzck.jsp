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
	String ppmc=null;

	dqbm=request.getParameter("dqbm");
	ppmc=cf.GB2Uni(request.getParameter("ppmc"));

	ls_sql="SELECT bj_tcwzck.ppmc,bj_tcwzck.gysmc,jxc_cldlbm.cldlmc,clxlmc,bj_tcwzck.cpbm,bj_tcwzck.cpmc,bj_tcwzck.xh,bj_tcwzck.gg,bj_tcwzck.jldw,bj_tcwzck.xdjldw,bj_tcwzck.xdb,bj_tcwzck.sh,DECODE(bj_tcwzck.sfxclxs,'1','����ȡ��','2','����ȡ��','3','4��5��','4','������') sfxclxs,bj_tcwzck.dj,DECODE(bj_tcwzck.sfkgdj,'Y','�ɸ�','N','��') sfkgdj,DECODE(bj_tcwzck.jsfs,'1','�����','2','�������') jsfs,bj_tcwzck.jsj,bj_tcwzck.jsbl,DECODE(bj_tcwzck.jjfs,'1','�����','2','�����Ƽ�','3','�ײ�ѡ��') jjfs,DECODE(bj_tcwzck.sfycx,'Y','�д���','N','��') sfycx,bj_tcwzck.cxkssj,bj_tcwzck.cxjssj,bj_tcwzck.cxj,bj_tcwzck.cxjsj,bj_tcwzck.cxjsbl,DECODE(bj_tcwzck.sfyx,'1','��Զ��Ч','2','��Ч','3','�׶���Ч') sfyx,bj_tcwzck.yxkssj,bj_tcwzck.yxjzsj ";
	ls_sql+=" FROM bj_tcwzck,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where bj_tcwzck.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_tcwzck.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_tcwzck.dqbm='"+dqbm+"' and bj_tcwzck.ppmc='"+ppmc+"'";
    ls_sql+=" order by bj_tcwzck.tccpdlbm,bj_tcwzck.tccplbbm,bj_tcwzck.cpbm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);

//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">Ʒ��</td>
	<td  width="8%">��Ӧ��</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="4%">��Ʒ���</td>
	<td  width="4%">��Ʒ����</td>
	<td  width="6%">��Ʒ����</td>
	<td  width="6%">�ͺ�</td>
	<td  width="6%">���</td>
	<td  width="3%">������λ</td>
	<td  width="3%">�µ�������λ</td>
	<td  width="3%">�µ���</td>
	<td  width="3%">���(%)</td>
	<td  width="4%">�Ƿ��账��С��</td>
	<td  width="3%">����</td>
	<td  width="3%">�Ƿ�ɸĵ���</td>
	<td  width="3%">���㷽ʽ</td>
	<td  width="2%">�����</td>
	<td  width="2%">�������</td>
	<td  width="3%">�Ƽ۷�ʽ</td>
	<td  width="3%">�Ƿ��д���</td>
	<td  width="3%">������ʼʱ��</td>
	<td  width="3%">��������ʱ��</td>
	<td  width="3%">������</td>
	<td  width="2%">���������</td>
	<td  width="2%">�����������</td>
	<td  width="3%">�Ƿ���Ч</td>
	<td  width="3%">��Ч��ʼʱ��</td>
	<td  width="3%">��Ч����ʱ��</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>