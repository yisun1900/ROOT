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
	String yy_scb_zqs=null;
	String yy_scb_yy_scb_ygmc=null;
	String yy_scb_ssbm=null;
	String yy_scb_ssfgs=null;
	String yy_scb_yy_scbkh_byjh=null;
	String yy_scb_yy_scbkh_bylj=null;
	String yy_scb_yy_scbkh_szjh=null;
	String yy_scb_yy_scbkh_szwc=null;
	String yy_scb_yy_scbkh_bzyj=null;
	String yy_scb_yy_scbdj_byjh=null;
	String yy_scb_yy_scbdj_bylj=null;
	String yy_scb_yy_scbdj_szjh=null;
	String yy_scb_yy_scbdj_szwc=null;
	String yy_scb_yy_scbdj_bzjh=null;
	String yy_scb_yy_scb_lrr=null;
	String yy_scb_yy_scb_lrsj=null;
	yy_scb_zqs=request.getParameter("yy_scb_zqs");
	if (yy_scb_zqs!=null)
	{
		yy_scb_zqs=yy_scb_zqs.trim();
		if (!(yy_scb_zqs.equals("")))	wheresql+=" and (yy_scb.zqs="+yy_scb_zqs+") ";
	}
	yy_scb_yy_scb_ygmc=request.getParameter("yy_scb_yy_scb_ygmc");
	if (yy_scb_yy_scb_ygmc!=null)
	{
		yy_scb_yy_scb_ygmc=cf.GB2Uni(yy_scb_yy_scb_ygmc);
		if (!(yy_scb_yy_scb_ygmc.equals("")))	wheresql+=" and  (yy_scb.yy_scb_ygmc='"+yy_scb_yy_scb_ygmc+"')";
	}
	yy_scb_ssbm=request.getParameter("yy_scb_ssbm");
	if (yy_scb_ssbm!=null)
	{
		yy_scb_ssbm=cf.GB2Uni(yy_scb_ssbm);
		if (!(yy_scb_ssbm.equals("")))	wheresql+=" and  (yy_scb.ssbm='"+yy_scb_ssbm+"')";
	}
	yy_scb_ssfgs=request.getParameter("yy_scb_ssfgs");
	if (yy_scb_ssfgs!=null)
	{
		yy_scb_ssfgs=cf.GB2Uni(yy_scb_ssfgs);
		if (!(yy_scb_ssfgs.equals("")))	wheresql+=" and  (yy_scb.ssfgs='"+yy_scb_ssfgs+"')";
	}
	yy_scb_yy_scbkh_byjh=request.getParameter("yy_scb_yy_scbkh_byjh");
	if (yy_scb_yy_scbkh_byjh!=null)
	{
		yy_scb_yy_scbkh_byjh=yy_scb_yy_scbkh_byjh.trim();
		if (!(yy_scb_yy_scbkh_byjh.equals("")))	wheresql+=" and (yy_scb.yy_scbkh_byjh="+yy_scb_yy_scbkh_byjh+") ";
	}
	yy_scb_yy_scbkh_bylj=request.getParameter("yy_scb_yy_scbkh_bylj");
	if (yy_scb_yy_scbkh_bylj!=null)
	{
		yy_scb_yy_scbkh_bylj=yy_scb_yy_scbkh_bylj.trim();
		if (!(yy_scb_yy_scbkh_bylj.equals("")))	wheresql+=" and (yy_scb.yy_scbkh_bylj="+yy_scb_yy_scbkh_bylj+") ";
	}
	yy_scb_yy_scbkh_szjh=request.getParameter("yy_scb_yy_scbkh_szjh");
	if (yy_scb_yy_scbkh_szjh!=null)
	{
		yy_scb_yy_scbkh_szjh=yy_scb_yy_scbkh_szjh.trim();
		if (!(yy_scb_yy_scbkh_szjh.equals("")))	wheresql+=" and (yy_scb.yy_scbkh_szjh="+yy_scb_yy_scbkh_szjh+") ";
	}
	yy_scb_yy_scbkh_szwc=request.getParameter("yy_scb_yy_scbkh_szwc");
	if (yy_scb_yy_scbkh_szwc!=null)
	{
		yy_scb_yy_scbkh_szwc=yy_scb_yy_scbkh_szwc.trim();
		if (!(yy_scb_yy_scbkh_szwc.equals("")))	wheresql+=" and (yy_scb.yy_scbkh_szwc="+yy_scb_yy_scbkh_szwc+") ";
	}
	yy_scb_yy_scbkh_bzyj=request.getParameter("yy_scb_yy_scbkh_bzyj");
	if (yy_scb_yy_scbkh_bzyj!=null)
	{
		yy_scb_yy_scbkh_bzyj=yy_scb_yy_scbkh_bzyj.trim();
		if (!(yy_scb_yy_scbkh_bzyj.equals("")))	wheresql+=" and (yy_scb.yy_scbkh_bzyj="+yy_scb_yy_scbkh_bzyj+") ";
	}
	yy_scb_yy_scbdj_byjh=request.getParameter("yy_scb_yy_scbdj_byjh");
	if (yy_scb_yy_scbdj_byjh!=null)
	{
		yy_scb_yy_scbdj_byjh=yy_scb_yy_scbdj_byjh.trim();
		if (!(yy_scb_yy_scbdj_byjh.equals("")))	wheresql+=" and (yy_scb.yy_scbdj_byjh="+yy_scb_yy_scbdj_byjh+") ";
	}
	yy_scb_yy_scbdj_bylj=request.getParameter("yy_scb_yy_scbdj_bylj");
	if (yy_scb_yy_scbdj_bylj!=null)
	{
		yy_scb_yy_scbdj_bylj=yy_scb_yy_scbdj_bylj.trim();
		if (!(yy_scb_yy_scbdj_bylj.equals("")))	wheresql+=" and (yy_scb.yy_scbdj_bylj="+yy_scb_yy_scbdj_bylj+") ";
	}
	yy_scb_yy_scbdj_szjh=request.getParameter("yy_scb_yy_scbdj_szjh");
	if (yy_scb_yy_scbdj_szjh!=null)
	{
		yy_scb_yy_scbdj_szjh=yy_scb_yy_scbdj_szjh.trim();
		if (!(yy_scb_yy_scbdj_szjh.equals("")))	wheresql+=" and (yy_scb.yy_scbdj_szjh="+yy_scb_yy_scbdj_szjh+") ";
	}
	yy_scb_yy_scbdj_szwc=request.getParameter("yy_scb_yy_scbdj_szwc");
	if (yy_scb_yy_scbdj_szwc!=null)
	{
		yy_scb_yy_scbdj_szwc=yy_scb_yy_scbdj_szwc.trim();
		if (!(yy_scb_yy_scbdj_szwc.equals("")))	wheresql+=" and (yy_scb.yy_scbdj_szwc="+yy_scb_yy_scbdj_szwc+") ";
	}
	yy_scb_yy_scbdj_bzjh=request.getParameter("yy_scb_yy_scbdj_bzjh");
	if (yy_scb_yy_scbdj_bzjh!=null)
	{
		yy_scb_yy_scbdj_bzjh=yy_scb_yy_scbdj_bzjh.trim();
		if (!(yy_scb_yy_scbdj_bzjh.equals("")))	wheresql+=" and (yy_scb.yy_scbdj_bzjh="+yy_scb_yy_scbdj_bzjh+") ";
	}
	yy_scb_yy_scb_lrr=request.getParameter("yy_scb_yy_scb_lrr");
	if (yy_scb_yy_scb_lrr!=null)
	{
		yy_scb_yy_scb_lrr=cf.GB2Uni(yy_scb_yy_scb_lrr);
		if (!(yy_scb_yy_scb_lrr.equals("")))	wheresql+=" and  (yy_scb.yy_scb_lrr='"+yy_scb_yy_scb_lrr+"')";
	}
	yy_scb_yy_scb_lrsj=request.getParameter("yy_scb_yy_scb_lrsj");
	if (yy_scb_yy_scb_lrsj!=null)
	{
		yy_scb_yy_scb_lrsj=yy_scb_yy_scb_lrsj.trim();
		if (!(yy_scb_yy_scb_lrsj.equals("")))	wheresql+="  and (yy_scb.yy_scb_lrsj>=TO_DATE('"+yy_scb_yy_scb_lrsj+"','YYYY-MM-DD'))";
	}
	yy_scb_yy_scb_lrsj=request.getParameter("yy_scb_yy_scb_lrsj2");
	if (yy_scb_yy_scb_lrsj!=null)
	{
		yy_scb_yy_scb_lrsj=yy_scb_yy_scb_lrsj.trim();
		if (!(yy_scb_yy_scb_lrsj.equals("")))	wheresql+="  and (yy_scb.yy_scb_lrsj<=TO_DATE('"+yy_scb_yy_scb_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	ls_sql="SELECT yy_scb.zqs,yy_scb.yy_scb_ygmc,yy_scb.ssbm,a.dwmc ssbmmc,yy_scb.ssfgs,b.dwmc ssfgsmc,yy_scb.yy_scbkh_byjh,yy_scb.yy_scbkh_bylj,yy_scb.yy_scbkh_szjh,yy_scb.yy_scbkh_szwc,yy_scb.yy_scbkh_bzyj,yy_scb.yy_scbdj_byjh,yy_scb.yy_scbdj_bylj,yy_scb.yy_scbdj_szjh,yy_scb.yy_scbdj_szwc,yy_scb.yy_scbdj_bzjh,yy_scb.yy_scb_lrr,yy_scb.yy_scb_lrsj  ";
	ls_sql+=" FROM yy_scb,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where yy_scb.ssbm=a.dwbh(+) and yy_scb.ssfgs=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_scb.zqs,yy_scb.ssbm,yy_scb.yy_scb_ygmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yy_scbList.jsp","","","EditYy_scb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"zqs","yy_scb_ygmc","ssbmmc","ssfgsmc","yy_scbkh_byjh","yy_scbkh_bylj","yy_scbkh_szjh","yy_scbkh_szwc","yy_scbkh_bzyj","yy_scbdj_byjh","yy_scbdj_bylj","yy_scbdj_szjh","yy_scbdj_szwc","yy_scbdj_bzjh","yy_scb_lrr","yy_scb_lrsj"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"zqs","yy_scb_ygmc","ssbm","ssfgs"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Yy_scbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from yy_scb where "+chooseitem;
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="5%">������</td>
	<td  width="6%">Ա������</td>
	<td  width="10%">��������</td>
	<td  width="9%">�����ֹ�˾</td>
	<td  width="5%">Ŀ��ͻ��������¼ƻ�</td>
	<td  width="5%">Ŀ��ͻ����������ۼ�</td>
	<td  width="5%">Ŀ��ͻ��������ܼƻ�</td>
	<td  width="5%">Ŀ��ͻ������������</td>
	<td  width="5%">Ŀ��ͻ���������Ԥ��</td>
	<td  width="5%">��ȡ�����¼ƻ�</td>
	<td  width="5%">��ȡ�������ۼ�</td>
	<td  width="5%">��ȡ�������ܼƻ�</td>
	<td  width="5%">��ȡ�����������</td>
	<td  width="5%">��ȡ������Ԥ��</td>
	<td  width="5%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
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