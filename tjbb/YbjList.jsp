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
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�ɲι�������б�<BR>
  (�ɲι۽�ֹʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="3%">���</td>
  <td  width="5%">�ͻ�����</td>
  <td  width="5%">���� </td>
  <td  width="5%">���ʦ</td>
  <td  width="19%">ʩ����ַ</td>
  <td  width="5%">����</td>
  <td  width="12%">��������</td>
  <td  width="6%">����ǩԼ��</td>
  <td  width="13%">�ι�����</td>
</tr>
<%
	String all=null;


	ls_sql=" SELECT '',khxm,sgdmc,sjs,fwdz,hxmc,ysmc||'+'||czmc,qye,TO_CHAR(ybjdjsj,'YYYY-MM-DD')||'��'||TO_CHAR(ybjyxq,'YYYY-MM-DD')";
	ls_sql+=" FROM crm_khxx,sq_sgd,dm_hxbm,dm_ysbm,dm_czbm";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.hxbm=dm_hxbm.hxbm(+)";
	ls_sql+=" and crm_khxx.ysbm=dm_ysbm.ysbm(+) and crm_khxx.czbm=dm_czbm.czbm(+)";
	ls_sql+=" and ybjyxq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and ybjyxq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	ls_sql+=" order by ybjyxq";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printFoot();

%>
</table>


</body>
</html>