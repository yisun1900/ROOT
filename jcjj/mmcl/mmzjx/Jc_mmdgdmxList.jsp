<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yddbh=request.getParameter("yddbh");
	String zjxxh=request.getParameter("zjxxh");
	String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");

	String ls_sql=null;

	ls_sql="SELECT DECODE(lx,'1','��ͬ��','2','����') lx,jc_mmdgdmx.xh xh,mmdglxmc,mlxmc,jc_mmdgdmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,mtxmc,mxxmc,TO_CHAR(jc_mmdgdmx.tjx) tjx,blxh, DECODE(jc_mmdgdmx.ctbs,'3','����','4','�ı�') ctbs,dczlmc,TO_CHAR(jc_mmdgdmx.dbh) dbh,jc_mmdgdmx.qh||'��'||jc_mmdgdmx.mdk||'��'||jc_mmdgdmx.mdg md,DECODE(sfsmjcc,'Y','��ľ���ɲ�','N','����ľ���ɲ�') sfsmjcc,DECODE(sfydc,'Y','�ж���','N','�޶���') sfydc,DECODE(jc_mmdgdmx.sfzdjj,'1','�Զ�','2','�˹�') sfzdjj,TO_CHAR(jc_mmdgdmx.bzdj) bzdj,TO_CHAR(jc_mmdgdmx.dj) dj,jc_mmdgdmx.sl,jc_mmdgdmx.zjhsl,NVL2(jc_mmxhb.zp,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=200>','') zp,jc_mmdgdmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb,jdm_mtxbm,jdm_mxxbm  ";
    ls_sql+=" where jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) ";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmdgdmx.mxxbm=jdm_mxxbm.mxxbm(+)";
    ls_sql+=" and jc_mmdgdmx.yddbh='"+yddbh+"' ";
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" and jc_mmdgdmx. xh  not in(select xh from jc_mmzjxmx where zjxxh='"+zjxxh+"')";
    ls_sql+=" order by jc_mmdgdmx.lx,jc_mmdgdmx.mmxh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"lx","mmdglxmc","mlxmc","mmxh","mmczmc","czmc","azwzmc","kqfxmc","mtxmc","mxxmc","dczlmc","dbh","md","tjx","ctbs","sl","zjhsl","bzdj","dj","sfsmjcc","sfydc","blxh","bz","zp","sfzdjj"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zp","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
//���ð�ť����
	String[] buttonName={"����"};//��ť����ʾ����
	String[] buttonLink={"SaveJc_mmdgdmxZjx.jsp?yddbh="+yddbh+"&zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ѡ��ľ���������������ţ�<%=zjxxh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="210%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">����</td>
	<td  width="3%">��������</td>
	<td  width="3%">������</td>
	<td  width="3%">ľ���ͺ�</td>
	<td  width="11%">����</td>
	<td  width="4%">��ɫ</td>
	<td  width="3%">��װλ��</td>
	<td  width="3%">��������</td>
	<td  width="4%">������</td>
	<td  width="4%">��о��</td>
	<td  width="4%">�ز�����</td>
	<td  width="3%">�ذ��</td>
	<td  width="6%">ǽ����Ŷ������</td>
	<td  width="4%">�߽���/ƽ̨�Ͽ�</td>
	<td  width="3%">���ױ���</td>
	<td  width="3%" bgcolor="#99CCFF">��ͬ����</td>
	<td  width="3%" bgcolor="#99CCFF">����������</td>
	<td  width="3%">��ǰ����</td>
	<td  width="3%">�ۺ󵥼�</td>
	<td  width="4%">����/�ƿڲ���</td>
	<td  width="3%">�Ƿ��ж���</td>
	<td  width="4%">�����ͺ�</td>
	<td  width="6%">��ע</td>
	<td  width="6%">��Ƭ</td>
	<td  width="2%">�Ƽ�</td>
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