<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yddbh=request.getParameter("yddbh");
	String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");
	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(jc_mmdgdmx.xh) xh,mmdglxmc,mlxmc,jc_mmdgdmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,mtxmc,mxxmc,dczlmc,TO_CHAR(jc_mmdgdmx.dbh) dbh,jc_mmdgdmx.mdk||'��'||jc_mmdgdmx.mdg||'��'||jc_mmdgdmx.qh md,TO_CHAR(jc_mmdgdmx.tjx) tjx,blxh, DECODE(jc_mmdgdmx.ctbs,'3','����','4','�ı�') ctbs,DECODE(sfsmjcc,'Y','��ľ���ɲ�','N','����ľ���ɲ�') sfsmjcc,DECODE(sfydc,'Y','�ж���','N','�޶���') sfydc,jc_mmdgdmx.sl,TO_CHAR(jc_mmdgdmx.bzdj) bzdj,TO_CHAR(jc_mmdgdmx.dj) dj,sl*bzdj zqzj,sl*dj zj,NVL2(jc_mmxhb.zp,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" >','') zp,jc_mmdgdmx.bz";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb,jdm_mtxbm,jdm_mxxbm  ";
    ls_sql+=" where jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmdgdmx.mxxbm=jdm_mxxbm.mxxbm(+)";
    ls_sql+=" and jc_mmdgdmx.yddbh='"+yddbh+"' and jc_mmdgdmx.lx='1'";
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmdgdmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_mmdgdmxMain.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��



//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_mmdgdmx.jsp?yddbh="+yddbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zp","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ľ�ź�ͬ��ϸ�������ţ�<%=yddbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">���</td>
	<td  width="5%">��������</td>
	<td  width="4%">������</td>
	<td  width="3%">ľ���ͺ�</td>
	<td  width="5%">����</td>
	<td  width="5%">��ɫ</td>
	<td  width="4%">��װλ��</td>
	<td  width="4%">��������</td>
	<td  width="4%">������</td>
	<td  width="4%">��о��</td>
	<td  width="4%">�ز�����</td>
	<td  width="3%">�زĺ�</td>
	<td  width="5%">�Ŷ�����ߡ�ǽ��</td>
	<td  width="3%">�߽���/ŷʽ��ñ</td>
	<td  width="5%">�����ͺ�</td>
	<td  width="3%">���ױ���</td>
	<td  width="4%">����/�ƿڲ���</td>
	<td  width="3%">�Ƿ��ж���</td>
	<td  width="3%">��������</td>
	<td  width="3%">��ǰ����</td>
	<td  width="3%">�ۺ󵥼�</td>
	<td  width="3%">��ǰ�ܼ�</td>
	<td  width="3%">�ۺ��ܼ�</td>
	<td  width="7%">��Ƭ</td>
	<td  width="5%">��ע</td>
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