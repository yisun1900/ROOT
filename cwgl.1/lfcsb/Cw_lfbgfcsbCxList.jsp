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
	String cw_lfbgfcsb_fgsbh=null;
	String cw_lfbgfcsb_bfcs=null;
	String cw_lfbgfcsb_bfjs=null;
	String cw_lfbgfcsb_bfbl=null;
	String cw_lfbgfcsb_dzld=null;
	cw_lfbgfcsb_fgsbh=request.getParameter("cw_lfbgfcsb_fgsbh");
	if (cw_lfbgfcsb_fgsbh!=null)
	{
		cw_lfbgfcsb_fgsbh=cf.GB2Uni(cw_lfbgfcsb_fgsbh);
		if (!(cw_lfbgfcsb_fgsbh.equals("")))	wheresql+=" and  (cw_lfbgfcsb.fgsbh='"+cw_lfbgfcsb_fgsbh+"')";
	}
	cw_lfbgfcsb_bfcs=request.getParameter("cw_lfbgfcsb_bfcs");
	if (cw_lfbgfcsb_bfcs!=null)
	{
		cw_lfbgfcsb_bfcs=cw_lfbgfcsb_bfcs.trim();
		if (!(cw_lfbgfcsb_bfcs.equals("")))	wheresql+=" and (cw_lfbgfcsb.bfcs="+cw_lfbgfcsb_bfcs+") ";
	}
	cw_lfbgfcsb_bfjs=request.getParameter("cw_lfbgfcsb_bfjs");
	if (cw_lfbgfcsb_bfjs!=null)
	{
		cw_lfbgfcsb_bfjs=cf.GB2Uni(cw_lfbgfcsb_bfjs);
		if (!(cw_lfbgfcsb_bfjs.equals("")))	wheresql+=" and  (cw_lfbgfcsb.bfjs='"+cw_lfbgfcsb_bfjs+"')";
	}
	cw_lfbgfcsb_bfbl=request.getParameter("cw_lfbgfcsb_bfbl");
	if (cw_lfbgfcsb_bfbl!=null)
	{
		cw_lfbgfcsb_bfbl=cw_lfbgfcsb_bfbl.trim();
		if (!(cw_lfbgfcsb_bfbl.equals("")))	wheresql+=" and  (cw_lfbgfcsb.bfbl="+cw_lfbgfcsb_bfbl+") ";
	}
	cw_lfbgfcsb_dzld=request.getParameter("cw_lfbgfcsb_dzld");
	if (cw_lfbgfcsb_dzld!=null)
	{
		cw_lfbgfcsb_dzld=cw_lfbgfcsb_dzld.trim();
		if (!(cw_lfbgfcsb_dzld.equals("")))	wheresql+=" and  (cw_lfbgfcsb.dzld="+cw_lfbgfcsb_dzld+") ";
	}
	ls_sql="SELECT sq_dwxx.dwmc,gdjsjdmc, DECODE(cw_lfbgfcsb.bfjs,'1','��ǰ���̷�','2','�ۺ󹤳̷�','3','ʵ�տ�','9','�ɴ������Ⱦ�����ǰ�ۺ�'),cw_lfbgfcsb.bfbl||'%',cw_lfbgfcsb.dzld,DECODE(sfkclk,'Y','��','N','��') sfkclk,clkzdbl||'%' clkzdbl,DECODE(sfkybgf,'Y','��','N','��') sfkybgf  ";
	ls_sql+=" FROM sq_dwxx,cw_lfbgfcsb,dm_gdjsjd  ";
    ls_sql+=" where cw_lfbgfcsb.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_lfbgfcsb.bfcs=dm_gdjsjd.gdjsjd(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and cw_lfbgfcsb.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_lfbgfcsb.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_lfbgfcsb.fgsbh,cw_lfbgfcsb.bfcs";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_lfbgfcsbCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


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
  <B><font size="3">�����Ѳ�������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">�ֹ�˾</td>
	<td  width="11%">��������</td>
	<td  width="15%">��������</td>
	<td  width="10%">��������</td>
	<td  width="10%">��������</td>
	<td  width="10%">�Ƿ�۲��Ͽ�</td>
	<td  width="10%">���Ͽ���ͱ���</td>
	<td  width="10%">�Ƿ���Ѳ�����</td>
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