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
	String bj_tcwzck_dqbm=null;
	String bj_tcwzck_cpbm=null;
	String bj_tcwzck_cldlbm=null;
	String bj_tcwzck_clxlbm=null;
	String bj_tcwzck_cpmc=null;
	String ppmc=null;
	String bj_tcwzck_xh=null;
	String bj_tcwzck_xh2=null;
	String bj_tcwzck_gg=null;
	String bj_tcwzck_jldw=null;
	String bj_tcwzck_lrr=null;
	String bj_tcwzck_lrsj=null;

	String jsfs=null;
	jsfs=request.getParameter("jsfs");
	if (jsfs!=null)
	{
		jsfs=cf.GB2Uni(jsfs);
		if (!(jsfs.equals("")))	wheresql+=" and  (bj_tcwzck.jsfs='"+jsfs+"')";
	}

	String jjfs=null;
	jjfs=request.getParameter("jjfs");
	if (jjfs!=null)
	{
		jjfs=cf.GB2Uni(jjfs);
		if (!(jjfs.equals("")))	wheresql+=" and  (bj_tcwzck.jjfs='"+jjfs+"')";
	}

	String sfkgdj=null;
	sfkgdj=request.getParameter("sfkgdj");
	if (sfkgdj!=null)
	{
		sfkgdj=cf.GB2Uni(sfkgdj);
		if (!(sfkgdj.equals("")))	wheresql+=" and  (bj_tcwzck.sfkgdj='"+sfkgdj+"')";
	}

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
	
	
	bj_tcwzck_dqbm=request.getParameter("bj_tcwzck_dqbm");
	if (bj_tcwzck_dqbm!=null)
	{
		bj_tcwzck_dqbm=cf.GB2Uni(bj_tcwzck_dqbm);
		if (!(bj_tcwzck_dqbm.equals("")))	wheresql+=" and  (bj_tcwzck.dqbm='"+bj_tcwzck_dqbm+"')";
	}
	bj_tcwzck_cpbm=request.getParameter("bj_tcwzck_cpbm");
	if (bj_tcwzck_cpbm!=null)
	{
		bj_tcwzck_cpbm=cf.GB2Uni(bj_tcwzck_cpbm);
		if (!(bj_tcwzck_cpbm.equals("")))	wheresql+=" and  (bj_tcwzck.cpbm='"+bj_tcwzck_cpbm+"')";
	}
	bj_tcwzck_cldlbm=request.getParameter("bj_tcwzck_cldlbm");
	if (bj_tcwzck_cldlbm!=null)
	{
		bj_tcwzck_cldlbm=cf.GB2Uni(bj_tcwzck_cldlbm);
		if (!(bj_tcwzck_cldlbm.equals("")))	wheresql+=" and  (bj_tcwzck.tccpdlbm='"+bj_tcwzck_cldlbm+"')";
	}
	bj_tcwzck_clxlbm=request.getParameter("bj_tcwzck_clxlbm");
	if (bj_tcwzck_clxlbm!=null)
	{
		bj_tcwzck_clxlbm=cf.GB2Uni(bj_tcwzck_clxlbm);
		if (!(bj_tcwzck_clxlbm.equals("")))	wheresql+=" and  (bj_tcwzck.tccplbbm='"+bj_tcwzck_clxlbm+"')";
	}
	bj_tcwzck_cpmc=request.getParameter("bj_tcwzck_cpmc");
	if (bj_tcwzck_cpmc!=null)
	{
		bj_tcwzck_cpmc=cf.GB2Uni(bj_tcwzck_cpmc);
		if (!(bj_tcwzck_cpmc.equals("")))	wheresql+=" and  (bj_tcwzck.cpmc like '%"+bj_tcwzck_cpmc+"%')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (bj_tcwzck.ppmc='"+ppmc+"')";
	}
	bj_tcwzck_xh=request.getParameter("bj_tcwzck_xh");
	if (bj_tcwzck_xh!=null)
	{
		bj_tcwzck_xh=cf.GB2Uni(bj_tcwzck_xh);
		if (!(bj_tcwzck_xh.equals("")))	wheresql+=" and  (bj_tcwzck.xh='"+bj_tcwzck_xh+"')";
	}
	
	bj_tcwzck_xh2=request.getParameter("bj_tcwzck_xh2");
	if (bj_tcwzck_xh2!=null)
	{
		bj_tcwzck_xh2=cf.GB2Uni(bj_tcwzck_xh2);
		if (!(bj_tcwzck_xh2.equals("")))	wheresql+=" and  (bj_tcwzck.xh like '%"+bj_tcwzck_xh2+"%')";
	}
	bj_tcwzck_gg=request.getParameter("bj_tcwzck_gg");
	if (bj_tcwzck_gg!=null)
	{
		bj_tcwzck_gg=cf.GB2Uni(bj_tcwzck_gg);
		if (!(bj_tcwzck_gg.equals("")))	wheresql+=" and  (bj_tcwzck.gg='"+bj_tcwzck_gg+"')";
	}
	bj_tcwzck_jldw=request.getParameter("bj_tcwzck_jldw");
	if (bj_tcwzck_jldw!=null)
	{
		bj_tcwzck_jldw=cf.GB2Uni(bj_tcwzck_jldw);
		if (!(bj_tcwzck_jldw.equals("")))	wheresql+=" and  (bj_tcwzck.jldw='"+bj_tcwzck_jldw+"')";
	}
	bj_tcwzck_lrr=request.getParameter("bj_tcwzck_lrr");
	if (bj_tcwzck_lrr!=null)
	{
		bj_tcwzck_lrr=cf.GB2Uni(bj_tcwzck_lrr);
		if (!(bj_tcwzck_lrr.equals("")))	wheresql+=" and  (bj_tcwzck.lrr='"+bj_tcwzck_lrr+"')";
	}

	bj_tcwzck_lrsj=request.getParameter("bj_tcwzck_lrsj");
	if (bj_tcwzck_lrsj!=null)
	{
		bj_tcwzck_lrsj=bj_tcwzck_lrsj.trim();
		if (!(bj_tcwzck_lrsj.equals("")))	wheresql+="  and (bj_tcwzck.lrsj>=TO_DATE('"+bj_tcwzck_lrsj+"','YYYY/MM/DD'))";
	}
	bj_tcwzck_lrsj=request.getParameter("bj_tcwzck_lrsj2");
	if (bj_tcwzck_lrsj!=null)
	{
		bj_tcwzck_lrsj=bj_tcwzck_lrsj.trim();
		if (!(bj_tcwzck_lrsj.equals("")))	wheresql+="  and (bj_tcwzck.lrsj<=TO_DATE('"+bj_tcwzck_lrsj+"','YYYY/MM/DD'))";
	}

	String sfyx=null;
	sfyx=request.getParameter("sfyx");
	if (sfyx!=null)
	{
		sfyx=cf.GB2Uni(sfyx);
		if (!(sfyx.equals("")))	wheresql+=" and  (bj_tcwzck.sfyx='"+sfyx+"')";
	}
	String yxkssj=null;
	yxkssj=request.getParameter("yxkssj");
	if (yxkssj!=null)
	{
		yxkssj=yxkssj.trim();
		if (!(yxkssj.equals("")))	wheresql+="  and (bj_tcwzck.yxkssj>=TO_DATE('"+yxkssj+"','YYYY/MM/DD'))";
	}
	yxkssj=request.getParameter("yxkssj2");
	if (yxkssj!=null)
	{
		yxkssj=yxkssj.trim();
		if (!(yxkssj.equals("")))	wheresql+="  and (bj_tcwzck.yxkssj<=TO_DATE('"+yxkssj+"','YYYY/MM/DD'))";
	}
	String yxjzsj=null;
	yxjzsj=request.getParameter("yxjzsj");
	if (yxjzsj!=null)
	{
		yxjzsj=yxjzsj.trim();
		if (!(yxjzsj.equals("")))	wheresql+="  and (bj_tcwzck.yxjzsj>=TO_DATE('"+yxjzsj+"','YYYY/MM/DD'))";
	}
	yxjzsj=request.getParameter("yxjzsj2");
	if (yxjzsj!=null)
	{
		yxjzsj=yxjzsj.trim();
		if (!(yxjzsj.equals("")))	wheresql+="  and (bj_tcwzck.yxjzsj<=TO_DATE('"+yxjzsj+"','YYYY/MM/DD'))";
	}


	String sfycx=null;
	sfycx=request.getParameter("sfycx");
	if (sfycx!=null)
	{
		sfycx=cf.GB2Uni(sfycx);
		if (!(sfycx.equals("")))	wheresql+=" and  (bj_tcwzck.sfycx='"+sfycx+"')";
	}
	String cxkssj=null;
	cxkssj=request.getParameter("cxkssj");
	if (cxkssj!=null)
	{
		cxkssj=cxkssj.trim();
		if (!(cxkssj.equals("")))	wheresql+="  and (bj_tcwzck.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	cxkssj=request.getParameter("cxkssj2");
	if (cxkssj!=null)
	{
		cxkssj=cxkssj.trim();
		if (!(cxkssj.equals("")))	wheresql+="  and (bj_tcwzck.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	String cxjssj=null;
	cxjssj=request.getParameter("cxjssj");
	if (cxjssj!=null)
	{
		cxjssj=cxjssj.trim();
		if (!(cxjssj.equals("")))	wheresql+="  and (bj_tcwzck.cxjssj>=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}
	cxjssj=request.getParameter("cxjssj2");
	if (cxjssj!=null)
	{
		cxjssj=cxjssj.trim();
		if (!(cxjssj.equals("")))	wheresql+="  and (bj_tcwzck.cxjssj<=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}


	ls_sql="SELECT bj_tcwzck.dqbm,dm_dqbm.dqmc,bj_tcwzck.cpbm,jxc_cldlbm.cldlmc,clxlmc,bj_tcwzck.cpmc,bj_tcwzck.ppmc,bj_tcwzck.xh,bj_tcwzck.gg,bj_tcwzck.jldw,bj_tcwzck.xdjldw,bj_tcwzck.xdb,bj_tcwzck.dj,DECODE(bj_tcwzck.sfkgdj,'Y','�ɸ�','N','��') sfkgdj,DECODE(bj_tcwzck.jsfs,'1','�����','2','�������') jsfs,bj_tcwzck.jsj,bj_tcwzck.jsbl||'%' jsbl,bj_tcwzck.sh||'%' sh,DECODE(bj_tcwzck.sfycx,'Y','�д���','N','�޴���') sfycx,bj_tcwzck.cxj,bj_tcwzck.cxkssj,bj_tcwzck.cxjssj,bj_tcwzck.cxjsj,bj_tcwzck.cxjsbl||'%' cxjsbl, DECODE(bj_tcwzck.sfxclxs,'1','����ȡ��','2','����ȡ��','3','4��5��','4','������') sfxclxs ,bj_tcwzck.gysmc,DECODE(bj_tcwzck.sfyx,'1','��Զ��Ч','2','��Ч','3','�׶���Ч') sfyx,bj_tcwzck.yxkssj,bj_tcwzck.yxjzsj,DECODE(bj_tcwzck.jjfs,'1','��������������ۣ�','2','���������������Ƽۣ�','3','�ײ�ѡ��') jjfs,bj_tcwzck.lrr,bj_tcwzck.lrsj,bj_tcwzck.bz  ";
	ls_sql+=" FROM bj_tcwzck,dm_dqbm,jxc_cldlbm,jxc_clxlbm  ";
    ls_sql+=" where bj_tcwzck.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcwzck.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_tcwzck.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcwzck.dqbm,bj_tcwzck.tccpdlbm,bj_tcwzck.tccplbbm,bj_tcwzck.cpbm";
    pageObj.sql=ls_sql;

//���ж����ʼ��
	pageObj.initPage("Bj_tcwzckList.jsp","","","EditBj_tcwzck.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"dqmc","cpbm","cpmc","ppmc","xh","gg","jldw","xdjldw","xdb","sh","sfxclxs","dj","sfkgdj","jsfs","jsj","jsbl","sfycx","cxj","cxkssj","cxjssj","cxjsj","cxjsbl","cldlmc","clxlmc","gysmc","sfyx","yxkssj","yxjzsj","jjfs","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ","�����޸ġ���Ч��־��","�����޸ġ�������"};//��ť����ʾ����
	String[] buttonLink={"Bj_tcwzckList.jsp?","PlUpdateYxbz.jsp","PlUpdateCx.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0,1,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
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
		sql[0]="delete from bj_tcwzck where "+chooseitem;
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
  <B><font size="3">�ײ������Ŀ⣭ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(360);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">����</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="4%">Ʒ��</td>
	<td  width="5%">�ͺ�</td>
	<td  width="5%">���</td>
	<td  width="2%">���ۼ�����λ</td>
	<td  width="2%">�µ�������λ</td>
	<td  width="2%">�µ���</td>
	<td  width="2%">���</td>
	<td  width="2%">�Ƿ��账��С��</td>
	<td  width="2%">����</td>
	<td  width="2%">�Ƿ�ɸĵ���</td>
	<td  width="2%">���㷽ʽ</td>
	<td  width="2%">�����</td>
	<td  width="2%">�������</td>
	<td  width="2%">�Ƿ��д���</td>
	<td  width="2%">������</td>
	<td  width="3%">������ʼʱ��</td>
	<td  width="3%">��������ʱ��</td>
	<td  width="2%">���������</td>
	<td  width="2%">�����������</td>
	<td  width="4%">��Ʒ����</td>
	<td  width="4%">��Ʒ���</td>
	<td  width="7%">��Ӧ��</td>
	<td  width="2%">�Ƿ���Ч</td>
	<td  width="3%">��Ч��ʼʱ��</td>
	<td  width="3%">��Ч����ʱ��</td>
	<td  width="3%">�Ƽ۷�ʽ</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="8%">��ע</td>
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