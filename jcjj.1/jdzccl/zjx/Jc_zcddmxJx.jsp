<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ddbh=request.getParameter("ddbh");
	String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
	String clzt=cf.executeQuery("select clzt from jc_zczjx where ddbh='"+ddbh+"' and zjxxh="+zjxxh);
	if (!clzt.equals("00"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ�����������");
		return;
	}

	
	ls_sql ="SELECT DECODE(jc_zcddmx.lx,'1','��ͬ��','2','����') lx,jc_zcddmx.xh xh,dwmc,zclbbm,DECODE(jc_zcddmx.jxbz,'N','��','Y','����') jxbz,jc_zcddmx.zcbm zcbm,zcmc,jc_zcjgb.xh xinghao,jc_zcjgb.gg,zcpzwzmc,jc_zcddmx.zcysbm,TO_CHAR(jc_zcddmx.dj) dj,jldwmc,jc_zcddmx.sl,jc_zcddmx.je,DECODE(jc_zcjgb.sfbhpj,'Y','����','N','������') sfbhpj,jc_zcjgb.pjts*jc_zcddmx.sl pjzs, DECODE(jc_zcddmx.cxhdbz,'Y','�μ�','N','���μ�') cxhdbz,jc_zcddmx.bz  ";
	ls_sql+=" FROM jc_zcddmx,jc_zcjgb,jdm_zcpzwzbm,sq_dwxx,jdm_jldwbm  ";
    ls_sql+=" where jc_zcddmx.zcpzwzbm=jdm_zcpzwzbm.zcpzwzbm(+)";
    ls_sql+=" and jc_zcddmx.zcbm=jc_zcjgb.zcbm and jc_zcjgb.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and jc_zcddmx.ddbh='"+ddbh+"' and jc_zcjgb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and jc_zcddmx.jxbz='N'";
    ls_sql+=" order by jc_zcddmx.lx,jc_zcjgb.zcdlbm,jc_zcjgb.dwbh,jc_zcjgb.zclbbm,jc_zcjgb.zcbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"lx","dwmc","zclbbm","jxbz","zcbm","zcmc","xinghao","gg","zcpzwzmc","zcysbm","dj","jldwmc","sl","je","sfbhpj","pjzs","cxhdbz","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"���ѡ����"};//��ť����ʾ����
	String[] buttonLink={"SaveJc_zcddmxJx.jsp?ddbh="+ddbh+"&zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("lx","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("zclbbm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ļ��������ţ�<%=ddbh%>����ţ�<%=zjxxh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">����</td>
	<td  width="5%">Ʒ��</td>
	<td  width="7%">ϵ��</td>
	<td  width="4%">����</td>
	<td  width="5%">���ı���</td>
	<td  width="9%">��������</td>
	<td  width="6%">�ͺ�</td>
	<td  width="8%">���</td>
	<td  width="6%" bgcolor="#CC99FF">��װλ��</td>
	<td  width="6%" bgcolor="#CC99FF">��ɫ</td>
	<td  width="5%">����</td>
	<td  width="4%">��λ</td>
	<td  width="4%" bgcolor="#CC99FF">����</td>
	<td  width="5%">���</td>
	<td  width="5%">���</td>
	<td  width="4%">�����</td>
	<td  width="5%" bgcolor="#CC99FF">�</td>
	<td  width="6%">��ע</td>
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