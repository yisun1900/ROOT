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
	String dm_sgdjscsb_fgsbh=null;
	String dm_sgdjscsb_bfcs=null;
	String dm_sgdjscsb_bfjs=null;
	String dm_sgdjscsb_bfbl=null;
	String dm_sgdjscsb_sdlbfbl=null;
	String dm_sgdjscsb_kzbjjs=null;
	String dm_sgdjscsb_sfwgjs=null;
	String dm_sgdjscsb_sdljsfs=null;
	String dm_sgdjscsb_sfkclk=null;
	String dm_sgdjscsb_sfkgdyp=null;
	String dm_sgdjscsb_sfkyfgf=null;
	String dm_sgdjscsb_sfkzbj=null;
	dm_sgdjscsb_fgsbh=request.getParameter("dm_sgdjscsb_fgsbh");
	if (dm_sgdjscsb_fgsbh!=null)
	{
		dm_sgdjscsb_fgsbh=cf.GB2Uni(dm_sgdjscsb_fgsbh);
		if (!(dm_sgdjscsb_fgsbh.equals("")))	wheresql+=" and  (dm_sgdjscsb.fgsbh='"+dm_sgdjscsb_fgsbh+"')";
	}
	dm_sgdjscsb_bfcs=request.getParameter("dm_sgdjscsb_bfcs");
	if (dm_sgdjscsb_bfcs!=null)
	{
		dm_sgdjscsb_bfcs=dm_sgdjscsb_bfcs.trim();
		if (!(dm_sgdjscsb_bfcs.equals("")))	wheresql+=" and (dm_sgdjscsb.bfcs="+dm_sgdjscsb_bfcs+") ";
	}
	dm_sgdjscsb_bfjs=request.getParameter("dm_sgdjscsb_bfjs");
	if (dm_sgdjscsb_bfjs!=null)
	{
		dm_sgdjscsb_bfjs=cf.GB2Uni(dm_sgdjscsb_bfjs);
		if (!(dm_sgdjscsb_bfjs.equals("")))	wheresql+=" and  (dm_sgdjscsb.bfjs='"+dm_sgdjscsb_bfjs+"')";
	}
	dm_sgdjscsb_bfbl=request.getParameter("dm_sgdjscsb_bfbl");
	if (dm_sgdjscsb_bfbl!=null)
	{
		dm_sgdjscsb_bfbl=dm_sgdjscsb_bfbl.trim();
		if (!(dm_sgdjscsb_bfbl.equals("")))	wheresql+=" and  (dm_sgdjscsb.bfbl="+dm_sgdjscsb_bfbl+") ";
	}
	dm_sgdjscsb_sdlbfbl=request.getParameter("dm_sgdjscsb_sdlbfbl");
	if (dm_sgdjscsb_sdlbfbl!=null)
	{
		dm_sgdjscsb_sdlbfbl=dm_sgdjscsb_sdlbfbl.trim();
		if (!(dm_sgdjscsb_sdlbfbl.equals("")))	wheresql+=" and  (dm_sgdjscsb.sdlbfbl="+dm_sgdjscsb_sdlbfbl+") ";
	}
	dm_sgdjscsb_kzbjjs=request.getParameter("dm_sgdjscsb_kzbjjs");
	if (dm_sgdjscsb_kzbjjs!=null)
	{
		dm_sgdjscsb_kzbjjs=cf.GB2Uni(dm_sgdjscsb_kzbjjs);
		if (!(dm_sgdjscsb_kzbjjs.equals("")))	wheresql+=" and  (dm_sgdjscsb.kzbjjs='"+dm_sgdjscsb_kzbjjs+"')";
	}
	dm_sgdjscsb_sfwgjs=request.getParameter("dm_sgdjscsb_sfwgjs");
	if (dm_sgdjscsb_sfwgjs!=null)
	{
		dm_sgdjscsb_sfwgjs=cf.GB2Uni(dm_sgdjscsb_sfwgjs);
		if (!(dm_sgdjscsb_sfwgjs.equals("")))	wheresql+=" and  (dm_sgdjscsb.sfwgjs='"+dm_sgdjscsb_sfwgjs+"')";
	}
	dm_sgdjscsb_sdljsfs=request.getParameter("dm_sgdjscsb_sdljsfs");
	if (dm_sgdjscsb_sdljsfs!=null)
	{
		dm_sgdjscsb_sdljsfs=cf.GB2Uni(dm_sgdjscsb_sdljsfs);
		if (!(dm_sgdjscsb_sdljsfs.equals("")))	wheresql+=" and  (dm_sgdjscsb.sdljsfs='"+dm_sgdjscsb_sdljsfs+"')";
	}
	dm_sgdjscsb_sfkclk=request.getParameter("dm_sgdjscsb_sfkclk");
	if (dm_sgdjscsb_sfkclk!=null)
	{
		dm_sgdjscsb_sfkclk=cf.GB2Uni(dm_sgdjscsb_sfkclk);
		if (!(dm_sgdjscsb_sfkclk.equals("")))	wheresql+=" and  (dm_sgdjscsb.sfkclk='"+dm_sgdjscsb_sfkclk+"')";
	}
	dm_sgdjscsb_sfkgdyp=request.getParameter("dm_sgdjscsb_sfkgdyp");
	if (dm_sgdjscsb_sfkgdyp!=null)
	{
		dm_sgdjscsb_sfkgdyp=cf.GB2Uni(dm_sgdjscsb_sfkgdyp);
		if (!(dm_sgdjscsb_sfkgdyp.equals("")))	wheresql+=" and  (dm_sgdjscsb.sfkgdyp='"+dm_sgdjscsb_sfkgdyp+"')";
	}
	dm_sgdjscsb_sfkyfgf=request.getParameter("dm_sgdjscsb_sfkyfgf");
	if (dm_sgdjscsb_sfkyfgf!=null)
	{
		dm_sgdjscsb_sfkyfgf=cf.GB2Uni(dm_sgdjscsb_sfkyfgf);
		if (!(dm_sgdjscsb_sfkyfgf.equals("")))	wheresql+=" and  (dm_sgdjscsb.sfkyfgf='"+dm_sgdjscsb_sfkyfgf+"')";
	}
	dm_sgdjscsb_sfkzbj=request.getParameter("dm_sgdjscsb_sfkzbj");
	if (dm_sgdjscsb_sfkzbj!=null)
	{
		dm_sgdjscsb_sfkzbj=cf.GB2Uni(dm_sgdjscsb_sfkzbj);
		if (!(dm_sgdjscsb_sfkzbj.equals("")))	wheresql+=" and  (dm_sgdjscsb.sfkzbj='"+dm_sgdjscsb_sfkzbj+"')";
	}
	ls_sql="SELECT dm_sgdjscsb.fgsbh,sq_dwxx.dwmc,dm_sgdjscsb.bfcs, DECODE(dm_sgdjscsb.bfcs,'1','��һ��','2','�ڶ���','3','������','4','���Ĵ�','5','�����','6','������','7','���ߴ�','8','�ڰ˴�','9','�ھŴ�','10','��ʮ��') bfcsmc, DECODE(dm_sgdjscsb.bfjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','����ʩ���ɱ���','A','����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�') bfjs,dm_sgdjscsb.bfbl||'%' bfbl,dm_sgdjscsb.sdlbfbl||'%' sdlbfbl, DECODE(dm_sgdjscsb.kzbjjs,'1','�������','2','�����ܶ�') kzbjjs, DECODE(dm_sgdjscsb.sfwgjs,'Y','��','N','��') sfwgjs, DECODE(dm_sgdjscsb.sdljsfs,'1','ͳһ��������','2','������������','3','�ֹ�¼�������','9','������') sdljsfs, DECODE(dm_sgdjscsb.sfkclk,'Y','��','N','��') sfkclk, DECODE(dm_sgdjscsb.sfkgdyp,'Y','��','N','��') sfkgdyp, DECODE(dm_sgdjscsb.sfkyfgf,'Y','��','N','��') sfkyfgf, DECODE(dm_sgdjscsb.sfkzbj,'Y','���ʱ���������ɸ�','M','���ʱ�������ɸ�','N','�����ʱ���') sfkzbj, DECODE(dm_sgdjscsb.sfhzjx,'Y','��','N','��') sfhzjx, DECODE(dm_sgdjscsb.sgdjbxg,'Y','��','N','��') sgdjbxg,dm_sgdjscsb.kzbjbl||'%' kzbjbl";
	ls_sql+=" FROM dm_sgdjscsb,sq_dwxx  ";
    ls_sql+=" where dm_sgdjscsb.fgsbh=sq_dwxx.dwbh(+)";
 	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and dm_sgdjscsb.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and dm_sgdjscsb.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by dm_sgdjscsb.fgsbh,dm_sgdjscsb.bfcs";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_sgdjscsbCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"dwmc","bfcsmc","bfjs","bfbl","sgdjbxg","sdljsfs","sdlbfbl","sfkclk","sfkgdyp","sfkyfgf","sfkzbj","kzbjjs","kzbjbl","sfhzjx","sfwgjs"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"fgsbh","bfcs"};
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">�ֹ�˾</td>
	<td  width="6%">��������</td>
	<td  width="14%">��������</td>
	<td  width="5%">��������</td>
	<td  width="6%">�Ƿ���ʩ���Ӽ������</td>
	<td  width="11%">ˮ��·���㷽ʽ</td>
	<td  width="5%">ˮ��·��������</td>
	<td  width="5%">�Ƿ�۲��Ͽ�</td>
	<td  width="5%">�Ƿ�۹�����Ʒ</td>
	<td  width="5%">�Ƿ���Ѹ�����</td>
	<td  width="9%">�Ƿ���ʱ���</td>
	<td  width="7%">���ʱ������</td>
	<td  width="5%">���ʱ������</td>
	<td  width="4%">�Ƿ�������</td>
	<td  width="4%">�Ƿ��깤����</td>
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