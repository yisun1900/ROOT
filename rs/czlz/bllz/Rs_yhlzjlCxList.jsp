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
	String xh=null;
	String ygbh=null;
	String yhmc=null;
	String bianhao=null;
	String sfzh=null;
	String xzzwbm=null;
	String lzrq=null;
	String lzyy=null;
	String dwbh=null;
	String ssfgs=null;
	String lrr=null;
	String lrsj=null;

	String lzlx=null;
	lzlx=request.getParameter("lzlx");
	if (lzlx!=null)
	{
		lzlx=cf.GB2Uni(lzlx);
		if (!(lzlx.equals("")))	wheresql+=" and  (rs_yhlzjl.lzlx='"+lzlx+"')";
	}

	String lzyyflbm=null;
	lzyyflbm=request.getParameter("lzyyflbm");
	if (lzyyflbm!=null)
	{
		lzyyflbm=cf.GB2Uni(lzyyflbm);
		if (!(lzyyflbm.equals("")))	wheresql+=" and  (rs_yhlzjl.lzyyflbm='"+lzyyflbm+"')";
	}
	String czsqxh=null;
	czsqxh=request.getParameter("czsqxh");
	if (czsqxh!=null)
	{
		czsqxh=cf.GB2Uni(czsqxh);
		if (!(czsqxh.equals("")))	wheresql+=" and  (rs_yhlzjl.czsqxh='"+czsqxh+"')";
	}

	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (rs_yhlzjl.xh="+xh+") ";
	}
	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		ygbh=ygbh.trim();
		if (!(ygbh.equals("")))	wheresql+=" and (rs_yhlzjl.ygbh="+ygbh+") ";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (rs_yhlzjl.yhmc like '%"+yhmc+"%')";
	}
	bianhao=request.getParameter("bianhao");
	if (bianhao!=null)
	{
		bianhao=cf.GB2Uni(bianhao);
		if (!(bianhao.equals("")))	wheresql+=" and  (rs_yhlzjl.bianhao='"+bianhao+"')";
	}
	sfzh=request.getParameter("sfzh");
	if (sfzh!=null)
	{
		sfzh=cf.GB2Uni(sfzh);
		if (!(sfzh.equals("")))	wheresql+=" and  (rs_yhlzjl.sfzh='"+sfzh+"')";
	}
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (rs_yhlzjl.xzzwbm='"+xzzwbm+"')";
	}
	lzrq=request.getParameter("lzrq");
	if (lzrq!=null)
	{
		lzrq=lzrq.trim();
		if (!(lzrq.equals("")))	wheresql+="  and (rs_yhlzjl.lzrq>=TO_DATE('"+lzrq+"','YYYY/MM/DD'))";
	}
	lzrq=request.getParameter("lzrq2");
	if (lzrq!=null)
	{
		lzrq=lzrq.trim();
		if (!(lzrq.equals("")))	wheresql+="  and (rs_yhlzjl.lzrq<=TO_DATE('"+lzrq+"','YYYY/MM/DD'))";
	}
	lzyy=request.getParameter("lzyy");
	if (lzyy!=null)
	{
		lzyy=cf.GB2Uni(lzyy);
		if (!(lzyy.equals("")))	wheresql+=" and  (rs_yhlzjl.lzyy like '%"+lzyy+"%')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (rs_yhlzjl.dwbh='"+dwbh+"')";
	}

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (rs_yhlzjl.ssfgs='"+ssfgs+"')";

	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (rs_yhlzjl.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_yhlzjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT DECODE(lzlx,'S','��ְ','T','����') lzlx,xh,rs_yhlzjl.czsqxh sqxh,ygbh,yhmc,bianhao,sfzh,xzzwbm,lzrq,lzyyflmc,lzyy,dwmc,rs_yhlzjl.lrr,rs_yhlzjl.lrsj  ";
	ls_sql+=" FROM rs_yhlzjl,sq_dwxx,dm_lzyyflbm  ";
    ls_sql+=" where rs_yhlzjl.dwbh=sq_dwxx.dwbh and rs_yhlzjl.lzyyflbm=dm_lzyyflbm.lzyyflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_yhlzjl.ssfgs,rs_yhlzjl.xh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_yhlzjlCxList.jsp","SelectCxRs_yhlzjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","ygbh","yhmc","bianhao","sfzh","xzzwbm","lzrq","lzyy","dwbh","ssfgs","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/rs/czlz/czsq/ViewRs_czsq.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sqxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yhmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
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
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">��ְ����</td>
	<td  width="4%">���</td>
	<td  width="6%">��ְ�������</td>
	<td  width="5%">Ա�����</td>
	<td  width="5%">Ա������</td>
	<td  width="5%">����</td>
	<td  width="8%">���֤��</td>
	<td  width="6%">����ְ��</td>
	<td  width="6%">��ְ����</td>
	<td  width="8%">��ְԭ�����</td>
	<td  width="21%">��ְԭ��</td>
	<td  width="9%">������λ</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
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