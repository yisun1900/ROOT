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
	String bfjs=null;
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
	bfjs=request.getParameter("bfjs");
	if (bfjs!=null)
	{
		bfjs=cf.GB2Uni(bfjs);
		if (!(bfjs.equals("")))	wheresql+=" and  (dm_sgdjscsb.bfjs='"+bfjs+"')";
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
	ls_sql="SELECT dm_sgdjscsb.fgsbh,sq_dwxx.dwmc,dm_sgdjscsb.bfcs, DECODE(dm_sgdjscsb.bfcs,'1','��һ��','2','�ڶ���','3','������','4','���Ĵ�','5','�����','6','������','7','���ߴ�','8','�ڰ˴�','9','�깤����') bfcsmc,jsjsmc bfjs,dm_sgdjscsb.bfbl||'%' bfbl, DECODE(dm_sgdjscsb.sdljsfs,'1','����������','2','�����������ɸ�','3','���������ɸ�','4','�ֹ�¼�������') sdljsfs,DECODE(dm_sgdjscsb.sdlqz ,'1','��ǰ','2','�ۺ�','3','ʩ���ɱ���') sdlqz,dm_sgdjscsb.sdlbfbl||'%' sdlbfbl,DECODE(dm_sgdjscsb.zjxjffs,'1','������','2','�ۼ��ۺ���������','3','�ۼ�������ʩ���ɱ�','4','�ۺ������������','5','����ʩ���ɱ�����ʩ���ɱ�','6','����ʩ���ɱ��ۺ������','7','�ۺ����������ʩ���ɱ�') zjxjffs,dm_sgdjscsb.ljzjxxs,dm_sgdjscsb.zxxs,dm_sgdjscsb.jxxs,DECODE(dm_sgdjscsb.zjxbhfw,'1','����','2','������','3','���̣�������','4','����(��ˮ��)','5','���̣�������(��ˮ��)') zjxbhfw,DECODE(dm_sgdjscsb.zjxsjd,'1','ȫ��','2','����ǰ','3','������') zjxsjd,DECODE(dm_sgdjscsb.sfkyqpc,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfkyqpc,DECODE(dm_sgdjscsb.zcsfjs,'1','������','2','����������','3','�˹�¼��') zcsfjs,DECODE(dm_sgdjscsb.zcjehqfs,'1','�Զ���ȡ','2','�˹�¼��') zcjehqfs,DECODE(dm_sgdjscsb.zcjsblkg,'1','���޸�','2','�����޸�') zcjsblkg,dm_sgdjscsb.zcjsbl, DECODE(dm_sgdjscsb.sfkzbj,'Y','���ʱ���������ɸ�','M','���ʱ�������ɸ�','N','�����ʱ���') sfkzbj, DECODE(dm_sgdjscsb.kzbjjs,'1','�������','2','�����ܶ�') kzbjjs,dm_sgdjscsb.kzbjbl||'%' kzbjbl, DECODE(dm_sgdjscsb.sfwgjs,'Y','��','N','��') sfwgjs, DECODE(dm_sgdjscsb.sfkclk,'Y','��','N','��') sfkclk, DECODE(dm_sgdjscsb.sfkgdyp,'Y','��','N','��') sfkgdyp, DECODE(dm_sgdjscsb.sfkyfgf,'Y','��','N','��') sfkyfgf, DECODE(dm_sgdjscsb.sgdjbxg,'Y','��','N','��') sgdjbxg         ,DECODE(dm_sgdjscsb.sfkclfk,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfkclfk,DECODE(dm_sgdjscsb.sfkclyf,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfkclyf,DECODE(dm_sgdjscsb.sfkzckk,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfkzckk,DECODE(dm_sgdjscsb.sfjzcjl,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfjzcjl,DECODE(dm_sgdjscsb.sfkfkje,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfkfkje,DECODE(dm_sgdjscsb.sfjjlje,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfjjlje,DECODE(dm_sgdjscsb.sfjqtje,'Y','�Զ���ȡ','S','�˹�¼��','N','��') sfjqtje,dm_sgdjscsb.lkhjbfb||'%' lkhjbfb,dm_sgdjscsb.fkbl,DECODE(dm_sgdjscsb.sksh,'Y','�����','N','�������') sksh,dm_sgdjscsb.gcjdmc";
	ls_sql+=" FROM dm_sgdjscsb,sq_dwxx,dm_jsjsbm  ";
    ls_sql+=" where dm_sgdjscsb.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and dm_sgdjscsb.bfjs=dm_jsjsbm.jsjsbm(+)";
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
	String[] disColName={"dwmc","bfcsmc","bfjs","bfbl","sgdjbxg","sdljsfs","sdlqz","sdlbfbl","zjxjffs","ljzjxxs","zxxs","jxxs","zjxbhfw","zjxsjd","sfkyqpc","zcsfjs","zcjehqfs","zcjsblkg","zcjsbl","sfkzbj","kzbjjs","kzbjbl","sfkclk","sfkgdyp","sfkyfgf","sfkclfk","sfkclyf","sfkzckk","sfjzcjl","sfkfkje","sfjjlje","sfjqtje","sfwgjs","lkhjbfb","fkbl","sksh","gcjdmc"};
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
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�ֹ�˾</td>
	<td  width="2%">��������</td>
	<td  width="6%">��������</td>
	<td  width="2%">��������</td>
	<td  width="2%">��ʩ���Ӽ������</td>
	<td  width="3%">ˮ��·���㷽ʽ</td>
	<td  width="2%">ˮ��·ȡֵ</td>
	<td  width="2%">ˮ��·��������</td>

	<td  width="4%">���������ʽ</td>
	<td  width="2%">�ۼ�������ϵ��</td>
	<td  width="2%">����ϵ��</td>
	<td  width="2%">����ϵ��</td>
	<td  width="4%">�����������Χ</td>
	<td  width="2%">������ʱ���</td>

	<td  width="3%">�Ƿ�����ڷ��⳥��</td>
	<td  width="2%">�����Ƿ����</td>
	<td  width="3%">���Ľ���ȡ��ʽ</td>
	<td  width="2%">��������ɸ�</td>
	<td  width="2%">���Ľ������</td>

	<td  width="5%">�Ƿ���ʱ���</td>
	<td  width="3%">���ʱ������</td>
	<td  width="2%">���ʱ������</td>

	<td  width="2%">�Ƿ�۲��Ͽ�</td>
	<td  width="2%">�Ƿ�۹�����Ʒ</td>
	<td  width="2%">�Ƿ���Ѹ�����</td>

	<td  width="3%">�Ƿ�۸��ķ���</td>
	<td  width="3%">�Ƿ�۲����˷�</td>
	<td  width="3%">�Ƿ�����Ŀۿ�</td>
	<td  width="3%">�Ƿ�����Ľ���</td>
	<td  width="3%">�Ƿ�۷�����</td>
	<td  width="3%">�Ƿ�ӽ������</td>
	<td  width="3%">�Ƿ���������</td>

	<td  width="2%">�Ƿ��깤����</td>
	<td  width="2%">������ϼưٷֱ�</td>
	<td  width="2%">Ҫ�󸶿����</td>
	<td  width="2%">�����Ƿ���������</td>
	<td  width="4%">Ҫ�󹤳̽���</td>
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