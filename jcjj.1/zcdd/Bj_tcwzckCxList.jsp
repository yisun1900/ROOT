<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_tczcbj_dqbm=null;
	String bj_tczcbj_bjjbbm=null;
	String bj_tczcbj_cpbm=null;
	String bj_tczcbj_sku=null;
	String bj_tczcjxc_cldlbm=null;
	String bj_tczcjxc_clxlbm=null;
	String bj_tczcbj_cpmc=null;
	String ppmc=null;
	String bj_tczcbj_xh=null;
	String bj_tczcbj_gg=null;
	String bj_tczcbj_jldw=null;
	String bj_tczcbj_sfcscp=null;
	String bj_tczcbj_xuhao=null;
	String bj_tczcbj_lrr=null;
	String bj_tczcbj_lrsj=null;

	String khbh=cf.GB2Uni(request.getParameter("khbh"));


	String sfxclxs=null;
	sfxclxs=request.getParameter("sfxclxs");
	if (sfxclxs!=null)
	{
		sfxclxs=cf.GB2Uni(sfxclxs);
		if (!(sfxclxs.equals("")))	wheresql+=" and  (bj_tcwzck.sfxclxs='"+sfxclxs+"')";
	}

	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (bj_tcwzck.gysmc='"+gysmc+"')";
	}

	bj_tczcbj_dqbm=request.getParameter("bj_tczcbj_dqbm");
	if (bj_tczcbj_dqbm!=null)
	{
		bj_tczcbj_dqbm=cf.GB2Uni(bj_tczcbj_dqbm);
		if (!(bj_tczcbj_dqbm.equals("")))	wheresql+=" and  (bj_tcwzck.dqbm='"+bj_tczcbj_dqbm+"')";
	}
	bj_tczcbj_cpbm=request.getParameter("bj_tczcbj_cpbm");
	if (bj_tczcbj_cpbm!=null)
	{
		bj_tczcbj_cpbm=cf.GB2Uni(bj_tczcbj_cpbm);
		if (!(bj_tczcbj_cpbm.equals("")))	wheresql+=" and  (bj_tcwzck.cpbm='"+bj_tczcbj_cpbm+"')";
	}
	bj_tczcbj_sku=request.getParameter("bj_tczcbj_sku");
	if (bj_tczcbj_sku!=null)
	{
		bj_tczcbj_sku=cf.GB2Uni(bj_tczcbj_sku);
		if (!(bj_tczcbj_sku.equals("")))	wheresql+=" and  (bj_tcwzck.sku='"+bj_tczcbj_sku+"')";
	}
	bj_tczcjxc_cldlbm=request.getParameter("bj_tczcjxc_cldlbm");
	if (bj_tczcjxc_cldlbm!=null)
	{
		bj_tczcjxc_cldlbm=cf.GB2Uni(bj_tczcjxc_cldlbm);
		if (!(bj_tczcjxc_cldlbm.equals("")))	wheresql+=" and  (jxc_cldlbm.cldlmc='"+bj_tczcjxc_cldlbm+"')";
	}
	bj_tczcjxc_clxlbm=request.getParameter("bj_tczcjxc_clxlbm");
	if (bj_tczcjxc_clxlbm!=null)
	{
		bj_tczcjxc_clxlbm=cf.GB2Uni(bj_tczcjxc_clxlbm);
		if (!(bj_tczcjxc_clxlbm.equals("")))	wheresql+=" and  (jxc_clxlbm.clxlmc='"+bj_tczcjxc_clxlbm+"')";
	}
	bj_tczcbj_cpmc=request.getParameter("bj_tczcbj_cpmc");
	if (bj_tczcbj_cpmc!=null)
	{
		bj_tczcbj_cpmc=cf.GB2Uni(bj_tczcbj_cpmc);
		if (!(bj_tczcbj_cpmc.equals("")))	wheresql+=" and  (bj_tcwzck.cpmc like '%"+bj_tczcbj_cpmc+"%')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (bj_tcwzck.ppmc='"+ppmc+"')";
	}
	bj_tczcbj_xh=request.getParameter("bj_tczcbj_xh");
	if (bj_tczcbj_xh!=null)
	{
		bj_tczcbj_xh=cf.GB2Uni(bj_tczcbj_xh);
		if (!(bj_tczcbj_xh.equals("")))	wheresql+=" and  (bj_tcwzck.xh like '%"+bj_tczcbj_xh+"%')";
	}
	bj_tczcbj_gg=request.getParameter("bj_tczcbj_gg");
	if (bj_tczcbj_gg!=null)
	{
		bj_tczcbj_gg=cf.GB2Uni(bj_tczcbj_gg);
		if (!(bj_tczcbj_gg.equals("")))	wheresql+=" and  (bj_tcwzck.gg like '%"+bj_tczcbj_gg+"%')";
	}
	bj_tczcbj_jldw=request.getParameter("bj_tczcbj_jldw");
	if (bj_tczcbj_jldw!=null)
	{
		bj_tczcbj_jldw=cf.GB2Uni(bj_tczcbj_jldw);
		if (!(bj_tczcbj_jldw.equals("")))	wheresql+=" and  (bj_tcwzck.jldw='"+bj_tczcbj_jldw+"')";
	}
	bj_tczcbj_sfcscp=request.getParameter("bj_tczcbj_sfcscp");
	if (bj_tczcbj_sfcscp!=null)
	{
		bj_tczcbj_sfcscp=cf.GB2Uni(bj_tczcbj_sfcscp);
		if (!(bj_tczcbj_sfcscp.equals("")))	wheresql+=" and  (bj_tcwzck.sfcscp='"+bj_tczcbj_sfcscp+"')";
	}
	bj_tczcbj_xuhao=request.getParameter("bj_tczcbj_xuhao");
	if (bj_tczcbj_xuhao!=null)
	{
		bj_tczcbj_xuhao=bj_tczcbj_xuhao.trim();
		if (!(bj_tczcbj_xuhao.equals("")))	wheresql+=" and (bj_tcwzck.xuhao="+bj_tczcbj_xuhao+") ";
	}
	bj_tczcbj_lrr=request.getParameter("bj_tczcbj_lrr");
	if (bj_tczcbj_lrr!=null)
	{
		bj_tczcbj_lrr=cf.GB2Uni(bj_tczcbj_lrr);
		if (!(bj_tczcbj_lrr.equals("")))	wheresql+=" and  (bj_tcwzck.lrr='"+bj_tczcbj_lrr+"')";
	}
	bj_tczcbj_lrsj=request.getParameter("bj_tczcbj_lrsj");
	if (bj_tczcbj_lrsj!=null)
	{
		bj_tczcbj_lrsj=bj_tczcbj_lrsj.trim();
		if (!(bj_tczcbj_lrsj.equals("")))	wheresql+="  and (bj_tcwzck.lrsj>=TO_DATE('"+bj_tczcbj_lrsj+"','YYYY/MM/DD'))";
	}
	bj_tczcbj_lrsj=request.getParameter("bj_tczcbj_lrsj2");
	if (bj_tczcbj_lrsj!=null)
	{
		bj_tczcbj_lrsj=bj_tczcbj_lrsj.trim();
		if (!(bj_tczcbj_lrsj.equals("")))	wheresql+="  and (bj_tcwzck.lrsj<=TO_DATE('"+bj_tczcbj_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT bj_tcwzck.dqbm,dm_dqbm.dqmc,bj_tcwzck.cpbm,jxc_cldlbm.cldlmc,clxlmc,bj_tcwzck.cpmc,bj_tcwzck.ppmc,bj_tcwzck.xh,bj_tcwzck.gg,bj_tcwzck.jldw,bj_tcwzck.xdjldw,bj_tcwzck.xdb,bj_tcwzck.dj,bj_tcwzck.jsj ,bj_tcwzck.sh||'%' sh, DECODE(bj_tcwzck.sfxclxs,'1','����ȡ��','2','����ȡ��','3','4��5��','4','������') sfxclxs,bj_tcwzck.gysmc,bj_tcwzck.lrr,bj_tcwzck.lrsj,bj_tcwzck.bz  ";
	ls_sql+=" FROM bj_tcwzck,dm_dqbm,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where bj_tcwzck.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcwzck.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_tcwzck.tccplbbm=jxc_clxlbm.clxlbm(+)";
	ls_sql+=" and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)))";
    ls_sql+=wheresql;


	ls_sql+=" order by bj_tcwzck.dqbm,bj_tcwzck.tccpdlbm,bj_tcwzck.tccplbbm,bj_tcwzck.cpbm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Bj_tcwzckCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"���������"};//��ť����ʾ����
	String[] buttonLink={"ChooseBj_tcwzck.jsp?ddbh="+ddbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ��
	String[] disColName={"cpbm","cpmc","xh","gg","jldw","xdjldw","xdb","sh","sfxclxs","dj","cldlmc","clxlmc","gysmc","lrr","lrsj","bz","dqmc","ppmc"};
	pageObj.setDisColName(disColName);


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
  <B><font size="3">�ײ����ı��ۣ���ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="4%">��Ʒ����</td>
	<td  width="6%">��Ʒ����</td>
	<td  width="5%">�ͺ�</td>
	<td  width="5%">���</td>
	<td  width="2%">���ۼ�����λ</td>
	<td  width="2%">�µ�������λ</td>
	<td  width="2%">�µ���</td>
	<td  width="2%">���</td>
	<td  width="3%">�Ƿ��账��С��</td>
	<td  width="3%">����</td>
	<td  width="4%">��Ʒ����</td>
	<td  width="4%">��Ʒ���</td>
	<td  width="8%">��Ӧ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="14%">��ע</td>
	<td  width="3%">����</td>
	<td  width="5%">Ʒ��</td>
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