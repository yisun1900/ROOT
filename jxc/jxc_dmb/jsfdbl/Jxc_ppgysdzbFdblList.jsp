<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ppbm=null;
	String ppmc=null;
	String gysbm=null;
	String gysmc=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=ssfgs.trim();
		if (!(ssfgs.equals("")))	wheresql+=" and (jxc_ppgysdzb.ssfgs='"+ssfgs+"') ";
	}
	
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=ppbm.trim();
		if (!(ppbm.equals("")))	wheresql+=" and (jxc_ppgysdzb.ppbm="+ppbm+") ";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jxc_ppgysdzb.ppmc like '%"+ppmc+"%')";
	}
	gysbm=request.getParameter("gysbm");
	if (gysbm!=null)
	{
		gysbm=gysbm.trim();
		if (!(gysbm.equals("")))	wheresql+=" and (jxc_ppgysdzb.gysbm="+gysbm+") ";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (jxc_ppgysdzb.gysmc like '%"+gysmc+"%')";
	}


	ls_sql="SELECT  jxc_ppgysdzb.ppbm,jxc_ppgysdzb.ppmc,jxc_ppgysdzb.gysbm,jxc_ppgysdzb.gysmc,jxc_ppgysdzb.azfjsbl||'%' azfjsbl,jxc_ppgysdzb.ycfjsbl||'%' ycfjsbl,fdbl||'%' fdbl,cxfdbl||'%' cxfdbl,khfdbl||'%' khfdbl,khcxfdbl||'%' khcxfdbl,tcjrbl||'%' tcjrbl,tccxjrbl||'%' tccxjrbl,xpjsbl||'%' xpjsbl,xpcxjsbl||'%' xpcxjsbl,xpkhfdbl||'%' xpkhfdbl,xpkhcxfdbl||'%' xpkhcxfdbl,xptcjrbl||'%' xptcjrbl,xptccxjrbl||'%' xptccxjrbl,jxc_ppgysdzb.lrr,jxc_ppgysdzb.lrsj,jxc_ppgysdzb.ssfgs,dwmc ";
	ls_sql+=" FROM jxc_ppgysdzb,jxc_ppxx,jxc_gysxx,sq_dwxx  ";
    ls_sql+=" where jxc_ppgysdzb.ppbm=jxc_ppxx.ppbm(+) ";
    ls_sql+=" and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm(+) ";
    ls_sql+=" and jxc_ppgysdzb.ssfgs=sq_dwxx.dwbh(+) ";
    ls_sql+=" and jxc_ppxx.pplb='1' ";
    ls_sql+=" and jxc_gysxx.cllx='1' ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and jxc_ppgysdzb.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_ppgysdzb.ssfgs in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
	ls_sql+=" order by jxc_ppgysdzb.ssfgs,jxc_ppgysdzb.ppmc,jxc_ppgysdzb.gysmc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_ppgysdzbFdblList.jsp","","","EditJxc_ppgysdzb.jsp");
	pageObj.setPageRow(26);//����ÿҳ��ʾ��¼��
 
 //������ʾ��
	String[] disColName={"ppbm","ppmc","gysbm","gysmc","azfjsbl","ycfjsbl","fdbl","cxfdbl","khfdbl","khcxfdbl","tcjrbl","tccxjrbl","xpjsbl","xpcxjsbl","xpkhfdbl","xpkhcxfdbl","xptcjrbl","xptccxjrbl","lrr","lrsj","dwmc"};
	pageObj.setDisColName(disColName);
 
//��������
	String[] keyName={"ppbm","gysbm","ssfgs"};
	pageObj.setKey(keyName);
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
  <B><font size="3">�������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">��Ʒ�Ʊ���</td>
	<td  width="6%">��Ʒ������</td>
	<td  width="3%">��Ӧ�̱���</td>
	<td  width="13%">��Ӧ������</td>
	<td  width="4%">��װ�ѽ������</td>
	<td  width="4%">Զ�̷ѽ������</td>
	<td  width="4%">�������������������</td>
	<td  width="4%">�������̴����������</td>
	<td  width="4%">�����ͻ������������</td>
	<td  width="4%">�����ͻ������������</td>
	<td  width="4%">������������������</td>
	<td  width="4%">������ɴ����������</td>
	<td  width="4%">ѡ�䳧�������������</td>
	<td  width="4%">ѡ�䳧�̴����������</td>
	<td  width="4%">ѡ��ͻ������������</td>
	<td  width="4%">ѡ��ͻ������������</td>
	<td  width="4%">ѡ����������������</td>
	<td  width="4%">ѡ����ɴ����������</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="12%">�����ֹ�˾</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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