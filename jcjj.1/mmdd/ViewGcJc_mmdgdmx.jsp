<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center>ľ�ź�ͬ��ϸ��Ԥ������ţ�<%=yddbh%>��</center>
<table border="1" width="270%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">����</td>
	<td  width="4%">��������</td>
	<td  width="2%">������</td>
	<td  width="4%">ľ���ͺ�</td>
	<td  width="7%">����</td>
	<td  width="5%">��ɫ</td>
	<td  width="3%">��װλ��</td>
	<td  width="4%">��������</td>
	<td  width="3%">������</td>
	<td  width="3%">��о��</td>
	<td  width="3%">�ز�����</td>
	<td  width="2%">�ذ��</td>
	<td  width="5%">�Ŷ�����ߡ�ǽ��</td>
	<td  width="3%">�߽���</td>
	<td  width="4%">�����ͺ�</td>
	<td  width="2%">���ױ���</td>
	<td  width="4%">����/�ƿڲ���</td>
	<td  width="3%">���Ƿ��ж���</td>
	<td  width="3%">����</td>
	<td  width="3%">��ͬ����</td>
	<td  width="4%">��ͬ���</td>
	<td  width="3%">����������</td>
	<td  width="4%">�������ܶ�</td>
	<td  width="13%">��ע</td>
	<td  width="5%">��Ƭ</td>
	<td  width="2%">�Զ��Ƽ�</td>
</tr>
<%

	ls_sql="SELECT DECODE(lx,'1','��ͬ��','2','����') lx,mmdglxmc,mlxmc,jc_mmdgdmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,mtxmc,mxxmc,TO_CHAR(jc_mmdgdmx.tjx) tjx,blxh, DECODE(jc_mmdgdmx.ctbs,'3','����','4','�ı�') ctbs,dczlmc,TO_CHAR(jc_mmdgdmx.dbh) dbh, jc_mmdgdmx.mdk||'��'||jc_mmdgdmx.mdg||'��'||jc_mmdgdmx.qh md,DECODE(sfsmjcc,'Y','��ľ���ɲ�','N','����ľ���ɲ�') sfsmjcc,DECODE(sfydc,'Y','�ж���','N','�޶���') sfydc,DECODE(jc_mmdgdmx.sfzdjj,'1','�Զ�','2','�˹�') sfzdjj,TO_CHAR(jc_mmdgdmx.dj) dj,jc_mmdgdmx.sl,sl*dj zj,jc_mmdgdmx.zjhsl,zjhsl*dj zjhze,NVL2(jc_mmxhb.zp,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=200>','') zp,jc_mmdgdmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb,jdm_mtxbm,jdm_mxxbm  ";
    ls_sql+=" where jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmdgdmx.mxxbm=jdm_mxxbm.mxxbm(+) ";
    ls_sql+=" and jc_mmdgdmx.yddbh='"+yddbh+"'";
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmdgdmx.lx,jc_mmdgdmx.mmxh";
	
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"lx","mmdglxmc","mlxmc","mmxh","mmczmc","czmc","azwzmc","kqfxmc","mtxmc","mxxmc","dczlmc","dbh","md","tjx","blxh","ctbs","sfsmjcc","sfydc","dj","sl","zj","zjhsl","zjhze","bz","zp","sfzdjj"};
	pageObj.setDisColName(disColName);
//������ʾ�ϲ���
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zp","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();

%>
</table>

<center>������ͬ��ϸ</center>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="5%">����</td>
	<td  width="15%">�������</td>
	<td  width="8%">������</td>
	<td  width="12%">�ͺ�</td>
	<td  width="7%">������</td>
	<td  width="5%">����</td>
	<td  width="4%">��ͬ����</td>
	<td  width="6%">��ͬ���</td>
	<td  width="4%">����������</td>
	<td  width="6%">�������ܶ�</td>
	<td  width="25%">��ע</td>
</tr>
<%

	ls_sql="SELECT '',DECODE(lx,'1','��ͬ��','2','����') lx,wjmc,jdm_wjjbm.wjjmc,jc_wjjddmx.xinghao ,mmsbsmc,TO_CHAR(jc_wjjddmx.dj),jc_wjjddmx.sl,jc_wjjddmx.dj*jc_wjjddmx.sl je,jc_wjjddmx.zjhsl,jc_wjjddmx.dj*jc_wjjddmx.zjhsl zjhze,jc_wjjddmx.bz as jc_wjjddmx_bz  ";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm,jdm_mmsbsbm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm  ";
    ls_sql+=" and jc_wjjddmx.mmsbsbm=jdm_mmsbsbm.mmsbsbm(+)";
    ls_sql+=" and jc_wjjddmx.yddbh='"+yddbh+"' ";
    ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash.put("lx","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum(true);
	pageObj.printFoot();

%>
</table>

<center>������ͬ��ϸ</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">���</td>
	<td  width="7%">����</td>
	<td  width="22%">��������</td>
	<td  width="7%">����</td>
	<td  width="7%">��ͬ����</td>
	<td  width="8%">��ͬ���</td>
	<td  width="7%">����������</td>
	<td  width="8%">�������ܶ�</td>
	<td  width="30%">��ע</td>
</tr>
<%

	ls_sql="SELECT '',DECODE(lx,'1','��ͬ��','2','����') lx,blxh,TO_CHAR(jc_blddmx.dj),jc_blddmx.sl,jc_blddmx.dj*jc_blddmx.sl je,jc_blddmx.zjhsl,jc_blddmx.dj*jc_blddmx.zjhsl zjhze,jc_blddmx.bz  ";
	ls_sql+=" FROM jc_blddmx  ";
    ls_sql+=" where jc_blddmx.yddbh='"+yddbh+"' ";
    ls_sql+=" order by jc_blddmx.yddbh,jc_blddmx.lrxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash.put("lx","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum(true);
	pageObj.printFoot();

%>
</table>

</body>
</html>
