<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String khzq=null;
	String ssfgs=null;
	String dwbh=null;
	String cw_jryjkh_yhmc=null;
	khzq=request.getParameter("khzq");
	if (khzq!=null)
	{
		khzq=cf.GB2Uni(khzq);
		if (!(khzq.equals("")))	wheresql+=" and  (cw_jryjkh.khzq='"+khzq+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (cw_jryjkh.fgsbh='"+ssfgs+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_jryjkh.dwbh='"+dwbh+"')";
	}
	cw_jryjkh_yhmc=request.getParameter("cw_jryjkh_yhmc");
	if (cw_jryjkh_yhmc!=null)
	{
		cw_jryjkh_yhmc=cf.GB2Uni(cw_jryjkh_yhmc);
		if (!(cw_jryjkh_yhmc.equals("")))	wheresql+=" and  (cw_jryjkh.yhmc='"+cw_jryjkh_yhmc+"')";
	}

	String sfkh=null;
	sfkh=request.getParameter("sfkh");
	if (sfkh!=null)
	{
		sfkh=cf.GB2Uni(sfkh);
		if (!(sfkh.equals("")))	wheresql+=" and  (cw_jryjkh.sfkh='"+sfkh+"')";
	}
	

	ls_sql="SELECT cw_jryjkh.khzq,cw_jryjkh.khqssj,cw_jryjkh.khjzsj,a.dwmc fgs,b.dwmc,DECODE(cw_jryjkh.sfkh,'N','δ����','Y','����'),cw_jryjkh.yhmc,zwmc,cw_jryjkh.byrw,cw_jryjkh.byqds,cw_jryjkh.byyj,cw_jryjkh.dzkhbl||'%',cw_jryjkh.khr,cw_jryjkh.khsj,cw_jryjkh.lrr,cw_jryjkh.lrsj,cw_jryjkh.bz  ";
	ls_sql+=" FROM cw_jryjkh,sq_dwxx a,sq_dwxx b,dm_zwbm  ";
    ls_sql+=" where cw_jryjkh.fgsbh=a.dwbh(+)";
    ls_sql+=" and cw_jryjkh.dwbh=b.dwbh(+)";
    ls_sql+=" and cw_jryjkh.zw=dm_zwbm.zwbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jryjkh.khzq,cw_jryjkh.fgsbh,cw_jryjkh.dwbh,cw_jryjkh.zw,cw_jryjkh.yhmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jryjkhCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khzq","cw_jryjkh_khqssj","cw_jryjkh_khjzsj","cw_jryjkh_fgsbh","dwbh","sq_dwxx_dwmc","yhmc","cw_jryjkh_zw","cw_jryjkh_byrw","cw_jryjkh_byqds","cw_jryjkh_byyj","cw_jryjkh_dzkhbl","cw_jryjkh_lrr","cw_jryjkh_lrsj","cw_jryjkh_bz"};
	pageObj.setDisColName(disColName);
*/


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
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">��������</td>
	<td  width="6%">������ʼʱ��</td>
	<td  width="6%">���˽���ʱ��</td>
	<td  width="8%">�ֹ�˾</td>
	<td  width="8%">��������</td>
	<td  width="4%">�Ƿ񿼺�</td>
	<td  width="4%">����</td>
	<td  width="6%">ְ��</td>
	<td  width="5%">��������</td>
	<td  width="5%">����ǩ����</td>
	<td  width="5%">����ҵ��</td>
	<td  width="4%">���˱���</td>
	<td  width="4%">������</td>
	<td  width="6%">����ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="15%">��ע</td>
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