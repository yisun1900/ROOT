<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_sbkhlx_xh=null;
	String crm_sbkhlx_ssfgs=null;
	String crm_sbkhlx_sbkhlx=null;
	crm_sbkhlx_xh=request.getParameter("crm_sbkhlx_xh");
	if (crm_sbkhlx_xh!=null)
	{
		crm_sbkhlx_xh=crm_sbkhlx_xh.trim();
		if (!(crm_sbkhlx_xh.equals("")))	wheresql+=" and (crm_sbkhlx.xh="+crm_sbkhlx_xh+") ";
	}
	crm_sbkhlx_ssfgs=request.getParameter("crm_sbkhlx_ssfgs");
	if (crm_sbkhlx_ssfgs!=null)
	{
		crm_sbkhlx_ssfgs=cf.GB2Uni(crm_sbkhlx_ssfgs);
		if (!(crm_sbkhlx_ssfgs.equals("")))	wheresql+=" and  (crm_sbkhlx.ssfgs='"+crm_sbkhlx_ssfgs+"')";
	}
	crm_sbkhlx_sbkhlx=request.getParameter("crm_sbkhlx_sbkhlx");
	if (crm_sbkhlx_sbkhlx!=null)
	{
		crm_sbkhlx_sbkhlx=cf.GB2Uni(crm_sbkhlx_sbkhlx);
		if (!(crm_sbkhlx_sbkhlx.equals("")))	wheresql+=" and  (crm_sbkhlx.sbkhlx='"+crm_sbkhlx_sbkhlx+"')";
	}
	ls_sql="SELECT crm_sbkhlx.xh,crm_sbkhlx.sbkhlx,sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,crm_sbkhlx  ";
    ls_sql+=" where crm_sbkhlx.ssfgs=sq_dwxx.dwbh(+)";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_sbkhlx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_sbkhlx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by crm_sbkhlx.ssfgs,crm_sbkhlx.sbkhlx";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_sbkhlxCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","sq_dwxx_dwmc","crm_sbkhlx_sbkhlx"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">���</td>
	<td  width="63%">ʧ�ܿͻ�����</td>
	<td  width="25%">�ֹ�˾</td>
</tr>
<%
	pageObj.displayDate();
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