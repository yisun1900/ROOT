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
	String yy_qtqd_zqs=null;
	String yy_qtqd_ssfgs=null;
	String yy_qtqd_yy_qtqdkh_byjh=null;
	String yy_qtqd_yy_qtqdkh_bylj=null;
	String yy_qtqd_yy_qtqdkh_szjh=null;
	String yy_qtqd_yy_qtqdkh_szwc=null;
	String yy_qtqd_yy_qtqdkh_bzyj=null;
	String yy_qtqd_yy_qtqddj_byjh=null;
	String yy_qtqd_yy_qtqddj_bylj=null;
	String yy_qtqd_yy_qtqddj_szjh=null;
	String yy_qtqd_yy_qtqddj_szwc=null;
	String yy_qtqd_yy_qtqddj_bzyj=null;
	String yy_qtqd_yy_qtqd_lrsj=null;
	String yy_qtqd_yy_qtqd_lrr=null;
	yy_qtqd_zqs=request.getParameter("yy_qtqd_zqs");
	if (yy_qtqd_zqs!=null)
	{
		yy_qtqd_zqs=yy_qtqd_zqs.trim();
		if (!(yy_qtqd_zqs.equals("")))	wheresql+=" and (yy_qtqd.zqs="+yy_qtqd_zqs+") ";
	}
	yy_qtqd_ssfgs=request.getParameter("yy_qtqd_ssfgs");
	if (yy_qtqd_ssfgs!=null)
	{
		yy_qtqd_ssfgs=cf.GB2Uni(yy_qtqd_ssfgs);
		if (!(yy_qtqd_ssfgs.equals("")))	wheresql+=" and  (yy_qtqd.ssfgs='"+yy_qtqd_ssfgs+"')";
	}
	yy_qtqd_yy_qtqdkh_byjh=request.getParameter("yy_qtqd_yy_qtqdkh_byjh");
	if (yy_qtqd_yy_qtqdkh_byjh!=null)
	{
		yy_qtqd_yy_qtqdkh_byjh=yy_qtqd_yy_qtqdkh_byjh.trim();
		if (!(yy_qtqd_yy_qtqdkh_byjh.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqdkh_byjh="+yy_qtqd_yy_qtqdkh_byjh+") ";
	}
	yy_qtqd_yy_qtqdkh_bylj=request.getParameter("yy_qtqd_yy_qtqdkh_bylj");
	if (yy_qtqd_yy_qtqdkh_bylj!=null)
	{
		yy_qtqd_yy_qtqdkh_bylj=yy_qtqd_yy_qtqdkh_bylj.trim();
		if (!(yy_qtqd_yy_qtqdkh_bylj.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqdkh_bylj="+yy_qtqd_yy_qtqdkh_bylj+") ";
	}
	yy_qtqd_yy_qtqdkh_szjh=request.getParameter("yy_qtqd_yy_qtqdkh_szjh");
	if (yy_qtqd_yy_qtqdkh_szjh!=null)
	{
		yy_qtqd_yy_qtqdkh_szjh=yy_qtqd_yy_qtqdkh_szjh.trim();
		if (!(yy_qtqd_yy_qtqdkh_szjh.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqdkh_szjh="+yy_qtqd_yy_qtqdkh_szjh+") ";
	}
	yy_qtqd_yy_qtqdkh_szwc=request.getParameter("yy_qtqd_yy_qtqdkh_szwc");
	if (yy_qtqd_yy_qtqdkh_szwc!=null)
	{
		yy_qtqd_yy_qtqdkh_szwc=yy_qtqd_yy_qtqdkh_szwc.trim();
		if (!(yy_qtqd_yy_qtqdkh_szwc.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqdkh_szwc="+yy_qtqd_yy_qtqdkh_szwc+") ";
	}
	yy_qtqd_yy_qtqdkh_bzyj=request.getParameter("yy_qtqd_yy_qtqdkh_bzyj");
	if (yy_qtqd_yy_qtqdkh_bzyj!=null)
	{
		yy_qtqd_yy_qtqdkh_bzyj=yy_qtqd_yy_qtqdkh_bzyj.trim();
		if (!(yy_qtqd_yy_qtqdkh_bzyj.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqdkh_bzyj="+yy_qtqd_yy_qtqdkh_bzyj+") ";
	}
	yy_qtqd_yy_qtqddj_byjh=request.getParameter("yy_qtqd_yy_qtqddj_byjh");
	if (yy_qtqd_yy_qtqddj_byjh!=null)
	{
		yy_qtqd_yy_qtqddj_byjh=yy_qtqd_yy_qtqddj_byjh.trim();
		if (!(yy_qtqd_yy_qtqddj_byjh.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqddj_byjh="+yy_qtqd_yy_qtqddj_byjh+") ";
	}
	yy_qtqd_yy_qtqddj_bylj=request.getParameter("yy_qtqd_yy_qtqddj_bylj");
	if (yy_qtqd_yy_qtqddj_bylj!=null)
	{
		yy_qtqd_yy_qtqddj_bylj=yy_qtqd_yy_qtqddj_bylj.trim();
		if (!(yy_qtqd_yy_qtqddj_bylj.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqddj_bylj="+yy_qtqd_yy_qtqddj_bylj+") ";
	}
	yy_qtqd_yy_qtqddj_szjh=request.getParameter("yy_qtqd_yy_qtqddj_szjh");
	if (yy_qtqd_yy_qtqddj_szjh!=null)
	{
		yy_qtqd_yy_qtqddj_szjh=yy_qtqd_yy_qtqddj_szjh.trim();
		if (!(yy_qtqd_yy_qtqddj_szjh.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqddj_szjh="+yy_qtqd_yy_qtqddj_szjh+") ";
	}
	yy_qtqd_yy_qtqddj_szwc=request.getParameter("yy_qtqd_yy_qtqddj_szwc");
	if (yy_qtqd_yy_qtqddj_szwc!=null)
	{
		yy_qtqd_yy_qtqddj_szwc=yy_qtqd_yy_qtqddj_szwc.trim();
		if (!(yy_qtqd_yy_qtqddj_szwc.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqddj_szwc="+yy_qtqd_yy_qtqddj_szwc+") ";
	}
	yy_qtqd_yy_qtqddj_bzyj=request.getParameter("yy_qtqd_yy_qtqddj_bzyj");
	if (yy_qtqd_yy_qtqddj_bzyj!=null)
	{
		yy_qtqd_yy_qtqddj_bzyj=yy_qtqd_yy_qtqddj_bzyj.trim();
		if (!(yy_qtqd_yy_qtqddj_bzyj.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqddj_bzyj="+yy_qtqd_yy_qtqddj_bzyj+") ";
	}
	yy_qtqd_yy_qtqd_lrsj=request.getParameter("yy_qtqd_yy_qtqd_lrsj");
	if (yy_qtqd_yy_qtqd_lrsj!=null)
	{
		yy_qtqd_yy_qtqd_lrsj=yy_qtqd_yy_qtqd_lrsj.trim();
		if (!(yy_qtqd_yy_qtqd_lrsj.equals("")))	wheresql+="  and (yy_qtqd.yy_qtqd_lrsj>=TO_DATE('"+yy_qtqd_yy_qtqd_lrsj+"','YYYY/MM/DD'))";
	}
	yy_qtqd_yy_qtqd_lrsj=request.getParameter("yy_qtqd_yy_qtqd_lrsj2");
	if (yy_qtqd_yy_qtqd_lrsj!=null)
	{
		yy_qtqd_yy_qtqd_lrsj=yy_qtqd_yy_qtqd_lrsj.trim();
		if (!(yy_qtqd_yy_qtqd_lrsj.equals("")))	wheresql+="  and (yy_qtqd.yy_qtqd_lrsj<=TO_DATE('"+yy_qtqd_yy_qtqd_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	yy_qtqd_yy_qtqd_lrr=request.getParameter("yy_qtqd_yy_qtqd_lrr");
	if (yy_qtqd_yy_qtqd_lrr!=null)
	{
		yy_qtqd_yy_qtqd_lrr=cf.GB2Uni(yy_qtqd_yy_qtqd_lrr);
		if (!(yy_qtqd_yy_qtqd_lrr.equals("")))	wheresql+=" and  (yy_qtqd.yy_qtqd_lrr='"+yy_qtqd_yy_qtqd_lrr+"')";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=null;
	myxssl=request.getParameter("myxssl");
	
	ls_sql="SELECT yy_qtqd.zqs,yy_qtqd.ssfgs,sq_dwxx.dwmc,yy_qtqd.yy_qtqdkh_byjh,yy_qtqd.yy_qtqdkh_bylj,yy_qtqd.yy_qtqdkh_szjh,yy_qtqd.yy_qtqdkh_szwc,yy_qtqd.yy_qtqdkh_bzyj,yy_qtqd.yy_qtqddj_byjh,yy_qtqd.yy_qtqddj_bylj,yy_qtqd.yy_qtqddj_szjh,yy_qtqd.yy_qtqddj_szwc,yy_qtqd.yy_qtqddj_bzyj,yy_qtqd.yy_qtqd_lrsj,yy_qtqd.yy_qtqd_lrr  ";
	ls_sql+=" FROM sq_dwxx,yy_qtqd  ";
    ls_sql+=" where yy_qtqd.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_qtqd.zqs,yy_qtqd.ssfgs";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yy_qtqdCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"zqs","ssfgs","sq_dwxx_dwmc","yy_qtqd_yy_qtqdkh_byjh","yy_qtqd_yy_qtqdkh_bylj","yy_qtqd_yy_qtqdkh_szjh","yy_qtqd_yy_qtqdkh_szwc","yy_qtqd_yy_qtqdkh_bzyj","yy_qtqd_yy_qtqddj_byjh","yy_qtqd_yy_qtqddj_bylj","yy_qtqd_yy_qtqddj_szjh","yy_qtqd_yy_qtqddj_szwc","yy_qtqd_yy_qtqddj_bzyj","yy_qtqd_yy_qtqd_lrsj","yy_qtqd_yy_qtqd_lrr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zqs","ssfgs"};
	pageObj.setKey(keyName);
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">������</td>
	<td  width="5%">�����ֹ�˾</td>
	<td  width="9%">�����ֹ�˾</td>
	<td  width="6%">Ŀ��ͻ��������¼ƻ�</td>
	<td  width="6%">Ŀ��ͻ����������ۼ�</td>
	<td  width="6%">Ŀ��ͻ��������ܼƻ�</td>
	<td  width="6%">Ŀ��ͻ������������</td>
	<td  width="6%">Ŀ��ͻ���������Ԥ��</td>
	<td  width="6%">��ȡ�����������¼ƻ�</td>
	<td  width="6%">��ȡ�������������ۼ�</td>
	<td  width="6%">��ȡ�����������ܼƻ�</td>
	<td  width="6%">��ȡ���������������</td>
	<td  width="6%">��ȡ������������Ԥ��</td>
	<td  width="8%">¼��ʱ��</td>
	<td  width="6%">¼����</td>
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