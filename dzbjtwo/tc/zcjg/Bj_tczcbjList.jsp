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
	String bj_tczcbj_bjbbh=null;
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

	String tcsjflbm=null;
	tcsjflbm=request.getParameter("tcsjflbm");
	if (tcsjflbm!=null)
	{
		tcsjflbm=cf.GB2Uni(tcsjflbm);
		if (!(tcsjflbm.equals("")))	wheresql+=" and  (bj_tczcbj.tcsjflbm='"+tcsjflbm+"')";
	}

	String sfxclxs=null;
	sfxclxs=request.getParameter("sfxclxs");
	if (sfxclxs!=null)
	{
		sfxclxs=cf.GB2Uni(sfxclxs);
		if (!(sfxclxs.equals("")))	wheresql+=" and  (bj_tczcbj.sfxclxs='"+sfxclxs+"')";
	}

	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (bj_tczcbj.gysmc='"+gysmc+"')";
	}
	
	
	bj_tczcbj_bjbbh=request.getParameter("bj_tczcbj_bjbbh");
	if (bj_tczcbj_bjbbh!=null)
	{
		bj_tczcbj_bjbbh=cf.GB2Uni(bj_tczcbj_bjbbh);
		if (!(bj_tczcbj_bjbbh.equals("")))	wheresql+=" and  (bj_tczcbj.bjbbh='"+bj_tczcbj_bjbbh+"')";
	}
	bj_tczcbj_dqbm=request.getParameter("bj_tczcbj_dqbm");
	if (bj_tczcbj_dqbm!=null)
	{
		bj_tczcbj_dqbm=cf.GB2Uni(bj_tczcbj_dqbm);
		if (!(bj_tczcbj_dqbm.equals("")))	wheresql+=" and  (bj_tczcbj.dqbm='"+bj_tczcbj_dqbm+"')";
	}
	bj_tczcbj_bjjbbm=request.getParameter("bj_tczcbj_bjjbbm");
	if (bj_tczcbj_bjjbbm!=null)
	{
		bj_tczcbj_bjjbbm=cf.GB2Uni(bj_tczcbj_bjjbbm);
		if (!(bj_tczcbj_bjjbbm.equals("")))	wheresql+=" and  (bj_tczcbj.bjjbbm='"+bj_tczcbj_bjjbbm+"')";
	}
	bj_tczcbj_cpbm=request.getParameter("bj_tczcbj_cpbm");
	if (bj_tczcbj_cpbm!=null)
	{
		bj_tczcbj_cpbm=cf.GB2Uni(bj_tczcbj_cpbm);
		if (!(bj_tczcbj_cpbm.equals("")))	wheresql+=" and  (bj_tczcbj.cpbm='"+bj_tczcbj_cpbm+"')";
	}
	bj_tczcbj_sku=request.getParameter("bj_tczcbj_sku");
	if (bj_tczcbj_sku!=null)
	{
		bj_tczcbj_sku=cf.GB2Uni(bj_tczcbj_sku);
		if (!(bj_tczcbj_sku.equals("")))	wheresql+=" and  (bj_tczcbj.sku='"+bj_tczcbj_sku+"')";
	}
	bj_tczcjxc_cldlbm=request.getParameter("bj_tczcjxc_cldlbm");
	if (bj_tczcjxc_cldlbm!=null)
	{
		bj_tczcjxc_cldlbm=cf.GB2Uni(bj_tczcjxc_cldlbm);
		if (!(bj_tczcjxc_cldlbm.equals("")))	wheresql+=" and  (bj_tczcbj.tccpdlbm='"+bj_tczcjxc_cldlbm+"')";
	}
	bj_tczcjxc_clxlbm=request.getParameter("bj_tczcjxc_clxlbm");
	if (bj_tczcjxc_clxlbm!=null)
	{
		bj_tczcjxc_clxlbm=cf.GB2Uni(bj_tczcjxc_clxlbm);
		if (!(bj_tczcjxc_clxlbm.equals("")))	wheresql+=" and  (bj_tczcbj.tccplbbm='"+bj_tczcjxc_clxlbm+"')";
	}
	bj_tczcbj_cpmc=request.getParameter("bj_tczcbj_cpmc");
	if (bj_tczcbj_cpmc!=null)
	{
		bj_tczcbj_cpmc=cf.GB2Uni(bj_tczcbj_cpmc);
		if (!(bj_tczcbj_cpmc.equals("")))	wheresql+=" and  (bj_tczcbj.cpmc like '%"+bj_tczcbj_cpmc+"%')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (bj_tczcbj.ppmc='"+ppmc+"')";
	}
	bj_tczcbj_xh=request.getParameter("bj_tczcbj_xh");
	if (bj_tczcbj_xh!=null)
	{
		bj_tczcbj_xh=cf.GB2Uni(bj_tczcbj_xh);
		if (!(bj_tczcbj_xh.equals("")))	wheresql+=" and  (bj_tczcbj.xh='"+bj_tczcbj_xh+"')";
	}
	bj_tczcbj_gg=request.getParameter("bj_tczcbj_gg");
	if (bj_tczcbj_gg!=null)
	{
		bj_tczcbj_gg=cf.GB2Uni(bj_tczcbj_gg);
		if (!(bj_tczcbj_gg.equals("")))	wheresql+=" and  (bj_tczcbj.gg='"+bj_tczcbj_gg+"')";
	}
	bj_tczcbj_jldw=request.getParameter("bj_tczcbj_jldw");
	if (bj_tczcbj_jldw!=null)
	{
		bj_tczcbj_jldw=cf.GB2Uni(bj_tczcbj_jldw);
		if (!(bj_tczcbj_jldw.equals("")))	wheresql+=" and  (bj_tczcbj.jldw='"+bj_tczcbj_jldw+"')";
	}
	bj_tczcbj_sfcscp=request.getParameter("bj_tczcbj_sfcscp");
	if (bj_tczcbj_sfcscp!=null)
	{
		bj_tczcbj_sfcscp=cf.GB2Uni(bj_tczcbj_sfcscp);
		if (!(bj_tczcbj_sfcscp.equals("")))	wheresql+=" and  (bj_tczcbj.sfcscp='"+bj_tczcbj_sfcscp+"')";
	}
	bj_tczcbj_xuhao=request.getParameter("bj_tczcbj_xuhao");
	if (bj_tczcbj_xuhao!=null)
	{
		bj_tczcbj_xuhao=bj_tczcbj_xuhao.trim();
		if (!(bj_tczcbj_xuhao.equals("")))	wheresql+=" and (bj_tczcbj.xuhao="+bj_tczcbj_xuhao+") ";
	}
	bj_tczcbj_lrr=request.getParameter("bj_tczcbj_lrr");
	if (bj_tczcbj_lrr!=null)
	{
		bj_tczcbj_lrr=cf.GB2Uni(bj_tczcbj_lrr);
		if (!(bj_tczcbj_lrr.equals("")))	wheresql+=" and  (bj_tczcbj.lrr='"+bj_tczcbj_lrr+"')";
	}
	bj_tczcbj_lrsj=request.getParameter("bj_tczcbj_lrsj");
	if (bj_tczcbj_lrsj!=null)
	{
		bj_tczcbj_lrsj=bj_tczcbj_lrsj.trim();
		if (!(bj_tczcbj_lrsj.equals("")))	wheresql+="  and (bj_tczcbj.lrsj>=TO_DATE('"+bj_tczcbj_lrsj+"','YYYY/MM/DD'))";
	}
	bj_tczcbj_lrsj=request.getParameter("bj_tczcbj_lrsj2");
	if (bj_tczcbj_lrsj!=null)
	{
		bj_tczcbj_lrsj=bj_tczcbj_lrsj.trim();
		if (!(bj_tczcbj_lrsj.equals("")))	wheresql+="  and (bj_tczcbj.lrsj<=TO_DATE('"+bj_tczcbj_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT bj_tczcbj.bjbbh,bj_tczcbj.dqbm,dm_dqbm.dqmc,bj_tczcbj.bjjbbm,bjjbmc,bj_tczcbj.cpbm,bj_tczcbj.sku,jxc_cldlbm.cldlmc,clxlmc,tcsjflmc,bj_tczcbj.cpmc,bj_tczcbj.ppmc,bj_tczcbj.xh,bj_tczcbj.gg,bj_tczcbj.jldw,bj_tczcbj.xdjldw,bj_tczcbj.xdb,bj_tczcbj.dj,bj_tczcbj.jsj,bj_tczcbj.jjje,bj_tczcbj.sh||'%' sh, DECODE(bj_tczcbj.sfxclxs,'1','����ȡ��','2','����ȡ��','3','4��5��','4','������') sfxclxs, DECODE(bj_tczcbj.sfcscp,'Y','��','N','��') sfcscp,bj_tczcbj.xuhao,bj_tczcbj.gysmc,bj_tczcbj.lrr,bj_tczcbj.lrsj,bj_tczcbj.bz  ";
	ls_sql+=" FROM bj_tczcbj,dm_dqbm,jxc_cldlbm,jxc_clxlbm,bdm_bjjbbm,bj_tcsjflbm  ";
    ls_sql+=" where bj_tczcbj.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tczcbj.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_tczcbj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_tczcbj.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tczcbj.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tczcbj.dqbm,bj_tczcbj.bjbbh,bj_tczcbj.bjjbbm,bj_tczcbj.tccpdlbm,bj_tczcbj.tccplbbm,bj_tczcbj.cpbm";
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("Bj_tczcbjList.jsp","","","EditBj_tczcbj.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"bjbbh","dqmc","bjjbmc","cpbm","sfcscp","sku","cpmc","ppmc","xh","gg","jldw","xdjldw","xdb","sh","sfxclxs","dj","jsj","jjje","xuhao","cldlmc","clxlmc","tcsjflmc","gysmc","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Bj_tczcbjList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] cpbm = request.getParameterValues("cpbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpbm,"cpbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from bj_tczcbj where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ײ����ı��ۣ�ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">���۰汾��</td>
	<td  width="3%">����</td>
	<td  width="3%">���ۼ���</td>
	<td  width="4%">��Ʒ����</td>
	<td  width="2%">�Ƿ��в�Ʒ</td>
	<td  width="3%">SKU��</td>
	<td  width="6%">��Ʒ����</td>
	<td  width="5%">Ʒ��</td>
	<td  width="5%">�ͺ�</td>
	<td  width="5%">���</td>
	<td  width="2%">���ۼ�����λ</td>
	<td  width="2%">�µ�������λ</td>
	<td  width="2%">�µ���</td>
	<td  width="2%">���</td>
	<td  width="3%">�Ƿ��账��С��</td>
	<td  width="3%">����</td>
	<td  width="3%">�����</td>
	<td  width="3%">�Ӽ۽��</td>
	<td  width="2%">�������</td>
	<td  width="4%">��Ʒ����</td>
	<td  width="4%">��Ʒ���</td>
	<td  width="4%">�ײ���������</td>
	<td  width="8%">��Ӧ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="11%">��ע</td>
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