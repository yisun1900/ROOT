<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//�������,��ȡ����

	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");

	String txlx=cf.GB2Uni(request.getParameter("txlx"));

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>ʩ�����˵�ͳ�� <BR>
  (<%=sjfw%>--<%=sjfw2%>)</B> 
  <BR> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr align="center">
    <td>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr align="center"> 
          <td width="15%">�ֹ�˾</td>
		  <td  width="8%">����</td>
          <td width="13%">ʩ����</td>
          <td width="10%">�˵����� </td>
          <td width="15%">�˵���Ԫ��</td>
          <td width="30%">�˵���Ԫ��</td>
        </tr>

<%
	String all=null;

	//��ȡ����
	ls_sql="SELECT max(sum(stje))";
	ls_sql+=" FROM crm_tddj,sq_sgd ";
	ls_sql+=" where crm_tddj.sgd=sq_sgd.sgd ";
	ls_sql+=" and crm_tddj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tddj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_tddj.sgd in(select sgd from sq_sgd where ssdw='"+fgs+"'))";
	}
	ls_sql+=" group by sgdmc";

	all=cf.executeQuery(ls_sql);

	ls_sql=" SELECT fgs,TO_CHAR(rownum),dm,sl,je,tx";
	ls_sql+=" FROM (";
	ls_sql+=" SELECT b.dwmc fgs,sgdmc dm,count(*) sl,sum(stje) je,'<A HREF=\"ViewSgdtd.jsp?sjfw="+sjfw+"&sjfw2="+sjfw2+"&dwbh='||crm_tddj.sgd||'\" target=\"_blank\"><img src=\"/images/ColuGif.gif\" width='||sum(stje)*200/"+all+"||' height=14></A>' as tx";
	ls_sql+=" FROM crm_tddj,sq_sgd,sq_dwxx b";
	ls_sql+=" where crm_tddj.sgd=sq_sgd.sgd and sq_sgd.ssdw=b.dwbh";
	ls_sql+=" and crm_tddj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tddj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_tddj.sgd in(select dwbh from sq_dwxx where ssdw='"+fgs+"'))";
	}
	ls_sql+=" group by b.dwmc,crm_tddj.sgd,sgdmc";
	ls_sql+=" order by count(*) desc";
	ls_sql+=" )";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[5]="align='left'";

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("fgs","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
	pageObj.displayFoot();

%>

</table>
</body>
</html>
