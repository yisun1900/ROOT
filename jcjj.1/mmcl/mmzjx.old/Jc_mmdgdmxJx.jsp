<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yddbh=request.getParameter("yddbh");
	String zjxxh=request.getParameter("zjxxh");

	String ls_sql=null;

	ls_sql="SELECT DECODE(lx,'1','��ͬ��','2','����') lx,DECODE(jxbz,'N','��','Y','��') jxbz,jc_mmdgdmx.xh xh,mmdglxmc,mlxmc,jc_mmdgdmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,TO_CHAR(jc_mmdgdmx.tjx) tjx,jc_blbj.blxh, DECODE(jc_mmdgdmx.ctbs,'3','����','4','�ı�') ctbs,dczlmc,TO_CHAR(jc_mmdgdmx.dbh) dbh,jc_mmdgdmx.qh||'��'||jc_mmdgdmx.mdk||'��'||jc_mmdgdmx.mdg md,DECODE(sfsmjcc,'Y','��ľ���ɲ�','N','����ľ���ɲ�') sfsmjcc,DECODE(sfydc,'Y','�ж���','N','�޶���') sfydc,jc_mmdgdmx.sl,TO_CHAR(jc_mmdgdmx.dj) dj,sl*dj zj,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=100>' zp,jc_mmdgdmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_blbj,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb  ";
    ls_sql+=" where jc_mmdgdmx.blxhbm=jc_blbj.blxhbm(+) and jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmdgdmx.blxhbm=jc_blbj.blxhbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) ";
    ls_sql+=" and jc_mmdgdmx.yddbh='"+yddbh+"' and jxbz='N'";
    ls_sql+=" order by jc_mmdgdmx.lx,jc_mmdgdmx.jxbz,jc_mmdgdmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"lx","jxbz","mmdglxmc","mlxmc","mmxh","mmczmc","czmc","azwzmc","kqfxmc","dczlmc","dbh","md","tjx","blxh","ctbs","sfsmjcc","sfydc","sl","dj","zj","zp","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"����"};//��ť����ʾ����
	String[] buttonLink={"SaveJc_mmdgdmxJx.jsp?yddbh="+yddbh+"&zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ľ�ż��Ԥ�����ţ�<%=yddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="115%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">����</td>
	<td  width="3%">����</td>
	<td  width="6%">��������</td>
	<td  width="4%">������</td>
	<td  width="3%">ľ���ͺ�</td>
	<td  width="6%">��ɫ</td>
	<td  width="3%">����</td>
	<td  width="4%">��װλ��</td>
	<td  width="4%">��������</td>
	<td  width="4%">�ز�����</td>
	<td  width="3%">�ذ��</td>
	<td  width="8%">ǽ����Ŷ������</td>
	<td  width="4%">�߽���/ƽ̨�Ͽ�</td>
	<td  width="7%">�����ͺ�</td>
	<td  width="4%">���ױ���</td>
	<td  width="4%">����/�ƿڲ���</td>
	<td  width="4%">�Ƿ��ж���</td>
	<td  width="3%">��������</td>
	<td  width="3%">����</td>
	<td  width="4%">�ܼ�</td>
	<td  width="6%">��Ƭ</td>
	<td  width="15%">��ע</td>
</tr>

<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
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