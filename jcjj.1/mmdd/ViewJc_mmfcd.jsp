<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String ls_sql=null;

%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center>ľ�Ÿ��ⵥ��Ԥ������ţ�<%=yddbh%>��</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="6%">��������</td>
	<td  width="7%">������</td>
	<td  width="5%">ľ���ͺ�</td>
	<td  width="6%">��ɫ</td>
	<td  width="4%">����</td>
	<td  width="5%">��װλ��</td>
	<td  width="5%">��������</td>
	<td  width="4%">��˫��</td>
	<td  width="4%">�ذ��</td>
	<td  width="4%">ǽ��</td>
	<td  width="8%">�Ŷ������</td>
	<td  width="6%">�߽���/ƽ̨�Ͽ�</td>
	<td  width="3%">��������</td>
	<td  width="4%">���ױ���</td>
	<td  width="20%">��ע</td>
</tr>
<%

	ls_sql="SELECT '',jc_mmdglx.mmdglxmc,mlxmc,jc_mmfcd.mmxh,dm_ysbm.ysmc,dm_czbm.czmc,jdm_azwzbm.azwzmc,jdm_kqfxbm.kqfxmc, DECODE(jc_mmfcd.dsk,'1','����','2','˫��'),TO_CHAR(jc_mmfcd.dbh),TO_CHAR(jc_mmfcd.qh),jc_mmfcd.mdk||'��'||jc_mmfcd.mdg,TO_CHAR(jc_mmfcd.tjx),jc_mmfcd.sl, DECODE(jc_mmfcd.ctbs,'3','����','4','�ı�'),jc_mmfcd.bz  ";
	ls_sql+=" FROM dm_czbm,dm_ysbm,jc_mmdglx,jc_mmfcd,jdm_azwzbm,jdm_kqfxbm,jdm_mlx  ";
    ls_sql+=" where jc_mmfcd.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmfcd.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmfcd.czbm=dm_czbm.czbm(+) and jc_mmfcd.ysbm=dm_ysbm.ysbm";
    ls_sql+=" and jc_mmfcd.mmdglxbm=jc_mmdglx.mmdglxbm(+) ";
    ls_sql+=" and  jc_mmfcd.mlx=jdm_mlx.mlx(+) and jc_mmfcd.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_mmfcd.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum(true);
	pageObj.printFoot();

%>

</table>
</body>
</html>
