<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");
String ls_sql=null;

%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<center>ľ�ų�����ϸ��Ԥ������ţ�<%=yddbh%>��</center>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">��������</td>
	<td  width="3%">������</td>
	<td  width="3%">ľ���ͺ�</td>
	<td  width="7%">����</td>
	<td  width="3%">��ɫ</td>
	<td  width="4%">��װλ��</td>
	<td  width="4%">��������</td>
	<td  width="4%">������</td>
	<td  width="4%">��о��</td>
	<td  width="4%">�ز�����</td>
	<td  width="3%">�ذ��</td>
	<td  width="6%">�Ŷ�����ߡ�ǽ��</td>
	<td  width="5%">���ȿ����</td>
	<td  width="3%">�߽���</td>
	<td  width="4%">�����ͺ�</td>
	<td  width="3%">���ױ���</td>
	<td  width="4%">����/�ƿڲ���</td>
	<td  width="3%">���Ƿ��ж���</td>
	<td  width="3%">����</td>
	<td  width="3%">����</td>
	<td  width="4%">���</td>
	<td  width="12%">��ע</td>
	<td  width="5%">��Ƭ</td>
</tr>
<%
	ls_sql="SELECT mmdglxmc,mlxmc,jc_mmccd.mmxh,mmczmc,czmc,azwzmc,kqfxmc,mtxmc,mxxmc,TO_CHAR(jc_mmccd.tjx) tjx,blxh, DECODE(jc_mmccd.ctbs,'3','����','4','�ı�') ctbs,dczlmc,TO_CHAR(jc_mmccd.dbh) dbh, jc_mmccd.mdk||'��'||jc_mmccd.mdg||'��'||jc_mmccd.qh md,msk||'��'||msg ms,DECODE(sfsmjcc,'Y','��ľ���ɲ�','N','����ľ���ɲ�') sfsmjcc,DECODE(sfydc,'Y','�ж���','N','�޶���') sfydc,TO_CHAR(jc_mmccd.dj) dj,jc_mmccd.sl,sl*dj zj,NVL2(jc_mmxhb.zp,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=200>','') zp,jc_mmccd.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_mmdglx,jc_mmccd,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb,jdm_mtxbm,jdm_mxxbm  ";
    ls_sql+=" where jc_mmccd.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmccd.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmccd.czbm=dm_czbm.czbm(+) and jc_mmccd.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmccd.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
	ls_sql+=" and jc_mmccd.mmxh=jc_mmxhb.mmxh(+) and jc_mmccd.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmccd.mlx=jdm_mlx.mlx(+) and jc_mmccd.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmccd.mxxbm=jdm_mxxbm.mxxbm(+) ";
    ls_sql+=" and jc_mmccd.yddbh='"+yddbh+"'";
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmccd.xh";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"mmdglxmc","mlxmc","mmxh","mmczmc","czmc","azwzmc","kqfxmc","mtxmc","mxxmc","dczlmc","dbh","md","ms","tjx","blxh","ctbs","sfsmjcc","sfydc","dj","sl","zj","bz","zp"};
	pageObj.setDisColName(disColName);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();
%>

</table>
</body>
</html>
