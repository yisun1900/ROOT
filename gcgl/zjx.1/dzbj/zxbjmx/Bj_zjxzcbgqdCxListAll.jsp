<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<table border="1" width="260%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���������</td>
	<td  width="3%">�ͻ����</td>
	<td  width="3%">�ṹλ��</td>
	<td  width="4%">���ϼƼ۷�ʽ</td>
	<td  width="2%">ʵ�ʵ���</td>
	<td  width="2%">����</td>
	<td  width="3%">���</td>
	<td  width="8%">���ײ�Ʒ˵��</td>
	<td  width="2%">���ۼ�������</td>
	<td  width="4%">��Ʒ����</td>
	<td  width="4%">��Ʒ����</td>
	<td  width="4%">Ʒ��</td>
	<td  width="4%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="7%">��Ӧ������</td>
	<td  width="2%">���ۼ�����λ</td>
	<td  width="2%">�µ�������λ</td>
	<td  width="2%">�µ���</td>
	<td  width="2%">�Ƿ��账��С��</td>
	<td  width="2%">�Ƿ���Ч</td>
	<td  width="2%">��Ч��ʼʱ��</td>
	<td  width="2%">��Ч����ʱ��</td>
	<td  width="2%">�ײ��ڵ���</td>
	<td  width="2%">�ײͳ�������</td>
	<td  width="2%">�Ƿ�ɸĵ���</td>
	<td  width="2%">���</td>
	<td  width="2%">�Ƿ��в�Ʒ</td>
	<td  width="3%">��������</td>
	<td  width="2%">SKU��</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="3%">��Ʒ���</td>
	<td  width="53%">�ײ�������</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();


	String ls_sql=null;

	ls_sql="SELECT bj_zjxzcbgqd.zjxxh,bj_zjxzcbgqd.khbh,bj_zjxzcbgqd.jgwzbm,DECODE(bj_zjxzcbgqd.ddcljjfs,'0','�Ƕ������','1','���䣨����ۣ�','2','���䣨�����Ƽۣ�','3','�ײ�ѡ��'),TO_CHAR(bj_zjxzcbgqd.dj),bj_zjxzcbgqd.sl,ROUND(bj_zjxzcbgqd.dj*bj_zjxzcbgqd.sl,2) je,bj_zjxzcbgqd.ptcpsm,bdm_bjjbbm.bjjbmc  ,bj_zjxzcbgqd.cpbm,bj_zjxzcbgqd.cpmc,bj_zjxzcbgqd.ppmc,bj_zjxzcbgqd.xh,bj_zjxzcbgqd.gg,bj_zjxzcbgqd.gysmc,bj_zjxzcbgqd.jldw,bj_zjxzcbgqd.xdjldw,TO_CHAR(bj_zjxzcbgqd.xdb),bj_zjxzcbgqd.sfxclxs,bj_zjxzcbgqd.sfyx,bj_zjxzcbgqd.yxkssj,bj_zjxzcbgqd.yxjzsj,TO_CHAR(bj_zjxzcbgqd.tcndj),TO_CHAR(bj_zjxzcbgqd.tccldj),DECODE(bj_zjxzcbgqd.sfkgdj,'Y','��','N','��'),bj_zjxzcbgqd.sh||'%',DECODE(bj_zjxzcbgqd.sfcscp,'Y','��','N','��'),DECODE(bj_zjxzcbgqd.zclx,'1','�ײ���','2','�ײ���','3','�����ײ���','4','�����ײ���'),bj_zjxzcbgqd.sku,jxc_cldlbm.cldlmc,jxc_clxlbm.clxlmc,bj_tcsjflbm.tcsjflmc";
	ls_sql+=" FROM bdm_bjjbbm,bj_zjxzcbgqd,jxc_cldlbm,jxc_clxlbm,bj_tcsjflbm  ";
	ls_sql+=" where bj_zjxzcbgqd.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.tccpdlbm=jxc_cldlbm.cldlbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
	ls_sql+=" and bj_zjxzcbgqd.khbh='"+khbh+"' and bj_zjxzcbgqd.zjxxh='"+zjxxh+"'";
	ls_sql+=" order by bj_zjxzcbgqd.jgwzbm,bj_zjxzcbgqd.ppmc,bj_zjxzcbgqd.xh";
	pageObj.sql=ls_sql;
	//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��



	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>