<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String wheresql="";
	String sjfw=null;
	String sjfw2=null;
	sjfw=request.getParameter("sjfw");
	if (sjfw!=null)
	{
		if (!(sjfw.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY/MM/DD'))";
	}
	sjfw2=request.getParameter("sjfw2");
	if (sjfw2!=null)
	{
		if (!(sjfw2.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}
	String clzt=request.getParameter("clzt");
	if (clzt.equals("2"))
	{
		wheresql+=" and  crm_tsjl.clzt!='3'";//0��δ����1��������2���ڴ���3���᰸��9:������
	}
	else if (clzt.equals("3"))
	{
		wheresql+=" and  crm_tsjl.clzt='3'";//0��δ����1��������2���ڴ���3���᰸��9:������
	}
%>
<html>
<head>
<title>����Ͷ��/������Ϣ�ձ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr align="right">
    <td><div align="center"><strong>����Ͷ��/������Ϣ�ձ���</strong></div></td>
  </tr>
  <tr align="right"> 
    <td width="34%"><div align="left">���ڣ�<%=sjfw%> �� <%=sjfw2%></div></td>
  </tr>
 <tr align="right">
    <td><div align="left">���̲�����</div></td>
  </tr>
     <table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">����</td>
	<td  width="8%">������Ϣ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="6%">�漰����/����/��Ա</td>
	<td  width="15%">�������</td>
	<td  width="8%">����ԭ��</td>
	<td  width="15%">�������</td>
	<td  width="6%">������</td>
	<td  width="6%">������</td>
	<td  width="8%">������ʱ��</td>
	<td  width="6%">����</td>
</tr>

<%
	ls_sql="SELECT DECODE(lx,'1','Ͷ��',2,'����') lx,slsj,khxm,a.dwmc,tsnr,tsyymc,clqk,slr,clr,jasj,b.dwmc dm";
	ls_sql+=" FROM crm_tsjl,dm_tsyybm,sq_dwxx a,sq_dwxx b,dm_tslxbm,crm_tsclqk,crm_tspp";
    ls_sql+=" where crm_tsjl.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.tslxbm in ('11','24') and b.dwbh=crm_tsjl.dwbh and crm_tsjl.tsyybm=dm_tsyybm.tsyybm and slbm='FBJ13' and crm_tsclqk.tsjlh=crm_tsjl.tsjlh and crm_tspp.tsjlh=crm_tsjl.tsjlh and a.dwbh=crm_tspp.tspp";
	ls_sql+=wheresql;
    ls_sql+=" order by lx";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table> 
</body>
</html>
