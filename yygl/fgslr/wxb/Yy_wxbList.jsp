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
	String yy_wxb_zqs=null;
	String yy_wxb_yy_wxb_ygmc=null;
	String yy_wxb_ssbm=null;
	String yy_wxb_ssfgs=null;
	String yy_wxb_yy_wxbkh_byjh=null;
	String yy_wxb_yy_wxbkh_bylj=null;
	String yy_wxb_yy_wxbkh_szjh=null;
	String yy_wxb_yy_wxbkh_szwc=null;
	String yy_wxb_yy_wxbkh_bzyj=null;
	String yy_wxb_yy_wxbdj_byjh=null;
	String yy_wxb_yy_wxbdj_bylj=null;
	String yy_wxb_yy_wxbdj_szjh=null;
	String yy_wxb_yy_wxbdj_szwc=null;
	String yy_wxb_yy_wxbdj_bzjh=null;
	String yy_wxb_yy_wxb_lrr=null;
	String yy_wxb_yy_wxb_lrsj=null;
	yy_wxb_zqs=request.getParameter("yy_wxb_zqs");
	if (yy_wxb_zqs!=null)
	{
		yy_wxb_zqs=yy_wxb_zqs.trim();
		if (!(yy_wxb_zqs.equals("")))	wheresql+=" and (yy_wxb.zqs="+yy_wxb_zqs+") ";
	}
	yy_wxb_yy_wxb_ygmc=request.getParameter("yy_wxb_yy_wxb_ygmc");
	if (yy_wxb_yy_wxb_ygmc!=null)
	{
		yy_wxb_yy_wxb_ygmc=cf.GB2Uni(yy_wxb_yy_wxb_ygmc);
		if (!(yy_wxb_yy_wxb_ygmc.equals("")))	wheresql+=" and  (yy_wxb.yy_wxb_ygmc='"+yy_wxb_yy_wxb_ygmc+"')";
	}
	yy_wxb_ssbm=request.getParameter("yy_wxb_ssbm");
	if (yy_wxb_ssbm!=null)
	{
		yy_wxb_ssbm=cf.GB2Uni(yy_wxb_ssbm);
		if (!(yy_wxb_ssbm.equals("")))	wheresql+=" and  (yy_wxb.ssbm='"+yy_wxb_ssbm+"')";
	}
	yy_wxb_ssfgs=request.getParameter("yy_wxb_ssfgs");
	if (yy_wxb_ssfgs!=null)
	{
		yy_wxb_ssfgs=cf.GB2Uni(yy_wxb_ssfgs);
		if (!(yy_wxb_ssfgs.equals("")))	wheresql+=" and  (yy_wxb.ssfgs='"+yy_wxb_ssfgs+"')";
	}
	yy_wxb_yy_wxbkh_byjh=request.getParameter("yy_wxb_yy_wxbkh_byjh");
	if (yy_wxb_yy_wxbkh_byjh!=null)
	{
		yy_wxb_yy_wxbkh_byjh=yy_wxb_yy_wxbkh_byjh.trim();
		if (!(yy_wxb_yy_wxbkh_byjh.equals("")))	wheresql+=" and (yy_wxb.yy_wxbkh_byjh="+yy_wxb_yy_wxbkh_byjh+") ";
	}
	yy_wxb_yy_wxbkh_bylj=request.getParameter("yy_wxb_yy_wxbkh_bylj");
	if (yy_wxb_yy_wxbkh_bylj!=null)
	{
		yy_wxb_yy_wxbkh_bylj=yy_wxb_yy_wxbkh_bylj.trim();
		if (!(yy_wxb_yy_wxbkh_bylj.equals("")))	wheresql+=" and (yy_wxb.yy_wxbkh_bylj="+yy_wxb_yy_wxbkh_bylj+") ";
	}
	yy_wxb_yy_wxbkh_szjh=request.getParameter("yy_wxb_yy_wxbkh_szjh");
	if (yy_wxb_yy_wxbkh_szjh!=null)
	{
		yy_wxb_yy_wxbkh_szjh=yy_wxb_yy_wxbkh_szjh.trim();
		if (!(yy_wxb_yy_wxbkh_szjh.equals("")))	wheresql+=" and (yy_wxb.yy_wxbkh_szjh="+yy_wxb_yy_wxbkh_szjh+") ";
	}
	yy_wxb_yy_wxbkh_szwc=request.getParameter("yy_wxb_yy_wxbkh_szwc");
	if (yy_wxb_yy_wxbkh_szwc!=null)
	{
		yy_wxb_yy_wxbkh_szwc=yy_wxb_yy_wxbkh_szwc.trim();
		if (!(yy_wxb_yy_wxbkh_szwc.equals("")))	wheresql+=" and (yy_wxb.yy_wxbkh_szwc="+yy_wxb_yy_wxbkh_szwc+") ";
	}
	yy_wxb_yy_wxbkh_bzyj=request.getParameter("yy_wxb_yy_wxbkh_bzyj");
	if (yy_wxb_yy_wxbkh_bzyj!=null)
	{
		yy_wxb_yy_wxbkh_bzyj=yy_wxb_yy_wxbkh_bzyj.trim();
		if (!(yy_wxb_yy_wxbkh_bzyj.equals("")))	wheresql+=" and (yy_wxb.yy_wxbkh_bzyj="+yy_wxb_yy_wxbkh_bzyj+") ";
	}
	yy_wxb_yy_wxbdj_byjh=request.getParameter("yy_wxb_yy_wxbdj_byjh");
	if (yy_wxb_yy_wxbdj_byjh!=null)
	{
		yy_wxb_yy_wxbdj_byjh=yy_wxb_yy_wxbdj_byjh.trim();
		if (!(yy_wxb_yy_wxbdj_byjh.equals("")))	wheresql+=" and (yy_wxb.yy_wxbdj_byjh="+yy_wxb_yy_wxbdj_byjh+") ";
	}
	yy_wxb_yy_wxbdj_bylj=request.getParameter("yy_wxb_yy_wxbdj_bylj");
	if (yy_wxb_yy_wxbdj_bylj!=null)
	{
		yy_wxb_yy_wxbdj_bylj=yy_wxb_yy_wxbdj_bylj.trim();
		if (!(yy_wxb_yy_wxbdj_bylj.equals("")))	wheresql+=" and (yy_wxb.yy_wxbdj_bylj="+yy_wxb_yy_wxbdj_bylj+") ";
	}
	yy_wxb_yy_wxbdj_szjh=request.getParameter("yy_wxb_yy_wxbdj_szjh");
	if (yy_wxb_yy_wxbdj_szjh!=null)
	{
		yy_wxb_yy_wxbdj_szjh=yy_wxb_yy_wxbdj_szjh.trim();
		if (!(yy_wxb_yy_wxbdj_szjh.equals("")))	wheresql+=" and (yy_wxb.yy_wxbdj_szjh="+yy_wxb_yy_wxbdj_szjh+") ";
	}
	yy_wxb_yy_wxbdj_szwc=request.getParameter("yy_wxb_yy_wxbdj_szwc");
	if (yy_wxb_yy_wxbdj_szwc!=null)
	{
		yy_wxb_yy_wxbdj_szwc=yy_wxb_yy_wxbdj_szwc.trim();
		if (!(yy_wxb_yy_wxbdj_szwc.equals("")))	wheresql+=" and (yy_wxb.yy_wxbdj_szwc="+yy_wxb_yy_wxbdj_szwc+") ";
	}
	yy_wxb_yy_wxbdj_bzjh=request.getParameter("yy_wxb_yy_wxbdj_bzjh");
	if (yy_wxb_yy_wxbdj_bzjh!=null)
	{
		yy_wxb_yy_wxbdj_bzjh=yy_wxb_yy_wxbdj_bzjh.trim();
		if (!(yy_wxb_yy_wxbdj_bzjh.equals("")))	wheresql+=" and (yy_wxb.yy_wxbdj_bzjh="+yy_wxb_yy_wxbdj_bzjh+") ";
	}
	yy_wxb_yy_wxb_lrr=request.getParameter("yy_wxb_yy_wxb_lrr");
	if (yy_wxb_yy_wxb_lrr!=null)
	{
		yy_wxb_yy_wxb_lrr=cf.GB2Uni(yy_wxb_yy_wxb_lrr);
		if (!(yy_wxb_yy_wxb_lrr.equals("")))	wheresql+=" and  (yy_wxb.yy_wxb_lrr='"+yy_wxb_yy_wxb_lrr+"')";
	}
	yy_wxb_yy_wxb_lrsj=request.getParameter("yy_wxb_yy_wxb_lrsj");
	if (yy_wxb_yy_wxb_lrsj!=null)
	{
		yy_wxb_yy_wxb_lrsj=yy_wxb_yy_wxb_lrsj.trim();
		if (!(yy_wxb_yy_wxb_lrsj.equals("")))	wheresql+="  and (yy_wxb.yy_wxb_lrsj>=TO_DATE('"+yy_wxb_yy_wxb_lrsj+"','YYYY-MM-DD'))";
	}
	yy_wxb_yy_wxb_lrsj=request.getParameter("yy_wxb_yy_wxb_lrsj2");
	if (yy_wxb_yy_wxb_lrsj!=null)
	{
		yy_wxb_yy_wxb_lrsj=yy_wxb_yy_wxb_lrsj.trim();
		if (!(yy_wxb_yy_wxb_lrsj.equals("")))	wheresql+="  and (yy_wxb.yy_wxb_lrsj<=TO_DATE('"+yy_wxb_yy_wxb_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	ls_sql="SELECT yy_wxb.zqs,yy_wxb.yy_wxb_ygmc,a.dwmc ssbm,b.dwmc ssfgs,yy_wxb.yy_wxbkh_byjh,yy_wxb.yy_wxbkh_bylj,yy_wxb.yy_wxbkh_szjh,yy_wxb.yy_wxbkh_szwc,yy_wxb.yy_wxbkh_bzyj,yy_wxb.yy_wxbdj_byjh,yy_wxb.yy_wxbdj_bylj,yy_wxb.yy_wxbdj_szjh,yy_wxb.yy_wxbdj_szwc,yy_wxb.yy_wxbdj_bzjh,yy_wxb.yy_wxb_lrr,yy_wxb.yy_wxb_lrsj  ";
	ls_sql+=" FROM yy_wxb,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where yy_wxb.ssbm=a.dwbh(+)";
    ls_sql+=" and yy_wxb.ssfgs=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_wxb.zqs,yy_wxb.ssbm,yy_wxb.yy_wxb_ygmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yy_wxbList.jsp","","","EditYy_wxb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zqs","yy_wxb_ygmc","sq_dwxx_dwmc","yy_wxb_ssfgs","yy_wxb_yy_wxbkh_byjh","yy_wxb_yy_wxbkh_bylj","yy_wxb_yy_wxbkh_szjh","yy_wxb_yy_wxbkh_szwc","yy_wxb_yy_wxbkh_bzyj","yy_wxb_yy_wxbdj_byjh","yy_wxb_yy_wxbdj_bylj","yy_wxb_yy_wxbdj_szjh","yy_wxb_yy_wxbdj_szwc","yy_wxb_yy_wxbdj_bzjh","yy_wxb_yy_wxb_lrr","yy_wxb_yy_wxb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zqs","yy_wxb_ygmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Yy_wxbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from yy_wxb where "+chooseitem;
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
	<td  width="6%">������Ա������</td>
	<td  width="10%">��������</td>
	<td  width="9%">�����ֹ�˾</td>
	<td  width="5%">Ŀ��ͻ��������¼ƻ�</td>
	<td  width="5%">Ŀ��ͻ����������ۼ�</td>
	<td  width="5%">Ŀ��ͻ��������ܼƻ�</td>
	<td  width="5%">Ŀ��ͻ������������</td>
	<td  width="5%">Ŀ��ͻ���������Ԥ��</td>
	<td  width="5%">��ȡ�����������¼ƻ�</td>
	<td  width="5%">��ȡ�������������ۼ�</td>
	<td  width="5%">��ȡ�����������ܼƻ�</td>
	<td  width="5%">��ȡ���������������</td>
	<td  width="5%">��ȡ�����������ܼƻ�</td>
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